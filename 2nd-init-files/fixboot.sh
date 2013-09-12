#!/sbin/bbx sh
# By: Hashcode
# Last Editted: 09/11/2013
BLOCK_DIR=/dev/block
BLOCK_SYSTEM=mmcblk0p16
BLOCK_USERDATA=mmcblk0p29
BLOCK_CACHE=mmcblk0p18
BLOCK_BOOT=mmcblk0p20

SS_PART=$BLOCK_USERDATA-orig
USER_MNT=/datamedia
IMG_TYPE=ext4
SS_MNT=/ss
SS_DIR=$SS_MNT/safestrap

# check for SS loopdevs
if [ ! -f "$BLOCK_DIR/loop-system" ]; then
	# create SS loopdevs
	/sbin/bbx mknod -m600 /dev/block/loop-system b 7 99
	/sbin/bbx mknod -m600 /dev/block/loop-userdata b 7 98
	/sbin/bbx mknod -m600 /dev/block/loop-cache b 7 97
	/sbin/bbx mknod -m600 /dev/block/loop-boot b 7 96
fi

# check for systemorig partition alias so we don't run this twice
if [ ! -f "$BLOCK_DIR/$BLOCK_SYSTEM-orig" ]; then
	# move real partitions out of the way
	/sbin/bbx mv $BLOCK_DIR/$BLOCK_SYSTEM $BLOCK_DIR/$BLOCK_SYSTEM-orig
	/sbin/bbx mv $BLOCK_DIR/$BLOCK_USERDATA $BLOCK_DIR/$BLOCK_USERDATA-orig
	/sbin/bbx mv $BLOCK_DIR/$BLOCK_CACHE $BLOCK_DIR/$BLOCK_CACHE-orig
	/sbin/bbx mv $BLOCK_DIR/$BLOCK_BOOT $BLOCK_DIR/$BLOCK_BOOT-orig

	# remount root as rw
	/sbin/bbx mount -o remount,rw rootfs
	/sbin/bbx mkdir $USER_MNT
	/sbin/bbx chmod 777 $USER_MNT
	/sbin/bbx mkdir $SS_MNT
	/sbin/bbx chmod 777 $SS_MNT

	# mount safestrap partition
	/sbin/bbx mount -t $IMG_TYPE $BLOCK_DIR/$SS_PART $USER_MNT
	/sbin/bbx mount $USER_MNT/media $SS_MNT
	SLOT_LOC=$(/sbin/bbx cat $SS_DIR/active_slot)

	if [ -f "$SS_DIR/$SLOT_LOC/system.img" ] && [ -f "$SS_DIR/$SLOT_LOC/userdata.img" ] && [ -f "$SS_DIR/$SLOT_LOC/cache.img" ]; then
		# setup loopbacks
		/sbin/bbx losetup $BLOCK_DIR/loop-system $SS_DIR/$SLOT_LOC/system.img
		/sbin/bbx losetup $BLOCK_DIR/loop-userdata $SS_DIR/$SLOT_LOC/userdata.img
		/sbin/bbx losetup $BLOCK_DIR/loop-cache $SS_DIR/$SLOT_LOC/cache.img
#		/sbin/bbx losetup $BLOCK_DIR/loop-boot $SS_DIR/$SLOT_LOC/boot.img

		# change symlinks
		/sbin/bbx ln -s $BLOCK_DIR/loop-system $BLOCK_DIR/$BLOCK_SYSTEM
		/sbin/bbx ln -s $BLOCK_DIR/loop-userdata $BLOCK_DIR/$BLOCK_USERDATA
		/sbin/bbx ln -s $BLOCK_DIR/loop-cache $BLOCK_DIR/$BLOCK_CACHE
#		/sbin/bbx ln -s $BLOCK_DIR/loop-boot $BLOCK_DIR/$BLOCK_BOOT
		/sbin/bbx ln -s /dev/null $BLOCK_DIR/$BLOCK_BOOT
	else
		echo "stock" > $SS_DIR/active_slot
		/sbin/bbx ln -s $BLOCK_DIR/$BLOCK_SYSTEM-orig $BLOCK_DIR/$BLOCK_SYSTEM
		/sbin/bbx ln -s $BLOCK_DIR/$BLOCK_USERDATA-orig $BLOCK_DIR/$BLOCK_USERDATA
		/sbin/bbx ln -s $BLOCK_DIR/$BLOCK_CACHE-orig $BLOCK_DIR/$BLOCK_CACHE
		/sbin/bbx ln -s $BLOCK_DIR/$BLOCK_BOOT-orig $BLOCK_DIR/$BLOCK_BOOT
	fi
fi

/sbin/taskset -p -c 0,1 1
