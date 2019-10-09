CREATE OR REPLACE FUNCTION create_mytable ()
RETURNS void AS
$func$
BEGIN
IF EXISTS (SELECT * FROM pg_catalog.pg_tables 
WHERE schemaname = 'sample_ctx'
AND tablename = 'mv_motor_company') THEN
RAISE NOTICE 'Table sample_ctx.mv_motor_company already exists.';
ELSE
CREATE TABLE sample_ctx.mv_motor_company (
userid_test integer PRIMARY KEY,
company varchar NULL,
subcoy int2 NULL,
state bpchar(2) NULL,
price numeric CHECK (price > 0),
product_no integer REFERENCES sample_ctx.mv_motor_company_pk (userid_test)
);
END IF;
END
$func$ LANGUAGE plpgsql;
SELECT create_mytable();
