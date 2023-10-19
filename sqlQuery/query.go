package sqlQuery

const(
	USERS_INSERT = "INSERT INTO users(id, name, email, password, date_of_birth,)VALUES($1, $2, $3, $4, $5)"
	USERS_LIST   = "SELECT name FROM users limit=$1 offset=2"
	USERS_GET    = "SELECT * FROM users where name=$1"
	USERS_UPDATE = "UPDATE users SET, phone=$2, address=$3, identity_number=$4, date_of_birth=$5, verified=$6,  WHERE id=$1"
	USERS_DELETE = "DELETE FROM users WHERE id=$1"
)
