/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100) NOT NULL,
	date_of_birth DATE,
	escape_attempts INT,
	neutered BOOL,
	weight_kg DECIMAL,
	species VARCHAR(100)
);

CREATE TABLE owners(
	id INT GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR(100),
	age INT,
	PRIMARY KEY (id)
);

CREATE TABLE species(
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100),
	PRIMARY KEY(id)
);

-- Adding Foreign Keys to animals table
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);
ALTER TABLE animals ADD PRIMARY KEY (id);

CREATE TABLE vets(
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100),
	age INT,
	date_of_graduation DATE,
	PRIMARY KEY(id)
);

CREATE TABLE specializations(
	vet_id INT REFERENCES vets(id),
	species_id INT REFERENCES species(id),
	PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits(
	id INT GENERATED ALWAYS AS IDENTITY,
	animal_id INT REFERENCES animals(id),
	vet_id INT REFERENCES vets(id),
	date_of_visit DATE,
	PRIMARY KEY (id)
);

-- Add an email column to owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Creating index tables for visits
CREATE INDEX animal_id_asc ON visits(animal_id ASC);
CREATE INDEX vet_id_asc ON visits(vet_id ASC);
CREATE INDEX index_owner_email ON owners (email);