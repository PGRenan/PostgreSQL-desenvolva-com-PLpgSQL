CREATE FUNCTION cria_curso (nome_curso VARCHAR, nome_categoria VARCHAR) RETURNS void AS $$
	DECLARE
		id_categoria INTEGER;
	BEGIN
		SELECT id INTO id_categoria FROM categoria WHERE nome = nome_categoria;
		
		IF NOT found THEN
			INSERT INTO categoria (nome) VALUES (nome_categoria) RETURNING id INTO id_categoria;
		END IF;	
		
		INSERT INTO curso (nome, categoria_id) VALUES (nome_curso, id_categoria);
	END;
$$ LANGUAGE plpgsql;

select cria_curso('PHP', 'Programação');
select cria_curso('Java', 'Programação');

select *  from curso;
select *  from categoria;



