
CREATE FUNCTION primeira_funcao() returns integer as '
select (5 - 3) * 2
' language SQL;

select primeira_funcao();
select primeira_funcao() as numero;

drop function soma_dois_numeros

CREATE FUNCTION soma_dois_numeros( integer,  integer) RETURNS INTEGER AS '
SELECT $1 + $2
' LANGUAGE SQL;

SELECT soma_dois_numeros(3, 12);


create table a (nome varchar(255) not null);

DROP FUNCTION cria_a;
create or replace function cria_a(nome varchar) returns void As $$
	insert into a (nome) values ('Patricia');
$$ language SQL; 

select cria_a('Vinicius Dias');
