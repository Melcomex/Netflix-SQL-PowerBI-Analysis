# Netflix Content Analysis Dashboard

## Project Overview
This project analyzes a sample Netflix dataset using MySQL and Power BI to uncover insights about content distribution, ratings, countries of origin, directors, and release trends. The project follows the complete data analysis workflow, from data loading and exploration to dashboard creation and visualization.

---

## Objectives
The main objectives of this project were:
- Load and manage data using MySQL.
- Perform data exploration using SQL queries.
- Identify patterns and trends in Netflix content.
- Clean and validate the dataset.
- Create an interactive Power BI dashboard.
- Communicate insights through visualizations.

---

## Tools Used
- MySQL Server
- MySQL Workbench
- Power BI Desktop
- Microsoft Excel
- SQL

---

## Dataset Information
The dataset contains information about Netflix titles, including:

| Column | Description |
|---|---|
| Show ID | Unique identifier for each title |
| Type | Movie or TV Show |
| Title | Name of the content |
| Director | Director of the title |
| Cast Members | Actors featured |
| Country | Country of origin |
| Date Added | Date added to Netflix |
| Release Year | Year of release |
| Rating | Content rating (e.g. TV-MA, PG-13) |
| Duration | Length of content |
| Genre | Content category |
| Description | Brief summary |

**Total Records:** 100

---

## Data Analysis Process

### 1. Data Collection
A Netflix dataset in CSV format was obtained and prepared for analysis.

### 2. Data Loading
The dataset was imported into MySQL and stored in a relational table using the Table Data Import Wizard in MySQL Workbench.

### 3. Data Exploration
SQL queries were used to answer business questions such as:
- How many Movies and TV Shows are available?
- Which countries contribute the most content?
- Which directors have the most titles?
- What is the most common content rating?
- How has content changed over time?

### 4. Data Cleaning
Data quality checks were performed to identify missing values and inconsistencies.

**Findings:**

| Field | Missing Values |
|---|---|
| Country | 41 |
| Director | 39 |
| Rating | 0 |
| Duplicate Show IDs | None found |

**Cleaning Strategy:**
Missing values were retained and flagged as `Unknown` using the *Flag as Missing* strategy to avoid losing 41% of the dataset. This approach preserves data integrity while clearly marking incomplete records.

```sql
SET SQL_SAFE_UPDATES = 0;
UPDATE netflix_titles SET country = 'Unknown' WHERE country = '';
UPDATE netflix_titles SET director = 'Unknown' WHERE director = '';
SET SQL_SAFE_UPDATES = 1;
```

### 5. Data Analysis
The following SQL queries were used for analysis:

**Content Type Split:**
```sql
SELECT type, COUNT(*) AS total
FROM netflix_titles
GROUP BY type;
```

**Top 10 Countries:**
```sql
SELECT country, COUNT(*) AS total
FROM netflix_titles
WHERE country != 'Unknown'
GROUP BY country
ORDER BY total DESC
LIMIT 10;
```

**Top 10 Directors:**
```sql
SELECT director, COUNT(*) AS total
FROM netflix_titles
WHERE director != 'Unknown'
GROUP BY director
ORDER BY total DESC
LIMIT 10;
```

**Rating Distribution:**
```sql
SELECT rating, COUNT(*) AS total
FROM netflix_titles
GROUP BY rating
ORDER BY total DESC;
```

**Content by Release Year:**
```sql
SELECT release_year, COUNT(*) AS total
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year DESC;
```

### 6. Data Visualization
Power BI was used to create an interactive dashboard displaying:
- Total Titles
- Unique Countries
- Top Rating
- Movies vs TV Shows Distribution
- Top 10 Countries
- Top 10 Directors
- Rating Distribution
- Content by Release Year
- Geographic Distribution Map

---

## Key Insights
- Movies account for **55%** of the dataset while TV Shows account for **45%**.
- **TV-MA** is the most common content rating, representing 32% of all titles.
- **Japan** has the highest number of titles after the United States with 13 titles.
- **The United States** leads overall with 17 titles.
- Most content was released in recent years, with **2021 showing the highest activity** (53 titles).
- Content production is concentrated among a small number of countries.
- Japanese directors dominate the top spots, consistent with Japan's strong content representation.

---

## Dashboard Preview
> *The dashboard provides a visual summary of Netflix content trends, ratings, country distribution, and release patterns.*

![Netflix Dashboard](<img width="1382" height="983" alt="image" src="https://github.com/user-attachments/assets/7d3b4741-e8cf-4d07-a47c-43b32b8cfc58" />
)

---

## Skills Demonstrated
- SQL Querying
- Data Cleaning
- Data Exploration
- Data Analysis
- Data Visualization
- Dashboard Design
- Business Insight Generation
- MySQL Database Management
- Power BI Reporting

---

## Conclusion
This project demonstrates an end-to-end data analytics workflow using MySQL and Power BI. Through data exploration, cleaning, and visualization, meaningful insights were extracted from Netflix content data and presented through an interactive dashboard.

---

## Author
**Welcome Khayeni Molefe**  
📁 GitHub: [github.com/Melcomex](https://github.com/Melcomex)  
🌐 Portfolio: [portfolio-ashen-five-83.vercel.app](https://portfolio-ashen-five-83.vercel.app)
