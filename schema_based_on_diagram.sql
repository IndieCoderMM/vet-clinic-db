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
)