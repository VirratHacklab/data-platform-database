DROP TABLE ruuvi_telemetry;

ALTER TYPE ruuvi ALTER ATTRIBUTE humidity TYPE FLOAT;

CREATE TABLE ruuvi_telemetry (
    device_id INTEGER REFERENCES device (id),
    time TIMESTAMP WITH TIME ZONE NOT NULL,
    parameters ruuvi
);

SELECT create_hypertable('ruuvi_telemetry', 'time');