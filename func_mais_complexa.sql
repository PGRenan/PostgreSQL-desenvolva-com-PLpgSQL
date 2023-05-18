
CREATE TABLE log_inst (
	id SERIAL PRIMARY KEY,
	informacao varchar (255),
	momento_criação TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION cria_inst(nome_instrutor VARCHAR, salario_instrutor decimal) RETURNS void AS $$
	DECLARE
		id_inst_inserido integer;
		media_salarial DECIMAL;
		inst_recebem_menos integer  default 0;
		total_inst integer default 0;
		salario decimal;
		percentual decimal;
	BEGIN
		INSERT INTO instrutor (nome,salario) VALUES (nome_instrutor,salario_instrutor) RETURNING id INTO id_inst_inserido; 
		
		select avg (instrutor.salario) INTO media_salarial from instrutor WHERE id <> id_inst_inserido;
		IF salario_instrutor> media_salarial then
			INSERT INTO log_inst (informacao) VALUES (nome_instrutor || 'recebe acima da mádia');
		END IF;
		
		for salario in select  instrutor.salario from instrutor WHERE id <> id_inst_inserido loop
			total_inst := total_inst + 1;
			if salario_instrutor > salario then
				inst_recebem_menos := inst_recebem_menos + 1;
			end if;
		end loop;
		
		percentual = inst_recebem_menos::decimal/total_inst::decimal*100;
		
		insert into log_inst (informacao)
			values (nome_instrutor || ' recebe mais que ' || percentual || '% da grade de instrutores');
	END;
$$ LANGUAGE plpgsql;



select * from instrutor;
select cria_inst('Abc def',1000);

select * from log_inst;




