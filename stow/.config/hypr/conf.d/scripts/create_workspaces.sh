#!/bin/bash

HYPRLAND_CONFIG="$HOME/.config/hypr/conf.d/monitors.conf"

WORKSPACES_PER_MONITOR=3
declare -A MONITOR_WORKSPACES

generate_monitor_workspaces() {
    local START_WORKSPACE=1

    local MONITORS=$(hyprctl monitors -j | jq -r '.[].name')
    for MONITOR in $MONITORS; do
        local WORKSPACE_RANGE=()
        for ((i = 0; i < WORKSPACES_PER_MONITOR; i++)); do
            WORKSPACE_RANGE+=($((START_WORKSPACE + i)))
        done
        MONITOR_WORKSPACES["$MONITOR"]="${WORKSPACE_RANGE[*]}"
        START_WORKSPACE=$((START_WORKSPACE + WORKSPACES_PER_MONITOR))
    done
}

cleanup_old_mappings() {
    sed -i '/workspace=/d' "$HYPRLAND_CONFIG"
}

append_new_mappings() {
    for MONITOR in "${!MONITOR_WORKSPACES[@]}"; do
        local WORKSPACES=${MONITOR_WORKSPACES[$MONITOR]}
        for WORKSPACE in $WORKSPACES; do
          echo "workspace=$WORKSPACE, monitor:$MONITOR" >> "$HYPRLAND_CONFIG"
        done
    done
}

generate_monitor_workspaces
cleanup_old_mappings
append_new_mappings

hyprctl reload
