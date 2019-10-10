CREATE OR REPLACE FUNCTION set_sensor_log(
  p_location VARCHAR, p_reading BIGINT
)
RETURNS BOOLEAN AS
$$
BEGIN
  IF p_reading > 500 THEN
    RAISE EXCEPTION '"%" is an invalid reading!', p_reading;
  END IF;

  INSERT INTO sensor_log (location, reading, reading_date)
    VALUES (p_location, p_reading, now());

  RETURN TRUE;
END;
$$ LANGUAGE plpgsql;