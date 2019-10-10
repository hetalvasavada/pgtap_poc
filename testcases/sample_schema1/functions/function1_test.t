-- Commentt
BEGIN;

SELECT plan(3);
\i  src/sample_schema1/functions/function1.sql

INSERT INTO sensor_log (sensor_log_id, location, reading, reading_date)
VALUES (99999, '999', 499, now());

SELECT lives_ok(
    $$ SELECT get_sensor_log('999') $$,
    'Check get_sensor_log - basic execution'
);

SELECT results_eq(
    $$ SELECT * FROM get_sensor_log('999') $$,
    $$ VALUES (99999::INT, '999'::VARCHAR, 
          499::BIGINT, now()::TIMESTAMP) $$,
    'Check get_sensor_log - existing location'
);

SELECT throws_ok(
    $$ SELECT get_sensor_log('998') $$,
    '"998" is an invalid location!',
    'Check get_sensor_log - invalid location'
);

ROLLBACK;