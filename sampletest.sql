\unset ECHO
\set QUIET 1
-- Turn off echo and keep things quiet.

-- Format the output for nice TAP.
\pset format unaligned
\pset tuples_only true
\pset pager off

-- Revert all changes on failure.
\set ON_ERROR_ROLLBACK 1
\set ON_ERROR_STOP true

-- Load the TAP functions.
BEGIN;

-- Plan the tests.
SELECT plan(1);

-- Run the tests.
SELECT pass( 'My test passed, w00t!' );

-- Finish the tests and clean up.
SELECT * FROM finish();
ROLLBACK;