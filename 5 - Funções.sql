-- FUNÇÕES DE STRING

-- Concatenação: é representada por duas barras verticais
SELECT (primeiro_nome||' '||ultimo_nome) AS nome_completo FROM aluno;

-- Porém, se um dos valores concatenados for NULL, será retornado apenas NULL.
-- Para contornar isso, basta utilizar a função CONCAT
SELECT (CONCAT(primeiro_nome,' ',ultimo_nome)) AS nome_completo FROM aluno;

-- Outras funções interessantes são:
-- UPPER: deixa toda a string em letras maiúsculas
-- LOWER: deixa toda a string em letras minúsculas
-- TRIM: remove espaços no início e no fim da string

-- FUNÇÕES DE DATA

SELECT (CONCAT(primeiro_nome,' ',ultimo_nome)) AS nome_completo,
    (NOW()::DATE - data_nascimento)/365, -- A função NOW retorna a data atual em timestamp. Para converter basta utilizar "::"
    -- É possível subtrair data, onde o resultado é retornado em dias. Dividindo por 365 obtemos em anos.
    FROM aluno;

-- Outra possibilidade para se obter a idade é utilizando a função AGE():
SELECT (CONCAT(primeiro_nome,' ',ultimo_nome)) AS nome_completo,
    EXTRACT(YEAR FROM AGE(data_nascimento)) AS idade-- Através da função EXTRACT é possível extrair partes da data
    FROM aluno;

-- CONVERSÃO DE DADOS

-- A função TO_CHAR converte os dados passados para string, levando em consideração
-- o formato fornecido:
SELECT TO_CHAR(NOW(),'DD')
SELECT TO_CHAR(NOW(),'DD/MM')
SELECT TO_CHAR(NOW(),'DD/MM/YYYY')
SELECT TO_CHAR(NOW(),'DD, MONTH, YYYY')
SELECT TO_CHAR(NOW(),'DD, Month, YYYY')

-- Na documentação do postgres é possível verificar todos os tipos de formatação existentes