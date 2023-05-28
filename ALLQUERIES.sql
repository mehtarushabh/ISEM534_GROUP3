DROP DATABASE IF EXISTS ISEM534_GROUP3;

CREATE DATABASE ISEM534_GROUP3;

USE ISEM534_GROUP3;



CREATE TABLE doctor
(
    doctor_id  INT          NOT NULL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100) NULL,
    speciality VARCHAR(100) NULL
);

CREATE TABLE patient
(
    patient_id INT          NOT NULL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    dob        DATE         NULL,
    ssn VARCHAR(100)    NOT NULL
);

CREATE TABLE pharmacy
(
    pharmacy_id INT          NOT NULL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    address     VARCHAR(200) NOT NULL
);

CREATE TABLE insurance_policy
(
    policy_id     INT          NOT NULL PRIMARY KEY,
    policy_name   VARCHAR(100) NOT NULL,
    coverage INT NOT NULL,
    provider_name VARCHAR(100) NOT NULL
);

CREATE TABLE drug_inventory
(
    inventory_id INT          NOT NULL PRIMARY KEY,
    name         VARCHAR(100) NULL,
    quantity     INT          NULL,
    pharmacy_id  INT          NULL,
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacy (pharmacy_id)
);

CREATE TABLE policy_subscriptions
(
    subscription_id  INT  NOT NULL PRIMARY KEY,
    date_of_purchase DATE NOT NULL,
    expiration_date  DATE NOT NULL,
    patient_id       INT  NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patient (patient_id),
    policy_id        INT  NOT NULL,
    FOREIGN KEY (policy_id) REFERENCES insurance_policy (policy_id)
);

CREATE TABLE appointment
(
    appointment_id   INT NOT NULL PRIMARY KEY,
    appointment_type VARCHAR(50),
    appointment_date DATE,
    appointment_time VARCHAR(50),
    patient_id       INT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patient (patient_id),
    doctor_id        INT NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES doctor (doctor_id),
    subscription_id  INT NOT NULL,
    FOREIGN KEY (subscription_id) REFERENCES policy_subscriptions (subscription_id)
);

CREATE TABLE drug_prescription
(
    prescription_id INT          NOT NULL PRIMARY KEY,
    drug_name       VARCHAR(100) NOT NULL,
    quantity        INT          NOT NULL,
    dosage          VARCHAR(100) NOT NULL,
    status          VARCHAR(100),
    appointment_id  INT          NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES appointment (appointment_id),
    patient_id      INT          NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patient (patient_id),
    doctor_id       INT          NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES doctor (doctor_id)
);

CREATE TABLE drug_collection
(
    collection_id   INT     NOT NULL PRIMARY KEY,
    cost            INT     NOT NULL,
    collection_date DATE    NOT NULL,
    paid            BOOLEAN NOT NULL DEFAULT FALSE,
    prescription_id INT     NOT NULL,
    FOREIGN KEY (prescription_id) REFERENCES drug_prescription (prescription_id),
    pharmacy_id     INT     NULL,
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacy (pharmacy_id),
    subscription_id INT     NOT NULL,
    FOREIGN KEY (subscription_id) REFERENCES policy_subscriptions (subscription_id)
);


INSERT INTO doctor (doctor_id, first_name, last_name, speciality)
VALUES (1,'Adam','Smith','Cardiologist');

INSERT INTO doctor (doctor_id, first_name, last_name, speciality)
VALUES (2,'Parishma','Thakkar','Neurologist');

INSERT INTO doctor (doctor_id, first_name, last_name, speciality)
VALUES (3,'David','Jones','General Physician');

INSERT INTO doctor (doctor_id, first_name, last_name, speciality)
VALUES (4,'Christopher','Nolan','Cardiologist');

INSERT INTO doctor (doctor_id, first_name, last_name, speciality)
VALUES (5,'John','Doe','Neurologist');

INSERT INTO doctor (doctor_id, first_name, last_name, speciality)
VALUES (6,'Varidhi','Duggal','General Physician');



INSERT INTO patient (patient_id, first_name, last_name, address, dob, ssn)
VALUES (1, 'Donald', 'Josephson', '3348 Parrill Court
Bridgeview, IN 60455', '1993-04-01', '123-45-7846');

INSERT INTO patient (patient_id, first_name, last_name, address, dob, ssn)
VALUES (2, 'Lisa', 'Mock', '4192 Myra Street
Providence, RI 02905', '1973-07-02', '435-78-6744');

INSERT INTO patient (patient_id, first_name, last_name, address, dob, ssn)
VALUES (3, 'Piper', 'Finney', '1437 Parkway Drive
Tucson, AZ 85712', '1984-07-02', '729-89-7688');

INSERT INTO patient (patient_id, first_name, last_name, address, dob, ssn)
VALUES (4, 'Yan', 'Chuang', '99 Ritter Avenue
Warren, MI 48093', '1984-07-02', '235-67-3345');

INSERT INTO patient (patient_id, first_name, last_name, address, dob, ssn)
VALUES (5, 'Jie', 'Teng', '2917 Blane Street
Saint Louis, MO 63101', '1997-04-12', '535-67-3385');

INSERT INTO patient (patient_id, first_name, last_name, address, dob, ssn)
VALUES (6, 'Larissa', 'Pinto', '189 Cedarstone Drive
Toledo, OH 43613', '1982-07-19', '535-67-3385');

INSERT INTO patient (patient_id, first_name, last_name, address, dob, ssn)
VALUES (7, 'Larissa', 'Pinto', '2520 Golden Street
Miami, FL 33179', '1982-07-19', '535-67-3385');

INSERT INTO patient (patient_id, first_name, last_name, address, dob, ssn)
VALUES (8, 'Arno', 'Longpré', '3263 Howard Street
Grand Rapids, MI 49503', '1972-03-29', '363-18-3385');

INSERT INTO pharmacy (pharmacy_id, name, address)
VALUES (1, 'CVS', '4779 Blue Spruce Lane Sparrows Point, MD 21219');

INSERT INTO pharmacy (pharmacy_id, name, address)
VALUES (2, 'Walgreens', '3120 Washburn Street Baton Rouge, LA 70806');

INSERT INTO pharmacy (pharmacy_id, name, address)
VALUES (3, 'Walmart Pharmacy', '4985 Whispering Pines Circle Irving, TX 75039');

INSERT INTO pharmacy (pharmacy_id, name, address)
VALUES (4, 'Target Pharmacy', '2189 Rowes Lane Clarkson, KY 42726');


INSERT INTO insurance_policy (policy_id, policy_name, coverage, provider_name)
VALUES (1, 'Silver Plan', 30000, 'Aetna');

INSERT INTO insurance_policy (policy_id, policy_name, coverage, provider_name)
VALUES (2, 'Gold Plan', 50000, 'Aetna');

INSERT INTO insurance_policy (policy_id, policy_name, coverage, provider_name)
VALUES (3, 'Platinum Plan', 70000, 'Aetna');

INSERT INTO insurance_policy (policy_id, policy_name, coverage, provider_name)
VALUES (4, 'Basic', 50000, 'Blue Cross');

INSERT INTO insurance_policy (policy_id, policy_name, coverage, provider_name)
VALUES (5, 'Advanced', 80000, 'Blue Cross');



INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (1, 'Advil', 200, 1);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (2, 'Tylenol', 100, 1);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (3, 'Vicks Nasal Spray', 10, 1);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (4, 'Cough Losenges', 10, 1);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (5, 'Excedrin', 10, 1);


INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (6, 'Advil', 20, 2);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (7, 'Tylenol', 0, 2);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (8, 'Vicks Nasal Spray', 0, 2);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (9, 'Cough Losenges', 10, 2);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (10, 'Excedrin', 10, 2);


INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (11, 'Advil', 20, 3);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (12, 'Tylenol', 0, 3);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (13, 'Vicks Nasal Spray', 0, 3);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (14, 'Cough Losenges', 10, 3);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (15, 'Excedrin', 10, 3);



INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (16, 'Advil', 20, 4);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (17, 'Tylenol', 0, 4);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (18, 'Vicks Nasal Spray', 0, 4);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (19, 'Cough Losenges', 10, 4);

INSERT INTO drug_inventory (inventory_id, name, quantity, pharmacy_id)
VALUES (20, 'Excedrin', 10, 4);




INSERT INTO policy_subscriptions (subscription_id, date_of_purchase, expiration_date, patient_id, policy_id)
VALUES (1,'2023-08-24','2024-08-24',1,2);

INSERT INTO policy_subscriptions (subscription_id, date_of_purchase, expiration_date, patient_id, policy_id)
VALUES (2,'2023-08-24','2024-08-24',2,3);

INSERT INTO policy_subscriptions (subscription_id, date_of_purchase, expiration_date, patient_id, policy_id)
VALUES (3,'2023-08-24','2024-08-24',3,1);

INSERT INTO policy_subscriptions (subscription_id, date_of_purchase, expiration_date, patient_id, policy_id)
VALUES (4,'2023-08-24','2024-08-24',4,2);

INSERT INTO policy_subscriptions (subscription_id, date_of_purchase, expiration_date, patient_id, policy_id)
VALUES (5,'2023-08-24','2024-08-24',5,4);

INSERT INTO policy_subscriptions (subscription_id, date_of_purchase, expiration_date, patient_id, policy_id)
VALUES (6,'2023-08-24','2024-08-24',6,5);

INSERT INTO policy_subscriptions (subscription_id, date_of_purchase, expiration_date, patient_id, policy_id)
VALUES (7,'2023-08-24','2024-08-24',7,1);

INSERT INTO policy_subscriptions (subscription_id, date_of_purchase, expiration_date, patient_id, policy_id)
VALUES (8,'2023-08-24','2024-08-24',8,2);


