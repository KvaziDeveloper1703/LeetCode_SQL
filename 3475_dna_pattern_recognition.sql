/*
You are given a table Samples with DNA sequences.

For each row, determine whether the DNA sequence:
    - Starts with ATG;
    - Ends with TAA, TAG, or TGA;
    - Contains the motif ATAT;
    - Contains at least three consecutive G.

Return:
    - sample_id, dna_sequence, species;
    - Flags has_start, has_stop, has_atat, has_ggg.

Order the result by sample_id in ascending order.

Дана таблица Samples с ДНК-последовательностями.

Для каждой строки определите, выполняется ли:
    - Последовательность начинается с ATG;
    - Заканчивается на TAA, TAG или TGA;
    - Содержит мотив ATAT;
    - Содержит минимум три подряд идущих G.

Выведите:
    - sample_id, dna_sequence, species;
    - Признаки has_start, has_stop, has_atat, has_ggg.

Отсортируйте результат по sample_id по возрастанию.

Annetaan taulu Samples, jossa on DNA-sekvenssejä.

Määritä jokaiselle riville, toteutuuko seuraavat ehdot:
    - sekvenssi alkaa merkkijonolla ATG;
    - se päättyy merkkijonoon TAA, TAG tai TGA;
    - se sisältää motiivin ATAT;
    - se sisältää vähintään kolme peräkkäistä G-kirjainta.

Tulosta:
    - sample_id, dna_sequence, species;
    - tunnisteet has_start, has_stop, has_atat, has_ggg.

Järjestä tulos nousevasti sarakkeen sample_id mukaan.
*/

SELECT sample_id, dna_sequence, species,
    CASE
        WHEN dna_sequence LIKE 'ATG%' THEN 1
        ELSE 0
    END AS has_start,
    CASE
        WHEN dna_sequence LIKE '%TAA'
          OR dna_sequence LIKE '%TAG'
          OR dna_sequence LIKE '%TGA'
        THEN 1
        ELSE 0
    END AS has_stop,
    CASE
        WHEN dna_sequence LIKE '%ATAT%' THEN 1
        ELSE 0
    END AS has_atat,
    CASE
        WHEN dna_sequence REGEXP 'G{3,}' THEN 1
        ELSE 0
    END AS has_ggg
FROM Samples
ORDER BY sample_id;