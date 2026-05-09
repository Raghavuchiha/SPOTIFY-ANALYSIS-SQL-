# 🎵 Spotify Data Analysis using SQL (PostgreSQL)

![Banner](spotify_banner.png)

![SQL](https://img.shields.io/badge/SQL-PostgreSQL-blue) ![Level](https://img.shields.io/badge/Level-Advanced-red) ![Status](https://img.shields.io/badge/Status-Completed-green)

## 📌 Project Overview

This project performs end-to-end data analysis on a Spotify dataset using **PostgreSQL**. It covers database setup, exploratory data analysis (EDA), and solving 13 real-world business problems using SQL — ranging from basic queries to advanced window functions and CTEs.

---

## 🗃️ Dataset

The dataset contains information about Spotify tracks including:

| Column | Description |
|---|---|
| `artist` | Name of the artist |
| `track` | Name of the track |
| `album` | Album name |
| `album_type` | Type of album (single/album) |
| `danceability` | How suitable a track is for dancing (0.0 - 1.0) |
| `energy` | Intensity and activity of the track (0.0 - 1.0) |
| `loudness` | Overall loudness in decibels |
| `speechiness` | Presence of spoken words in the track |
| `acousticness` | Confidence of the track being acoustic |
| `instrumentalness` | Predicts whether a track has no vocals |
| `liveness` | Presence of an audience in the recording |
| `valence` | Musical positiveness conveyed by a track |
| `tempo` | Estimated tempo in beats per minute |
| `duration_min` | Duration of track in minutes |
| `views` | Number of YouTube views |
| `likes` | Number of YouTube likes |
| `comments` | Number of YouTube comments |
| `licensed` | Whether the track is licensed |
| `official_video` | Whether it has an official video |
| `stream` | Number of Spotify streams |
| `most_played_on` | Platform where most played (Spotify/YouTube) |

---

## 🛠️ Tools Used

- **PostgreSQL 18** — Database
- **pgAdmin 4** — Query Tool & Database Management

---

## 📁 Project Structure

```
Spotify-SQL-Analysis/
├── analysis.sql    ← All queries (EDA + Analytics)
├── cleaned_dataset.csv   
└── README.md
```

---

## 🔍 Exploratory Data Analysis (EDA)

Before diving into analytics, the following EDA was performed:

- Total number of tracks in the dataset
- Count of distinct artists
- Distinct album types available
- Max and Min track duration
- Removed records where `duration_min = 0` (invalid data)
- Distinct YouTube channels and streaming platforms

---

## 📊 Business Problems Solved

### 🟢 Beginner Level

| # | Question | Concepts Used |
|---|---|---|
| Q1 | Tracks with more than 1 billion streams | `WHERE`, `>`  |
| Q2 | All albums with their respective artists | `DISTINCT`, `SELECT` |
| Q3 | Total comments for licensed tracks | `SUM`, `WHERE` |
| Q4 | Tracks belonging to album type 'single' | `WHERE`, filter |
| Q5 | Total number of tracks by each artist | `COUNT`, `GROUP BY` |

### 🟡 Intermediate Level

| # | Question | Concepts Used |
|---|---|---|
| Q6 | Average danceability per album | `AVG`, `GROUP BY` |
| Q7 | Top 5 tracks with highest energy | `ORDER BY DESC`, `LIMIT` |
| Q8 | Tracks with views and likes where official_video = TRUE | `WHERE`, Boolean filter |
| Q9 | Total views per album | `SUM`, `GROUP BY` |

### 🔴 Advanced Level

| # | Question | Concepts Used |
|---|---|---|
| Q10 | Tracks streamed more on Spotify than YouTube | `HAVING`, `CASE WHEN`, `GROUP BY` |
| Q11 | Top 3 most-viewed tracks for each artist | `DENSE_RANK()`, `PARTITION BY`, Window Functions, CTE |
| Q12 | Tracks with liveness above average | Subquery inside `WHERE` |
| Q13 | Difference between highest and lowest energy per album | CTE, `MAX`, `MIN` |

---

## 💡 Key SQL Concepts Covered

- `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, `LIMIT`
- Aggregate functions: `SUM`, `AVG`, `COUNT`, `MAX`, `MIN`
- `DISTINCT`, `HAVING`, Boolean filters
- `CASE WHEN` statements
- Subqueries
- Common Table Expressions (CTEs) — `WITH` clause
- Window Functions — `DENSE_RANK()`, `PARTITION BY`
- Data Cleaning — `DELETE` invalid records

---

## 🚀 How to Run This Project

1. Install **PostgreSQL** and **pgAdmin 4**
2. Create a database called `Spotify_db`
3. Run the `CREATE TABLE` statement from `spotify_analysis.sql`
4. Import `cleaned_dataset.csv` using pgAdmin's Import/Export feature
5. Run the queries one by one in pgAdmin Query Tool

---

## 📈 Sample Insights

- Tracks with over **1 billion streams** are identified using simple filtering
- **DENSE_RANK()** window function is used to find the top 3 most viewed tracks per artist without skipping ranks
- **CASE WHEN** inside **HAVING** clause is used to compare streaming performance across platforms (Spotify vs YouTube)
- CTE is used to calculate energy range per album efficiently


