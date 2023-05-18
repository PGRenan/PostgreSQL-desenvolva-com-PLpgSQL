drop table instrutor;
CREATE TABLE instrutor(
id SERIAL PRIMARY KEY,
nome VARCHAR (255) NOT NULL,
salario DECIMAL (10, 2)
);


INSERT INTO instrutor (nome, salario) VALUES ('Vinicius Dias', 100);
INSERT INTO instrutor (nome, salario) VALUES ('Pedro Pedro', 200);
INSERT INTO instrutor (nome, salario) VALUES ('Harry Potter', 300);
INSERT INTO instrutor (nome, salario) VALUES ('Rony Wesley', 400);
INSERT INTO instrutor (nome, salario) VALUES ('Doby Elfo', 500);


CREATE FUNCTION dobro_do_salario(instrutor) returns decimal as $$
	select $1.salario * 2 as dobro
$$ language SQL;

select nome,dobro_do_salario(instrutor) from instrutor;

CREATE or replace FUNCTION cria_intrutor_falso() returns instrutor as $$
    select 22, 'Nome Falso' , 200::decimal ;
$$ language SQL; 

select * from cria_intrutor_falso();

drop function instrutores_bem_pagos;
CREATE or replace FUNCTION instrutores_bem_pagos (valor_salario decimal) returns setof instrutor as $$
    SELECT * FROM instrutor WHERE salario > valor_salario;
$$ language SQL;  

select * from instrutores_bem_pagos(300);

