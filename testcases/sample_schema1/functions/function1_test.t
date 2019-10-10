--Comment added
BEGIN;
SELECT plan(3);
\i  src/sample_schema1/functions/function1.sql
SELECT has_function('sample_scema1.accept_invite_to_list',ARRAY['integer','integer','integer'],'accept_invite_to_list exists');
SELECT function_lang_is('sample_scema1.accept_invite_to_list',ARRAY ['integer','integer','integer'], 'plpgsql','accept_invite_to_list is plpgsql');
SELECT function_returns('sample_scema1.accept_invite_to_list','boolean');
SELECT * FROM finish();
ROLLBACK;

