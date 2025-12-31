#!/bin/bash

# nordvpn.sh

# Function to get the NordVPN status
get_status() {
    if ! command -v nordvpn &> /dev/null; then
        echo "{\"text\": \"VPN\", \"class\": \"unavailable\", \"tooltip\": \"NordVPN: Not installed\"}"
        return
    fi

    status=$(nordvpn status 2>/dev/null | grep "Status:" | sed 's/Status: //')
    if [[ $status == "Connected" ]]; then
        echo "{\"text\": \"VPN\", \"class\": \"connected\", \"tooltip\": \"NordVPN: Connected\"}"
    else
        echo "{\"text\": \"VPN\", \"class\": \"disconnected\", \"tooltip\": \"NordVPN: Disconnected\"}"
    fi
}

# Function to toggle the NordVPN connection
toggle_connection() {
    if ! command -v nordvpn &> /dev/null; then
        notify-send "NordVPN" "nordvpn command not found" 2>/dev/null || true
        return
    fi

    status=$(nordvpn status 2>/dev/null | grep "Status:" | sed 's/Status: //')
    if [[ $status == "Connected" ]]; then
        nordvpn disconnect
    else
        nordvpn connect
    fi
}

# Main logic
case "$1" in
    status) 
        get_status
        ;;
    toggle)
        toggle_connection
        ;;
    *)
        echo "Usage: $0 {status|toggle}"
        exit 1
        ;;
esac
