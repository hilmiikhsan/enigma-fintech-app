package model

import "time"

type Users struct {
	// TODO: tambahkan field sesuai kolom table users
	Id               string    `json:"id"`
	Name             string    `json:"name"`
	Email            string    `json:"email"`
	Password         string    `json:"password"`
	Phone            string    `json:"phone"`
	Address          string    `json:"address"`
	IdentityNumber   string    `json:"identityNumber"`
	DateOfBirth      string    `json:"dateOfBirth"`
	Verified         bool      `json:"verified"`
	Role             string    `json:"role"`
	RegistrationDate time.Time `json:"registrationDate"`
}
