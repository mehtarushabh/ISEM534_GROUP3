SELECT DISTINCT d.doctor_id                            AS doctor_id,
                CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
                dp.drug_name                           AS prescription_drug,
                dp.quantity                            AS prescription_quantity,
                dp.dosage                              AS prescription_dosage,
                dp.status                              AS prescription_status,
                ip.policy_name                         AS insurance_policy,
                ip.provider_name                       AS insurance_provider
FROM doctor d
         JOIN drug_prescription dp ON dp.doctor_id = d.doctor_id
         JOIN patient p ON p.patient_id = dp.patient_id
         JOIN policy_subscriptions ps ON ps.patient_id = p.patient_id
         JOIN insurance_policy ip ON ip.policy_id = ps.policy_id
WHERE CONCAT(p.first_name, ' ', p.last_name) = 'Donald Josephson'
  AND p.patient_id IN (SELECT DISTINCT patient_id
                       FROM appointment);

/*This query retrieves the details associated with a given patient named
‘Donald Josephson’. It includes the doctor’s ID and name who wrote the
prescription, along with prescription details such as drug name, quantity,
dosage, and status. It also includes the patient’s insurance details such
as the name of the insurance provider and policy name. The DISTINCT clause
ensures that only unique rows are returned. CONCAT keyword is used to
combine first and last names for easy reading and JOIN clause is used to
combine multiple tables to return the correct data associated with the
patient.
The query also checks if the patient is active (has/had appointments) to
return more meaningful results for patients active in the system.
The significance of this query is to provide a specific patient with a
comprehensive list of their prescriptions, including the prescribing
doctors’ information and insurance plan, allowing them to review their
medication history. This information is valuable for both the patient and
healthcare provider.*/