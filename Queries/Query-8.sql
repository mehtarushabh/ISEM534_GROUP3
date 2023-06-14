/*This query retrieves all appointments and sorts the results first in
descending order based on the appointment date and then in ascending order
based on the appointment time.
*/

SELECT *
FROM appointment
ORDER BY appointment_date DESC, appointment_date ASC;