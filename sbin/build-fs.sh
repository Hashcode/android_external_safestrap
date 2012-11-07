#!/sbin/bbx sh
# By: Hashcode
# Last Editted: 10/27/2012

# system/userdata/cache
IMAGE_NAME=${1}
LOOP_DEV=${2}
ROMSLOT_NAME=${3}

BLOCK_DIR=/dev/block
BLOCKNAME_DIR=$BLOCK_DIR
SS_MNT=/ss
SS_DIR=$SS_MNT/safestrap

rm $BLOCKNAME_DIR/$IMAGE_NAME
ln -s $BLOCK_DIR/loop$LOOP_DEV $BLOCKNAME_DIR/$IMAGE_NAME
mke2fs $BLOCKNAME_DIR/$IMAGE_NAME
/sbin/fsync $SS_DIR/$ROMSLOT_NAME/$IMAGE_NAME.img
tune2fs -j $BLOCKNAME_DIR/$IMAGE_NAME
/sbin/fsync $SS_DIR/$ROMSLOT_NAME/$IMAGE_NAME.img

