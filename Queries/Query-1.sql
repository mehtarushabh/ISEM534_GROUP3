/*Query #1: Below is a SQL SELECT statement that includes two aggregate
functions: COUNT and AVG. This query will return the total number of
prescriptions given by each doctor and the average quantity of drugs per
prescription.*/


SELECT dp.doctor_id,
       COUNT(*)         AS total_prescriptions,
       AVG(dp.quantity) AS average_quantity_per_prescription
FROM drug_prescription dp
GROUP BY dp.doctor_id;


/*This query works by grouping the data in the drug_prescription table by
doctor_id. For each group, it computes two aggregates:
COUNT(*) which counts the total number of rows in each group. This gives
us the total number of prescriptions given by each doctor.
AVG(dp.quantity) which calculates the average quantity of drugs per
prescription for each doctor.*/


SELECT d.*, appt_count
FROM doctor d
         INNER JOIN (SELECT doctor_id, COUNT(*) AS appt_count
                     FROM appointment
                     WHERE appointment_date <= CURDATE()
                     GROUP BY doctor_id) AS appt ON d.doctor_id = appt.doctor_id
ORDER BY appt_count DESC;


SELECT *
FROM patient
WHERE patient_id IN
      (SELECT DISTINCT patient_id
       FROM drug_prescription
       WHERE status = 'Pending');