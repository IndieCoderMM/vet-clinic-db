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

-- Table for invoices 

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_histories(id),
    PRIMARY KEY (id)
);

-- Table for invoice_items

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY (id)
);

-- Indexing foreign keys

CREATE INDEX medical_history_id_idx ON invoices(medical_history_id);
CREATE INDEX invoice_id_idx ON invoice_items(invoice_id);
CREATE INDEX treatment_id_idx ON invoice_items(treatment_id);
CREATE INDEX patient_id_idx ON medical_histories(patient_id);
