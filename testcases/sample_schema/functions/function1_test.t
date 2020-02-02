--format the output for nice TAP......
\pset format unaligned
\pset tuples_only true
\pset pager
-- Revert all changes on failure.
\set ON_ERROR_ROLLBACK 1
\set ON_ERROR_STOP true
\set QUIET 1

BEGIN;

\i  src/sample_schema/functions/function1.sql

SELECT plan(3);

SELECT lives_ok($$ SELECT sample_schema.set_sensor_log('1', 1) $$,'Check set_sensor_log - basic execution');

SELECT is(sample_schema.set_sensor_log('10', 20), True,'Check set_sensor_log - new value');

SELECT throws_ok($$ SELECT sample_schema.set_sensor_log('100', 599) $$,'"599" is an invalid reading!','Check set_sensor_log - invalid reading');

SELECT * FROM finish();

ROLLBACK;
