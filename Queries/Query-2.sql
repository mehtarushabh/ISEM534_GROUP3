/*
To accomplish this task, we need to do two things:
i. Define the trigger.
ii. Write an INSERT statement that would activate the trigger.
Creating a trigger that will automatically add an entry to the
drug_collection table whenever a new drug prescription is created.
First, we need to create the trigger. It will add an entry to the
drug_collection table using the data from the newly inserted
drug_prescription.
Description:
In this trigger, NEW is a keyword that refers to the new row being
inserted into the drug_prescription table. cost is set to 0 and
collection_date is set to the current date. We are assuming that the
subscription_id from the appointment table matches the appointment_id from
the new drug_prescription.
*/

CREATE TRIGGER prescription_to_collection_trigger
    AFTER INSERT
    ON drug_prescription
    FOR EACH ROW
BEGIN
    INSERT INTO drug_collection (collection_id, cost, collection_date,
                                 prescription_id, subscription_id)
    VALUES (NEW.prescription_id, 0, CURDATE(), NEW.prescription_id,
            NEW.appointment_id);
END;

INSERT INTO drug_prescription(prescription_id, drug_name, quantity,
                              dosage, status, appointment_id, patient_id, doctor_id)
VALUES (10, 'Aspirin', 30, '100mg', 'pending', 5, 1, 1);

SELECT *
FROM drug_collection
WHERE prescription_id = 10


/*When this statement is executed, a new row is inserted into the
drug_prescription table and the prescription_to_collection_trigger is
activated. This trigger creates a new row in the drug_collection table.
*/