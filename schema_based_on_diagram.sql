-- Table for Patients

CREATE TABLE patients (
    id INT NOT NULL,
    name VARCHAR(100),
    date_of_birth DATE,
    PRIMARY KEY(id)
);

-- Table for Medical Histories

CREATE TABLE medical_histories (
    id INT,
    admitted_at TIMESTAMP NOT NULL,
    patient_id INT,
    status varchar(100),
    PRIMARY KEY(id),
    FOREIGN KEY(patient_id) REFERENCES patients(id)
);

-- Table for Treatments

CREATE TABLE treatments (
    id INT PRIMARY KEY,
    type VARCHAR,
    name VARCHAR
);

-- Many to many relationship table

CREATE TABLE medical_histories_treatments (
    id INT PRIMARY KEY,
    medical_history_id INT NOT NULL,
    treatment_id INT NOT NULL,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);