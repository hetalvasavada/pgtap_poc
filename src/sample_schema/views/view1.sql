--Comment.
create schema sample_schema;
CREATE OR REPLACE FUNCTION sample_schema.create_mytable ()
  RETURNS void AS
$func$
BEGIN
   IF EXISTS (SELECT * FROM pg_catalog.pg_tables 
              WHERE  schemaname = 'sample_schema'
              AND    tablename  = 'mv_motor_sensor') THEN
      RAISE NOTICE 'Table sample_schema.mv_motor_sensor already exists.';
   ELSE
      CREATE TABLE sample_schema.mv_motor_sensor
(
  sensor_log_id  SERIAL PRIMARY KEY,
  location       VARCHAR NOT NULL,
  reading        BIGINT NOT NULL,
  reading_date   TIMESTAMP NOT NULL
)
;
   END IF;
END
$func$ LANGUAGE plpgsql;

SELECT sample_schema.create_mytable();   

CREATE OR REPLACE FUNCTION sample_schema.mv_motor_sensor(p_location VARCHAR, p_reading BIGINT)
RETURNS BOOLEAN AS
$$
BEGIN
  IF p_reading > 500 THEN
    RAISE EXCEPTION '"%" is an invalid reading!', p_reading;
  END IF;
  INSERT INTO sample_schema.mv_motor_sensor(location, reading, reading_date)
    VALUES (p_location, p_reading, now());
  RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

select sample_schema.mv_motor_sensor('1', 10);

create or replace VIEW sample_schema.mv_motor_sensor_view AS
    SELECT *
    FROM sample_schema.mv_motor_sensor
    WHERE reading = '10';
