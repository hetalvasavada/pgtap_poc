SET client_encoding = 'UTF-8';
SET client_min_messages = warning;
CREATE EXTENSION IF NOT EXISTS pgtap;
RESET client_min_messages;

BEGIN;
SELECT plan(20);

SELECT has_table(
    'sample_schema', 'mv_motor_sensor',
    'Should have table sample_schema.mv_motor_sensor'
);

SELECT has_pk(
    'sample_schema', 'mv_motor_sensor',
    'Table sample_schema.mv_motor_sensor should have a primary key'
);

SELECT columns_are('sample_schema'::name, 'mv_motor_sensor'::name, ARRAY[
    'sensor_log_id'::name,
    'location'::name,
    'reading'::name,
    'reading_date'::name
]);

SELECT has_column(       'sample_schema', 'mv_motor_sensor', 'sensor_log_id', 'Column sample_schema.mv_motor_sensor.sensor_log_id should exist');
SELECT col_type_is(      'sample_schema', 'mv_motor_sensor', 'sensor_log_id', 'integer', 'Column sample_schema.mv_motor_sensor.sensor_log_id should be type integer');
SELECT col_not_null(     'sample_schema', 'mv_motor_sensor', 'sensor_log_id', 'Column sample_schema.mv_motor_sensor.sensor_log_id should be NOT NULL');
SELECT col_has_default(  'sample_schema', 'mv_motor_sensor', 'sensor_log_id', 'Column sample_schema.mv_motor_sensor.sensor_log_id should have a default');
SELECT col_default_is(   'sample_schema', 'mv_motor_sensor', 'sensor_log_id', 'nextval(''sample_schema.mv_motor_sensor_sensor_log_id_seq''::regclass)', 'Column sample_schema.mv_motor_sensor.sensor_log_id default is');

SELECT has_column(       'sample_schema', 'mv_motor_sensor', 'location', 'Column sample_schema.mv_motor_sensor.location should exist');
SELECT col_type_is(      'sample_schema', 'mv_motor_sensor', 'location', 'character varying', 'Column sample_schema.mv_motor_sensor.location should be type character varying');
SELECT col_not_null(     'sample_schema', 'mv_motor_sensor', 'location', 'Column sample_schema.mv_motor_sensor.location should be NOT NULL');
SELECT col_hasnt_default('sample_schema', 'mv_motor_sensor', 'location', 'Column sample_schema.mv_motor_sensor.location should not  have a default');

SELECT has_column(       'sample_schema', 'mv_motor_sensor', 'reading', 'Column sample_schema.mv_motor_sensor.reading should exist');
SELECT col_type_is(      'sample_schema', 'mv_motor_sensor', 'reading', 'bigint', 'Column sample_schema.mv_motor_sensor.reading should be type bigint');
SELECT col_not_null(     'sample_schema', 'mv_motor_sensor', 'reading', 'Column sample_schema.mv_motor_sensor.reading should be NOT NULL');
SELECT col_hasnt_default('sample_schema', 'mv_motor_sensor', 'reading', 'Column sample_schema.mv_motor_sensor.reading should not  have a default');

SELECT has_column(       'sample_schema', 'mv_motor_sensor', 'reading_date', 'Column sample_schema.mv_motor_sensor.reading_date should exist');
SELECT col_type_is(      'sample_schema', 'mv_motor_sensor', 'reading_date', 'timestamp without time zone', 'Column sample_schema.mv_motor_sensor.reading_date should be type timestamp without time zone');
SELECT col_not_null(     'sample_schema', 'mv_motor_sensor', 'reading_date', 'Column sample_schema.mv_motor_sensor.reading_date should be NOT NULL');
SELECT col_hasnt_default('sample_schema', 'mv_motor_sensor', 'reading_date', 'Column sample_schema.mv_motor_sensor.reading_date should not  have a default');

SELECT * FROM finish();
ROLLBACK;
