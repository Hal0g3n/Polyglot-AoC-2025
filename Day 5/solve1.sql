-- 1. Create a table with a single column to hold the raw text line
CREATE TABLE raw_data (line TEXT);

-- 2. Import the file. Since there is only 1 column, SQLite will
--    dump the entire line ("10 20") into that column.
.import input.txt raw_data

-- 3. Parse the string using string functions and calculate the sum
--    We find the position of the space, split the string, cast to Integer, and add.
WITH
-- A. Extract the a and b values (lines containing a hyphen)
ranges AS (
    SELECT
        CAST(substr(line, 1, instr(line, '-') - 1) AS INTEGER) AS a,
        CAST(substr(line, instr(line, '-') + 1) AS INTEGER) AS b
    FROM raw_data
    WHERE line LIKE '%-%' -- Filter for lines containing the hyphen separator
),
-- B. Extract the x values (lines not containing a hyphen and not empty)
queries AS (
    SELECT
        CAST(line AS INTEGER) AS x
    FROM raw_data
    WHERE line NOT LIKE '%-%' -- Exclude a-b pairs
      AND TRIM(line) <> ''     -- Exclude the blank separator line
)
-- C. Perform the final calculation (Example: Sum of all a's, b's, and x's)
SELECT COUNT(*) FROM queries WHERE (SELECT COUNT(*) FROM ranges WHERE a <= x AND x <= b) > 0;
-- SELECT (SELECT COUNT(*) FROM ranges WHERE a <= x AND x <= b) FROM queries;