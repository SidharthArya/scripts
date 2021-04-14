#!/bin/bash

SNAPSHOT_ZFS="pool/documents"

for vol in ${SNAPSHOT_ZFS};
do
	zfs snapshot ${vol}@$(date +'%Y-%m-%d')
done
exit 0
