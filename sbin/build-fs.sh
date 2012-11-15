#!/sbin/bbx sh
# By: Hashcode
# Last Editted: 11/14/2012

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
mke2fs -T ext4 $BLOCKNAME_DIR/$IMAGE_NAME

