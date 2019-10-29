CREATE TABLE hierarchy (
    id SERIAL PRIMARY KEY,
    uuid UUID UNIQUE DEFAULT uuid_generate_v4()
    name TEXT NOT NULL,
    description TEXT,
    created_date TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp,
    modified_date TIMESTAMP WITH TIME ZONE,
    parent_id INTEGER,
    CONSTRAINT fk_parent_id
        FOREIGN KEY (parent_id) REFERENCES hierarchy(id) ON DELETE RESTRICT
);

CREATE TYPE device_type AS ENUM ('ruuvi');

CREATE TABLE device (
    id SERIAL PRIMARY KEY,
    device_type device_type NOT NULL DEFAULT 'ruuvi',
    name TEXT NOT NULL,
    description TEXT,
    created_date TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp,
    modified_date TIMESTAMP WITH TIME ZONE,
    parent_id INTEGER,
    CONSTRAINT fk_parent_id
        FOREIGN KEY (parent_id) REFERENCES device(id) ON DELETE RESTRICT
);

CREATE TYPE ruuvi AS (
    temperature FLOAT,
    humidity INTEGER,
    pressure INTEGER,
    voltage INTEGER,
    tx_power INTEGER
);

CREATE TABLE ruuvi_telemetry (
    device_id INTEGER REFERENCES device (id)
    time TIMESTAMP WITH TIME ZONE NOT NULL,
    parameters ruuvi
);

SELECT create_hypertable('ruuvi_telemetry', 'time');