WITH RECURSIVE coworker(id1, id2) AS (
    SELECT c1.person_id, c2.person_id
    FROM crew c1 JOIN crew c2 ON c1.title_id = c2.title_id
),
    bacon(person_id, n) AS(
        VALUES(102,0)
        UNION
        SELECT coworker.id2, n+1
        FROM bacon JOIN coworker ON bacon.person_id = coworker.id1
        WHERE n < 5
)
SELECT bacon.person_id, name, MIN(n) as n
FROM bacon JOIN people on bacon.person_id = people.person_id
GROUP BY bacon.person_id, name
HAVING n<=4
ORDER BY n, name DESC;
