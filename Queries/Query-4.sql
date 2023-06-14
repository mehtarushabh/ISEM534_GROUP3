DROP TRIGGER IF EXISTS delete_patient_trigger;
CREATE TRIGGER delete_patient_trigger
    BEFORE DELETE
    ON patient
    FOR EACH ROW
BEGIN
    -- Delete corresponding records in drug_collection table
    DELETE
    FROM drug_collection
    WHERE subscription_id IN (SELECT subscription_id
                              FROM policy_subscriptions
                              WHERE patient_id = OLD.patient_id);
-- Delete corresponding records in drug_prescription table
    DELETE
    FROM drug_prescription
    WHERE patient_id = OLD.patient_id;
-- Delete corresponding records in appointment table
    DELETE
    FROM appointment
    WHERE patient_id = OLD.patient_id;
-- Delete corresponding records in policy_subscriptions table
    DELETE
    FROM policy_subscriptions
    WHERE patient_id = OLD.patient_id;
END;


DELETE FROM patient WHERE patient_id = 3