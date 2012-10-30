#!/sbin/bbx sh
# By: Hashcode
# Last Editted: 10/23/2012
SS_SLOT=${1}
BLOCK_DIR=/dev/block
BLOCKNAME_DIR=$BLOCK_DIR/platform/msm_sdcc.1/by-name
SS_MNT=/ss
SS_DIR=$SS_MNT/safestrap

rm $BLOCKNAME_DIR/system
rm $BLOCKNAME_DIR/userdata
rm $BLOCKNAME_DIR/cache
/sbin/bbx losetup -d $BLOCK_DIR/loop7
/sbin/bbx losetup -d $BLOCK_DIR/loop6
/sbin/bbx losetup -d $BLOCK_DIR/loop5

if [ "$SS_SLOT" = "stock" ]; then
	ln -s $BLOCKNAME_DIR/systemorig $BLOCKNAME_DIR/system
	ln -s $BLOCKNAME_DIR/userdataorig $BLOCKNAME_DIR/userdata
	ln -s $BLOCKNAME_DIR/cacheorig $BLOCKNAME_DIR/cache
else
	/sbin/bbx losetup $BLOCK_DIR/loop7 $SS_DIR/$SS_SLOT/system.img
	/sbin/bbx losetup $BLOCK_DIR/loop6 $SS_DIR/$SS_SLOT/userdata.img
	/sbin/bbx losetup $BLOCK_DIR/loop5 $SS_DIR/$SS_SLOT/cache.img
	/sbin/bbx ln -s $BLOCK_DIR/loop7 $BLOCKNAME_DIR/system
	/sbin/bbx ln -s $BLOCK_DIR/loop6 $BLOCKNAME_DIR/userdata
	/sbin/bbx ln -s $BLOCK_DIR/loop5 $BLOCKNAME_DIR/cache
fi
echo "$SS_SLOT" > $SS_DIR/active_slot

