# SPOTIFY-ANALYSIS-SQL-
📌 Project Overview
This project performs end-to-end data analysis on a Spotify dataset using PostgreSQL. It covers database setup, exploratory data analysis (EDA), and solving 13 real-world business problems using SQL — ranging from basic queries to advanced window functions and CTEs.

🗃️ Dataset
The dataset contains information about Spotify tracks including:
ColumnDescriptionartistName of the artisttrackName of the trackalbumAlbum namealbum_typeType of album (single/album)danceabilityHow suitable a track is for dancing (0.0 - 1.0)energyIntensity and activity of the track (0.0 - 1.0)loudnessOverall loudness in decibelsspeechinessPresence of spoken words in the trackacousticnessConfidence of the track being acousticinstrumentalnessPredicts whether a track has no vocalslivenessPresence of an audience in the recordingvalenceMusical positiveness conveyed by a tracktempoEstimated tempo in beats per minuteduration_minDuration of track in minutesviewsNumber of YouTube viewslikesNumber of YouTube likescommentsNumber of YouTube commentslicensedWhether the track is licensedofficial_videoWhether it has an official videostreamNumber of Spotify streamsmost_played_onPlatform where most played (Spotify/YouTube)

🛠️ Tools Used

PostgreSQL 18 — Database
pgAdmin 4 — Query Tool & Database Management


📁 Project Structure
Spotify-SQL-Analysis/
├── spotify_analysis.sql    ← All queries (EDA + Analytics)
├── dataset/
│   └── cleaned_dataset.csv ← Raw dataset
└── README.md

🔍 Exploratory Data Analysis (EDA)
Before diving into analytics, the following EDA was performed:

Total number of tracks in the dataset
Count of distinct artists
Distinct album types available
Max and Min track duration
Removed records where duration_min = 0 (invalid data)
Distinct YouTube channels and streaming platforms


📊 Business Problems Solved
🟢 Beginner Level
#QuestionConcepts UsedQ1Tracks with more than 1 billion streamsWHERE, >Q2All albums with their respective artistsDISTINCT, SELECTQ3Total comments for licensed tracksSUM, WHEREQ4Tracks belonging to album type 'single'WHERE, filterQ5Total number of tracks by each artistCOUNT, GROUP BY
🟡 Intermediate Level
#QuestionConcepts UsedQ6Average danceability per albumAVG, GROUP BYQ7Top 5 tracks with highest energyORDER BY DESC, LIMITQ8Tracks with views and likes where official_video = TRUEWHERE, Boolean filterQ9Total views per albumSUM, GROUP BY
🔴 Advanced Level
#QuestionConcepts UsedQ10Tracks streamed more on Spotify than YouTubeHAVING, CASE WHEN, GROUP BYQ11Top 3 most-viewed tracks for each artistDENSE_RANK(), PARTITION BY, Window Functions, CTEQ12Tracks with liveness above averageSubquery inside WHEREQ13Difference between highest and lowest energy per albumCTE, MAX, MIN

💡 Key SQL Concepts Covered

SELECT, WHERE, GROUP BY, ORDER BY, LIMIT
Aggregate functions: SUM, AVG, COUNT, MAX, MIN
DISTINCT, HAVING, Boolean filters
CASE WHEN statements
Subqueries
Common Table Expressions (CTEs) — WITH clause
Window Functions — DENSE_RANK(), PARTITION BY
Data Cleaning — DELETE invalid records


🚀 How to Run This Project

Install PostgreSQL and pgAdmin 4
Create a database called Spotify_db
Run the CREATE TABLE statement from spotify_analysis.sql
Import cleaned_dataset.csv using pgAdmin's Import/Export feature
Run the queries one by one in pgAdmin Query Tool


📈 Sample Insights

Tracks with over 1 billion streams are identified using simple filtering
DENSE_RANK() window function is used to find the top 3 most viewed tracks per artist without skipping ranks
CASE WHEN inside HAVING clause is used to compare streaming performance across platforms (Spotify vs YouTube)
CTE is used to calculate energy range per album efficiently
