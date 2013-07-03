#!/bin/bash

# Kill all background jobs
kill -9 $(jobs -p)

# Start the Notification Server
nohup php $GC/ws-apps/NotificationPusher/NotificationServer.php > /dev/null &

exit 0