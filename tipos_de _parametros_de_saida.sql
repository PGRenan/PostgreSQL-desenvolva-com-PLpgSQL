CREATE TYPE dois_valores AS (soma INTEGER, produto INTEGER);

CREATE FUNCTION soma_e_produto (numero_1 INTEGER, numero_2 INTEGER) returns dois_valores as $$
   SELECT numero_1 + numero_2 AS soma, numero_1 * numero_2 AS produto;
$$ language SQL;

select * from soma_e_produto(3,3);


CREATE TYPE dois_valores AS (soma INTEGER, produto INTEGER);

DROP FUNCTION soma_e_produto;


