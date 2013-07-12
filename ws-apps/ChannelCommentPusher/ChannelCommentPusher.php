<?php
	require __DIR__."/../ratchetLib/vendor/autoload.php";

	use Ratchet\ConnectionInterface;
	use Ratchet\Wamp\WampServerInterface;

	class ChannelCommentPusher implements WampServerInterface
	{
		protected $channels = array();
		public $logFileHandle;

		function __construct()
		{
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
			$this->logMessage($conn->resourceId." subscribed to ".$topic->getId());
			if(!array_key_exists($topic->getID(), $this->channels))
			{
				$this->channels[$topic->getId()] = $topic;
			}
			$topic->add($conn);
		}

		public function onUnSubscribe(ConnectionInterface $conn, $topic)
		{
			$this->logMessage($conn->resourceId." unsubscribed from ".$topic);
			$topic->remove($conn);
			if($topic->count == 0)
				unset($this->channels[$topic->getId()]);
		}

		public function onNotification($notification)
		{
			$this->logMessage($notification." recieved...");
			$notification = json_decode($notification, true);
			if(array_key_exists($notification["cid"], $this->channels))
			{
				$topic = $this->channels[$notification["cid"]];
				$topic->broadcast(json_encode($notification));
				$this->logMessage($notification["comment"]." sent to subscribers...");
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
