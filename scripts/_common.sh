#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

# YunoHost CI does not accept systemd DynamicUser
# In CI, we have to convert DynamicUser into real user
myynh_fix_ci() {
	# Check if DynamicUser is supported inside the container
	if test_dynamicuser; then
		for f in /usr/lib/systemd/system/cockpit*; do
			if grep -q 'DynamicUser=yes' "$f"; then
				# Extract User= ; if present and missing, create the user and its group
				user=$(grep -E '^User=' "$f" | head -n1 | cut -d= -f2-)
				if [ -n "$user" ]; then
					ynh_system_user_exists --username="$user" || ynh_system_user_create --username="$user"
				fi

				# Extract Group= ; if present and missing, create the user/group
				group=$(grep -E '^Group=' "$f" | head -n1 | cut -d= -f2-)
				if [ -n "$group" ]; then
					ynh_system_group_exists --group=$group  || ynh_system_user_create --username="$user"
				fi

				# Replace DynamicUser=yes → DynamicUser=no
				ynh_replace --match="DynamicUser=yes" --replace="DynamicUser=no" --file="$f"
			fi
		done

		# Reload systemd configuration after modifications
		systemctl daemon-reload
	fi
}

# Check if DynamicUser is supported
test_dynamicuser() {
	# Launch a temporary systemd unit that uses DynamicUser=yes.
	# If DynamicUser works inside this container, the command will run successfully.
	systemd-run --unit test-dynamicuser --property DynamicUser=yes id >/dev/null 2>&1
	local rc=$?

	# Wait a bit because systemd creates the transient unit asynchronously.
	sleep 0.2

	# Query the systemd unit state (SubState=exited indicates success).
	local state
	state=$(systemctl show -p SubState --value test-dynamicuser 2>/dev/null)

	# Clean up the temporary unit to avoid leaving traces.
	systemctl stop test-dynamicuser >/dev/null 2>&1
	systemctl reset-failed test-dynamicuser >/dev/null 2>&1

	# If systemd-run returned 0 AND the unit finished in "exited",
	# DynamicUser is working properly inside this LXC container.
	if [[ "$rc" -eq 0 && "$state" == "exited" ]]; then
		echo -e "\n🟢 DynamicUser is working through a systemd service!"
		return 1
	else
		echo -e "\n🔴 DynamicUser is NOT working through a systemd service."
		echo "This confirms that the container is blocking DynamicUser=yes."
		return 0
	fi
}

