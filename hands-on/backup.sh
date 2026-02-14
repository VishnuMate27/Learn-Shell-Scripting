#backup.sh
#!/bin/bash
#
<<readme
This is the script for taking the backup of last 5 days
and use log rotation to delete the old backup folder
1. Check the usage
Usage: ./backup.sh <path_to_source> <path_to_backup_destination>
2. Create backup 
3. Rotate backup (means delete folders older than last 5 backups)
readme

function displayUsage {
	echo "Usage: ./backup.sh <path_to_source> <path_to_backup_destination"	
}

if [ $# -eq 0 ]; then
	displayUsage
fi

source_path=$1
timestamp=$(date '+%Y-%m-%d-%H-%M-%S') 
destination_path=$2

function createBackup {
	echo "Creating Backup"
	zip -r "${destination_path}/backup_${timestamp}.zip" "${source_path}" >> /dev/null
}

function rotateBackup {
	echo "Rotating Backup"
	backups=($(ls -t "${destination_path}/backup_"*.zip 2> /dev/null))
	
	if [ ${#backups[@]} -gt 5 ]; then
		echo "Performing rotation for 5 days"

		backups_to_remove=("${backups[@]:5}")
		echo "${backups_to_remove[@]}"

		for backup in "${backups_to_remove[@]}";
		do
			rm -f ${backup}
		done
	fi
}

createBackup
rotateBackup
