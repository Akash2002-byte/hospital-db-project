-- Find patient appointments
SELECT p.name, d.name, a.appointment_date
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
JOIN doctors d ON d.doctor_id = a.doctor_id
WHERE p.name = 'Patient_10';

-- Top doctors by appointments
SELECT doctor_id, COUNT(*) 
FROM appointments
GROUP BY doctor_id
ORDER BY COUNT(*) DESC
LIMIT 5;

-- Revenue calculation
SELECT SUM(amount) FROM billing;