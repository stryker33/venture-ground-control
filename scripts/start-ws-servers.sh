#!/bin/bash

# Start the Notification Sever
nohup php $GC/ws-apps/NotificationPusher/NotificationServer.php > /dev/null &
