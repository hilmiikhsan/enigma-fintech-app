package repository

import (
	"database/sql"
	"enigma-fintech/model"
	"enigma-fintech/sqlQuery"
	"fmt"
)

type UserRepository interface {
	BaseRepository[model.Users]
}

type usersRepository struct {
	db *sql.DB
}

func (u *usersRepository) Create(payload model.Users) error {
	_, err := u.db.Exec(sqlQuery.USERS_INSERT,
		payload.Id,
		payload.Name,
		payload.Email,
		payload.Password,
		payload.DateOfBirth)
	if err != nil {
		return err
	}
	return nil
}

func (u *usersRepository) List() ([]model.Users, error) {
	rows, err := u.db.Query(sqlQuery.USERS_LIST)
	if err != nil {
		return nil, err
	}
	var users []model.Users

	for rows.Next() {
		var user model.Users
		err = rows.Scan(
		&user.Id,
		&user.Name,
		&user.Password,
		&user.DateOfBirth)

		if err != nil {
			return users, err
		}

		users = append(users, user) 
	}
	return users, nil
}

func (u *usersRepository) Get(id string) (model.Users, error) {
	var users model.Users
	err := u.db.QueryRow(sqlQuery.USERS_GET, id).Scan(
		&users.Id,
		&users.Name,
		&users.Password,
		&users.DateOfBirth,
	)
	if err != nil {
		return model.Users{}, fmt.Errorf("error Get Users : %s ", err.Error())
	}
	return users, nil
}

func (u *usersRepository) Update(payload model.Users) error {
	_, err := u.db.Exec(sqlQuery.USERS_UPDATE,
		payload.Id,
		payload.Name,
		payload.Password,
		payload.Address,
	)
	if err != nil {
		return fmt.Errorf(" Error Update Users : %s ", err.Error())
	}
	return nil
}

func (u *usersRepository) Delete(id string) error {
	_, err := u.db.Exec(sqlQuery.USERS_DELETE, id)
	if err != nil {
		return fmt.Errorf("repo : Error Delete Users : %s ", err.Error())
	}
	return nil
}

func NewUsersRepository(db *sql.DB) UserRepository {
	return &usersRepository{
		db: db,
	}
}
