<?php
	require __DIR__."/../../vendor/autoload.php";

	use Ratchet\ConnectionInterface;
	use Ratchet\Wamp\WampServerInterface;

	class NotificationPusherDemo implements WampServerInterface
	{
		protected $notificationChannel = array();

		public function onOpen(ConnectionInterface $conn)
		{
			echo "New Connection ({$conn->resourceId})\n";
		}

		public function onClose(ConnectionInterface $conn)
		{
			echo "Connection Closed ({$conn->resourceId})\n";
		}

		public function onSubscribe(ConnectionInterface $conn, $topic)
		{
			if(!array_key_exists($topic->getID(), $this->notificationChannel))
			{
				$this->notificationChannel[$topic->getId()] = $topic;
			}
			$topic->add($conn);
		}

		public function onUnSubscribe(ConnectionInterface $conn, $topic)
		{
			$topic->remove($conn);
		}

		public function onNotification($notification)
		{
			$notification = json_decode($notification, true);
			if(array_key_exists($notification["id"], $this->notificationChannel))
			{
				$topic = $this->notificationChannel[$notification["id"]];
				$topic->broadcast(json_encode($notification));
				echo "Notification Sent\n";
			}
		}

		public function onCall(ConnectionInterface $conn, $id, $topic, array $params)
		{
			$conn->callError($id, $topic, "Calls not allowed")->close();
		}

		public function onPublish(ConnectionInterface $conn, $topic, $event, array $exclude, array $eligible)
		{
			$conn->close();
		}

		public function onError(ConnectionInterface $conn, \Exception $e)
		{
			echo "Error: ".$e."\n";
		}
	}

?>