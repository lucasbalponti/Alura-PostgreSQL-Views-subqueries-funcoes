-- CLÁUSULA IN
-- Através da cláusula IN é possível passar uma lista de valores para a query
SELECT * FROM curso WHERE categoria_id IN (1,2);

-- QUERIES ANINHADAS
-- Criando uma query onde são selecionados os ids de cursos que não possuem espaço
SELECT id FROM categoria WHERE nome NOT LIKE '% %';

-- É possível utilizar o resultado dessa query dentro de outra query:
SELECT * FROM curso WHERE categoria_id IN (
    SELECT id FROM categoria WHERE nome NOT LIKE '% %'
);

-- PERSONALIZANDO TABELAS

-- Ao realizar a query abaixo temos o número de cursos por categoria:
SELECT categoria.nome AS categoria,
        COUNT(curso.id) AS numero_cursos
    FROM categoria
    JOIN curso ON curso.categoria_id = categoria.id
GROUP BY categoria;

-- É possível inserir essa query dentro da cláusula FROM em outra query:
SELECT categoria
    FROM(
            SELECT categoria.nome AS categoria,
                    COUNT(curso.id) AS numero_cursos
                FROM categoria
                JOIN curso ON curso.categoria_id = categoria.id
            GROUP BY categoria
    ) AS categoria_cursos -- É possível adicionar um alias para a query adicionada na cláusula FROM
    WHERE numero_cursos > 3;

-- Porém, na maioria das vezes é possível chegar ao mesmo resultado de maneiras mais simples:
SELECT categoria.nome AS categoria
    FROM categoria
    JOIN curso ON curso.categoria_id = categoria.id
GROUP BY categoria
HAVING COUNT(curso.id) > 3