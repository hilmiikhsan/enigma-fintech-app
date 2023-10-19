CREATE TABLE "users" (
  "id" varchar(100) PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "email" varchar(100) UNIQUE NOT NULL,
  "password" varchar(100) NOT NULL,
  "phone" varchar(20) UNIQUE,
  "address" text,
  "identity_number" varchar(100),
  "date_of_birth" date NOT NULL,
  "verified" bool NOT NULL DEFAULT (false),
  "role" varchar(100) NOT NULL,
  "registration_date" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "role" (
  "id" varchar(100) NOT NULL,
  "name" varchar(100) NOT NULL
);

CREATE TABLE "loan_product" (
  "id" varchar(100) PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "interest_rate" int NOT NULL,
  "minimum_loan" bigint NOT NULL,
  "maximum_loan" bigint NOT NULL,
  "minimum_tenor" int NOT NULL,
  "maximum_tenor" int NOT NULL
);

CREATE TABLE "loan_application" (
  "id" varchar(100) PRIMARY KEY,
  "user_id" varchar(100) NOT NULL,
  "product_id" varchar(100) NOT NULL,
  "loan_amount" bigint NOT NULL,
  "loan_tenor" int NOT NULL,
  "application_date" timestamptz NOT NULL DEFAULT (now()),
  "status" varchar(100) NOT NULL
);

CREATE TABLE "loan_disbursement" (
  "id" varchar(100) PRIMARY KEY,
  "application_id" varchar(100),
  "payment_id" varchar(100) NOT NULL,
  "disbursement_date" timestamptz NOT NULL DEFAULT (now()),
  "amount" bigint NOT NULL
);

CREATE TABLE "loan_payment" (
  "id" varchar(100) PRIMARY KEY,
  "amount" bigint NOT NULL,
  "installment" int NOT NULL,
  "due" date NOT NULL
);

CREATE TABLE "status" (
  "id" varchar(100) PRIMARY KEY,
  "name" varchar(100) NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("role") REFERENCES "role" ("id");

ALTER TABLE "loan_application" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "loan_application" ADD FOREIGN KEY ("product_id") REFERENCES "loan_product" ("id");

ALTER TABLE "loan_application" ADD FOREIGN KEY ("status") REFERENCES "status" ("id");

ALTER TABLE "loan_disbursement" ADD FOREIGN KEY ("application_id") REFERENCES "loan_application" ("id");

ALTER TABLE "loan_disbursement" ADD FOREIGN KEY ("payment_id") REFERENCES "loan_payment" ("id");