-- Patients
INSERT INTO patients (name, gender, age, phone)
SELECT 
    'Patient_' || gs,
    CASE WHEN random() > 0.5 THEN 'Male' ELSE 'Female' END,
    (random()*80)::int,
    '90000' || (random()*99999)::int
FROM generate_series(1,50000) gs;

-- Doctors
INSERT INTO doctors (name, specialization, experience)
SELECT 
    'Doctor_' || gs,
    (ARRAY['Cardiology','Neurology','Orthopedic','General'])[floor(random()*4)+1],
    (random()*20)::int
FROM generate_series(1,100) gs;

-- Appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, status)
SELECT 
    (random()*50000)::int + 1,
    (random()*100)::int + 1,
    NOW() - (random()*100 || ' days')::interval,
    (ARRAY['Completed','Pending','Cancelled'])[floor(random()*3)+1]
FROM generate_series(1,100000);