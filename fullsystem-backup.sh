#!/bin/bash

TODAY=`/bin/date +%Y%m%d-%H:%M`
HOST=`/usr/bin/hostname`
FILENAME="${TODAY}-FULLBACKUP-${HOST}"

tar -cvpf /backups/${FILENAME}.tar –directory=/ –exclude=proc –exclude=sys –exclude=dev/pts –exclude=backups .

exit 0
