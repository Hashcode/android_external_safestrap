#!/sbin/bbx sh
# By: Hashcode
# Last Editted: 10/23/2012
BLOCK_DIR=/dev/block
BLOCKNAME_DIR=$BLOCK_DIR/platform/msm_sdcc.1/by-name

SS_PART=userdataorig
USER_MNT=/u2
IMG_TYPE=ext4
SS_MNT=/ss
SS_DIR=$SS_MNT/safestrap

# move real partitions out of the way
/sbin/bbx mv $BLOCKNAME_DIR/system $BLOCKNAME_DIR/systemorig
/sbin/bbx mv $BLOCKNAME_DIR/userdata $BLOCKNAME_DIR/userdataorig
/sbin/bbx mv $BLOCKNAME_DIR/cache $BLOCKNAME_DIR/cacheorig

# remount root as rw
/sbin/bbx mount -o remount,rw rootfs
/sbin/bbx mkdir $USER_MNT
/sbin/bbx chmod 777 $USER_MNT
/sbin/bbx mkdir $SS_MNT
/sbin/bbx chmod 777 $SS_MNT

# mount safestrap partition
/sbin/e2fsck -p $BLOCKNAME_DIR/$SS_PART
/sbin/bbx mount -t $IMG_TYPE $BLOCKNAME_DIR/$SS_PART $USER_MNT
/sbin/bbx mount $USER_MNT/media $SS_MNT

#/sbin/bbx mount -o remount,ro rootfs
SLOT_LOC=$(/sbin/bbx cat $SS_DIR/active_slot)

if [ -f "$SS_DIR/$SLOT_LOC/system.img" ] && [ -f "$SS_DIR/$SLOT_LOC/userdata.img" ] && [ -f "$SS_DIR/$SLOT_LOC/cache.img" ]; then
	# setup loopbacks
	/sbin/bbx losetup $BLOCK_DIR/loop7 $SS_DIR/$SLOT_LOC/system.img
	/sbin/bbx losetup $BLOCK_DIR/loop6 $SS_DIR/$SLOT_LOC/userdata.img
	/sbin/bbx losetup $BLOCK_DIR/loop5 $SS_DIR/$SLOT_LOC/cache.img

	# change symlinks
	/sbin/bbx ln -s $BLOCK_DIR/loop7 $BLOCKNAME_DIR/system
	/sbin/bbx ln -s $BLOCK_DIR/loop6 $BLOCKNAME_DIR/userdata
	/sbin/bbx ln -s $BLOCK_DIR/loop5 $BLOCKNAME_DIR/cache
else
	echo "stock" > $SS_DIR/active_slot
	/sbin/bbx ln -s $BLOCKNAME_DIR/systemorig $BLOCKNAME_DIR/system
	/sbin/bbx ln -s $BLOCKNAME_DIR/userdataorig $BLOCKNAME_DIR/userdata
	/sbin/bbx ln -s $BLOCKNAME_DIR/cacheorig $BLOCKNAME_DIR/cache
fi

/sbin/taskset -p -c 0,1 1
