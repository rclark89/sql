--Adds column with categories based on size of surface area. 
SELECT name, continent, code, surface_area,
    -- First case
    CASE WHEN surface_area > 2000000 THEN 'large'
        -- Second case
        WHEN surface_area > 350000 THEN 'medium'
        -- Else clause + end
        ELSE 'small' END
        -- Alias name for new column.
        AS geosize_group
-- From table
FROM countries;

--Add column with category based on surface area.
SELECT country_code, size,
  CASE WHEN size > 50000000
            THEN 'large'
       WHEN size > 1000000
            THEN 'medium'
       ELSE 'small' END
       AS popsize_group
--Create new table called pop_plus, filtering only for entries from 2015.
INTO pop_plus       
FROM populations
WHERE year = 2015;

-- Select fields and perform join
SELECT name, continent, geosize_group, popsize_group
FROM countries_plus AS c
  INNER JOIN pop_plus AS p
    ON c.code = p.country_code
-- Order the table by geosize group.  
ORDER BY geosize_group ASC;
