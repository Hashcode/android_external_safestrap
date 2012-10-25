#!/sbin/bbx sh
SS_SLOT=${1}

rm /dev/block/system
rm /dev/block/userdata
rm /dev/block/cache
/sbin/bbx losetup -d /dev/block/loop7
/sbin/bbx losetup -d  /dev/block/loop6
/sbin/bbx losetup -d  /dev/block/loop5

if [ "$SS_SLOT" = "stock" ]; then
	ln -s /dev/block/systemorig /dev/block/system
	ln -s /dev/block/userdataorig /dev/block/userdata
	ln -s /dev/block/cacheorig /dev/block/cache
else
	/sbin/bbx losetup /dev/block/loop7 /ss/safestrap/$SS_SLOT/system.img
	/sbin/bbx losetup /dev/block/loop6 /ss/safestrap/$SS_SLOT/userdata.img
	/sbin/bbx losetup /dev/block/loop5 /ss/safestrap/$SS_SLOT/cache.img
	/sbin/bbx ln -s /dev/block/loop7 /dev/block/system
	/sbin/bbx ln -s /dev/block/loop6 /dev/block/userdata
	/sbin/bbx ln -s /dev/block/loop5 /dev/block/cache
fi
echo "$SS_SLOT" > /ss/safestrap/active_slot

