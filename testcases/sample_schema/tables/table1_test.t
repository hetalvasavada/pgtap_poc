--format the output for nice TAP. added comment............
\pset format unaligned
\pset tuples_only true
\pset pager
-- Revert all changes on failure.
\set ON_ERROR_ROLLBACK 1
\set ON_ERROR_STOP true
\set QUIET 1
BEGIN;
\i src/sample_schema1/tables/table1.sql
SELECT plan(9);
SELECT columns_are('sample_schema1','mv_motor_company',ARRAY['userid_test','company','price','product_no','subcoy','state'],'All Columns exist in mv_motor_company table');
SELECT col_type_is('sample_schema1','mv_motor_company','company','character varying','Column type is character varying');
SELECT has_pk('sample_schema1','mv_motor_company','mv_motor_company table has primary key constraint');
SELECT hasnt_pk('sample_schema1','mv_motor_table1','mv_motor_table1 table does not have primary key constraint');
SELECT col_is_pk('sample_schema1','mv_motor_company','userid_test','userid_test column is primary key constraint');
SELECT col_is_pk('sample_schema1','mv_motor_company','company','company column is primary key constraint');
SELECT col_isnt_pk('sample_schema1','mv_motor_company','company','Company column is not a primary key');
SELECT col_has_check('sample_schema1','mv_motor_company','price','price column has check');
SELECT col_is_fk('sample_schema1','mv_motor_company','product_no','product_no is a foreign key');
SELECT * FROM finish();
ROLLBACK;
