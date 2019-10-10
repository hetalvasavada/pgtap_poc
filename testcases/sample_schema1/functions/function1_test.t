BEGIN;
\i  src/sample_schema1/functions/function1.sql
SELECT plan(3);

SELECT lives_ok(
    $$ SELECT sample_schema1.set_sensor_log('1', 1) $$,
    'Check set_sensor_log - basic execution'
);

SELECT is(
    sample_schema1.set_sensor_log('10', 20), True,
    'Check set_sensor_log - new value'
);

SELECT throws_ok(
    $$ SELECT sample_schema1.set_sensor_log('100', 599) $$,
    '"599" is an invalid reading!',
    'Check set_sensor_log - invalid reading'
);

ROLLBACK;