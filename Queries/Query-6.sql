/*This query retrieves information about the patients whose prescription
status is ‘Pending’ using a subquery.
*/

SELECT *
FROM patient
WHERE patient_id IN (SELECT DISTINCT patient_id
                     FROM drug_prescription
                     WHERE status = 'Pending');