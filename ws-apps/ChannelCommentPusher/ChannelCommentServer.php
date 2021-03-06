<?php
	require __DIR__."/../ratchetLib/vendor/autoload.php";
	require __DIR__."/ChannelCommentPusher.php";

	$loop = React\EventLoop\Factory::create();
	$notificationPusher = new ChannelCommentPusher();

	// Listen for a notification push from the web server
	$context = new React\ZMQ\Context($loop);
	$pull = $context->getSocket(ZMQ::SOCKET_PULL);
	$pull->bind("tcp://127.0.0.1:5556");
	$pull->on("message", array($notificationPusher, "onNotification"));

	// Websocket Server for notification subscribers
	$webSocket = new  React\Socket\Server($loop);
	$webSocket->listen("8081", "0.0.0.0");
	$webSocketServer = new Ratchet\Server\IoServer(
		new Ratchet\WebSocket\WsServer(
			new Ratchet\Wamp\WampServer(
				$notificationPusher
			)
		), 
		$webSocket
	);

	$loop->run();
?>