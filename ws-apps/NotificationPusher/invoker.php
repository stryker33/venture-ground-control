<?php

	$notification = array(
		"id" => "1",
		"type" => "connRequest",
		"from" => "1"
	);

	$context = new ZMQContext();
	$socket = $context->getSocket(ZMQ::SOCKET_PUSH, "notificationPusher");
	$socket->connect("tcp://localhost:5555");

	$socket->send(json_encode($notification));

	echo json_encode($notification);
?>