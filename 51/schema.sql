SET client_encoding = 'UTF-8';
SET client_min_messages = warning;
CREATE EXTENSION IF NOT EXISTS pgtap;
RESET client_min_messages;

BEGIN;
SELECT plan(890);

SELECT schemas_are(ARRAY[
    'public',
    'sample_schema'
]);

SELECT schema_owner_is('public','postgres');
SELECT schema_owner_is('sample_schema','postgres');
SELECT views_are('public', ARRAY[
    'pg_all_foreign_keys',
    'tap_funky'
]);

SELECT view_owner_is('public','pg_all_foreign_keys','postgres', 'public.pg_all_foreign_keys owner is postgres');
SELECT view_owner_is('public','tap_funky','postgres', 'public.tap_funky owner is postgres');
SELECT functions_are('public', ARRAY[
    '_add',
    '_add',
    '_agg',
    '_agg',
    '_agg',
    '_agg',
    '_alike',
    '_are',
    '_areni',
    '_assets_are',
    '_cast_exists',
    '_cast_exists',
    '_cast_exists',
    '_cdi',
    '_cdi',
    '_cdi',
    '_cexists',
    '_cexists',
    '_ckeys',
    '_ckeys',
    '_cleanup',
    '_cmp_types',
    '_col_is_null',
    '_col_is_null',
    '_constraint',
    '_constraint',
    '_contract_on',
    '_currtest',
    '_db_privs',
    '_def_is',
    '_definer',
    '_definer',
    '_definer',
    '_definer',
    '_dexists',
    '_dexists',
    '_do_ne',
    '_docomp',
    '_expand_context',
    '_expand_on',
    '_expand_vol',
    '_extras',
    '_extras',
    '_finish',
    '_fkexists',
    '_fkexists',
    '_fprivs_are',
    '_func_compare',
    '_func_compare',
    '_func_compare',
    '_func_compare',
    '_get',
    '_get_ac_privs',
    '_get_col_ns_type',
    '_get_col_privs',
    '_get_col_type',
    '_get_col_type',
    '_get_context',
    '_get_db_owner',
    '_get_db_privs',
    '_get_dtype',
    '_get_dtype',
    '_get_fdw_privs',
    '_get_func_owner',
    '_get_func_owner',
    '_get_func_privs',
    '_get_index_owner',
    '_get_index_owner',
    '_get_lang_privs',
    '_get_language_owner',
    '_get_latest',
    '_get_latest',
    '_get_note',
    '_get_note',
    '_get_opclass_owner',
    '_get_opclass_owner',
    '_get_rel_owner',
    '_get_rel_owner',
    '_get_rel_owner',
    '_get_rel_owner',
    '_get_schema_owner',
    '_get_schema_privs',
    '_get_sequence_privs',
    '_get_server_privs',
    '_get_table_privs',
    '_get_tablespace_owner',
    '_get_tablespaceprivs',
    '_get_type_owner',
    '_get_type_owner',
    '_got_func',
    '_got_func',
    '_got_func',
    '_got_func',
    '_grolist',
    '_has_def',
    '_has_def',
    '_has_group',
    '_has_role',
    '_has_type',
    '_has_type',
    '_has_user',
    '_hasc',
    '_hasc',
    '_have_index',
    '_have_index',
    '_ident_array_to_string',
    '_ikeys',
    '_ikeys',
    '_is_instead',
    '_is_instead',
    '_is_schema',
    '_is_super',
    '_is_trusted',
    '_is_verbose',
    '_keys',
    '_keys',
    '_lang',
    '_lang',
    '_lang',
    '_lang',
    '_missing',
    '_missing',
    '_nosuch',
    '_op_exists',
    '_op_exists',
    '_op_exists',
    '_opc_exists',
    '_opc_exists',
    '_pg_sv_column_array',
    '_pg_sv_table_accessible',
    '_pg_sv_type_array',
    '_query',
    '_quote_ident_like',
    '_refine_vol',
    '_relcomp',
    '_relcomp',
    '_relcomp',
    '_relexists',
    '_relexists',
    '_relne',
    '_relne',
    '_returns',
    '_returns',
    '_returns',
    '_returns',
    '_rexists',
    '_rexists',
    '_rule_on',
    '_rule_on',
    '_runem',
    '_runner',
    '_set',
    '_set',
    '_set',
    '_strict',
    '_strict',
    '_strict',
    '_strict',
    '_table_privs',
    '_temptable',
    '_temptable',
    '_temptypes',
    '_time_trials',
    '_tlike',
    '_todo',
    '_trig',
    '_trig',
    '_types_are',
    '_types_are',
    '_unalike',
    '_vol',
    '_vol',
    '_vol',
    '_vol',
    'add_result',
    'alike',
    'alike',
    'any_column_privs_are',
    'any_column_privs_are',
    'any_column_privs_are',
    'any_column_privs_are',
    'bag_eq',
    'bag_eq',
    'bag_eq',
    'bag_eq',
    'bag_has',
    'bag_has',
    'bag_hasnt',
    'bag_hasnt',
    'bag_ne',
    'bag_ne',
    'bag_ne',
    'bag_ne',
    'can',
    'can',
    'can',
    'can',
    'cast_context_is',
    'cast_context_is',
    'casts_are',
    'casts_are',
    'check_test',
    'check_test',
    'check_test',
    'check_test',
    'check_test',
    'cmp_ok',
    'cmp_ok',
    'col_default_is',
    'col_default_is',
    'col_default_is',
    'col_default_is',
    'col_default_is',
    'col_default_is',
    'col_has_check',
    'col_has_check',
    'col_has_check',
    'col_has_check',
    'col_has_check',
    'col_has_check',
    'col_has_default',
    'col_has_default',
    'col_has_default',
    'col_hasnt_default',
    'col_hasnt_default',
    'col_hasnt_default',
    'col_is_fk',
    'col_is_fk',
    'col_is_fk',
    'col_is_fk',
    'col_is_fk',
    'col_is_fk',
    'col_is_null',
    'col_is_null',
    'col_is_null',
    'col_is_pk',
    'col_is_pk',
    'col_is_pk',
    'col_is_pk',
    'col_is_pk',
    'col_is_pk',
    'col_is_unique',
    'col_is_unique',
    'col_is_unique',
    'col_is_unique',
    'col_is_unique',
    'col_is_unique',
    'col_is_unique',
    'col_is_unique',
    'col_isnt_fk',
    'col_isnt_fk',
    'col_isnt_fk',
    'col_isnt_fk',
    'col_isnt_fk',
    'col_isnt_fk',
    'col_isnt_pk',
    'col_isnt_pk',
    'col_isnt_pk',
    'col_isnt_pk',
    'col_isnt_pk',
    'col_isnt_pk',
    'col_not_null',
    'col_not_null',
    'col_not_null',
    'col_type_is',
    'col_type_is',
    'col_type_is',
    'col_type_is',
    'col_type_is',
    'col_type_is',
    'collect_tap',
    'collect_tap',
    'column_privs_are',
    'column_privs_are',
    'column_privs_are',
    'column_privs_are',
    'columns_are',
    'columns_are',
    'columns_are',
    'columns_are',
    'composite_owner_is',
    'composite_owner_is',
    'composite_owner_is',
    'composite_owner_is',
    'database_privs_are',
    'database_privs_are',
    'db_owner_is',
    'db_owner_is',
    'diag',
    'diag',
    'diag',
    'diag',
    'diag_test_name',
    'display_oper',
    'do_tap',
    'do_tap',
    'do_tap',
    'do_tap',
    'doesnt_imatch',
    'doesnt_imatch',
    'doesnt_match',
    'doesnt_match',
    'domain_type_is',
    'domain_type_is',
    'domain_type_is',
    'domain_type_is',
    'domain_type_is',
    'domain_type_is',
    'domain_type_isnt',
    'domain_type_isnt',
    'domain_type_isnt',
    'domain_type_isnt',
    'domain_type_isnt',
    'domain_type_isnt',
    'domains_are',
    'domains_are',
    'domains_are',
    'domains_are',
    'enum_has_labels',
    'enum_has_labels',
    'enum_has_labels',
    'enum_has_labels',
    'enums_are',
    'enums_are',
    'enums_are',
    'enums_are',
    'fail',
    'fail',
    'fdw_privs_are',
    'fdw_privs_are',
    'findfuncs',
    'findfuncs',
    'finish',
    'fk_ok',
    'fk_ok',
    'fk_ok',
    'fk_ok',
    'fk_ok',
    'fk_ok',
    'fk_ok',
    'fk_ok',
    'foreign_table_owner_is',
    'foreign_table_owner_is',
    'foreign_table_owner_is',
    'foreign_table_owner_is',
    'foreign_tables_are',
    'foreign_tables_are',
    'foreign_tables_are',
    'foreign_tables_are',
    'function_lang_is',
    'function_lang_is',
    'function_lang_is',
    'function_lang_is',
    'function_lang_is',
    'function_lang_is',
    'function_lang_is',
    'function_lang_is',
    'function_owner_is',
    'function_owner_is',
    'function_owner_is',
    'function_owner_is',
    'function_privs_are',
    'function_privs_are',
    'function_privs_are',
    'function_privs_are',
    'function_returns',
    'function_returns',
    'function_returns',
    'function_returns',
    'function_returns',
    'function_returns',
    'function_returns',
    'function_returns',
    'functions_are',
    'functions_are',
    'functions_are',
    'functions_are',
    'groups_are',
    'groups_are',
    'has_cast',
    'has_cast',
    'has_cast',
    'has_cast',
    'has_cast',
    'has_cast',
    'has_check',
    'has_check',
    'has_check',
    'has_column',
    'has_column',
    'has_column',
    'has_composite',
    'has_composite',
    'has_composite',
    'has_domain',
    'has_domain',
    'has_domain',
    'has_domain',
    'has_enum',
    'has_enum',
    'has_enum',
    'has_enum',
    'has_fk',
    'has_fk',
    'has_fk',
    'has_foreign_table',
    'has_foreign_table',
    'has_foreign_table',
    'has_foreign_table',
    'has_function',
    'has_function',
    'has_function',
    'has_function',
    'has_function',
    'has_function',
    'has_function',
    'has_function',
    'has_group',
    'has_group',
    'has_index',
    'has_index',
    'has_index',
    'has_index',
    'has_index',
    'has_index',
    'has_index',
    'has_index',
    'has_index',
    'has_index',
    'has_language',
    'has_language',
    'has_leftop',
    'has_leftop',
    'has_leftop',
    'has_leftop',
    'has_leftop',
    'has_leftop',
    'has_materialized_view',
    'has_materialized_view',
    'has_materialized_view',
    'has_opclass',
    'has_opclass',
    'has_opclass',
    'has_opclass',
    'has_operator',
    'has_operator',
    'has_operator',
    'has_operator',
    'has_operator',
    'has_operator',
    'has_pk',
    'has_pk',
    'has_pk',
    'has_relation',
    'has_relation',
    'has_relation',
    'has_rightop',
    'has_rightop',
    'has_rightop',
    'has_rightop',
    'has_rightop',
    'has_rightop',
    'has_role',
    'has_role',
    'has_rule',
    'has_rule',
    'has_rule',
    'has_rule',
    'has_schema',
    'has_schema',
    'has_sequence',
    'has_sequence',
    'has_sequence',
    'has_sequence',
    'has_table',
    'has_table',
    'has_table',
    'has_table',
    'has_tablespace',
    'has_tablespace',
    'has_tablespace',
    'has_trigger',
    'has_trigger',
    'has_trigger',
    'has_trigger',
    'has_type',
    'has_type',
    'has_type',
    'has_type',
    'has_unique',
    'has_unique',
    'has_unique',
    'has_user',
    'has_user',
    'has_view',
    'has_view',
    'has_view',
    'hasnt_cast',
    'hasnt_cast',
    'hasnt_cast',
    'hasnt_cast',
    'hasnt_cast',
    'hasnt_cast',
    'hasnt_column',
    'hasnt_column',
    'hasnt_column',
    'hasnt_composite',
    'hasnt_composite',
    'hasnt_composite',
    'hasnt_domain',
    'hasnt_domain',
    'hasnt_domain',
    'hasnt_domain',
    'hasnt_enum',
    'hasnt_enum',
    'hasnt_enum',
    'hasnt_enum',
    'hasnt_fk',
    'hasnt_fk',
    'hasnt_fk',
    'hasnt_foreign_table',
    'hasnt_foreign_table',
    'hasnt_foreign_table',
    'hasnt_foreign_table',
    'hasnt_function',
    'hasnt_function',
    'hasnt_function',
    'hasnt_function',
    'hasnt_function',
    'hasnt_function',
    'hasnt_function',
    'hasnt_function',
    'hasnt_group',
    'hasnt_group',
    'hasnt_index',
    'hasnt_index',
    'hasnt_index',
    'hasnt_index',
    'hasnt_language',
    'hasnt_language',
    'hasnt_materialized_view',
    'hasnt_materialized_view',
    'hasnt_materialized_view',
    'hasnt_opclass',
    'hasnt_opclass',
    'hasnt_opclass',
    'hasnt_opclass',
    'hasnt_pk',
    'hasnt_pk',
    'hasnt_pk',
    'hasnt_relation',
    'hasnt_relation',
    'hasnt_relation',
    'hasnt_role',
    'hasnt_role',
    'hasnt_rule',
    'hasnt_rule',
    'hasnt_rule',
    'hasnt_rule',
    'hasnt_schema',
    'hasnt_schema',
    'hasnt_sequence',
    'hasnt_sequence',
    'hasnt_sequence',
    'hasnt_table',
    'hasnt_table',
    'hasnt_table',
    'hasnt_table',
    'hasnt_tablespace',
    'hasnt_tablespace',
    'hasnt_trigger',
    'hasnt_trigger',
    'hasnt_trigger',
    'hasnt_trigger',
    'hasnt_type',
    'hasnt_type',
    'hasnt_type',
    'hasnt_type',
    'hasnt_user',
    'hasnt_user',
    'hasnt_view',
    'hasnt_view',
    'hasnt_view',
    'ialike',
    'ialike',
    'imatches',
    'imatches',
    'in_todo',
    'index_is_primary',
    'index_is_primary',
    'index_is_primary',
    'index_is_primary',
    'index_is_type',
    'index_is_type',
    'index_is_type',
    'index_is_type',
    'index_is_unique',
    'index_is_unique',
    'index_is_unique',
    'index_is_unique',
    'index_owner_is',
    'index_owner_is',
    'index_owner_is',
    'index_owner_is',
    'indexes_are',
    'indexes_are',
    'indexes_are',
    'indexes_are',
    'is',
    'is',
    'is_aggregate',
    'is_aggregate',
    'is_aggregate',
    'is_aggregate',
    'is_aggregate',
    'is_aggregate',
    'is_aggregate',
    'is_aggregate',
    'is_clustered',
    'is_clustered',
    'is_clustered',
    'is_clustered',
    'is_definer',
    'is_definer',
    'is_definer',
    'is_definer',
    'is_definer',
    'is_definer',
    'is_definer',
    'is_definer',
    'is_empty',
    'is_empty',
    'is_member_of',
    'is_member_of',
    'is_member_of',
    'is_member_of',
    'is_strict',
    'is_strict',
    'is_strict',
    'is_strict',
    'is_strict',
    'is_strict',
    'is_strict',
    'is_strict',
    'is_superuser',
    'is_superuser',
    'isa_ok',
    'isa_ok',
    'isnt',
    'isnt',
    'isnt_empty',
    'isnt_empty',
    'isnt_strict',
    'isnt_strict',
    'isnt_strict',
    'isnt_strict',
    'isnt_strict',
    'isnt_strict',
    'isnt_strict',
    'isnt_strict',
    'isnt_superuser',
    'isnt_superuser',
    'language_is_trusted',
    'language_is_trusted',
    'language_owner_is',
    'language_owner_is',
    'language_privs_are',
    'language_privs_are',
    'languages_are',
    'languages_are',
    'lives_ok',
    'lives_ok',
    'matches',
    'matches',
    'materialized_view_owner_is',
    'materialized_view_owner_is',
    'materialized_view_owner_is',
    'materialized_view_owner_is',
    'materialized_views_are',
    'materialized_views_are',
    'materialized_views_are',
    'materialized_views_are',
    'no_plan',
    'num_failed',
    'ok',
    'ok',
    'opclass_owner_is',
    'opclass_owner_is',
    'opclass_owner_is',
    'opclass_owner_is',
    'opclasses_are',
    'opclasses_are',
    'opclasses_are',
    'opclasses_are',
    'operators_are',
    'operators_are',
    'operators_are',
    'operators_are',
    'os_name',
    'pass',
    'pass',
    'performs_ok',
    'performs_ok',
    'performs_within',
    'performs_within',
    'performs_within',
    'performs_within',
    'pg_version',
    'pg_version_num',
    'pgtap_version',
    'plan',
    'relation_owner_is',
    'relation_owner_is',
    'relation_owner_is',
    'relation_owner_is',
    'results_eq',
    'results_eq',
    'results_eq',
    'results_eq',
    'results_eq',
    'results_eq',
    'results_eq',
    'results_eq',
    'results_eq',
    'results_eq',
    'results_eq',
    'results_eq',
    'results_ne',
    'results_ne',
    'results_ne',
    'results_ne',
    'results_ne',
    'results_ne',
    'results_ne',
    'results_ne',
    'results_ne',
    'results_ne',
    'results_ne',
    'results_ne',
    'roles_are',
    'roles_are',
    'row_eq',
    'row_eq',
    'rule_is_instead',
    'rule_is_instead',
    'rule_is_instead',
    'rule_is_instead',
    'rule_is_on',
    'rule_is_on',
    'rule_is_on',
    'rule_is_on',
    'rules_are',
    'rules_are',
    'rules_are',
    'rules_are',
    'runtests',
    'runtests',
    'runtests',
    'runtests',
    'schema_owner_is',
    'schema_owner_is',
    'schema_privs_are',
    'schema_privs_are',
    'schemas_are',
    'schemas_are',
    'sequence_owner_is',
    'sequence_owner_is',
    'sequence_owner_is',
    'sequence_owner_is',
    'sequence_privs_are',
    'sequence_privs_are',
    'sequence_privs_are',
    'sequence_privs_are',
    'sequences_are',
    'sequences_are',
    'sequences_are',
    'sequences_are',
    'server_privs_are',
    'server_privs_are',
    'set_eq',
    'set_eq',
    'set_eq',
    'set_eq',
    'set_has',
    'set_has',
    'set_hasnt',
    'set_hasnt',
    'set_ne',
    'set_ne',
    'set_ne',
    'set_ne',
    'skip',
    'skip',
    'skip',
    'skip',
    'table_owner_is',
    'table_owner_is',
    'table_owner_is',
    'table_owner_is',
    'table_privs_are',
    'table_privs_are',
    'table_privs_are',
    'table_privs_are',
    'tables_are',
    'tables_are',
    'tables_are',
    'tables_are',
    'tablespace_owner_is',
    'tablespace_owner_is',
    'tablespace_privs_are',
    'tablespace_privs_are',
    'tablespaces_are',
    'tablespaces_are',
    'throws_ilike',
    'throws_ilike',
    'throws_imatching',
    'throws_imatching',
    'throws_like',
    'throws_like',
    'throws_matching',
    'throws_matching',
    'throws_ok',
    'throws_ok',
    'throws_ok',
    'throws_ok',
    'throws_ok',
    'throws_ok',
    'throws_ok',
    'todo',
    'todo',
    'todo',
    'todo',
    'todo_end',
    'todo_start',
    'todo_start',
    'trigger_is',
    'trigger_is',
    'trigger_is',
    'trigger_is',
    'triggers_are',
    'triggers_are',
    'triggers_are',
    'triggers_are',
    'type_owner_is',
    'type_owner_is',
    'type_owner_is',
    'type_owner_is',
    'types_are',
    'types_are',
    'types_are',
    'types_are',
    'unalike',
    'unalike',
    'unialike',
    'unialike',
    'users_are',
    'users_are',
    'view_owner_is',
    'view_owner_is',
    'view_owner_is',
    'view_owner_is',
    'views_are',
    'views_are',
    'views_are',
    'views_are',
    'volatility_is',
    'volatility_is',
    'volatility_is',
    'volatility_is',
    'volatility_is',
    'volatility_is',
    'volatility_is',
    'volatility_is'
]);

SELECT is(md5(p.prosrc), '68c5a174851ca3d6679a9bb6454493a6', 'Function _add body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_add'
   AND proargtypes::text = '25 23';

SELECT is(md5(p.prosrc), 'bbfe9fbbb0f6c065ae322347cd41ebae', 'Function _add body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_add'
   AND proargtypes::text = '25 23 25';

SELECT is(md5(p.prosrc), 'e8b30c8b0102dabe15c15e2fcb35db2d', 'Function _agg body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_agg'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'd789a9c19ea4d16186ee1f2222544fab', 'Function _agg body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_agg'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '56ffac67330a337ba0da0403e8857438', 'Function _agg body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_agg'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '42d32aee5b35a3f8b88e36a393fe74ba', 'Function _agg body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_agg'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '5e5b73c1bf15f4f03ee13969c00ef81e', 'Function _alike body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_alike'
   AND proargtypes::text = '16 2283 25 25';

SELECT is(md5(p.prosrc), 'aaa05129ee1707055872a06d58ef5607', 'Function _are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_are'
   AND proargtypes::text = '25 1003 1003 25';

SELECT is(md5(p.prosrc), '117e741ea58f86b8f9b98503a272e1f4', 'Function _areni body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_areni'
   AND proargtypes::text = '25 1009 1009 25';

SELECT is(md5(p.prosrc), '0a9fe24d17d06d2c1bd2ad82faa162f6', 'Function _assets_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_assets_are'
   AND proargtypes::text = '25 1009 1009 25';

SELECT is(md5(p.prosrc), 'f173abb2b262af68c41ec99d9d79371a', 'Function _cast_exists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_cast_exists'
   AND proargtypes::text = '19 19 19 19';

SELECT is(md5(p.prosrc), '070d0219650a72721023af22c5e92de3', 'Function _cast_exists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_cast_exists'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '2186a3ce92ce950b4f96de536d4cd9b6', 'Function _cast_exists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_cast_exists'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '36d42d55a85a24c83eb7a39d4868024b', 'Function _cdi body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_cdi'
   AND proargtypes::text = '19 19 2283 25';

SELECT is(md5(p.prosrc), 'e0ab744c20cb61e3d22145bae8ce8659', 'Function _cdi body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_cdi'
   AND proargtypes::text = '19 19 2283';

SELECT is(md5(p.prosrc), '95854eb43186d7c3c683054ce88958d0', 'Function _cdi body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_cdi'
   AND proargtypes::text = '19 19 19 2283 25';

SELECT is(md5(p.prosrc), '1cd1912f2c092d9c908c88224d87bedb', 'Function _cexists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_cexists'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '8a398fda2ff50b607b28b8767032f78e', 'Function _cexists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_cexists'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '457407a8483d70f54058bfaf763998d6', 'Function _ckeys body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_ckeys'
   AND proargtypes::text = '19 19 1042';

SELECT is(md5(p.prosrc), '707fbf78897a94d6e4a36e7ffa449223', 'Function _ckeys body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_ckeys'
   AND proargtypes::text = '19 1042';

SELECT is(md5(p.prosrc), '754534415aae03023cf9505b82a22e78', 'Function _cleanup body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_cleanup'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), 'be2a5f55fe84c09d7456bb7a25b690b8', 'Function _cmp_types body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_cmp_types'
   AND proargtypes::text = '26 19';

SELECT is(md5(p.prosrc), 'd665a6a00911308470784b5c9f4c64a2', 'Function _col_is_null body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_col_is_null'
   AND proargtypes::text = '19 19 19 25 16';

SELECT is(md5(p.prosrc), '37dd01994e68f9fa0ace19fac099b07a', 'Function _col_is_null body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_col_is_null'
   AND proargtypes::text = '19 19 25 16';

SELECT is(md5(p.prosrc), '21b1045aa99a639e9340eebf0df22bd3', 'Function _constraint body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_constraint'
   AND proargtypes::text = '19 1042 1003 25 25';

SELECT is(md5(p.prosrc), '408b8f7f6005aa77ce8845cad4886d3a', 'Function _constraint body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_constraint'
   AND proargtypes::text = '19 19 1042 1003 25 25';

SELECT is(md5(p.prosrc), 'd29341943c682a255c93f16442acd2a4', 'Function _contract_on body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_contract_on'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), '571254d0237e28063d94e1295b2e94bf', 'Function _currtest body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_currtest'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), '8aaf6940c985caaa6d6d0df3c81cc2f9', 'Function _db_privs body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_db_privs'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), '4cd32008bcd0a09ec8ec826ce0417776', 'Function _def_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_def_is'
   AND proargtypes::text = '25 25 2283 25';

SELECT is(md5(p.prosrc), 'adc664b1be55dd7ba331e509876e7f02', 'Function _definer body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_definer'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '081f3880829c79d73c85c2a94814d467', 'Function _definer body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_definer'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '3f952224a4b4c81e9cbcbbc40d72222f', 'Function _definer body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_definer'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'e271a5da0d988b279f886f49ea359f32', 'Function _definer body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_definer'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '67630b6da79c0d0e0c24ee2e90700d94', 'Function _dexists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_dexists'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '23576c6773700739dc75d8fde021e5c2', 'Function _dexists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_dexists'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '6ad91675ebb6bafa505d3ade4f92456e', 'Function _do_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_do_ne'
   AND proargtypes::text = '25 25 25 25';

SELECT is(md5(p.prosrc), '81086c432dc21e215752c92f6b05cfb1', 'Function _docomp body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_docomp'
   AND proargtypes::text = '25 25 25 25';

SELECT is(md5(p.prosrc), 'e144e2fce0ab668725bab0373a6b0c2d', 'Function _expand_context body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_expand_context'
   AND proargtypes::text = '1042';

SELECT is(md5(p.prosrc), '0530c8097f2fb59dda219d3d569d00de', 'Function _expand_on body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_expand_on'
   AND proargtypes::text = '1042';

SELECT is(md5(p.prosrc), '06594342fa3fd767d1efbd5899b7f1af', 'Function _expand_vol body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_expand_vol'
   AND proargtypes::text = '1042';

SELECT is(md5(p.prosrc), '7dfd20b7814585742d033a7869686ab7', 'Function _extras body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_extras'
   AND proargtypes::text = '1042 1003';

SELECT is(md5(p.prosrc), 'e7a7ff049bb3fb47cac32498cb4d12e3', 'Function _extras body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_extras'
   AND proargtypes::text = '1042 19 1003';

SELECT is(md5(p.prosrc), '10e39f8b16bb3f2b21520aeb653a368b', 'Function _finish body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_finish'
   AND proargtypes::text = '23 23 23';

SELECT is(md5(p.prosrc), '4a4b09b452e004793c21ab783e437483', 'Function _fkexists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_fkexists'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '01f5939e4fbc275d00c304f6a0f68c52', 'Function _fkexists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_fkexists'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), 'd4f422d5b6aad65c163d35dac7aea2ba', 'Function _fprivs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_fprivs_are'
   AND proargtypes::text = '25 19 1003 25';

SELECT is(md5(p.prosrc), '309d0997dc05cd6b9868f5cd018b2d4c', 'Function _func_compare body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_func_compare'
   AND proargtypes::text = '19 19 1003 2283 2283 25';

SELECT is(md5(p.prosrc), '92e811eaeb0229b340ab1cf6912cb8a7', 'Function _func_compare body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_func_compare'
   AND proargtypes::text = '19 19 1003 16 25';

SELECT is(md5(p.prosrc), '220335905376af1655944dc1e3cd0f09', 'Function _func_compare body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_func_compare'
   AND proargtypes::text = '19 19 16 25';

SELECT is(md5(p.prosrc), '69381105c3a86f577ba8e7badcd2060f', 'Function _func_compare body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_func_compare'
   AND proargtypes::text = '19 19 2283 2283 25';

SELECT is(md5(p.prosrc), 'df2942120b2d4c0c0b47d6503a16c426', 'Function _get body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), '9b1471ad0e9779a8bfaee979bb018d31', 'Function _get_ac_privs body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_ac_privs'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '098881065aeb89dc9f692dc3af74fe1c', 'Function _get_col_ns_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_col_ns_type'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), 'a85ae9aff0e4fd86a9b08a8bdb1fef37', 'Function _get_col_privs body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_col_privs'
   AND proargtypes::text = '19 25 19';

SELECT is(md5(p.prosrc), '0cebcadb9d4af6761bf9b768c5523115', 'Function _get_col_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_col_type'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '6d10e1faefa7b3e3e79a34bcfd82fd46', 'Function _get_col_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_col_type'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '4169033bb410306cd885f36eb79076ee', 'Function _get_context body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_context'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'ff61a36ee2e17f87c298c5777bf6ba17', 'Function _get_db_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_db_owner'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '5dc0894433e2420b723fba88779e9bcb', 'Function _get_db_privs body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_db_privs'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'd992f546a9577b199ddae39c790dc260', 'Function _get_dtype body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_dtype'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '5b47825d082c067a9acf4e924f615817', 'Function _get_dtype body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_dtype'
   AND proargtypes::text = '19 25 16';

SELECT is(md5(p.prosrc), '03e0887579c0e0b752fc21b114948280', 'Function _get_fdw_privs body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_fdw_privs'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '575270dbbf3c2365859cb6ae1ffc477d', 'Function _get_func_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_func_owner'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '7edd4db4ec8a0f15fff5dd7f4397399b', 'Function _get_func_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_func_owner'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '7b105a2065966d166d00eea29bd12a7e', 'Function _get_func_privs body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_func_privs'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '342200148f6c2d255bbdf2d749dbc05e', 'Function _get_index_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_index_owner'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '08ae9889c0c47ca48afa5816f84917b5', 'Function _get_index_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_index_owner'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'a7bb8818a2e2dc32ef2033882e912eb0', 'Function _get_lang_privs body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_lang_privs'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '58e67e2ada0d2b29a7b93b83fae74116', 'Function _get_language_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_language_owner'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '6e2769e63e30d9699eb6c758c5de4dd3', 'Function _get_latest body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_latest'
   AND proargtypes::text = '25 23';

SELECT is(md5(p.prosrc), '7c960137ba3188111df987bca1ad4138', 'Function _get_latest body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_latest'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), 'd0347a7e8e02f2167dad1955593965a9', 'Function _get_note body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_note'
   AND proargtypes::text = '23';

SELECT is(md5(p.prosrc), '9f1c613ee10bbe6bf13a821e3494e875', 'Function _get_note body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_note'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), '43ff7325469ee35216a24a1dea827402', 'Function _get_opclass_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_opclass_owner'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'b1f2ad3357e3c0bee2ea67958cdee8d4', 'Function _get_opclass_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_opclass_owner'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '0c3cf5e33917c3d98f2dae1eff8ae177', 'Function _get_rel_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_rel_owner'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '5dbca01b048b7be4f32b4df4bed4b242', 'Function _get_rel_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_rel_owner'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '0df9a9bb710c6f88dce957878e9de98e', 'Function _get_rel_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_rel_owner'
   AND proargtypes::text = '1042 19 19';

SELECT is(md5(p.prosrc), 'b0f452dd697662e4600d1927ee059bbc', 'Function _get_rel_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_rel_owner'
   AND proargtypes::text = '1042 19';

SELECT is(md5(p.prosrc), '907919b02dc876229f3f4bd78dd768c5', 'Function _get_schema_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_schema_owner'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '2a4fd033b81658b821efae9bc246945e', 'Function _get_schema_privs body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_schema_privs'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '0b3e2831f088100c0603c8a61022b443', 'Function _get_sequence_privs body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_sequence_privs'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'dd0c3caa998bf14b9fab78ec2dfc1b4b', 'Function _get_server_privs body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_server_privs'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '6f960a00d340ef9c8fa9cc89b464d1a9', 'Function _get_table_privs body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_table_privs'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '2a9d13de656a3031380ddd4df05fc2b0', 'Function _get_tablespace_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_tablespace_owner'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'f6ca21903c552514a889c275f6811867', 'Function _get_tablespaceprivs body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_tablespaceprivs'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '7df8bd58ff7cbbf558a5223d365b8563', 'Function _get_type_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_type_owner'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '1834b1b833a45052123318c2a3985bd3', 'Function _get_type_owner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_get_type_owner'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '9dbb6ab0a37d9cc10ff7cc95530b9e3f', 'Function _got_func body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_got_func'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), 'abe4b36dc014bcb5fcd5ec8b629ae8e9', 'Function _got_func body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_got_func'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '67e5202a9f88145e452fbb28ba13c69f', 'Function _got_func body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_got_func'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '6f8f20c5dc9860d7e74d7c12bb677ee3', 'Function _got_func body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_got_func'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'a5365d53408118fa739cbc47df1d2fd8', 'Function _grolist body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_grolist'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '14ffbd96d2c21f926fcd7ec0b75a9b29', 'Function _has_def body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_has_def'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '1f3f0f9532172542ee9c73e86ba7126d', 'Function _has_def body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_has_def'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '4d4b4316a79cdc88c7d43e88edafbda9', 'Function _has_group body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_has_group'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'dcf401db7e7a776bd2c65a1fcf9b5adb', 'Function _has_role body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_has_role'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '2c5c683d5c742db11bb2dee0740ffb57', 'Function _has_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_has_type'
   AND proargtypes::text = '19 1014';

SELECT is(md5(p.prosrc), '8bfc732cd576c9703428d2c3e6ac47db', 'Function _has_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_has_type'
   AND proargtypes::text = '19 19 1014';

SELECT is(md5(p.prosrc), 'eca32054b704f12b38cfb99b5e7c225d', 'Function _has_user body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_has_user'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'c125075cfccf2887ec3168f35b9680eb', 'Function _hasc body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_hasc'
   AND proargtypes::text = '19 1042';

SELECT is(md5(p.prosrc), '075bf76920ec169ee9f0e6e6a9c259e0', 'Function _hasc body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_hasc'
   AND proargtypes::text = '19 19 1042';

SELECT is(md5(p.prosrc), 'c4b5a3dc640cd1f89d1f26aa9ea34e08', 'Function _have_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_have_index'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '81306a0089b311382b8a20f7a2c74660', 'Function _have_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_have_index'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '8528791d07208d0bc814c820e626b90c', 'Function _ident_array_to_string body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_ident_array_to_string'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), '64f2cd66eb565af0032783f60949ed28', 'Function _ikeys body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_ikeys'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '748b0f841fdcad74f81f5385aafae1c6', 'Function _ikeys body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_ikeys'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '231129d452ac453bf8b64f24be7caeab', 'Function _is_instead body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_is_instead'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '74ad4badd8d8d7e35ea079aecfabbdad', 'Function _is_instead body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_is_instead'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'c72eb0f4440e8efc4f14f8194c5f5215', 'Function _is_schema body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_is_schema'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '0712e18e85f61d4ad2912a151f81480e', 'Function _is_super body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_is_super'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '0ac2be50475f44684c8248e5a8b5a32c', 'Function _is_trusted body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_is_trusted'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'edcca8a2412b485bcd4d97c4c0bd0521', 'Function _is_verbose body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_is_verbose'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), 'a4dd58239d1fd21e53464a4028c05267', 'Function _keys body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_keys'
   AND proargtypes::text = '19 1042';

SELECT is(md5(p.prosrc), '6c8c1966b3cf76120b449362c91842ee', 'Function _keys body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_keys'
   AND proargtypes::text = '19 19 1042';

SELECT is(md5(p.prosrc), '48a4ac247641c020c3dd8730afd24324', 'Function _lang body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_lang'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '610b23ac81be1438e4b2ce4b9e4e53da', 'Function _lang body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_lang'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '09f00140e372425f6a30b32257481604', 'Function _lang body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_lang'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'e801b981b4caefd167191b09a922969c', 'Function _lang body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_lang'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), 'ec5e3519ddaea9fb6625aea4a59b8f55', 'Function _missing body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_missing'
   AND proargtypes::text = '1042 19 1003';

SELECT is(md5(p.prosrc), '59574da113d075759a51574dcecaa149', 'Function _missing body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_missing'
   AND proargtypes::text = '1042 1003';

SELECT is(md5(p.prosrc), 'ea0cdae3adfd03d4c483e0c04c5c7d8c', 'Function _nosuch body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_nosuch'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '92c7ffa5ace32a906c35d4a43bad9121', 'Function _op_exists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_op_exists'
   AND proargtypes::text = '19 19 19 19 19';

SELECT is(md5(p.prosrc), 'ec93581d1a23f8d64fef5baa5c2ed5bb', 'Function _op_exists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_op_exists'
   AND proargtypes::text = '19 19 19 19';

SELECT is(md5(p.prosrc), '0d6daba2b779fbf3181b8730f2ff06b4', 'Function _op_exists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_op_exists'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), 'c7d4890634ce920b9f97c10fe1e45a08', 'Function _opc_exists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_opc_exists'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '6af5eb486156ddd74eadd214b0131406', 'Function _opc_exists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_opc_exists'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'd930cc661022deef1591266b906f7c18', 'Function _pg_sv_column_array body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_pg_sv_column_array'
   AND proargtypes::text = '26 1005';

SELECT is(md5(p.prosrc), 'c90b91823924c9a747911e624c27652b', 'Function _pg_sv_table_accessible body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_pg_sv_table_accessible'
   AND proargtypes::text = '26 26';

SELECT is(md5(p.prosrc), 'fcc9dff143e8d5bf0fec737aa948425d', 'Function _pg_sv_type_array body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_pg_sv_type_array'
   AND proargtypes::text = '1028';

SELECT is(md5(p.prosrc), 'c892e8510c7ac951857ac9fd8cb0199c', 'Function _query body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_query'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), '7a1521d0bd39edd241bad76d1a4d1f28', 'Function _quote_ident_like body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_quote_ident_like'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), 'dab17d1c499745cded1b603a408969da', 'Function _refine_vol body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_refine_vol'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), '20aa3586af0321e6380efe7574e0bbf7', 'Function _relcomp body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_relcomp'
   AND proargtypes::text = '25 25 25 25 25';

SELECT is(md5(p.prosrc), 'c37b9e7a71b5b8cb3f1c6a423bc9ac06', 'Function _relcomp body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_relcomp'
   AND proargtypes::text = '25 2277 25 25';

SELECT is(md5(p.prosrc), 'c37b9e7a71b5b8cb3f1c6a423bc9ac06', 'Function _relcomp body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_relcomp'
   AND proargtypes::text = '25 25 25 25';

SELECT is(md5(p.prosrc), 'e3526cbd4a09786b9b2453e9acad246b', 'Function _relexists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_relexists'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'fc9238f5ad9621908449fea582beb754', 'Function _relexists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_relexists'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '074b887470c364dfdce1bb4d9c7091e6', 'Function _relne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_relne'
   AND proargtypes::text = '25 25 25 25';

SELECT is(md5(p.prosrc), '074b887470c364dfdce1bb4d9c7091e6', 'Function _relne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_relne'
   AND proargtypes::text = '25 2277 25 25';

SELECT is(md5(p.prosrc), 'd4cfec6bf93a9306bcf46c58f77fbc9c', 'Function _returns body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_returns'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '60c41e4c09ae9347fd99c0f700983aed', 'Function _returns body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_returns'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '01181f003651e7594b2ce9e83b062677', 'Function _returns body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_returns'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), 'f5a6dab99d167c29984897be4d0340c4', 'Function _returns body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_returns'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '00741989e8a6fd23570a0f212a37d107', 'Function _rexists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_rexists'
   AND proargtypes::text = '1042 19';

SELECT is(md5(p.prosrc), '65452d04a839233fba71697f583f892f', 'Function _rexists body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_rexists'
   AND proargtypes::text = '1042 19 19';

SELECT is(md5(p.prosrc), '0ce505a39005625e4be617985f40c683', 'Function _rule_on body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_rule_on'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'ce2763f02a5db1d302d95755722cdbc4', 'Function _rule_on body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_rule_on'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '70eadf683e851fe14881c861d5b31783', 'Function _runem body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_runem'
   AND proargtypes::text = '1009 16';

SELECT is(md5(p.prosrc), '3b95e55da7e6e42249421e83f56d2221', 'Function _runner body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_runner'
   AND proargtypes::text = '1009 1009 1009 1009 1009';

SELECT is(md5(p.prosrc), '0f83da49280663d6789da51e6ad714dd', 'Function _set body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_set'
   AND proargtypes::text = '23 23';

SELECT is(md5(p.prosrc), 'c095e6becf89fb1fa78a9f7e53bcf5f2', 'Function _set body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_set'
   AND proargtypes::text = '25 23 25';

SELECT is(md5(p.prosrc), 'e5d7049242846d8dd7363a38128f888a', 'Function _set body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_set'
   AND proargtypes::text = '25 23';

SELECT is(md5(p.prosrc), '03733365bdaa7121e44bd14652d0cec1', 'Function _strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_strict'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'a93096301e5477c05c1d9ed563860f53', 'Function _strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_strict'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), 'b4eaf84273f8614e362fefb59dcc1dc3', 'Function _strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_strict'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), 'd6b704d279ff481b191d9e2f9f8116e8', 'Function _strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_strict'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '9ce525530eb9eeae73b23104c36a653d', 'Function _table_privs body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_table_privs'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), '07c7fb25b2cc553ee68cd0f261aab1be', 'Function _temptable body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_temptable'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '998f987d7682df08b180961118349b4b', 'Function _temptable body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_temptable'
   AND proargtypes::text = '2277 25';

SELECT is(md5(p.prosrc), 'd4b5286e202e81c31fb51def8ba8bfdb', 'Function _temptypes body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_temptypes'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), 'f2a74f6e695ec7d9b56281d656244c87', 'Function _time_trials body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_time_trials'
   AND proargtypes::text = '25 23 1700';

SELECT is(md5(p.prosrc), 'dcecae503ff072b8bc1403ec761a870e', 'Function _tlike body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_tlike'
   AND proargtypes::text = '16 25 25 25';

SELECT is(md5(p.prosrc), '38a46cc94c581227afb91e9fb8dd7fcc', 'Function _todo body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_todo'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), '361de35d6bc2710989c40096e785abd6', 'Function _trig body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_trig'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'f65946ba942e991e6c15d592f6838b6f', 'Function _trig body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_trig'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), 'a64a2e6dcbbbd935ae9a542ec72b15ae', 'Function _types_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_types_are'
   AND proargtypes::text = '1003 25 1014';

SELECT is(md5(p.prosrc), '3f127dec0d5d6918b3c21b8cab419068', 'Function _types_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_types_are'
   AND proargtypes::text = '19 1003 25 1014';

SELECT is(md5(p.prosrc), '78a7f8ea78edd93a5657cfb39b11a07e', 'Function _unalike body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_unalike'
   AND proargtypes::text = '16 2283 25 25';

SELECT is(md5(p.prosrc), 'a889494367aa7128c8079767e2f6afdd', 'Function _vol body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_vol'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'f84ccccc60e8b3bcaa223a3bacd131c2', 'Function _vol body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_vol'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '4b62e67906387983f3eeae7db60ea00b', 'Function _vol body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_vol'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'd5f872e605885354b720dd6be833cbbe', 'Function _vol body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = '_vol'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '8fdd7fdd14a4fb8ea9745ac0cbea48ae', 'Function add_result body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'add_result'
   AND proargtypes::text = '16 16 25 25 25';

SELECT is(md5(p.prosrc), '6dc83df80d89959ca4839ac1dc1ee251', 'Function alike body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'alike'
   AND proargtypes::text = '2283 25 25';

SELECT is(md5(p.prosrc), '9a4c9d12adcd74afcc2508c61a3a10b0', 'Function alike body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'alike'
   AND proargtypes::text = '2283 25';

SELECT is(md5(p.prosrc), '212860ee40720eacb7fbe03c6aff80be', 'Function any_column_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'any_column_privs_are'
   AND proargtypes::text = '19 19 19 1003';

SELECT is(md5(p.prosrc), '0c32974c61c176b11afdce356c173b9d', 'Function any_column_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'any_column_privs_are'
   AND proargtypes::text = '19 19 19 1003 25';

SELECT is(md5(p.prosrc), 'cc36dd93755b7d66955e3a3d72e325eb', 'Function any_column_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'any_column_privs_are'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), 'a6195ec57c8fec7aa77299a75059e11a', 'Function any_column_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'any_column_privs_are'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), 'b103c07c129617a46f385437f31e5e96', 'Function bag_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'bag_eq'
   AND proargtypes::text = '25 2277';

SELECT is(md5(p.prosrc), '7e5f57300792f4b4439f6de9664196a7', 'Function bag_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'bag_eq'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), 'b103c07c129617a46f385437f31e5e96', 'Function bag_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'bag_eq'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '7e5f57300792f4b4439f6de9664196a7', 'Function bag_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'bag_eq'
   AND proargtypes::text = '25 2277 25';

SELECT is(md5(p.prosrc), '89d78cc43068e602fe490cf5089a61a6', 'Function bag_has body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'bag_has'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), '37ada8e4cb692ecd7f68b8d0d1193d72', 'Function bag_has body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'bag_has'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '61145c27b133e75c21b386c1333d4108', 'Function bag_hasnt body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'bag_hasnt'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), '400531a4facfb67382b10caba00fb580', 'Function bag_hasnt body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'bag_hasnt'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), 'b20d25d9e8222b6d9db18f7aae0b6aee', 'Function bag_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'bag_ne'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '1711fa374cd592c0fea3e233c5f0154a', 'Function bag_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'bag_ne'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), 'b20d25d9e8222b6d9db18f7aae0b6aee', 'Function bag_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'bag_ne'
   AND proargtypes::text = '25 2277';

SELECT is(md5(p.prosrc), '1711fa374cd592c0fea3e233c5f0154a', 'Function bag_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'bag_ne'
   AND proargtypes::text = '25 2277 25';

SELECT is(md5(p.prosrc), '5d94fbec10b97d8223e000f7ed0d8f78', 'Function can body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'can'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '758c7ceb805afaa0e2cbfc3a399ecdd9', 'Function can body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'can'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), '824ec6189c7c1e8a4dde65cf77da5c7b', 'Function can body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'can'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), '3ba83d9e0887aabfced9e24c7f3c3857', 'Function can body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'can'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), 'ac24efd99e20507359b63205c1613ba6', 'Function cast_context_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'cast_context_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '32388e0e5d441104a99ad02d1a84e0cc', 'Function cast_context_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'cast_context_is'
   AND proargtypes::text = '19 19 25 25';

SELECT is(md5(p.prosrc), '90e3aef4f9bf26e3c92ba3279e0d2d04', 'Function casts_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'casts_are'
   AND proargtypes::text = '1009';

SELECT is(md5(p.prosrc), 'c6b49e397c5ffdeaa8ba1e01ad66461b', 'Function casts_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'casts_are'
   AND proargtypes::text = '1009 25';

SELECT is(md5(p.prosrc), '62bdd4bd98077503b4d493b0bcbaca02', 'Function check_test body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'check_test'
   AND proargtypes::text = '25 16 25 25 25';

SELECT is(md5(p.prosrc), '72093fd7d90704bc5b8cc7f84dcbc1f7', 'Function check_test body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'check_test'
   AND proargtypes::text = '25 16 25';

SELECT is(md5(p.prosrc), '579e08928d18b7230938f6999bd6506b', 'Function check_test body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'check_test'
   AND proargtypes::text = '25 16';

SELECT is(md5(p.prosrc), '496273db281050b456e413af156eaaf6', 'Function check_test body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'check_test'
   AND proargtypes::text = '25 16 25 25 25 16';

SELECT is(md5(p.prosrc), '6249815e3f36c4b7607ffcfb60fe3ec6', 'Function check_test body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'check_test'
   AND proargtypes::text = '25 16 25 25';

SELECT is(md5(p.prosrc), '2bb836b2953219084b49356203e139e1', 'Function cmp_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'cmp_ok'
   AND proargtypes::text = '2283 25 2283';

SELECT is(md5(p.prosrc), '82ee7966602c46f7d1e922af03c062cd', 'Function cmp_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'cmp_ok'
   AND proargtypes::text = '2283 25 2283 25';

SELECT is(md5(p.prosrc), '6e7798a14140e7d07c9ab4c1bb42b43a', 'Function col_default_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_default_is'
   AND proargtypes::text = '19 19 19 2283 25';

SELECT is(md5(p.prosrc), '23eb1441a5cbf6d7d48fc5b805360b51', 'Function col_default_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_default_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '23eb1441a5cbf6d7d48fc5b805360b51', 'Function col_default_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_default_is'
   AND proargtypes::text = '19 19 2283';

SELECT is(md5(p.prosrc), '8a9b219921d9971c028e2da8b55e70cc', 'Function col_default_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_default_is'
   AND proargtypes::text = '19 19 25 25';

SELECT is(md5(p.prosrc), '8a9b219921d9971c028e2da8b55e70cc', 'Function col_default_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_default_is'
   AND proargtypes::text = '19 19 2283 25';

SELECT is(md5(p.prosrc), '6e7798a14140e7d07c9ab4c1bb42b43a', 'Function col_default_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_default_is'
   AND proargtypes::text = '19 19 19 25 25';

SELECT is(md5(p.prosrc), '970fd6deb79d41140c5990a81a36ee63', 'Function col_has_check body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_has_check'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), 'a4a6a1168b4f3881a1477b0e42895199', 'Function col_has_check body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_has_check'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), 'd82c772a546dfe27dfa95f3a246286cb', 'Function col_has_check body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_has_check'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '0c33fd0ab52e6a54168f5ed0425eb3cc', 'Function col_has_check body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_has_check'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '8c346328c5484f0d8a5962312e3e0de9', 'Function col_has_check body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_has_check'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '0bfed6ab1030143fcd051f4d5b26664b', 'Function col_has_check body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_has_check'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '1fd44ba6fe34054a212185bb6ab188d4', 'Function col_has_default body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_has_default'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'ccb9b28188f5d0da9b7391113178d899', 'Function col_has_default body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_has_default'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '53794c2b39eaba797f20268b47485ceb', 'Function col_has_default body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_has_default'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '04616120773e99f83ddb9c9a13c27f3e', 'Function col_hasnt_default body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_hasnt_default'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), 'dc36e61b30cfc21de351d2a3faac2dde', 'Function col_hasnt_default body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_hasnt_default'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '5cc0152a8914392f388bccf8cd74d24f', 'Function col_hasnt_default body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_hasnt_default'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '68f917815394817e9846b78be8d2d865', 'Function col_is_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_fk'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'd507b10bd453bf14bbc22eafa6c9d20f', 'Function col_is_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_fk'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '01cfad39238ec512dd802e5ae2369bce', 'Function col_is_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_fk'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '16ca15f24622651eca1627910d190898', 'Function col_is_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_fk'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '2eae3e052fcb36128cc67f3d2a2348eb', 'Function col_is_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_fk'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), 'a420c655e764d2805fd03ec162f89bf3', 'Function col_is_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_fk'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '996f65a059e8a950fe715762be528143', 'Function col_is_null body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_null'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'c1e5010910f582e3705a55798345af88', 'Function col_is_null body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_null'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '54645cc00817c944838eaad3cd9625fc', 'Function col_is_null body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_null'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '8be4276918754c349c755f97215d901f', 'Function col_is_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_pk'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'f182a5d4acc7f39c141ee2e6062e3a9c', 'Function col_is_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_pk'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '27461a9ac25a5281b97dcb2bbc2d41eb', 'Function col_is_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_pk'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '6f55598a7cd35d7f6bc895e85d3b0293', 'Function col_is_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_pk'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '225260d6d2e38cf8fbd116dd3ddd9a32', 'Function col_is_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_pk'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '1f2b065eddd18e4d3d1c778a19d1ed48', 'Function col_is_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_pk'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '9da524a1d269179718ada4a43ff62dc2', 'Function col_is_unique body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_unique'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '4705927a264c7a8729be50778a9da2d4', 'Function col_is_unique body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_unique'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '8f6dd7847942277a1517f9df0bb78cd8', 'Function col_is_unique body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_unique'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '88b9bdaa8ad5acea80e1bfab2daf441f', 'Function col_is_unique body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_unique'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), 'c5e19d5b28d74755e2b3431b4436557f', 'Function col_is_unique body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_unique'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '535e60c1bef983f97c768652be0d6e22', 'Function col_is_unique body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_unique'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), 'b333ce63d45b754c8af47d7bb95101df', 'Function col_is_unique body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_unique'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '64619569a59f548956b1d7d8c67b70fb', 'Function col_is_unique body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_is_unique'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '666c18a0d7292fdd1c76537d9558b831', 'Function col_isnt_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_isnt_fk'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '7465d84eefe71655eb94e9f31108391d', 'Function col_isnt_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_isnt_fk'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '6576a46b6a3aaf5c1c3d4d1087737d00', 'Function col_isnt_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_isnt_fk'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '87d6e1c756449ea23e0c8bb3ce0bb3a7', 'Function col_isnt_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_isnt_fk'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), 'e6ef6a2b062b6fa914e7dd753888e76e', 'Function col_isnt_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_isnt_fk'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'a9b7bc91f81edf7adb3be781681f9af7', 'Function col_isnt_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_isnt_fk'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'f7cb33fa6373f568f1b868b5cfa52451', 'Function col_isnt_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_isnt_pk'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), 'd7af5b3a9f725f4fbda2b031837ed205', 'Function col_isnt_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_isnt_pk'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '6a652f028b5ed3bd841bf7873ca60f99', 'Function col_isnt_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_isnt_pk'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '95e83ef061bcb2c3eaa1d9ce2b392f70', 'Function col_isnt_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_isnt_pk'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'ee56eb1a0d3f1631d2f24e469f2b4a17', 'Function col_isnt_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_isnt_pk'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), 'e819212a666ba113f55935af9ba47404', 'Function col_isnt_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_isnt_pk'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), 'a880f5fc5c0566582d22c157705115ce', 'Function col_not_null body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_not_null'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '1c2e2d8c1fd06f81edc4d869e27f8d6b', 'Function col_not_null body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_not_null'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '4443c4305f519c49849fdd3616f2ab0b', 'Function col_not_null body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_not_null'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '31d82029e78f1877d99818c3ecb55260', 'Function col_type_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_type_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '345ba85e93a2b450dc561f2dd7056bba', 'Function col_type_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_type_is'
   AND proargtypes::text = '19 19 19 19 25 25';

SELECT is(md5(p.prosrc), 'b7466ec6987d0d5e604978fe13fb89b9', 'Function col_type_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_type_is'
   AND proargtypes::text = '19 19 19 19 25';

SELECT is(md5(p.prosrc), 'f04981b0556a9d38acb3ecaaef4bd434', 'Function col_type_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_type_is'
   AND proargtypes::text = '19 19 19 25 25';

SELECT is(md5(p.prosrc), 'a53100fc0565532bee98baa978918882', 'Function col_type_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_type_is'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '25c8bb00168378cb1fd33089ba781c6e', 'Function col_type_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'col_type_is'
   AND proargtypes::text = '19 19 25 25';

SELECT is(md5(p.prosrc), '9ab3158fcb16d5b5ce9f3154cbd01670', 'Function collect_tap body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'collect_tap'
   AND proargtypes::text = '1009';

SELECT is(md5(p.prosrc), '9ab3158fcb16d5b5ce9f3154cbd01670', 'Function collect_tap body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'collect_tap'
   AND proargtypes::text = '1015';

SELECT is(md5(p.prosrc), 'f0a04d2f9c657ac184130d0b862a5f32', 'Function column_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'column_privs_are'
   AND proargtypes::text = '19 19 19 19 1003';

SELECT is(md5(p.prosrc), '5c6bef6e9c3ea69fa38da5c6f2f42eb5', 'Function column_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'column_privs_are'
   AND proargtypes::text = '19 19 19 19 1003 25';

SELECT is(md5(p.prosrc), '901080b37518e21ccd7a5f7db7f37878', 'Function column_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'column_privs_are'
   AND proargtypes::text = '19 19 19 1003 25';

SELECT is(md5(p.prosrc), 'e585d68c7c0727a202f08290e2063f4e', 'Function column_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'column_privs_are'
   AND proargtypes::text = '19 19 19 1003';

SELECT is(md5(p.prosrc), 'ff445796859b12da9adfb717f1b9c018', 'Function columns_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'columns_are'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '34c3be0c6753864cb8c408d5c618481f', 'Function columns_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'columns_are'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '05d62edd89fbf655e13c8287f0b92629', 'Function columns_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'columns_are'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), 'afdfad16cef38598399defcfa8b4b4a4', 'Function columns_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'columns_are'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '3a7ae952f2c394584c809d77306eab3a', 'Function composite_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'composite_owner_is'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '706ebc2ed04d7ffd02943a83880a5289', 'Function composite_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'composite_owner_is'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), 'f030fc4b7e685abe280039bb40f21877', 'Function composite_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'composite_owner_is'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '2a18972c7e399426f0e56b3da8156b15', 'Function composite_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'composite_owner_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'fe381c7eae7fab791b70fcc8fc4a4c5a', 'Function database_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'database_privs_are'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), 'ed222c058010336332e435baf7cfeeeb', 'Function database_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'database_privs_are'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '395fcd58a573d4db63498cb92fe2bea3', 'Function db_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'db_owner_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '2b511f6875f99990016678a9996f79b2', 'Function db_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'db_owner_is'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '68c0d09ca8103b02cb60058a1cf24ec2', 'Function diag body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'diag'
   AND proargtypes::text = '2283';

SELECT is(md5(p.prosrc), '7cbcc570f1ad96cb5a7fe79ef1ca4148', 'Function diag body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'diag'
   AND proargtypes::text = '2277';

SELECT is(md5(p.prosrc), '8bf8640a47ab2a3ddd3a718fd68be24e', 'Function diag body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'diag'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), '7cbcc570f1ad96cb5a7fe79ef1ca4148', 'Function diag body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'diag'
   AND proargtypes::text = '1009';

SELECT is(md5(p.prosrc), '345755b011d470f246cd8799c44023ea', 'Function diag_test_name body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'diag_test_name'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), 'ba8e94ce39ab65d6cd56d9a890bde69d', 'Function display_oper body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'display_oper'
   AND proargtypes::text = '19 26';

SELECT is(md5(p.prosrc), 'f0acd8520b571faa7b696acf191a5ef2', 'Function do_tap body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'do_tap'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '98eee42b80a41a1be01bffe2700f2e43', 'Function do_tap body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'do_tap'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), '8772b7ced222c89d7f992ff77c06dc03', 'Function do_tap body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'do_tap'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), '4c0f80f52d4c19d627c4cb7d183c8253', 'Function do_tap body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'do_tap'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '8013cab81cc755ce8ed394ebf4882de8', 'Function doesnt_imatch body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'doesnt_imatch'
   AND proargtypes::text = '2283 25';

SELECT is(md5(p.prosrc), 'c9026cc5c8666b7422faecb913bc68bb', 'Function doesnt_imatch body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'doesnt_imatch'
   AND proargtypes::text = '2283 25 25';

SELECT is(md5(p.prosrc), '3765b5c0d0b4a773791b0c34609acc0d', 'Function doesnt_match body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'doesnt_match'
   AND proargtypes::text = '2283 25 25';

SELECT is(md5(p.prosrc), '8bbb2a9b884597166e8047cf3b6905e6', 'Function doesnt_match body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'doesnt_match'
   AND proargtypes::text = '2283 25';

SELECT is(md5(p.prosrc), 'dba7fa9c4da713d73e2174941c50c07a', 'Function domain_type_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domain_type_is'
   AND proargtypes::text = '19 25 25';

SELECT is(md5(p.prosrc), 'a767042489abb8de6b9c3170093dc258', 'Function domain_type_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domain_type_is'
   AND proargtypes::text = '19 25 19 25';

SELECT is(md5(p.prosrc), '028ed2bc290b4d936249b530293e71db', 'Function domain_type_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domain_type_is'
   AND proargtypes::text = '19 25 19 25 25';

SELECT is(md5(p.prosrc), 'add314a77f49f3e562c7525583f3a473', 'Function domain_type_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domain_type_is'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), '52f7354db4394643718f10a795291426', 'Function domain_type_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domain_type_is'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '96d94fc2d092f33af6ebba515a0946de', 'Function domain_type_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domain_type_is'
   AND proargtypes::text = '19 25 25 25';

SELECT is(md5(p.prosrc), '12824f58d625b8e3fa6f9bb3c1368074', 'Function domain_type_isnt body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domain_type_isnt'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '3ea1076e5c54a4e9c53b77f153daa780', 'Function domain_type_isnt body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domain_type_isnt'
   AND proargtypes::text = '19 25 19 25 25';

SELECT is(md5(p.prosrc), 'ef58d3eb0d836f5d43fe61bc4b9219fb', 'Function domain_type_isnt body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domain_type_isnt'
   AND proargtypes::text = '19 25 19 25';

SELECT is(md5(p.prosrc), '2c239a4d252515b44aaec9da5a5cdee6', 'Function domain_type_isnt body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domain_type_isnt'
   AND proargtypes::text = '19 25 25 25';

SELECT is(md5(p.prosrc), '59a1f005bda1edd8fd84156fed076174', 'Function domain_type_isnt body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domain_type_isnt'
   AND proargtypes::text = '19 25 25';

SELECT is(md5(p.prosrc), '3cde90f1dc2a65870344208be8e54c50', 'Function domain_type_isnt body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domain_type_isnt'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), 'fc55e9a95ffe2ad909df2ec96f820600', 'Function domains_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domains_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), '7827c4b9ef030b3425a71561eab8e01b', 'Function domains_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domains_are'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '35395281117e6a9c91748eafe66beb0b', 'Function domains_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domains_are'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '1f22bf7d2914702ebf7e44a3bc00c0c8', 'Function domains_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'domains_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), '7272d7c08347e16e00f19307b9c47aa9', 'Function enum_has_labels body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'enum_has_labels'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '80a2330d6922f4da64c28f3f81e0d4d8', 'Function enum_has_labels body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'enum_has_labels'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '4dc6ef1b8e29cdfebe030c591ea3b393', 'Function enum_has_labels body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'enum_has_labels'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '1e768904daf964ba22d96dcab81c0d7c', 'Function enum_has_labels body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'enum_has_labels'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '9977824f10d3298dd1f83c8b248721ff', 'Function enums_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'enums_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), '58813088af084652518f10b90e558f6b', 'Function enums_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'enums_are'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '6ffbf1286dd0763609b4525ec57250e5', 'Function enums_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'enums_are'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '7a34553a24b9d69b3ffccbbdee5fea3b', 'Function enums_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'enums_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), '60fe94b91be37f4b27e2e36ec3632168', 'Function fail body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'fail'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), '6c1e65dda9a51959e3c3db51ddbf7db6', 'Function fail body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'fail'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), '756ab40302fddd75736e14c1ea79384b', 'Function fdw_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'fdw_privs_are'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), 'dedb29f52fbad467079dd944e08600c5', 'Function fdw_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'fdw_privs_are'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), 'e9663eab19fb5f36573502d93c7bcd63', 'Function findfuncs body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'findfuncs'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), '958456539a4b238bb96029cad66e691f', 'Function findfuncs body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'findfuncs'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '217a139c87469d8a263d1635983acc87', 'Function finish body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'finish'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), '7cbfc65f1d8c6fad2268f901b1ca61e0', 'Function fk_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'fk_ok'
   AND proargtypes::text = '19 19 19 19 25';

SELECT is(md5(p.prosrc), '759e2ef179710f0c7aa2302edb02c470', 'Function fk_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'fk_ok'
   AND proargtypes::text = '19 19 1003 19 19 1003 25';

SELECT is(md5(p.prosrc), '648ba99b1eca1452b1c566814d9411db', 'Function fk_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'fk_ok'
   AND proargtypes::text = '19 1003 19 1003 25';

SELECT is(md5(p.prosrc), '0b842fedfd7a2fc7c4b3703e22f7979a', 'Function fk_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'fk_ok'
   AND proargtypes::text = '19 19 1003 19 19 1003';

SELECT is(md5(p.prosrc), '758eb89e43fa577af3badd852a19a5a0', 'Function fk_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'fk_ok'
   AND proargtypes::text = '19 1003 19 1003';

SELECT is(md5(p.prosrc), '9cb098d8d7a64f33801d7ea304d7b51d', 'Function fk_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'fk_ok'
   AND proargtypes::text = '19 19 19 19 19 19 25';

SELECT is(md5(p.prosrc), '2375a6a79476d0e9b20d339b633f1edf', 'Function fk_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'fk_ok'
   AND proargtypes::text = '19 19 19 19 19 25';

SELECT is(md5(p.prosrc), '8da8859351749bb8e2db36e7c79d8ddc', 'Function fk_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'fk_ok'
   AND proargtypes::text = '19 19 19 19';

SELECT is(md5(p.prosrc), 'b6e38b4f19d096334400b2425dbc56be', 'Function foreign_table_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'foreign_table_owner_is'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '8fced739c43a82a825610b2fd5cb669b', 'Function foreign_table_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'foreign_table_owner_is'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '56fac082a91ab4da09c049da3bd29c35', 'Function foreign_table_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'foreign_table_owner_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '41880b8607ff6b7cb0d1b57d72bd960d', 'Function foreign_table_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'foreign_table_owner_is'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '133aec0f297e08de8ef00f12a00ac9a8', 'Function foreign_tables_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'foreign_tables_are'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), 'b215db3d80d0b53b9de8e26317197d22', 'Function foreign_tables_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'foreign_tables_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), 'faa5cf5b3d1db24f486b4089567fcef2', 'Function foreign_tables_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'foreign_tables_are'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '75855eda846a0945010debd838276f8e', 'Function foreign_tables_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'foreign_tables_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), 'fc8009d0a248d9778d7acc3dcb0cbf1a', 'Function function_lang_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_lang_is'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '4b1579e85786c03bda3b15ff9e1cbc42', 'Function function_lang_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_lang_is'
   AND proargtypes::text = '19 1003 19 25';

SELECT is(md5(p.prosrc), '8f44c8da5edcdcdfb9a73f448f931adb', 'Function function_lang_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_lang_is'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '9882eb62a06cec7bdc66168f64767a1f', 'Function function_lang_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_lang_is'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '87b286cb6e692872d13c9647c001827c', 'Function function_lang_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_lang_is'
   AND proargtypes::text = '19 19 1003 19 25';

SELECT is(md5(p.prosrc), 'd03987bc7a5d3b3f2b3f0a4a5f3803c9', 'Function function_lang_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_lang_is'
   AND proargtypes::text = '19 19 1003 19';

SELECT is(md5(p.prosrc), 'e996e6d5bbe4781e9892700dc433c3f7', 'Function function_lang_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_lang_is'
   AND proargtypes::text = '19 1003 19';

SELECT is(md5(p.prosrc), '3d2db7391cf6dc4eb5ec057f5fe29384', 'Function function_lang_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_lang_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '344d1de9d28a194d114f345d51351195', 'Function function_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_owner_is'
   AND proargtypes::text = '19 1003 19';

SELECT is(md5(p.prosrc), '71e7bcc35768f879020481e2ddcba31c', 'Function function_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_owner_is'
   AND proargtypes::text = '19 19 1003 19 25';

SELECT is(md5(p.prosrc), '709502b55ae82766a990e16f03fea78c', 'Function function_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_owner_is'
   AND proargtypes::text = '19 19 1003 19';

SELECT is(md5(p.prosrc), '30395013bd809505a289f6d78ad657e4', 'Function function_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_owner_is'
   AND proargtypes::text = '19 1003 19 25';

SELECT is(md5(p.prosrc), 'b1cf7c5a6882d3f3947f45632618d123', 'Function function_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_privs_are'
   AND proargtypes::text = '19 19 1003 19 1003 25';

SELECT is(md5(p.prosrc), '1984673f6d3da80ccdbe6b0e7607aadf', 'Function function_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_privs_are'
   AND proargtypes::text = '19 1003 19 1003 25';

SELECT is(md5(p.prosrc), 'cb5ba9f209af9916655cd251a52d3bac', 'Function function_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_privs_are'
   AND proargtypes::text = '19 1003 19 1003';

SELECT is(md5(p.prosrc), 'dddd31664db15cc699d1a88b86128cb4', 'Function function_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_privs_are'
   AND proargtypes::text = '19 19 1003 19 1003';

SELECT is(md5(p.prosrc), 'db7eb8ec4b99b70e6fe42f8b4330e34f', 'Function function_returns body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_returns'
   AND proargtypes::text = '19 25 25';

SELECT is(md5(p.prosrc), 'f7788d1c57babaa2bd8a06103a1c452d', 'Function function_returns body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_returns'
   AND proargtypes::text = '19 19 1003 25 25';

SELECT is(md5(p.prosrc), 'd25415231537d9796058e38ee4a72e89', 'Function function_returns body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_returns'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '26941057906ee93af93cfe7a1508d237', 'Function function_returns body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_returns'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '6a9f83905a04aa619e332dff76b9da11', 'Function function_returns body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_returns'
   AND proargtypes::text = '19 1003 25 25';

SELECT is(md5(p.prosrc), '3d268010e4eb53d197ec818544915ff5', 'Function function_returns body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_returns'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'd670c28033ea480b5962430757e6cb16', 'Function function_returns body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_returns'
   AND proargtypes::text = '19 19 25 25';

SELECT is(md5(p.prosrc), '16f1bbe0314ddbf69c3d87c3b48567e5', 'Function function_returns body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'function_returns'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '5bb739cfd28975230ff8c7320e99bd46', 'Function functions_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'functions_are'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '16a708edfe81b0090826a88710512649', 'Function functions_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'functions_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), 'd629d8962f420f8ce0ee4d03b437e8ee', 'Function functions_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'functions_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), '01ac62683faf5eb752d551558f3cb41e', 'Function functions_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'functions_are'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), 'e02ff7ffa0376161d502118e44c856c3', 'Function groups_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'groups_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), 'a359d127a16952b00069ec601353c6b2', 'Function groups_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'groups_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), '879bb58a4be2559973e24468d89669a1', 'Function has_cast body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_cast'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '19b2a4d9b58454c2eebb5f602e7c4e34', 'Function has_cast body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_cast'
   AND proargtypes::text = '19 19 19 19 25';

SELECT is(md5(p.prosrc), '75c0dd757a191130a9a1ac0844f8741a', 'Function has_cast body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_cast'
   AND proargtypes::text = '19 19 19 19';

SELECT is(md5(p.prosrc), '5485a4ea611bb679998a1a6bfe64a24a', 'Function has_cast body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_cast'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '4f83ce2e7fcfa456ebdcc920f02b8a79', 'Function has_cast body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_cast'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '8da13b6ab75c7d14f39b294158d18492', 'Function has_cast body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_cast'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '8514a537f13d140a86980a305dcd7958', 'Function has_check body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_check'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '17f5e3bf86e2c418a3486c63d184091d', 'Function has_check body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_check'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '05c4e69926eb92c729208c8971e94f0b', 'Function has_check body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_check'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '79bee7e636ffc6ae87f75ae13a55c936', 'Function has_column body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_column'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), 'd0bcd57e3109a537c5fd1b4dbf9e6298', 'Function has_column body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_column'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '56d313cc3461d93e898cb7f9ae469564', 'Function has_column body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_column'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'ff9e64373873482c08ca06e5eac5ebed', 'Function has_composite body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_composite'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '75d383e036f39389547126acd3afb325', 'Function has_composite body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_composite'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'eadd6823ac9c0a2845d398f012019b77', 'Function has_composite body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_composite'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '84725b742384db6cf96298c855e098b4', 'Function has_domain body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_domain'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '4ffae8809a9b0d277db41a9cb4a166d8', 'Function has_domain body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_domain'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '00349b99fa507576be0800ce462e7e18', 'Function has_domain body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_domain'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '0419a69a409af8b9375719bb901907af', 'Function has_domain body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_domain'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'd000230b3b2dbcc38c6a19df67d79699', 'Function has_enum body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_enum'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'cd319bd2c119164629b4a1c714b98a10', 'Function has_enum body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_enum'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '44d4c36883b1a5e04ab1fc9fce8139e8', 'Function has_enum body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_enum'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '1a4280a531fc2955a9cd4c75501c0976', 'Function has_enum body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_enum'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'bcc73953e03824721139a73d0b50edb7', 'Function has_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_fk'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'f99b698bbcbaec65550dec899b9def17', 'Function has_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_fk'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '8a1e8be5acdf14a8c0889882518dba3d', 'Function has_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_fk'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'daeab976a38f10b38f6ad366f458a432', 'Function has_foreign_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_foreign_table'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'e86975bba4e44734f8582033d2735d69', 'Function has_foreign_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_foreign_table'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '808c684b62230523e5b9f13c60d7f026', 'Function has_foreign_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_foreign_table'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'edce3caa712c2c126fbf3505538206e1', 'Function has_foreign_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_foreign_table'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '170358448f2a75a05a5fffa8cb2ad542', 'Function has_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_function'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), 'eb04d641d2f4ea0b50450e2588a9342d', 'Function has_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_function'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '1aaccef3ed8e5fd70ee361f2c272d6ec', 'Function has_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_function'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '24aa12cd1a0db4485d4cce8b32a72ecd', 'Function has_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_function'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '170358448f2a75a05a5fffa8cb2ad542', 'Function has_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_function'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '46e07861f8f6cb595535d36bd17bed34', 'Function has_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_function'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'f03136263d518be799a55805d8fd737f', 'Function has_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_function'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '4afead16074bcea3f392be757dc15f14', 'Function has_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_function'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), 'd0af8aee6879706946c3fa10ed029f7c', 'Function has_group body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_group'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'a6bcf9934253cddec2ce1f2e21b0b4a6', 'Function has_group body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_group'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '6d4cedc9ef42d5793675513923127feb', 'Function has_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_index'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '5b722af70f61ef1b6936b7f1427378d7', 'Function has_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_index'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '2e22534a155d20a976d8a9550bd29459', 'Function has_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_index'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '37285f6b101b4036a99ba9ed9a50b64d', 'Function has_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_index'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '3c2977fb7eeb372ce08871a2fe084b5e', 'Function has_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_index'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '0ab075d6c8c30f62c227d62d4f6d95a8', 'Function has_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_index'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), 'cd27c10cf18ef933d384e090fdf3187e', 'Function has_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_index'
   AND proargtypes::text = '19 19 19 19';

SELECT is(md5(p.prosrc), 'bbae2a2ce8698ed648715d0cedc0f9c1', 'Function has_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_index'
   AND proargtypes::text = '19 19 19 19 25';

SELECT is(md5(p.prosrc), 'cd27c10cf18ef933d384e090fdf3187e', 'Function has_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_index'
   AND proargtypes::text = '19 19 19 1003';

SELECT is(md5(p.prosrc), '342f444bc0d5c7b28ab806ed20f007e2', 'Function has_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_index'
   AND proargtypes::text = '19 19 19 1003 25';

SELECT is(md5(p.prosrc), '8047dd8bbfea9648e522c7e5d6a7d290', 'Function has_language body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_language'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '4c6c1679a2c2234af04c0c659ffa675a', 'Function has_language body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_language'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '30474fb2649450c2514b15fcdbe16d91', 'Function has_leftop body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_leftop'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '8e04e8b8dd60dedefc2ba0febbc79ce7', 'Function has_leftop body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_leftop'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'e5f94540a0b3852f5852dfff44dd47f5', 'Function has_leftop body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_leftop'
   AND proargtypes::text = '19 19 19 19 25';

SELECT is(md5(p.prosrc), 'b39ec4678d0728a6b0914ce5ecce8e8a', 'Function has_leftop body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_leftop'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), 'ba755483bf83ed25efba5fc85437a35c', 'Function has_leftop body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_leftop'
   AND proargtypes::text = '19 19 19 19';

SELECT is(md5(p.prosrc), 'b8de8d480ad66ab1d50532fbd48df60e', 'Function has_leftop body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_leftop'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '11114ac5464bea879d97999be06dbdb1', 'Function has_materialized_view body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_materialized_view'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '7d875294325330e76da69f2c51cda0bf', 'Function has_materialized_view body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_materialized_view'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '745583016885b0d49893d08d13a01d1c', 'Function has_materialized_view body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_materialized_view'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '27b75654fb44c85bda11ed266d806dda', 'Function has_opclass body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_opclass'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '4a3320280b2543bed9669e31f7af6fb0', 'Function has_opclass body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_opclass'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'dc0711ed1e6b4c350a0d2640c2190287', 'Function has_opclass body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_opclass'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '6e9f376edb9705e05d15c6b37ab001cb', 'Function has_opclass body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_opclass'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '128e09f7a8b1548106fb36a0ab4b8440', 'Function has_operator body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_operator'
   AND proargtypes::text = '19 19 19 19 25';

SELECT is(md5(p.prosrc), 'e69f067963a8d422a787996d84f887ee', 'Function has_operator body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_operator'
   AND proargtypes::text = '19 19 19 19 19';

SELECT is(md5(p.prosrc), 'dd9e1c7d89b0ad816e7e0e099d8919f4', 'Function has_operator body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_operator'
   AND proargtypes::text = '19 19 19 19 19 25';

SELECT is(md5(p.prosrc), 'c06009285a113dd4c879c9868df08e61', 'Function has_operator body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_operator'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), 'b33b52079709b600a5cb0606706dbf15', 'Function has_operator body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_operator'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), 'f012636b234c23460914894ade89a3f6', 'Function has_operator body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_operator'
   AND proargtypes::text = '19 19 19 19';

SELECT is(md5(p.prosrc), 'c4f30be8362bd9412fae82c38ee79dde', 'Function has_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_pk'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '8fac94496deab1f80064cbab2f1b97ec', 'Function has_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_pk'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '3683d68d1705b4e0cb490b1a53467a5d', 'Function has_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_pk'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '127d357e491f31debdf467028a83132d', 'Function has_relation body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_relation'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'd4b8513073a626b5f48a4846cc2fa4c4', 'Function has_relation body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_relation'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'ada503c131bcb8df34238695699e32f6', 'Function has_relation body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_relation'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '9ca9f797fbc8e11b1e2b0b310de5f402', 'Function has_rightop body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_rightop'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), 'ada6b2adad6cf12e0b45f0a6358e36b3', 'Function has_rightop body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_rightop'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '703fe0f0070d4bc3817e558be64d4889', 'Function has_rightop body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_rightop'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '91a30513a3d5f5b5a76122b98b2c1912', 'Function has_rightop body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_rightop'
   AND proargtypes::text = '19 19 19 19 25';

SELECT is(md5(p.prosrc), '2a881b32f6821c8ce556c8f026b91794', 'Function has_rightop body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_rightop'
   AND proargtypes::text = '19 19 19 19';

SELECT is(md5(p.prosrc), 'bbcd26e36d835cdef91fd97b37c80a24', 'Function has_rightop body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_rightop'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '2be83f429a35212bef35b5ee45c73461', 'Function has_role body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_role'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '3be95e9e631c36c6cf722ef6038d47a9', 'Function has_role body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_role'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'a2048cc426b270c8971fc2cf2795c3e0', 'Function has_rule body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_rule'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'bd3733571cc49b37507c75fe3daa6d10', 'Function has_rule body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_rule'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '6e52cc9a2d6b5d43a6cb0983328828f1', 'Function has_rule body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_rule'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '179ef62c542ff21fcee7e797e76523ea', 'Function has_rule body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_rule'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '62b7ccd3c0ce53c4fb3c31ecd8458103', 'Function has_schema body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_schema'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '3e6aed22075ab822a915da510c9d0053', 'Function has_schema body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_schema'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'bc72c60d52b66bf6fb41654e2f5d5e27', 'Function has_sequence body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_sequence'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '09e4c4e94426ccad20db20b6c40500ca', 'Function has_sequence body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_sequence'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'f34882ca20530926a3b11eac821964d0', 'Function has_sequence body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_sequence'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '61461a6be43bf0ac9f59eacbd0b85320', 'Function has_sequence body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_sequence'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '817ca3cc2d4168f17598188f8f846166', 'Function has_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_table'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'a32c0ba64b63aab149b024049fa86c76', 'Function has_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_table'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'eaea0b671b0c27cccf09bf1b36ed0665', 'Function has_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_table'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'f1c37563ec975dc2d745f71410362dc8', 'Function has_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_table'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '6c70bd1de529c5f35aac1d106523b7a6', 'Function has_tablespace body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_tablespace'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'b46c113355b432142de63eb31716fc7a', 'Function has_tablespace body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_tablespace'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'ab1c0a4ec0121131afddb3f912ab44bd', 'Function has_tablespace body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_tablespace'
   AND proargtypes::text = '19 25 25';

SELECT is(md5(p.prosrc), '58e1b0072c9771d61d10735a2536fe39', 'Function has_trigger body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_trigger'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '54fcb57346e2bec564122da5005c0c4a', 'Function has_trigger body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_trigger'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '4bcceccb54851a5a27b1130d9d7c7914', 'Function has_trigger body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_trigger'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), 'df8fa547cb6da2e445c8845e4e85320c', 'Function has_trigger body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_trigger'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '78360a4b508a0f356cd775f3ade03ef6', 'Function has_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_type'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'b07a533b3f764e09a6b1436cf1b21946', 'Function has_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_type'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '312cb4b2f786c2a9364c0ae2f062daf8', 'Function has_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_type'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '04a93c0f28ac2c5adbae1464977f9943', 'Function has_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_type'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '721fca9e1829362481370413a233cc30', 'Function has_unique body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_unique'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), '8ef6635029a4ad5dbdc0d04234d4cc74', 'Function has_unique body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_unique'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '5c426b79c591b08e1fd47bed61878a63', 'Function has_unique body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_unique'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), 'e9a77908ee70d760b51ca58793494fa8', 'Function has_user body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_user'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'd914d011aaee59c3db3ea041107f78c2', 'Function has_user body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_user'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '1d11b3770215e3f32600f7c53899d3d5', 'Function has_view body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_view'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'a0e989c22805cf5ed359d12a44aa326c', 'Function has_view body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_view'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '9a4ac02df582b539a13336bedece022a', 'Function has_view body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'has_view'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '28df35ff7c10b28e0e0e773b1ebc219b', 'Function hasnt_cast body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_cast'
   AND proargtypes::text = '19 19 19 19';

SELECT is(md5(p.prosrc), '8b59e8dd8f5e7232cbd95ac1fd8bd7dd', 'Function hasnt_cast body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_cast'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '85007383f82a6278d5d2f0aceebaf85a', 'Function hasnt_cast body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_cast'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '6fb21b6bdc0e40653e7fdfa4254c0171', 'Function hasnt_cast body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_cast'
   AND proargtypes::text = '19 19 19 19 25';

SELECT is(md5(p.prosrc), '80f5805f045620ccb73aa8d9d59c10c3', 'Function hasnt_cast body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_cast'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '327ee3ecfebb0678c50d915c75594bd4', 'Function hasnt_cast body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_cast'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '59804569cec62356d3b28c02646c6eef', 'Function hasnt_column body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_column'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '8c7db3fc24f5b33ecb6dc17881c89d3c', 'Function hasnt_column body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_column'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'c8849e6db6180b2648ac7f6423c29388', 'Function hasnt_column body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_column'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '54aceff3e5eef5e6194d7012f7cf74d9', 'Function hasnt_composite body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_composite'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'd30235d9af1463371dbf0fecbb10f3f5', 'Function hasnt_composite body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_composite'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'bf9f40bfa6dfd911bcae08b9f5fc423e', 'Function hasnt_composite body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_composite'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '9ab7d0bacaa22eac2b0b0766008b7256', 'Function hasnt_domain body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_domain'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '4cb7b0b788cee8e72e1b78a82f1d528b', 'Function hasnt_domain body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_domain'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '37d437324f4c1cdf0f98e2774d940978', 'Function hasnt_domain body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_domain'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'a5b2e2ccd84e6500348f5dc71064a603', 'Function hasnt_domain body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_domain'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '05d138088a975f8aa85cc45a987473c9', 'Function hasnt_enum body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_enum'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '84ab69f6ea59468d5ceb360f8c133e3e', 'Function hasnt_enum body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_enum'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'eea549ba24a3ae53debb5bc152f839f8', 'Function hasnt_enum body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_enum'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '285c03df380f05ff4b42f575b2d63ab1', 'Function hasnt_enum body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_enum'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '7643c165b2b44257870c44c0ef1aef34', 'Function hasnt_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_fk'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '844f186f345b4016bf4b8f7c22a3f93d', 'Function hasnt_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_fk'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'bebd3d72b7dc6daa15072e0500ec817f', 'Function hasnt_fk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_fk'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '3a931066be028b747c3ef642b7241377', 'Function hasnt_foreign_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_foreign_table'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '566ba97c16776d8ee2fd268bfd771eb3', 'Function hasnt_foreign_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_foreign_table'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '7519a7581e22af96f5ed7f4891ca69f8', 'Function hasnt_foreign_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_foreign_table'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'e50c9bac5e95d9ef2247ca095489dc9f', 'Function hasnt_foreign_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_foreign_table'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '806a27de3f9238f47e5fa39d1c860c7e', 'Function hasnt_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_function'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '746f6388aa686436962420be55c29c57', 'Function hasnt_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_function'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), 'af03a2982ce595989f461c79fb96400d', 'Function hasnt_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_function'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '9e79ca38b64677ce9543ac2ac660d233', 'Function hasnt_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_function'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'd659ea232dcb6bec671cefe7d01329b1', 'Function hasnt_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_function'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '02ee433e6c214294a375235fa119c244', 'Function hasnt_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_function'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '9e79ca38b64677ce9543ac2ac660d233', 'Function hasnt_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_function'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), 'df91fabac17d7e97d3e45a95a369e59e', 'Function hasnt_function body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_function'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'c98e3f067e776da09a759d9cae8b9dda', 'Function hasnt_group body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_group'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'e117e93b9c33b220722f0659220fffd5', 'Function hasnt_group body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_group'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '4172e6ce67e00adfefc52da611fa29cd', 'Function hasnt_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_index'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '61eb424efcd9670b77c57a6c9b2333d0', 'Function hasnt_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_index'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '4801fcf8e00793680de20d79b359f04b', 'Function hasnt_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_index'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), 'debafcf347c5df7746600d250f37a82d', 'Function hasnt_index body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_index'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '0959222c15632a7a8988638512a613b8', 'Function hasnt_language body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_language'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'bb547e2dd1d4a65658a482c91bc434ec', 'Function hasnt_language body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_language'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '96f2e1ecebadd74075e769d0a56267b1', 'Function hasnt_materialized_view body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_materialized_view'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'adf31b38fb7ae1435b69716649c08b1d', 'Function hasnt_materialized_view body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_materialized_view'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '4cbdf453a8da49c17aaeea25d4778b4a', 'Function hasnt_materialized_view body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_materialized_view'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'fe54432c124108b023e8d821596c6e76', 'Function hasnt_opclass body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_opclass'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'c5cf4b090da160b3476cc8b4fed3639b', 'Function hasnt_opclass body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_opclass'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '8dfc03003c75e927441d5ef9b2b6eb32', 'Function hasnt_opclass body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_opclass'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '253a6b992a355738ad8ada8a08ef98ba', 'Function hasnt_opclass body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_opclass'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'e17a55296a84cb4b2bc70c7128fe042c', 'Function hasnt_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_pk'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'dc6c8ae797764692bb2af532527806e1', 'Function hasnt_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_pk'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '97382ea579c16063ac8461adb9d533c4', 'Function hasnt_pk body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_pk'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'df178200f81c6da97aa43e05ced32db0', 'Function hasnt_relation body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_relation'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'd5095afd9fe42001184c2b1584849645', 'Function hasnt_relation body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_relation'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '9154d72ac04bb2a552f7e38c917c4d4a', 'Function hasnt_relation body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_relation'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'ff9e63246f58696eb40b51278e5b3e77', 'Function hasnt_role body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_role'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'a0700821949d539459b45aead530f9e0', 'Function hasnt_role body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_role'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '4a29a6bdaa82558dfda805e60b239b22', 'Function hasnt_rule body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_rule'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), 'f04dcfdeb108d86d6f7b37ad927ad57a', 'Function hasnt_rule body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_rule'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'bd45235f463a023167c6483af8543463', 'Function hasnt_rule body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_rule'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '5733fe2601ddbe419dd13241839b2fa8', 'Function hasnt_rule body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_rule'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '4d5d9bf55b83178257d5f5ae0dc4ec67', 'Function hasnt_schema body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_schema'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '302245db019bf999a6cbd127e0713e73', 'Function hasnt_schema body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_schema'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '582a6d61b0bee5e7251b915c70dc0c1e', 'Function hasnt_sequence body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_sequence'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'eea3607c37c4f7c7361cc82a3569187b', 'Function hasnt_sequence body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_sequence'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '9c95d193f2fe6537a6715b02a3f34140', 'Function hasnt_sequence body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_sequence'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '53922bcb886f117277f30356355b2bb3', 'Function hasnt_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_table'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '669d6a38fb9ce4cf08965a10d3f8c49f', 'Function hasnt_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_table'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '5b7430e7f17c8728dd76d9fbcf06b145', 'Function hasnt_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_table'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'def975ec527ed7affd99715c4d8d0c69', 'Function hasnt_table body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_table'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '9642318c57b226e6e9ebddf01a51daaf', 'Function hasnt_tablespace body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_tablespace'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'ae600581465470407687ec87bb947a62', 'Function hasnt_tablespace body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_tablespace'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'ce08ce2d3d853c13e4c85e7660c7d865', 'Function hasnt_trigger body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_trigger'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), 'e5100ccd5efd421ffb32d5db96ce4a1e', 'Function hasnt_trigger body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_trigger'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '35ff1f81f9409330c8f6280fc793d293', 'Function hasnt_trigger body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_trigger'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'a5c2aac9967973bd3c42974746188427', 'Function hasnt_trigger body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_trigger'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), 'bb9beab58f64145ed13742ee415f7b59', 'Function hasnt_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_type'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'e1d30bd13ea93957e08c5380094b0496', 'Function hasnt_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_type'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '86b3cfa626fd7ba74620922a63bb2e5e', 'Function hasnt_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_type'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '05a0e9dcf3765f7667f1566ca91b9737', 'Function hasnt_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_type'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '630bae6fa5072cc19588ae9ac06fb337', 'Function hasnt_user body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_user'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '110f4bd89f797cb2753403b03d043a92', 'Function hasnt_user body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_user'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '3c65b4d29639b8cff13ebc3cead68859', 'Function hasnt_view body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_view'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '4802a29da53dcaa856e3fe885cbff087', 'Function hasnt_view body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_view'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'ea405216b88221ccc8efa479cffd565d', 'Function hasnt_view body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'hasnt_view'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'e3b8c7f95d39772a8597803c606f9f68', 'Function ialike body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'ialike'
   AND proargtypes::text = '2283 25 25';

SELECT is(md5(p.prosrc), 'eb85f3639e4aadc83f102860d056ffd1', 'Function ialike body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'ialike'
   AND proargtypes::text = '2283 25';

SELECT is(md5(p.prosrc), '118793bb6050945b63fc49ef23f05011', 'Function imatches body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'imatches'
   AND proargtypes::text = '2283 25';

SELECT is(md5(p.prosrc), '78c1303de04029bcc329515761748eef', 'Function imatches body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'imatches'
   AND proargtypes::text = '2283 25 25';

SELECT is(md5(p.prosrc), '41a2b4d6cb78f5ba61380efe51d6d8eb', 'Function in_todo body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'in_todo'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), '84a21eb0c6b976e9313e1bfd4e95958e', 'Function index_is_primary body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_is_primary'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '5ce0372a96ee0adbdd8945684d06f49d', 'Function index_is_primary body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_is_primary'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '468a873342df1fc7e67dad56d225d1c1', 'Function index_is_primary body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_is_primary'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), 'a059cd98612eb7a2c222bc1207556052', 'Function index_is_primary body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_is_primary'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '5f3e1a2cd80bbde823e37a53625c4bd9', 'Function index_is_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_is_type'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), 'd1958261a81eb3f9cf66dc871713dfc5', 'Function index_is_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_is_type'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '65f97358eee15bcdd23a570f1e62beaf', 'Function index_is_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_is_type'
   AND proargtypes::text = '19 19 19 19 25';

SELECT is(md5(p.prosrc), 'deaefec4e31559a64910a95a535d5c66', 'Function index_is_type body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_is_type'
   AND proargtypes::text = '19 19 19 19';

SELECT is(md5(p.prosrc), '380235855c68b3cacc41c3066085521b', 'Function index_is_unique body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_is_unique'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '8f24c6ef62b088f2438c629a9a3e69d0', 'Function index_is_unique body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_is_unique'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '8e8915432cf72bb8b9bc5ffb871fdecc', 'Function index_is_unique body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_is_unique'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '6665104bf501a682a3b3f1c2cc8f68ce', 'Function index_is_unique body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_is_unique'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '201554a26fee1c4985fdfec326348865', 'Function index_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_owner_is'
   AND proargtypes::text = '19 19 19 19';

SELECT is(md5(p.prosrc), '5792cfdd614b9b43b00a1e0cf4f7a743', 'Function index_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_owner_is'
   AND proargtypes::text = '19 19 19 19 25';

SELECT is(md5(p.prosrc), '4af5c556cc9e548f14098bf792389d3f', 'Function index_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_owner_is'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), 'd3950dee1293e28cec7df49e4a82ae9b', 'Function index_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'index_owner_is'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), 'c94184a85e3845e6ed89fba2a7f74a09', 'Function indexes_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'indexes_are'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '66ca8594ced34d7478bc60376f978f8a', 'Function indexes_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'indexes_are'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '26722a0320fb9744f510b55ed0663cdf', 'Function indexes_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'indexes_are'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '965184be1540702d3b086587876f4aa3', 'Function indexes_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'indexes_are'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), 'f13e6941453bcd25230d5205ae8ef2c4', 'Function is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is'
   AND proargtypes::text = '2283 2283';

SELECT is(md5(p.prosrc), 'bf29cf2330f8447822d7db6d4ffb676c', 'Function is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is'
   AND proargtypes::text = '2283 2283 25';

SELECT is(md5(p.prosrc), '80e87604db7a73952ed2befef368a529', 'Function is_aggregate body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_aggregate'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '32a9c864a126c397296c4ef204ed6da7', 'Function is_aggregate body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_aggregate'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), 'f753d9791b945867a842e7e76c620229', 'Function is_aggregate body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_aggregate'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '99d2e4d34b1f92ad1ed8331485d2ff68', 'Function is_aggregate body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_aggregate'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '6f06bf55d254583fb7a096826317384f', 'Function is_aggregate body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_aggregate'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '229839b7ad816a459bb86925c7a3ec11', 'Function is_aggregate body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_aggregate'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '83fc10f9bce91c647544f87891a6ea7e', 'Function is_aggregate body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_aggregate'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), 'bf3a09a76325e2c90d1daa7a89c1e28b', 'Function is_aggregate body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_aggregate'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '7bbfed4347aa4f9bccb5293325688c61', 'Function is_clustered body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_clustered'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '23dc557a86c878d852eaf6c3e6f9fda0', 'Function is_clustered body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_clustered'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), 'e04c10ba02b9886027233ad0fd921754', 'Function is_clustered body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_clustered'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '45c831d56d633a7d37dff1910154d6c5', 'Function is_clustered body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_clustered'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '9616ea33f1a0bad00efa17ea329c4025', 'Function is_definer body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_definer'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '4be1bc26cc03ac5c45fd7f19cbf77cd4', 'Function is_definer body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_definer'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'b21e68128a370aceb27844001515b738', 'Function is_definer body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_definer'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '2bb18531cc1a3f991226c93051316917', 'Function is_definer body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_definer'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), 'c7a48401a2f6403e7d38c3bcf811b744', 'Function is_definer body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_definer'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '96ccd08e1915c31c3307bf0a5b4607de', 'Function is_definer body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_definer'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '6b21952a9d8972b402748fee4e733772', 'Function is_definer body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_definer'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '40e1ff9891a3d03a4d70633ffca77f47', 'Function is_definer body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_definer'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '30462f965a975a4b69e8a1c05459c03a', 'Function is_empty body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_empty'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '33b28a2ef3da234c523e11d0b960cb49', 'Function is_empty body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_empty'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), 'b0c5dae99d5601525988f1670e4c7582', 'Function is_member_of body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_member_of'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'b06a2b316b5e738aab8a4293596d6008', 'Function is_member_of body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_member_of'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '3168900e213108bee2eb1534b4931c1b', 'Function is_member_of body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_member_of'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '9d6396e6e7f4a64d1606a0bdc6856537', 'Function is_member_of body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_member_of'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), 'f26beadb011fdec6c4b4835bfdb54c46', 'Function is_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_strict'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '9e89e7a6ab355490a115fa117b5a26ca', 'Function is_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_strict'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), 'f4f43bde929fb3413dd6a858c043a64c', 'Function is_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_strict'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '26c895366019e892930b7300e1126eb2', 'Function is_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_strict'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '2d08c10f0614cb8632362a70ca671fce', 'Function is_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_strict'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '3e9f4024ee77cfafa0f956d89a9731b2', 'Function is_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_strict'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), 'b01fcf77dfc084b2d7cb201a8bdd95fc', 'Function is_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_strict'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), 'e13e9d8b449fcb0c013d095a7ef28085', 'Function is_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_strict'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '19c5330851106e570f3abe687a91ab40', 'Function is_superuser body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_superuser'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'da5a211e75324fb6900c50360ef8b30f', 'Function is_superuser body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'is_superuser'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '288417eb933d83a844f344784c55a2d6', 'Function isa_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isa_ok'
   AND proargtypes::text = '2283 2206 25';

SELECT is(md5(p.prosrc), '746bd9d4bde739a71a9045b5777e4d80', 'Function isa_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isa_ok'
   AND proargtypes::text = '2283 2206';

SELECT is(md5(p.prosrc), '82016def8237e6640f1af193ee34a61a', 'Function isnt body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isnt'
   AND proargtypes::text = '2283 2283';

SELECT is(md5(p.prosrc), '1c8feb42ab28b983cebfa895c6f478e2', 'Function isnt body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isnt'
   AND proargtypes::text = '2283 2283 25';

SELECT is(md5(p.prosrc), '2fb91e0894873cedc23a1386ef3c6cf1', 'Function isnt_empty body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isnt_empty'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), 'e3901d49589cf5ed4366f4b4f00f2701', 'Function isnt_empty body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isnt_empty'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), 'fdf1c2f0f0498de599bf2d6cd501a75f', 'Function isnt_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isnt_strict'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '4d0fc77369db282dfe1f30ff6a9284c3', 'Function isnt_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isnt_strict'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '0f4796e00894dba656e3c45518a24fbd', 'Function isnt_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isnt_strict'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '9e51a6be2ac9c60c9e0c5d415b586dbb', 'Function isnt_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isnt_strict'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '278ea9a76914d7c76d162f9d6d2021c5', 'Function isnt_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isnt_strict'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'b2489974deb8efa3def64de339552cc4', 'Function isnt_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isnt_strict'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '15c39aeedb467e75a7f6a6b4e233da73', 'Function isnt_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isnt_strict'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '38d5433235c6ff7d88ccf1a3bd645f5f', 'Function isnt_strict body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isnt_strict'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), 'b31291921e3fd90868b0bf2e70fae033', 'Function isnt_superuser body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isnt_superuser'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '5497853d7fe002be5095eace52b40337', 'Function isnt_superuser body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'isnt_superuser'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'a9e79c1761ddc2c5c77b2b359e69d54b', 'Function language_is_trusted body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'language_is_trusted'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), 'e04d73b52f818aaa1f2a6898eacf8078', 'Function language_is_trusted body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'language_is_trusted'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '6d25ef185277536387c0c084741499fa', 'Function language_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'language_owner_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '7cdc81b6ed665ca23c17a7cf3150c4b0', 'Function language_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'language_owner_is'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'b421fea68a846b971c195764fd502d6d', 'Function language_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'language_privs_are'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '83c850bb9babb1b140d6ab34de49e14a', 'Function language_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'language_privs_are'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '54804eb5c99fbc4d39bf5a7b6b1c3a75', 'Function languages_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'languages_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), '582089264a1c31c74aaa8aeefe020d70', 'Function languages_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'languages_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), '198418b78607c5cb0c1b625cfe71977d', 'Function lives_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'lives_ok'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), '53d28d92e2967d56583d775c95baaedc', 'Function lives_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'lives_ok'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '70ec16fb9fd634c84afca0f0b9b4ec10', 'Function matches body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'matches'
   AND proargtypes::text = '2283 25';

SELECT is(md5(p.prosrc), 'aec2799f739723dad4a234061c4014e0', 'Function matches body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'matches'
   AND proargtypes::text = '2283 25 25';

SELECT is(md5(p.prosrc), '6c3bf481d3e8a2a6d908b84e7cc5923e', 'Function materialized_view_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'materialized_view_owner_is'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '62cf5eb6c50f1c18cde872f4c44bef07', 'Function materialized_view_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'materialized_view_owner_is'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '6f19895b22abc9af8a987152e88dbd28', 'Function materialized_view_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'materialized_view_owner_is'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '3d0c55108a6a717b2f205475eccc56b5', 'Function materialized_view_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'materialized_view_owner_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'c78c1844c9ad2c03d070a4f2831d4600', 'Function materialized_views_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'materialized_views_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), '63098f05fd5a4b478deb9eba41f7f9ef', 'Function materialized_views_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'materialized_views_are'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '34a2172e2c23d31b097f147186b77894', 'Function materialized_views_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'materialized_views_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), '4dbef6041a137ee51a8592ed4c472087', 'Function materialized_views_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'materialized_views_are'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '5309ea16d8b6faae7198cc29c716131f', 'Function no_plan body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'no_plan'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), '13b3a5561149ca4249b355c7de831f9b', 'Function num_failed body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'num_failed'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), 'd1aef97196efe087f80c57947fccd303', 'Function ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'ok'
   AND proargtypes::text = '16';

SELECT is(md5(p.prosrc), '22220414d5862b3c018cb1d30f75d550', 'Function ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'ok'
   AND proargtypes::text = '16 25';

SELECT is(md5(p.prosrc), '4c7fc2739554cadfe91ae82cb2ac582a', 'Function opclass_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'opclass_owner_is'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '5b6ebd66527eac2038f02b00e9bbacd3', 'Function opclass_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'opclass_owner_is'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'fe331fa87015b70e748bdc3203529e2b', 'Function opclass_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'opclass_owner_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '1c4fb4b6577b945e53ae2d81d33b6bcf', 'Function opclass_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'opclass_owner_is'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), 'b6ee91e9b154fe533b17ad6452d22d1d', 'Function opclasses_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'opclasses_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), 'cfb8b0e981227567226f201e4009c895', 'Function opclasses_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'opclasses_are'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '9e48a4db80702d70273429e99a9cab9d', 'Function opclasses_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'opclasses_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), '170afce60d9616a99d7f78302029da08', 'Function opclasses_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'opclasses_are'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), 'e79c698c92f9c599883e3c1f80730a16', 'Function operators_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'operators_are'
   AND proargtypes::text = '19 1009';

SELECT is(md5(p.prosrc), 'a504861504be93af7484349cac1e8011', 'Function operators_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'operators_are'
   AND proargtypes::text = '19 1009 25';

SELECT is(md5(p.prosrc), '1fa03e00594c85937222d0ec9541f40a', 'Function operators_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'operators_are'
   AND proargtypes::text = '1009';

SELECT is(md5(p.prosrc), '0870cabd34b649b861fb694457130526', 'Function operators_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'operators_are'
   AND proargtypes::text = '1009 25';

SELECT is(md5(p.prosrc), '01eea730ebe251ff0a9ebe6742cc821d', 'Function os_name body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'os_name'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), 'e3cca7f38cc1a73e4bed00e94d534f7c', 'Function pass body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'pass'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), '72c24d6dc95593c6383fa64c02c17f3b', 'Function pass body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'pass'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), 'dcb7483e7ca72d6a99495362147adbca', 'Function performs_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'performs_ok'
   AND proargtypes::text = '25 1700 25';

SELECT is(md5(p.prosrc), 'edd4be9743d4a2ca326a365857c5e5d5', 'Function performs_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'performs_ok'
   AND proargtypes::text = '25 1700';

SELECT is(md5(p.prosrc), 'ecb893a0e36010ca8c6a6cd182ea16a3', 'Function performs_within body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'performs_within'
   AND proargtypes::text = '25 1700 1700';

SELECT is(md5(p.prosrc), 'c19c5ebd942e35196721d8aecf480a3e', 'Function performs_within body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'performs_within'
   AND proargtypes::text = '25 1700 1700 25';

SELECT is(md5(p.prosrc), '81c768f48c2e2dc322ec0565ac7099ee', 'Function performs_within body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'performs_within'
   AND proargtypes::text = '25 1700 1700 23';

SELECT is(md5(p.prosrc), 'c9eb0aef89c787e03586b79d0eee755a', 'Function performs_within body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'performs_within'
   AND proargtypes::text = '25 1700 1700 23 25';

SELECT is(md5(p.prosrc), '24a6da10328d93949eb9106abffb1b4d', 'Function pg_version body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'pg_version'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), 'ca62fbd68c230708f61ad9d2a4fdfc79', 'Function pg_version_num body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'pg_version_num'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), '41e76e1ca08d6b70963978b60d74b2bc', 'Function pgtap_version body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'pgtap_version'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), '0e46eca9468761604126e354b2a3e27b', 'Function plan body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'plan'
   AND proargtypes::text = '23';

SELECT is(md5(p.prosrc), '5033c3a311349330322321588fe3f368', 'Function relation_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'relation_owner_is'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), 'f99f8aeb9b90893fdceaaef00c5bc822', 'Function relation_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'relation_owner_is'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), 'ea07b6bee85aee91a93c0f588a9767d6', 'Function relation_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'relation_owner_is'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '1f41b7cf7953974de091bf536f2eae49', 'Function relation_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'relation_owner_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '7c5631d1a6bccedf0cf9612821f17c64', 'Function results_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_eq'
   AND proargtypes::text = '25 2277 25';

SELECT is(md5(p.prosrc), '2cd0bd37aaaf5e90a97540cb4d352059', 'Function results_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_eq'
   AND proargtypes::text = '1790 2277';

SELECT is(md5(p.prosrc), '59d1c9501db5e2313ad627732774026c', 'Function results_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_eq'
   AND proargtypes::text = '1790 1790 25';

SELECT is(md5(p.prosrc), '2cd0bd37aaaf5e90a97540cb4d352059', 'Function results_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_eq'
   AND proargtypes::text = '1790 1790';

SELECT is(md5(p.prosrc), '76d4b3e81ce484afefa80e11c7cb6c45', 'Function results_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_eq'
   AND proargtypes::text = '1790 2277 25';

SELECT is(md5(p.prosrc), '2cd0bd37aaaf5e90a97540cb4d352059', 'Function results_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_eq'
   AND proargtypes::text = '1790 25';

SELECT is(md5(p.prosrc), '5f364df3cb44f6aaee9ef715fb30adb4', 'Function results_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_eq'
   AND proargtypes::text = '1790 25 25';

SELECT is(md5(p.prosrc), '2cd0bd37aaaf5e90a97540cb4d352059', 'Function results_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_eq'
   AND proargtypes::text = '25 1790';

SELECT is(md5(p.prosrc), '08c92ea189f827d4c4579fed4b8238ae', 'Function results_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_eq'
   AND proargtypes::text = '25 1790 25';

SELECT is(md5(p.prosrc), '6427d3aad3cde362a89b0e413a148c2f', 'Function results_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_eq'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), '2cd0bd37aaaf5e90a97540cb4d352059', 'Function results_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_eq'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '2cd0bd37aaaf5e90a97540cb4d352059', 'Function results_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_eq'
   AND proargtypes::text = '25 2277';

SELECT is(md5(p.prosrc), '5c3dc8133f80dc3afc669b7b7848ae4a', 'Function results_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_ne'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), 'd2e355423923aa7ec85bf0a89fadcf68', 'Function results_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_ne'
   AND proargtypes::text = '1790 1790';

SELECT is(md5(p.prosrc), 'd2e355423923aa7ec85bf0a89fadcf68', 'Function results_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_ne'
   AND proargtypes::text = '1790 2277';

SELECT is(md5(p.prosrc), '6e162b3fd83ef14c77b9dfc0900571bd', 'Function results_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_ne'
   AND proargtypes::text = '1790 1790 25';

SELECT is(md5(p.prosrc), 'd2e355423923aa7ec85bf0a89fadcf68', 'Function results_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_ne'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '4147fe0b56ad021f0ca514e0c8753082', 'Function results_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_ne'
   AND proargtypes::text = '25 2277 25';

SELECT is(md5(p.prosrc), 'd2e355423923aa7ec85bf0a89fadcf68', 'Function results_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_ne'
   AND proargtypes::text = '25 2277';

SELECT is(md5(p.prosrc), 'e81e2da741b2c13b825fc1bb70ce4516', 'Function results_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_ne'
   AND proargtypes::text = '25 1790 25';

SELECT is(md5(p.prosrc), 'd2e355423923aa7ec85bf0a89fadcf68', 'Function results_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_ne'
   AND proargtypes::text = '25 1790';

SELECT is(md5(p.prosrc), '92ddd79c0c51850b84986d10a486a9d3', 'Function results_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_ne'
   AND proargtypes::text = '1790 25 25';

SELECT is(md5(p.prosrc), 'd2e355423923aa7ec85bf0a89fadcf68', 'Function results_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_ne'
   AND proargtypes::text = '1790 25';

SELECT is(md5(p.prosrc), 'd82f79dd260f04b8967975aab99f7db4', 'Function results_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'results_ne'
   AND proargtypes::text = '1790 2277 25';

SELECT is(md5(p.prosrc), 'd9e54836be299359f1c100e3bef360a6', 'Function roles_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'roles_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), 'a1f5e0dced78afb82eaa11ca97b4c894', 'Function roles_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'roles_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), '6b828ac4032be0e4d38eb074056c5c5e', 'Function row_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'row_eq'
   AND proargtypes::text = '25 2283 25';

SELECT is(md5(p.prosrc), 'f30998437ba412e599aa70410c920f05', 'Function row_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'row_eq'
   AND proargtypes::text = '25 2283';

SELECT is(md5(p.prosrc), '4bfc61453e16440268f1aefe4289724e', 'Function rule_is_instead body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'rule_is_instead'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '5f818d8e79d8edbad2effcd1de5d8274', 'Function rule_is_instead body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'rule_is_instead'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '7dd4312addd33a3fa189fdb369ae8094', 'Function rule_is_instead body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'rule_is_instead'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), 'a64d0c6e662978bb23b561605feccbd8', 'Function rule_is_instead body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'rule_is_instead'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '2f1e8236355177d6a59ec1a665571fb6', 'Function rule_is_on body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'rule_is_on'
   AND proargtypes::text = '19 19 19 25 25';

SELECT is(md5(p.prosrc), 'be0baffa61a37b849e04debc4d7f29ca', 'Function rule_is_on body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'rule_is_on'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), 'ad985e9201860064a7ec0d009fd99958', 'Function rule_is_on body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'rule_is_on'
   AND proargtypes::text = '19 19 25 25';

SELECT is(md5(p.prosrc), '80424cfdf64a7f9027a70fdf0a4df0b8', 'Function rule_is_on body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'rule_is_on'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '2a2ad4aaea1479a7804f29409d89f46e', 'Function rules_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'rules_are'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), 'cdeb7141d64384f8603d310d62c96f63', 'Function rules_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'rules_are'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '0891a6967c894e328f8e61fafe324126', 'Function rules_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'rules_are'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), 'dc629b4fb0a5b705a71bed76021c84a1', 'Function rules_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'rules_are'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '28840309cdcd2dcd8e5ab11473aeed8f', 'Function runtests body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'runtests'
   AND proargtypes::text = '19';

SELECT is(md5(p.prosrc), '12b8e08da43eb65d244d95ce12024d56', 'Function runtests body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'runtests'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), 'bac0b43fff0f7a015fdc3ad9ade94439', 'Function runtests body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'runtests'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), '437f8465cb35cd9d1ea08c06d429f93a', 'Function runtests body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'runtests'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), 'a3ca768c31c134b4b1fe0445a4cae19f', 'Function schema_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'schema_owner_is'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '98825d6b32b89c037012e9b89740a3d8', 'Function schema_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'schema_owner_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'd55db5e9e33995d7654c1e391313af77', 'Function schema_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'schema_privs_are'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '9104e1e040f6de38fac116883ea04e4c', 'Function schema_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'schema_privs_are'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '27489996a28dea0669f1a5579d88fe0a', 'Function schemas_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'schemas_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), '5a51d4133387c3833148d08540e1a2ff', 'Function schemas_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'schemas_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), 'a1ad1506fab8841c0f79d6fcf8defcd4', 'Function sequence_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'sequence_owner_is'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '983f61558936d4f959eef67f49d3d15a', 'Function sequence_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'sequence_owner_is'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '1c0d77b13ec713bda36f536c7ff8033c', 'Function sequence_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'sequence_owner_is'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '8e2f295e613f2205192f1b2fd6f8a803', 'Function sequence_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'sequence_owner_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'f883ad82449c5647771b346e93c370fe', 'Function sequence_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'sequence_privs_are'
   AND proargtypes::text = '19 19 19 1003 25';

SELECT is(md5(p.prosrc), '9d4a7d91decdf2c07e35bb36e18e411f', 'Function sequence_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'sequence_privs_are'
   AND proargtypes::text = '19 19 19 1003';

SELECT is(md5(p.prosrc), '2d59cdc08a708adc52097e8a3bda5673', 'Function sequence_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'sequence_privs_are'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '639d0cab0502a62915f53aa537b862c3', 'Function sequence_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'sequence_privs_are'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), 'deb6b1870642d73183a22f5b48e01d11', 'Function sequences_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'sequences_are'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '9f5503df1de13a891153e60df45ccba0', 'Function sequences_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'sequences_are'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), 'f123a1c70c1ce37e5c85d29b6408d920', 'Function sequences_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'sequences_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), '36f8d1f70e7736ee794d04e5588ab3ef', 'Function sequences_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'sequences_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), '90363af68379754aa491067e033b3d20', 'Function server_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'server_privs_are'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '5962b7695f84a607f447a1d6d1c8e8cc', 'Function server_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'server_privs_are'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '985c9afad0069659f28799e72b178d26', 'Function set_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'set_eq'
   AND proargtypes::text = '25 2277 25';

SELECT is(md5(p.prosrc), '21124691f8af089f79c1a93ded28d90a', 'Function set_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'set_eq'
   AND proargtypes::text = '25 2277';

SELECT is(md5(p.prosrc), '985c9afad0069659f28799e72b178d26', 'Function set_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'set_eq'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), '21124691f8af089f79c1a93ded28d90a', 'Function set_eq body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'set_eq'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '67a8d1ed0a731977cce56e2cafcd7121', 'Function set_has body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'set_has'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '2171e91f12176c043fa8fbf25269c6c2', 'Function set_has body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'set_has'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), '4f902bfd35db15cbd8838e66a0c5d1a0', 'Function set_hasnt body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'set_hasnt'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '4d8f5b234bb10a46dbd77d06329b0f03', 'Function set_hasnt body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'set_hasnt'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), 'edc3af56d7f6e85abc90f09b2fef1097', 'Function set_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'set_ne'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), 'edc3af56d7f6e85abc90f09b2fef1097', 'Function set_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'set_ne'
   AND proargtypes::text = '25 2277 25';

SELECT is(md5(p.prosrc), '007c76a22d736e0bf89353ce0c734e6e', 'Function set_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'set_ne'
   AND proargtypes::text = '25 2277';

SELECT is(md5(p.prosrc), '007c76a22d736e0bf89353ce0c734e6e', 'Function set_ne body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'set_ne'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '9489a04672e455a21f3a1a3524b395e5', 'Function skip body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'skip'
   AND proargtypes::text = '23 25';

SELECT is(md5(p.prosrc), '01ed5f777cb9e2e21e2fd2fd15854afa', 'Function skip body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'skip'
   AND proargtypes::text = '23';

SELECT is(md5(p.prosrc), 'd568d6c5177024c6e9300f7dd8ce7b2b', 'Function skip body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'skip'
   AND proargtypes::text = '25 23';

SELECT is(md5(p.prosrc), '9a1e4ba615a697f863a13fbe87781b5a', 'Function skip body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'skip'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), 'a0a88f19bea06cc137abaa7c41cd07b2', 'Function table_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'table_owner_is'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), 'e9300081b62fe7a76bc1c0f175dc4278', 'Function table_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'table_owner_is'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '29d17342e1a4b200e215845bbd138c87', 'Function table_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'table_owner_is'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), 'a2fa89ebe7f583db46442d02370f868b', 'Function table_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'table_owner_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '034d0391c1a51baac8b38ba41ebc54f4', 'Function table_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'table_privs_are'
   AND proargtypes::text = '19 19 19 1003';

SELECT is(md5(p.prosrc), 'a01418fe4f591b2915c90c4101ecbba7', 'Function table_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'table_privs_are'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), 'e9f9c24498d80957ea0ad14404e9149a', 'Function table_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'table_privs_are'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '35aaeb437001cf4e183c3593e3ebe5e0', 'Function table_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'table_privs_are'
   AND proargtypes::text = '19 19 19 1003 25';

SELECT is(md5(p.prosrc), 'b76a5faec7db7db791734cc4711b61de', 'Function tables_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'tables_are'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '00ffd0f22cdb7d199cd16aa49e056f46', 'Function tables_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'tables_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), 'eadc3cd2e3679a4e5f5f9f480c836295', 'Function tables_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'tables_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), 'd4463c613ac51a971396718747d68afb', 'Function tables_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'tables_are'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '691e3ca59cf78093dbd97b0ed44d33de', 'Function tablespace_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'tablespace_owner_is'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), '253e12afe73c906ce05e9da4ef6a87f8', 'Function tablespace_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'tablespace_owner_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '19c3178dc941868ca96d2b6047d19a5e', 'Function tablespace_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'tablespace_privs_are'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '044b2361b71c18f78e6451537c71dab8', 'Function tablespace_privs_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'tablespace_privs_are'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '9f056afaae12b52854d6e37a6999f09d', 'Function tablespaces_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'tablespaces_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), 'ff5e3e8fc31adab2032372f5a2440dc9', 'Function tablespaces_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'tablespaces_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), '483f1085bdba6ab1c94ff3c8434d55ac', 'Function throws_ilike body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'throws_ilike'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), '5442bdcbcafad5cb2f060d8876419dd5', 'Function throws_ilike body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'throws_ilike'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '03c01ab1984cc84576712ecc5b861e59', 'Function throws_imatching body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'throws_imatching'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), '68dd45e0803d6a03dc681e86a8ab1843', 'Function throws_imatching body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'throws_imatching'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '89f4a660ea05f4a13c1fbbe8ca8f8f1d', 'Function throws_like body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'throws_like'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), 'c22c485a85354c92c81ef1f40adc8c7e', 'Function throws_like body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'throws_like'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), 'd8aa4d3597c916fb8a0069afd6fe8562', 'Function throws_matching body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'throws_matching'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), 'c025716dd16a53281728079eed3a8ec9', 'Function throws_matching body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'throws_matching'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '786970032b30d22b6a23902f156c8103', 'Function throws_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'throws_ok'
   AND proargtypes::text = '25 25';

SELECT is(md5(p.prosrc), '2d48a6e1dc3719ae6d3ad58f641c95d9', 'Function throws_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'throws_ok'
   AND proargtypes::text = '25 1042 25 25';

SELECT is(md5(p.prosrc), '86fda1dd5e03051977188564fc474ec2', 'Function throws_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'throws_ok'
   AND proargtypes::text = '25 23';

SELECT is(md5(p.prosrc), '63ec8993bb60302abe77aeb9f5da53ae', 'Function throws_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'throws_ok'
   AND proargtypes::text = '25 23 25';

SELECT is(md5(p.prosrc), '7c0da2e2c402873611e407eba87c10da', 'Function throws_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'throws_ok'
   AND proargtypes::text = '25 23 25 25';

SELECT is(md5(p.prosrc), 'cfc5b5909ecce9ed384234215d244638', 'Function throws_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'throws_ok'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), '7c7b8a7d7cf3f0961225e00c0a545167', 'Function throws_ok body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'throws_ok'
   AND proargtypes::text = '25 25 25';

SELECT is(md5(p.prosrc), '00e77318c07d488ec18cf172cb324f75', 'Function todo body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'todo'
   AND proargtypes::text = '23';

SELECT is(md5(p.prosrc), '9084389991074213871be1f39cb51977', 'Function todo body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'todo'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), '997309ff2250e5859a1c274d7322a76a', 'Function todo body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'todo'
   AND proargtypes::text = '23 25';

SELECT is(md5(p.prosrc), '997309ff2250e5859a1c274d7322a76a', 'Function todo body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'todo'
   AND proargtypes::text = '25 23';

SELECT is(md5(p.prosrc), '0f0a238beaa4555ac9f1f42c12619cfa', 'Function todo_end body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'todo_end'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), '620458994080596d044b0de8ba2f0f3e', 'Function todo_start body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'todo_start'
   AND proargtypes::text = '25';

SELECT is(md5(p.prosrc), 'ea96780d6c0fb8877e78bb3166bcf681', 'Function todo_start body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'todo_start'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), '1c1fa64fa09c8999296842ccd71d42c2', 'Function trigger_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'trigger_is'
   AND proargtypes::text = '19 19 19 19 19 25';

SELECT is(md5(p.prosrc), 'f51b3ab4f2b6cac5aed7d62584bcc7aa', 'Function trigger_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'trigger_is'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '187d95c0ba360d2041cc7f2ca9cb8280', 'Function trigger_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'trigger_is'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '2a5fa186734a7bc07fdb4b9215656c6f', 'Function trigger_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'trigger_is'
   AND proargtypes::text = '19 19 19 19 19';

SELECT is(md5(p.prosrc), '699fd6bef6f8e7d60e7efb5a3a7af806', 'Function triggers_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'triggers_are'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), 'd11de279018ae4fe118bf689baecec5b', 'Function triggers_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'triggers_are'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '91aa020100bfd44d8bd55ff29b47f08e', 'Function triggers_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'triggers_are'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '4ed59c06c41db59580ceb0254761092f', 'Function triggers_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'triggers_are'
   AND proargtypes::text = '19 19 1003';

SELECT is(md5(p.prosrc), '61623cbd48a0d20995cf40cf8a0183a0', 'Function type_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'type_owner_is'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'c032c3e986aebb8e7a12f382d3a206cd', 'Function type_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'type_owner_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), '5ff47b7c9ecbcf1a19c87cba55728bad', 'Function type_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'type_owner_is'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '232368987104c59472e2a7210e973150', 'Function type_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'type_owner_is'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '7a61f1fd0e1ce0e8e4b619ec87babbdb', 'Function types_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'types_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), 'c70ee61aab047c547d910277760d9836', 'Function types_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'types_are'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), 'e857a9a0ec119118b62ea0665b6feed4', 'Function types_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'types_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), '92bf502fa69e8e79b9f42cd1f894db50', 'Function types_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'types_are'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '9df51d3a1d31ed24b998d0bd55fe24e0', 'Function unalike body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'unalike'
   AND proargtypes::text = '2283 25 25';

SELECT is(md5(p.prosrc), 'f2ffc28aa11868975ede28cc343be60a', 'Function unalike body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'unalike'
   AND proargtypes::text = '2283 25';

SELECT is(md5(p.prosrc), 'dee4a08cf593e0c9b5c807d9f695c0f9', 'Function unialike body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'unialike'
   AND proargtypes::text = '2283 25 25';

SELECT is(md5(p.prosrc), 'd83bedb127fa3cda5bf78d2b31896f8c', 'Function unialike body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'unialike'
   AND proargtypes::text = '2283 25';

SELECT is(md5(p.prosrc), '938b73753c931a5f231cc5d35d723373', 'Function users_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'users_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), '1c742a98263aab04affda26873b4603a', 'Function users_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'users_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), 'b1ba59514e961848425dcb319c20047d', 'Function view_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'view_owner_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'a9dedafc6dfca36ec14186dbc4dd16cb', 'Function view_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'view_owner_is'
   AND proargtypes::text = '19 19';

SELECT is(md5(p.prosrc), 'c541bfe875c5a43e944a31c12488c2b6', 'Function view_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'view_owner_is'
   AND proargtypes::text = '19 19 19';

SELECT is(md5(p.prosrc), '6309ae9c061407fb6c24814622feaedb', 'Function view_owner_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'view_owner_is'
   AND proargtypes::text = '19 19 19 25';

SELECT is(md5(p.prosrc), '3bbbe6e19ccf581b45805b70c06b298c', 'Function views_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'views_are'
   AND proargtypes::text = '1003 25';

SELECT is(md5(p.prosrc), 'd1a64dca3923b85ab4bf2bb06b22fa33', 'Function views_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'views_are'
   AND proargtypes::text = '1003';

SELECT is(md5(p.prosrc), '5188545ee7c22dbf9f39cba9e3395d23', 'Function views_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'views_are'
   AND proargtypes::text = '19 1003';

SELECT is(md5(p.prosrc), '41fff752d45e34c34cea4a20c8886574', 'Function views_are body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'views_are'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '0cbbafbe0f2a5391ad127919fbe06a0d', 'Function volatility_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'volatility_is'
   AND proargtypes::text = '19 19 1003 25';

SELECT is(md5(p.prosrc), '9fb0427611b3e72efa588f6f406c1d8c', 'Function volatility_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'volatility_is'
   AND proargtypes::text = '19 19 1003 25 25';

SELECT is(md5(p.prosrc), '691aa63544983d7937c8613ca4d64fe9', 'Function volatility_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'volatility_is'
   AND proargtypes::text = '19 19 25';

SELECT is(md5(p.prosrc), 'b998a1c2c8da81728ddef3f866d0aa7d', 'Function volatility_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'volatility_is'
   AND proargtypes::text = '19 1003 25';

SELECT is(md5(p.prosrc), '0947c8bad2b689b8eef63e748c5be65b', 'Function volatility_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'volatility_is'
   AND proargtypes::text = '19 1003 25 25';

SELECT is(md5(p.prosrc), '765ad5dad4c43efa949258cd611a9fab', 'Function volatility_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'volatility_is'
   AND proargtypes::text = '19 25 25';

SELECT is(md5(p.prosrc), '31c19342ecb8af3c1454fa8bd0d3763e', 'Function volatility_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'volatility_is'
   AND proargtypes::text = '19 25';

SELECT is(md5(p.prosrc), '2b11a750dd45f5e674ad93f5ae242a49', 'Function volatility_is body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'public'
   AND proname = 'volatility_is'
   AND proargtypes::text = '19 19 25 25';

SELECT extensions_are('public', ARRAY[
    'pgtap'
]);

SELECT tables_are('sample_schema', ARRAY[
    'mv_motor_sensor'
]);

SELECT table_owner_is('sample_schema','mv_motor_sensor','postgres','sample_schema.mv_motor_sensor owner is postgres');
SELECT views_are('sample_schema', ARRAY[
    'mv_motor_sensor_view'
]);

SELECT view_owner_is('sample_schema','mv_motor_sensor_view','postgres', 'sample_schema.mv_motor_sensor_view owner is postgres');
SELECT sequences_are('sample_schema', ARRAY[
    'mv_motor_sensor_sensor_log_id_seq'
]);

SELECT sequence_owner_is('sample_schema','mv_motor_sensor_sensor_log_id_seq','postgres','sample_schema.mv_motor_sensor_sensor_log_id_seq owner is postgres');
SELECT functions_are('sample_schema', ARRAY[
    'create_mytable',
    'mv_motor_sensor'
]);

SELECT is(md5(p.prosrc), '360c6c03341c17c70fcaf80d89bb7491', 'Function create_mytable body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'sample_schema'
   AND proname = 'create_mytable'
   AND proargtypes::text = '';

SELECT is(md5(p.prosrc), '036827850a75cb705f9b0ef1f4902988', 'Function mv_motor_sensor body should match checksum')
  FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON p.pronamespace = n.oid
 WHERE n.nspname = 'sample_schema'
   AND proname = 'mv_motor_sensor'
   AND proargtypes::text = '1043 20';

SELECT * FROM finish();
ROLLBACK;
