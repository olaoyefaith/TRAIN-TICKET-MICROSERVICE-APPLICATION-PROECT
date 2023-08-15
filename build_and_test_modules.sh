#!/bin/bash

# Define your parent project directory
parent_project="TRAIN-TICKET-MICROSERVICE-APPLICATION-PROJECT"

# List of module directories
modules=("ts-price-service" "ts-admin-order-service" "ts-admin-route-service")

# Build and test each module
for module in "${modules[@]}"; do
    module_dir="$parent_project/$module"
    
    echo "Building and testing $module..."
    
    if [ -d "$module_dir" ]; then
        cd "$module_dir" || exit 1
        
        mvn --batch-mode --update-snapshots verify
        mkdir staging && cp target/*.jar staging
        
        cd ..
    else
        echo "Module directory '$module_dir' not found."
    fi
done

echo "Build and test process completed for all modules"
