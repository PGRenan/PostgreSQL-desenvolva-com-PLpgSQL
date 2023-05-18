CREATE OR REPLACE FUNCTION primeira_pl() returns integer as $$
	DECLARE
		primeira_variavel integer DEFAULT 3;
	BEGIN
		primeira_variavel := primeira_variavel * 2;
		return primeira_variavel;
	END
$$ language plpgsql;

select primeira_pl();



