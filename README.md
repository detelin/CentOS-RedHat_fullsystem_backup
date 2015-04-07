# CentOS-RedHat_fullsystem_backup

Having a snapshot of your system right after the initial installation gives you something to revert back to should you want to reconfigure your server without starting from scratch or you can take backup your system after a time interval to keep your work safe for future.

Enter the following commands:

    $ cd /
    $ mkdir backups
    $ cd backups

Use the nano editor to create our shell script file with the command:

    $ nano fullsystem-backup.sh

and enter the following command into it (and don’t miss that period at the end of the command):

    #!/bin/bash
    TODAY=`/bin/date +%Y%m%d-%H`
    FILENAME="FULLBACKUP-${TODAY}"

    tar -cvpf /backups/${FILENAME}.tar --directory=/ --exclude=proc --exclude=sys --exclude=dev/pts --exclude=backups .

    exit 0

Exit the editor (Ctrl-X) saving the file.

    The c option creates the backup file.
    The v option gives a more verbose output while the command is running. This option can also be safely eliminated.
    The p option preserves the file and directory permissions.
    The f option needs to go last because it allows you to specify the name and location of the backup file which follows next in the command (in our case this is the /backups/fullbackup.tar file).
    The --directory option tells tar to switch to the root of the file system before starting the backup.
    We --exclude certain directories from the backup because the contents of the directories are dynamically created by the OS. We also want to exclude the directory that contains are backup file.
    Many tar references on the Web will give an exclude example as:
    --exclude=/proc

You have to make your script executable before you can run it. To do that and run it enter the following two commands:

    $ chmod 750 /backups/fullserver-backup.sh
    $ ./backups/fullserver-backup.sh

To restore your “tar ball” you need to copy it to the top-most point in the file tree that it backed up. In our case the –directory option told tar to start backing up from the root of the file system so that’s where we would want to copy the tar ball to. Then simply replace the c option with the x parameter line so:

    $ tar -xvpf /fullbackup.tar

