/*
You are given table Tree where:
    - id is the node ID
    - p_id is the parent ID

For each node, return its type:
    - Root: p_id IS NULL;
    - Leaf: node has no children;
    - Inner: node has a parent and has at least one child.

Return columns id, type.

Дана таблица Tree где:
    - id это идентификатор узла
    - p_id это идентификатор родителя

Для каждого узла выведи его тип:
    - Root: p_id IS NULL;
    - Leaf: у узла нет детей;
    - Inner: узел не корень и имеет хотя бы одного ребёнка.

Верни столбцы id, type.

Annettu taulukko Tree, jossa:
    - id on solmun tunniste
    - p_id on vanhemman solmun tunniste

Tulosta jokaiselle solmulle sen tyyppi:
    - Root: p_id IS NULL;
    - Leaf: solmulla ei ole lapsia;
    - Inner: solmu ei ole juuri ja sillä on vähintään yksi lapsi.

Palauta sarakkeet id, type.
*/

SELECT
    id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Inner'
        ELSE 'Leaf'
    END AS type
FROM Tree;