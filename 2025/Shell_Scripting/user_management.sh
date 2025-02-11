#!/bin/bash

<<Note 
Account Creation
1. Implement an option -c or --create that allows the script to create a new user account. The script should prompt the user to enter the new username and password.
2. Ensure that the script checks whether the username is available before creating the account. If the username already exists, display an appropriate message and exit gracefully.
3. After creating the account, display a success message with the newly created username.
Note

# Function to display help information
function show_help() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -c, --create    Create a new user account"
    echo "  -d, --delete    Delete an existing user account"
    echo "  -r, --reset     Reset the password of an existing user account"
    echo "  -l, --list      List all user accounts with detailed information"
    echo "  -m, --modify    Modify user account properties"
    echo "  -h, --help      Display this help message"
}


# Function to create a new user account
function create_user() {
    read -p "Enter new username: " username
    if id "$username" &>/dev/null; then
        echo "Error: User '$username' already exists."
        exit 1
    fi
    read -sp "Enter password for $username: " password
    echo
    sudo useradd -m -p "$(openssl passwd -1 "$password")" "$username"
    echo "User '$username' created successfully."
}

# Function to delete an existing user account
function delete_user() {
    read -p "Enter username to delete: " username
    if ! id "$username" &>/dev/null; then
        echo "Error: User '$username' does not exist."
        exit 1
    fi
    sudo userdel -r "$username"
    echo "User '$username' deleted successfully."
}

# Function to reset the password of an existing user account
function reset_password() {
    read -p "Enter username to reset password: " username
    if ! id "$username" &>/dev/null; then
        echo "Error: User '$username' does not exist."
        exit 1
    fi
    read -sp "Enter new password for $username: " password
    echo
    echo "$username:$(openssl passwd -1 "$password")" | sudo chpasswd
    echo "Password for user '$username' reset successfully."
}

# Function to list all user accounts
function list_users() {
    echo "Detailed User Account Information:"
    printf "%-20s %-10s %-10s %-30s %-20s\n" "USERNAME" "USER ID" "GROUP ID" "HOME DIRECTORY" "SHELL"
    echo "--------------------------------------------------------------------------------"
    while IFS=: read -r username _ uid gid _ home shell; do
        # Check if uid is a valid number and in the desired range
        if [[ "$uid" =~ ^[0-9]+$ ]] && [[ $uid -ge 1000 && $uid -ne 65534 ]]; then
            printf "%-20s %-10s %-10s %-30s %-20s\n" "$username" "$uid" "$gid" "$home" "$shell"
        fi
    done < /etc/passwd
}


function modify_user() {
    read -p "Enter username to modify: " username
    if ! id "$username" &>/dev/null; then
        echo "Error: User '$username' does not exist."
        exit 1
    fi

    echo "What would you like to modify?"
    echo "1. Change username"
    echo "2. Change user ID"
    echo "3. Change primary group"
    echo "4. Change home directory"
    echo "5. Change shell"
    read -p "Enter your choice (1-5): " choice

    case $choice in
        1)  read -p "Enter new username: " new_username
            if id "$new_username" &>/dev/null; then
                echo "Error: User '$new_username' already exists."
                exit 1
            fi
            sudo usermod -l "$new_username" "$username"
            echo "Username changed successfully to '$new_username'"
            ;;
        2)  read -p "Enter new user ID: " new_uid
            sudo usermod -u "$new_uid" "$username"
            echo "User ID changed successfully"
            ;;
        3)  read -p "Enter new primary group: " new_group
            if ! getent group "$new_group" &>/dev/null; then
                echo "Error: Group '$new_group' does not exist."
                exit 1
            fi
            sudo usermod -g "$new_group" "$username"
            echo "Primary group changed successfully"
            ;;
        4)  read -p "Enter new home directory: " new_home
            sudo usermod -d "$new_home" -m "$username"
            echo "Home directory changed successfully"
            ;;
        5)  read -p "Enter new shell path: " new_shell
            if [ ! -f "$new_shell" ]; then
                echo "Error: Shell '$new_shell' does not exist."
                exit 1
            fi
            sudo usermod -s "$new_shell" "$username"
            echo "Shell changed successfully"
            ;;
        *)  echo "Invalid choice"
            exit 1
            ;;
    esac
}

# Main script logic
if [[ $# -eq 0 ]]; then
    show_help
    exit 1
fi

case "$1" in
    -c|--create)
        create_user
        ;;
    -d|--delete)
        delete_user
        ;;
    -r|--reset)
        reset_password
        ;;
    -l|--list)
        list_users
        ;;
    -m|--modify)
        modify_user
        ;;
    -h|--help)
        show_help
        ;;
    *)
        echo "Invalid option: $1"
        show_help
        exit 1
        ;;
esac

