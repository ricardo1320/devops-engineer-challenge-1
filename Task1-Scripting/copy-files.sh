#!/bin/bash

# Define variables
SOURCE_DIR="/home/domain/member/mail"
REMOTE_SERVER="user@remote_server"
REMOTE_BASE_DIR="/home/domain/member/mail"
START_DATE="2024-08-01 09:00:00"
END_DATE="2024-08-02 08:00:00"

# Find and copy files
find "$SOURCE_DIR" -type f -newermt "$START_DATE" ! -newermt "$END_DATE" | while IFS= read file; do
    # Create directory on the remote server
    # dirname extracts the directory part of the path
    # -p flag will create any necessary parent directories and does not return an error if the directory already exists
    ssh "$REMOTE_SERVER" "mkdir -p $(dirname "$file")"

    # Copy the file to the remote server
    rsync -avz "$file" "$REMOTE_SERVER:$file"
done
echo "Backup completed successfully."

# ---------------------------- #
# If the remote server does not have the same directory structure as the local directory, use the following script to ensure the preservation of the directory structure
# find "$SOURCE_DIR" -type f -newermt "$START_DATE" ! -newermt "$END_DATE" | while IFS= read file; do
#     # Get the relative path of the file
#     relative_path="${file#$SOURCE_DIR/}"

#     # Define the target path on the remote server
#     target_path="$REMOTE_BASE_DIR/$relative_path"

#     # Create the target directory on the remote server
#     ssh "$REMOTE_SERVER" "mkdir -p $(dirname "$target_path")"

#     # Copy the file to the remote server
#     rsync -avz "$file" "$REMOTE_SERVER:$target_path"
# done
# echo "Backup completed successfully."

# ---------------------------- #
# Local testing
# SOURCE_DIR="/Users/ricardo/Documents/Trainings"
# REMOTE_BASE_DIR="/Users/ricardo/Documents/Trainings"
# START_DATE="2024-01-01 09:00:00"
# END_DATE="2024-12-31 09:00:00"

# Exit immediately if a command exits with a non-zero status  
# set -e 

# # Find and print files
# find "$SOURCE_DIR" -type f -newermt "$START_DATE" ! -newermt "$END_DATE" | while IFS= read file; do
#     # # Get the relative path of the file
#     # relative_path="${file#$SOURCE_DIR/}"
#     # echo "$relative_path"

#     # # Define the target path on local
#     # target_path="$REMOTE_BASE_DIR/$relative_path"
#     # echo "$target_path"

#     # # Create the target directory on local
#     # echo "$(dirname "$target_path")"
#     # mkdir -p $(dirname "$target_path")

#     # # Copy the file local to local
#     # rsync -a "$file" "$target_path"

#     # Create the target directory on local
#     echo "$(dirname "$file")"
#     mkdir -p $(dirname "$file")

#     # Copy the file local to local
#     # Putting error handling in place
#     if ! rsync -a "$file" "$file"; then
#         echo "Failed to copy $file"
#         exit 1
#     fi
# done
# echo "Backup completed successfully."
