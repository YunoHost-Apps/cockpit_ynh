#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

# YunoHost CI does not accept systemd DynamicUser
# Convert DynamicUser=yes units into system users
myynh_handle_dynamicuser() {
	declare -a created_users=()
	declare -A created_users_set=()

	# Helper ensuring uniqueness
	add_user_unique() {
		local u="$1"
		[[ -z "$u" ]] && return
		if [[ -z "${created_users_set[$u]+_}" ]]
		then
			created_users+=("$u")
			created_users_set["$u"]=1
		fi
	}

	# If DynamicUser is NOT supported → convert to system users
	if ! is_dynamicuser_supported; then
		for f in /usr/lib/systemd/system/cockpit*
		do
			if grep -q '^DynamicUser=yes' "$f"
			then

				# Extract User= ; if present and missing, create the user and its group
				user=$(grep -E '^User=' "$f" | head -n1 | cut -d= -f2-)
				if [[ -n "$user" ]]
				then
					if ! ynh_system_user_exists --username="$user"
					then
						ynh_system_user_create --username="$user"
						add_user_unique "$user"
					fi
				fi

				# Extract Group= ; if present and missing, create the user/group
				group=$(grep -E '^Group=' "$f" | head -n1 | cut -d= -f2-)
				if [[ -n "$group" ]]
				then
					if ! ynh_system_group_exists --group="$group"
					then
						ynh_system_user_create --username="$group"
						add_user_unique "$group"
					fi
				fi

				# Replace DynamicUser=yes → DynamicUser=no
				ynh_replace --match="^DynamicUser=yes" --replace="DynamicUser=no" --file="$f"
			fi
		done

		# Reload systemd configuration after modifications
		systemctl daemon-reload

		# Store settings
		ynh_app_setting_set --key=is_dynamicuser --value=0
		dynamicusers=$(printf "%s;" "${created_users[@]}")
		ynh_app_setting_set --key=dynamicusers --value="$dynamicusers"

	else
		ynh_app_setting_set --key=is_dynamicuser --value=1
		ynh_app_setting_delete --key=dynamicusers
		
	fi
}

# In case of non working DynamicUser=yes, remove system users created
myynh_remove_non_dynamic_users() {
	if [[ "$(ynh_app_setting_get --key=is_dynamicuser)" == "0" ]]
	then
			
		# Retrieve list and convert back to array
		created_users=$(ynh_app_setting_get --key=dynamicusers)
		IFS=';' read -r -a created_users <<< "$created_users"

		# Remove each created_users
		for u in "${created_users[@]}"
		do
			[[ -n "$u" ]] && ynh_system_user_delete --username="$u"
		done
			
	fi
}

# Check if DynamicUser is supported
is_dynamicuser_supported() {
	local unit_name="test-dynamicuser-$"
	
	if systemd-run --wait --quiet --unit "$unit_name" --property DynamicUser=yes /bin/true 2>/dev/null
	then
		systemctl reset-failed "$unit_name" >/dev/null 2>&1
		ynh_print_info "DynamicUser is working through a systemd service."
		return 0   # OK
	else
		systemctl reset-failed "$unit_name" >/dev/null 2>&1
		ynh_print_info "DynamicUser is NOT working through a systemd service!"
		ynh_print_info "This confirms that the container is blocking DynamicUser=yes."
		return 1   # NOT OK
	fi
}

# Remove old users of cockpit (starting with cockpit-*)
myynh_remove_old_cockpit_users() {
	# Load all /etc/passwd entries into an array
	# Each entry is of the form: user:passwd:uid:gid:comment:home:shell
	local users=()
	while read -r line
	do
		 users+=("$line")
	done < /etc/passwd

	# Iterate through each user entry
	for entry in "${users[@]}"
	do
		# Extract username (field 1)
		local username
		username=$(echo "$entry" | cut -d: -f1)

		# Check if username begins with "cockpit-"
		if [[ "$username" =~ ^cockpit- ]]
		then
			ynh_system_user_delete --username="$username"
		fi
	done
}
