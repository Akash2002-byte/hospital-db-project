-- Indexes
CREATE INDEX idx_patient ON appointments(patient_id);
CREATE INDEX idx_doctor ON appointments(doctor_id);

-- Slow query check
EXPLAIN ANALYZE
SELECT * FROM appointments WHERE patient_id = 100;

-- Optimize
CREATE INDEX idx_patient_id ON appointments(patient_id);