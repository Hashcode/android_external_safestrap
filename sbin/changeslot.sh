#!/sbin/bbx sh
BLOCK_DIR=/dev/block
SS_MNT=/ss
SS_DIR=$SS_MNT/safestrap
SS_SLOT=${1}

rm $BLOCK_DIR/system
rm $BLOCK_DIR/userdata
rm $BLOCK_DIR/cache
/sbin/bbx losetup -d $BLOCK_DIR/loop7
/sbin/bbx losetup -d  $BLOCK_DIR/loop6
/sbin/bbx losetup -d  $BLOCK_DIR/loop5

if [ "$SS_SLOT" = "stock" ]; then
	ln -s $BLOCK_DIR/systemorig $BLOCK_DIR/system
	ln -s $BLOCK_DIR/userdataorig $BLOCK_DIR/userdata
	ln -s $BLOCK_DIR/cacheorig $BLOCK_DIR/cache
else
	/sbin/bbx losetup $BLOCK_DIR/loop7 $SS_DIR/$SS_SLOT/system.img
	/sbin/bbx losetup $BLOCK_DIR/loop6 $SS_DIR/$SS_SLOT/userdata.img
	/sbin/bbx losetup $BLOCK_DIR/loop5 $SS_DIR/$SS_SLOT/cache.img
	/sbin/bbx ln -s $BLOCK_DIR/loop7 $BLOCK_DIR/system
	/sbin/bbx ln -s $BLOCK_DIR/loop6 $BLOCK_DIR/userdata
	/sbin/bbx ln -s $BLOCK_DIR/loop5 $BLOCK_DIR/cache
fi
echo "$SS_SLOT" > $SS_DIR/active_slot

