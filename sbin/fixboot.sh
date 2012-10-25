#!/sbin/bbx sh
SS_MNT=/ss
SS_DIR=$SS_MNT/safestrap
SS_PART=emstorage
BLOCK_DIR=/dev/block

# remount root as rw
/sbin/bbx mount -o remount,rw rootfs
/sbin/bbx mkdir $SS_MNT
/sbin/bbx chmod 777 $SS_MNT
#/sbin/bbx mount -o remount,ro rootfs

# mount safestrap partition
/sbin/bbx mount -t vfat $BLOCK_DIR/$SS_PART $SS_MNT
SLOT_LOC=$(/sbin/bbx cat $SS_DIR/active_slot)

/sbin/bbx mv $BLOCK_DIR/system $BLOCK_DIR/systemorig
/sbin/bbx mv $BLOCK_DIR/userdata $BLOCK_DIR/userdataorig
/sbin/bbx mv $BLOCK_DIR/cache $BLOCK_DIR/cacheorig
if [ -f "$SS_DIR/$SLOT_LOC/system.img" ] && [ -f "$SS_DIR/$SLOT_LOC/userdata.img" ] && [ -f "$SS_DIR/$SLOT_LOC/cache.img" ]; then
	# setup loopbacks
	/sbin/bbx losetup $BLOCK_DIR/loop7 $SS_DIR/$SLOT_LOC/system.img
	/sbin/bbx losetup $BLOCK_DIR/loop6 $SS_DIR/$SLOT_LOC/userdata.img
	/sbin/bbx losetup $BLOCK_DIR/loop5 $SS_DIR/$SLOT_LOC/cache.img

	# change symlinks
	/sbin/bbx ln -s $BLOCK_DIR/loop7 $BLOCK_DIR/system
	/sbin/bbx ln -s $BLOCK_DIR/loop6 $BLOCK_DIR/userdata
	/sbin/bbx ln -s $BLOCK_DIR/loop5 $BLOCK_DIR/cache
else
	echo "stock" > /ss/safestrap/active_slot
	/sbin/bbx ln -s $BLOCK_DIR/systemorig $BLOCK_DIR/system
	/sbin/bbx ln -s $BLOCK_DIR/userdataorig $BLOCK_DIR/userdata
	/sbin/bbx ln -s $BLOCK_DIR/cacheorig $BLOCK_DIR/cache
fi


