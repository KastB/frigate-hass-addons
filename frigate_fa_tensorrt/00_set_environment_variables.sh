#!/bin/bash

# Check if options.json file exists
if [ -f "/data/options.json" ]; then
    # Read environment variables from options.json
    for var in $(jq -r '.env_vars | keys | .[]' /data/options.json); do
        name=$(jq -r ".env_vars[$var].name" /data/options.json)
        value=$(jq -r ".env_vars[$var].value" /data/options.json)
        echo "Setting ${name} to ${value}"
        export "${name}=${value}"
    done
else
    echo "Options file not found. No environment variables set."
fi
/init
