#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

# YunoHost CI does not accept systemd DynamicUser
# In CI, we have to convert DynamicUser into real user
myynh_fix_ci() {
	for f in /usr/lib/systemd/system/cockpit*; do
		if grep -q 'DynamicUser=yes' "$f"; then
			# Récupérer User= et si présent et non-existant, le créer le user avec le groupe
				user=$(grep -E '^User=' "$f" | head -n1 | cut -d= -f2-)
				if [ -n "$user" ]; then
					ynh_system_user_exists --username="$user" || ynh_system_user_create --username="$user"
				fi

			# Récupérer Group= et si présent et non-existant, créer le user avec le groupe
				group=$(grep -E '^Group=' "$f" | head -n1 | cut -d= -f2-)
				if [ -n "$group" ]; then
					ynh_system_group_exists --group=$group  || ynh_system_user_create --username="$user"
				fi

			# Modifier DynamicUser=yes → DynamicUser=no
				ynh_replace --match="DynamicUser=yes" --replace="DynamicUser=no" --file="$f"
		fi
	done
	systemctl daemon-reload
}
