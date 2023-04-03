-- CONCEITO
-- View é o conceito de nomear consultas - que são tabelas virtuais
-- Isso torna mais simples a criação de relatórios (maior legibilidade)
-- Possibilita que seja mais seguro o compartilhamento dessas tabelas com terceiros
-- Porém, essas consultas podem ser menos "otimizadas"

-- A sintaxe para criar uma view é a seguinte:
CREATE VIEW vw_cursos_por_categoria AS SELECT categoria.nome AS categoria,
                    COUNT(curso.id) AS numero_cursos
                FROM categoria
                JOIN curso ON curso.categoria_id = categoria.id
            GROUP BY categoria

-- Então é possível chamar a view pelo alias como se fosse uma tabela
SELECT * FROM vw_cursos_por_categoria