/*
You are given table Logs:
    - log_id
    - ip
    - status_code

Find invalid IPv4 addresses and count how many times each invalid ip appears.

An IPv4 is invalid if:
    - it does not have exactly 4 octets, or
    - any octet is greater than 255, or
    - any octet has leading zeros.

Return ip, invalid_count, ordered by:
    - invalid_count DESC
    - ip DESC

Дана таблица Logs:
    - log_id
    - ip
    - status_code

Найди некорректные IPv4-адреса и посчитай, сколько раз каждый такой ip встречается.

IPv4 некорректный, если:
    - содержит не ровно 4 октета, или
    - в любом октете число больше 255, или
    - в любом октете есть ведущие нули.

Верни ip, invalid_count, отсортируй по:
    - invalid_count по убыванию
    - ip по убыванию

Annettu taulukko Logs:
    - log_id
    - ip
    - status_code

Etsi virheelliset IPv4-osoitteet ja laske, kuinka monta kertaa kukin tällainen ip esiintyy.

IPv4-osoite on virheellinen, jos:
    - siinä ei ole täsmälleen 4 okteettia, tai;
    - missä tahansa okteetissa luku on suurempi kuin 255, tai;
    - missä tahansa okteetissa on etunollia.

Palauta ip, invalid_count, ja lajittele tulos:
    - invalid_count laskevaan järjestykseen
    - ip laskevaan järjestykseen
*/

SELECT ip, COUNT(*) AS invalid_count
FROM logs
WHERE
    (LENGTH(ip) - LENGTH(REPLACE(ip, '.', ''))) != 3
    OR ip REGEXP '[^0-9.]'
    OR ip REGEXP '(^|\\.)0[0-9]+'
    OR (
        CAST(SUBSTRING_INDEX(ip, '.', 1) AS UNSIGNED) > 255
        OR CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) AS UNSIGNED) > 255
        OR CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1) AS UNSIGNED) > 255
        OR CAST(SUBSTRING_INDEX(ip, '.', -1) AS UNSIGNED) > 255
    )
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;