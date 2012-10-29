#!/sbin/bbx sh
# By: Hashcode
# Last Editted: 10/27/2012

# system/userdata/cache
IMAGE_NAME=${1}
LOOP_DEV=${2}
ROMSLOT_NAME=${3}

BLOCK_DIR=/dev/block
BLOCKNAME_DIR=/dev/block/platform/omap/omap_hsmmc.1/by-name
SS_MNT=/ss
SS_DIR=$SS_MNT/safestrap

rm $BLOCKNAME_DIR/$IMAGE_NAME
ln -s $BLOCK_DIR/loop$LOOP_DEV $BLOCKNAME_DIR/$IMAGE_NAME
mke2fs $BLOCKNAME_DIR/$IMAGE_NAME
/sbin/fsync /ss/safestrap/$ROMSLOT_NAME/$IMAGE_NAME.img
tune2fs -j $BLOCKNAME_DIR/$IMAGE_NAME
/sbin/fsync /ss/safestrap/$ROMSLOT_NAME/$IMAGE_NAME.img
tune2fs -O extents,uninit_bg,dir_index $BLOCKNAME_DIR/$IMAGE_NAME
/sbin/fsync /ss/safestrap/$ROMSLOT_NAME/$IMAGE_NAME.img
e2fsck -fyD $BLOCKNAME_DIR/$IMAGE_NAME
/sbin/fsync /ss/safestrap/$ROMSLOT_NAME/$IMAGE_NAME.img
