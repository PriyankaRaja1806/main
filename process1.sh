#!/bin/bash

# Prompt for the process name
read -p "Enter the process name: " pname

# Function to view process tree
view_processes() {
echo "Process tree for '$pname':"
pids=$(pgrep -d, -x "$pname")
if [[ -z "$pids" ]]; then
echo "No process named '$pname' found."
else
pstree -p $pids
fi
}

# Function to kill process and its subprocesses
kill_processes() {
pids=$(pgrep -x "$pname")
if [[ -z "$pids" ]]; then
echo "No process named '$pname' found."
else
echo "Killing the following processes:"
pstree -p $pids
read -p "Are you sure you want to kill all these processes? (y/n): " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
pkill -TERM -x "$pname"
echo "Processes killed."
else
echo "Operation cancelled."
fi
fi
}

# Prompt for action
echo "Choose an option:"
echo "1) View"
echo "2) Kill"
read -p "Enter your choice (1 or 2): " choice

case $choice in
1) view_processes ;;
2) kill_processes ;;
*) echo "Invalid choice." ;;
esac

