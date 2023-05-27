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