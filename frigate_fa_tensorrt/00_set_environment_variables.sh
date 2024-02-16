#!/bin/bash

if [ -f "/data/options.json" ]; then
    # Read environment variables from options.json
    env_vars=$(jq -r '.env_vars' /data/options.json)
    IFS=';' read -ra var_array <<< "$env_vars"
    for variable in "${var_array[@]}"; do
        # Split variable into name and value
        IFS='=' read -r name value <<< "$variable"
        # Write the environment variable to the container environment directory
        echo "$value" > "/var/run/s6/container_environment/$name"
        echo "Setting $name to $value globally"
    done
else
    echo "Options file not found. No environment variables set."
fi
