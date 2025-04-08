#!/bin/bash

# Supported parameters:
# delete (node buildit.js delete) - this deletes everything in the _site folder

# Function to get current time in milliseconds
get_current_time_in_ms() {
    date +%s%3N | awk '{ printf "%d\n", $1 }'
}

ACTION="${1:-local}" # Default to "build" if no parameter is passed

if [ "ACTION" = "init" ]; then
    echo "Building scaffolding..."
    rm -rf _site
    if [ ! -d "_includes" ]; then
        echo "Created _includes folder"
        mkdir _includes
    fi

    if [ ! -d "_source" ]; then
        echo "Created _source folder"
        mkdir _source
    fi

    #copy _env to .env
    if [ ! -f ".env" ]; then
        echo "Created .env file"
        cp _env .env
    fi

    if [ ! -f ".dev.vars" ]; then
        echo "Created .dev.vars file"
        cp _.dev.vars .dev.vars
    fi

    #copy _wrangler.toml to wrangler.toml
    if [ ! -f "wrangler.toml" ]; then
        echo "Created .dev.vars file"
        cp _wrangler.toml wrangler.toml
    fi
     echo "Building scaffolding complete..."
    exit   
fi


# Capture the start time in milliseconds
start_time=$(get_current_time_in_ms)

# Check if 'delete' is passed as an argument
if [[ "ACTION" == *"delete"* ]]; then
    echo "Deleting _site folder..."
    rm -rf _site
    echo "_site folder deleted."
fi

# Execute the build script with any arguments passed to this script
echo "Executing build script with arguments: $ACTION"
node buildit.js $ACTION

# Capture the end time in milliseconds
end_time=$(get_current_time_in_ms)

# Calculate the execution time in milliseconds
execution_time=$((end_time - start_time))

# Calculate minutes, seconds, and milliseconds
minutes=$((execution_time / 60000))
seconds=$(( (execution_time % 60000) / 1000 ))
milliseconds=$((execution_time % 1000))

# Format the output string based on the calculated values
if [ $minutes -eq 0 ]; then
    printf "Build script completed in %d.%03d seconds\n" $seconds $milliseconds
else
    printf "Build script completed in %d minutes %d.%03d seconds\n" $minutes $seconds $milliseconds
fi
