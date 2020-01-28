--Commentttt...
CREATE SCHEMA IF NOT EXISTS sample_schema1;


CREATE OR REPLACE FUNCTION sample_schema1.sensor_log_func()
RETURNS void AS
$func$
BEGIN

IF EXISTS (SELECT * FROM pg_catalog.pg_tables 
WHERE schemaname = 'sample_schema1'
AND tablename = 'sensor_log') THEN
RAISE NOTICE 'Table sample_schema1.sensor_log already exists.';
ELSE
CREATE TABLE sample_schema1.sensor_log (
  sensor_log_id  SERIAL PRIMARY KEY,
  location       VARCHAR NOT NULL,
  reading        BIGINT NOT NULL,
  reading_date   TIMESTAMP NOT NULL
);
END IF;
END
$func$ LANGUAGE plpgsql;

SELECT sample_schema1.sensor_log_func();

CREATE OR REPLACE FUNCTION sample_schema1.set_sensor_log(p_location VARCHAR, p_reading BIGINT)
RETURNS BOOLEAN AS
$$
BEGIN
  IF p_reading > 500 THEN
    RAISE EXCEPTION '"%" is an invalid reading!', p_reading;
  END IF;

  INSERT INTO sample_schema1.sensor_log (location, reading, reading_date)
    VALUES (p_location, p_reading, now());

  RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

SELECT sample_schema1.set_sensor_log('hetal1',499);