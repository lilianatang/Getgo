<?php

class DB_Fetch {

	private $connection;

	function __construct() {
		require_once 'include_php/db_connect.php';

		$db = new DB_Connect();
		$this->connection = $db->connect();
	}

	function __destruct() {

	}

	/* store new user, return user info */
	public function new_user($name, $email, $password) {
		$unique_id = uniquid('', true);
		$hash = $this->hashSSHA($password);
		$encrypted_password = $hash["encrypted"];
		$salt = $hash["salt"];

		// insert new user to our users table
		$stm_id = $this->connection->prepare("INSERT INTO users(unique_id, username, email, encrypted_password, salt, created_at) VALUES(?, ?, ?, ?, ?, NOW())");

		$stm_id->bind_param("sssss", $unique_id, $name, $email, $encrypted_password, $salt);
		$result = $smt_id->execute();
		$smt_id->close();

		// check if the insert statement was executed successfully
		if ($result) {
			$smt_id = $this->connection->prepare("SELECT * FROM users WHERE email = ?");
			$smt_id->bind_param("s", $email);
			$smt_id->execute();
			$user = $smt_id->get_result()->fetch_assoc();
			$stm_id->close();

			return $user;
		} else {
			return false;
		}

	}

	
}