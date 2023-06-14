/*This query retrieves information about doctors along with their
corresponding appointment counts in descending order using a subquery
  */

SELECT d.*, appt_count
FROM doctor d
         INNER JOIN (SELECT doctor_id, COUNT(*) AS appt_count
                     FROM appointment
                     WHERE appointment_date <= CURDATE()
                     GROUP BY doctor_id) AS appt ON d.doctor_id = appt.doctor_id
ORDER BY appt_count DESC;

