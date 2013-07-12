<?php
	require __DIR__."/../ratchetLib/vendor/autoload.php";

	use Ratchet\ConnectionInterface;
	use Ratchet\Wamp\WampServerInterface;

	class NotificationPusherDemo implements WampServerInterface
	{
		protected $userNotificationChannel = array();
		public $logFileHandle;

		function __construct()
		{
			echo "Server Started...";
			$date = new DateTime();
			$this->logFileHandle = fopen("serverLog/serverLog_".$date->format("dmY").".log", "a");
			$this->logMessage("Server Started...");
		}

		public function logMessage($message)
		{
			$date = new DateTime();
			echo $date->format("dmY_His").": ".$message."\n";
			fwrite($this->logFileHandle, $date->format("dmY_His").": ".$message."\n");
		}

		public function onOpen(ConnectionInterface $conn)
		{
			$this->logMessage("New Connection ({$conn->resourceId})");
		}

		public function onClose(ConnectionInterface $conn)
		{
			$this->logMessage("Connection Closed ({$conn->resourceId})");
		}

		public function onSubscribe(ConnectionInterface $conn, $topic)
		{
			$this->logMessage($topic->getID()." connected...");
			if(!array_key_exists($topic->getID(), $this->userNotificationChannel))
			{
				$this->userNotificationChannel[$topic->getId()] = $topic;
			}
			$topic->add($conn);
		}

		public function onUnSubscribe(ConnectionInterface $conn, $topic)
		{
			$this->logMessage($topic->getID()." disconnected...");
			$topic->remove($conn);
		}

		public function onNotification($notification)
		{
			$notification = json_decode($notification, true);
			if(array_key_exists($notification["uid"], $this->userNotificationChannel))
			{
				$topic = $this->userNotificationChannel[$notification["uid"]];
				$topic->broadcast(json_encode($notification));
				$this->logMessage("Notification Sent");
				echo "Notification Sent";
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
			$this->logMessage("Error: ".$e);
		}

		function __destruct()
		{
			$this->logMessage("Server Shutdown...");
			fclose($this->logFileHandle);
		}
	}
?>
