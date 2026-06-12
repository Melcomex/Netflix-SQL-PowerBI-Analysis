-- ============================================================
-- NETFLIX CONTENT ANALYSIS
-- Tool: MySQL Workbench
-- Author: Welcome Khayeni Molefe
-- GitHub: github.com/Melcomex
-- ============================================================


-- ============================================================
-- STAGE 1: DATABASE SETUP
-- ============================================================

-- Create the database
CREATE DATABASE IF NOT EXISTS netflix_db;
USE netflix_db;

-- The netflix_titles table was created automatically
-- via the Table Data Import Wizard in MySQL Workbench
-- using the file: netflix_titles_cleaned.csv


-- ============================================================
-- STAGE 2: DATA EXPLORATION
-- ============================================================

-- View all records
SELECT * FROM netflix_titles;

-- Count total records
SELECT COUNT(*) AS total_records
FROM netflix_titles;

-- View all column names and data types
DESCRIBE netflix_titles;


-- ============================================================
-- STAGE 3: DATA QUALITY CHECKS
-- ============================================================

-- Check for missing values (blank strings) across all key columns
SELECT
  SUM(CASE WHEN country = '' THEN 1 ELSE 0 END) AS missing_country,
  SUM(CASE WHEN director = '' THEN 1 ELSE 0 END) AS missing_director,
  SUM(CASE WHEN rating = '' THEN 1 ELSE 0 END) AS missing_rating,
  SUM(CASE WHEN type = '' THEN 1 ELSE 0 END) AS missing_type,
  SUM(CASE WHEN title = '' THEN 1 ELSE 0 END) AS missing_title
FROM netflix_titles;

-- Check for true NULL values
SELECT
  SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS null_country,
  SUM(CASE WHEN director IS NULL THEN 1 ELSE 0 END) AS null_director,
  SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS null_rating
FROM netflix_titles;

-- Check for duplicate show IDs
SELECT show_id, COUNT(*) AS count
FROM netflix_titles
GROUP BY show_id
HAVING COUNT(*) > 1;


-- ============================================================
-- STAGE 4: DATA CLEANING
-- ============================================================

-- Disable safe update mode temporarily
SET SQL_SAFE_UPDATES = 0;

-- Replace blank country values with 'Unknown'
UPDATE netflix_titles
SET country = 'Unknown'
WHERE country = '';

-- Replace blank director values with 'Unknown'
UPDATE netflix_titles
SET director = 'Unknown'
WHERE director = '';

-- Re-enable safe update mode
SET SQL_SAFE_UPDATES = 1;

-- Verify cleaning was successful (all should return 0)
SELECT
  SUM(CASE WHEN country = '' THEN 1 ELSE 0 END) AS missing_country,
  SUM(CASE WHEN director = '' THEN 1 ELSE 0 END) AS missing_director,
  SUM(CASE WHEN rating = '' THEN 1 ELSE 0 END) AS missing_rating,
  SUM(CASE WHEN type = '' THEN 1 ELSE 0 END) AS missing_type,
  SUM(CASE WHEN title = '' THEN 1 ELSE 0 END) AS missing_title
FROM netflix_titles;


-- ============================================================
-- STAGE 5: DATA ANALYSIS
-- ============================================================

-- ------------------------------------------------------------
-- Query 1: Content Type Distribution (Movies vs TV Shows)
-- ------------------------------------------------------------
SELECT type, COUNT(*) AS total
FROM netflix_titles
GROUP BY type;

-- ------------------------------------------------------------
-- Query 2: Top 10 Countries by Content
-- ------------------------------------------------------------
SELECT country, COUNT(*) AS total
FROM netflix_titles
WHERE country != 'Unknown'
GROUP BY country
ORDER BY total DESC
LIMIT 10;

-- ------------------------------------------------------------
-- Query 3: Top 10 Directors by Title Count
-- ------------------------------------------------------------
SELECT director, COUNT(*) AS total
FROM netflix_titles
WHERE director != 'Unknown'
GROUP BY director
ORDER BY total DESC
LIMIT 10;

-- ------------------------------------------------------------
-- Query 4: Rating Distribution
-- ------------------------------------------------------------
SELECT rating, COUNT(*) AS total
FROM netflix_titles
GROUP BY rating
ORDER BY total DESC;

-- ------------------------------------------------------------
-- Query 5: Content by Release Year
-- ------------------------------------------------------------
SELECT release_year, COUNT(*) AS total
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year DESC;

-- ------------------------------------------------------------
-- Query 6: Count of Unique Countries
-- ------------------------------------------------------------
SELECT COUNT(DISTINCT country) AS unique_countries
FROM netflix_titles
WHERE country != 'Unknown';

-- ------------------------------------------------------------
-- Query 7: Most Common Rating
-- ------------------------------------------------------------
SELECT rating, COUNT(*) AS total
FROM netflix_titles
GROUP BY rating
ORDER BY total DESC
LIMIT 1;

-- ============================================================
-- END OF ANALYSIS
-- ============================================================