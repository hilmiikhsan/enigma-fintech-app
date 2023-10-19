ALTER TABLE "loan_disbursement" DROP CONSTRAINT IF EXISTS "loan_disbursement_application_id_fkey";
ALTER TABLE "loan_disbursement" DROP CONSTRAINT IF EXISTS "loan_disbursement_payment_id_fkey";
ALTER TABLE "loan_application" DROP CONSTRAINT IF EXISTS "loan_application_user_id_fkey";
ALTER TABLE "loan_application" DROP CONSTRAINT IF EXISTS "loan_application_product_id_fkey";
ALTER TABLE "loan_application" DROP CONSTRAINT IF EXISTS "loan_application_status_fkey";
ALTER TABLE "users" DROP CONSTRAINT IF EXISTS "users_role_fkey";

DROP TABLE IF EXISTS "loan_disbursement";
DROP TABLE IF EXISTS "loan_payment";
DROP TABLE IF EXISTS "loan_application";
DROP TABLE IF EXISTS "loan_product";
DROP TABLE IF EXISTS "status";
DROP TABLE IF EXISTS "users";
DROP TABLE IF EXISTS "role";
