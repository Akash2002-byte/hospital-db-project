CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100),
    experience INT
);

CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    doctor_id INT REFERENCES doctors(doctor_id),
    appointment_date TIMESTAMP,
    status VARCHAR(20)
);

CREATE TABLE treatments (
    treatment_id SERIAL PRIMARY KEY,
    appointment_id INT REFERENCES appointments(appointment_id),
    diagnosis TEXT,
    prescription TEXT
);

CREATE TABLE billing (
    bill_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    amount NUMERIC(10,2),
    payment_status VARCHAR(20),
    bill_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);