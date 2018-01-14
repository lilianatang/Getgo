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

	/* get user info from email and password */
	public function getUserByEmailAndPassword($email, $password) {
		$stm_id = $this->connection->prepare("SELECT * FROM users WHERE email = ?");
		$stm_id->bind_param("s", $email);

		if ($stm_id->execute()) {
			$user = $stm_id->get_result()->fetch_assoc();
			$stm_id->close();

			//verifying user password
			$salt = $user['salt'];
			$encrypted_password = $user['encrypted_password'];
			$hash = $this->checkhashSSHA($salt, $password);

			if ($encrypted_password == $hash) {

				return $user;
			}
		} else {
			return NULL;
		}

	}
	/* check if the user exists in the database by email, returns false if not, true otherwise */
	public function isUserExisted($email) {
		$stm_id = $this->connection->prepare("SELECT email from users WHERE email = ?");
		$stm_id->bind_param("s", $email);
		$stm_id->execute();
		$stm_id->store_result();

		if ($stm_id->num_rows > 0) {
			//user is existed
			$stm_id->close();
			return true;
		} else {
			//user is not existed
			$stm_id->close();
			return false;
		}
	}

	/* encrypting password and returning an array of salt and encrypted password */
	public function hashing($password) {
		$salt = sha1(rand());
		$salt = substr($salt, 0, 10);
		$encrypted = base64_encode(sha1($password, $salt, true), $salt);
		$hash = array("salt" => $salt, "encrypted" => $encrypted);
	       	return $hash;
	}		


	/* decrypting password with the given password and salt to return hash string value */
	public function check_hashing($salt, $password) {
		$hash = base64_encode(sha1($password, $salt, true), $salt);
		return $hash;
	}
}

?>
