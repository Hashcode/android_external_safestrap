#/sbin/bbx sh
sleep 5
echo "do_watchdog::post sleep" > /cache/watchdog.log
/sbin/strace -ff -F -tt -s 200 -o /cache/watchdog.pid /sbin/watchdog -t 30 >> /cache/watchdog.log
