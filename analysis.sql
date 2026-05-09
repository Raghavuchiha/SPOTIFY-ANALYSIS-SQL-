SHOW databases;

-- create table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);

SELECT * FROM spotify LIMIT 5;

--EDA

SElECT count(*) from spotify;

select count(distinct artist ) from spotify;

select distinct album_type FROM spotify;


SELECT duration_min FROM spotify;

SELECT MAX(duration_min) AS max_due_time FROM spotify;

SELECT MIN(duration_min) AS min_due_time FROM spotify;

DELETE 
FROM spotify 
where duration_min = 0;

SELECT * 
FROM spotify
where duration_min = 0;

SELECT DISTINCT channel FROM spotify;


SELECT DISTINCT most_played_on FROM spotify;


---------------------------
----- DATA ANALYSTICS------
-----------JOB-------------

-- Q1. Retrieve the names of all tracks that have more than 1 billion streams.
SELECT track ,stream
FROM spotify
WHERE stream > 1000000000

-- Q2. List all albums along with their respective artists.
 SELECT DISTINCT album , artist 
 FROM spotify;
 

-- Q3. Get the total number of comments for tracks where licensed = TRUE.
SELECT SUM(comments)
FROM spotify
WHERE licensed = 'TRUE'

-- Q4. Find all tracks that belong to the album type 'single'.
SELECT track
FROM spotify
WHERE album_type = 'single'

-- Q5. Count the total number of tracks by each artist.
SELECT COUNT(DISTINCT track) AS total_tracks , artist
FROM spotify
GROUP BY artist

-- Q6. Calculate the average danceability of tracks in each album.
SELECT AVG(danceability),album
FROM spotify 
GROUP BY album

-- Q7. Find the top 5 tracks with the highest energy values.
SELECT track , energy 
FROM spotify
ORDER BY energy DESC 
LIMIT 5;

-- Q8. List all tracks along with their views and likes where official_video = TRUE.
SELECT track , views ,likes 
FROM spotify
WHERE official_video = TRUE

-- Q9. For each album, calculate the total views of all associated tracks.
SELECT album,SUM(views)
FROM spotify
GROUP BY album

-- Q10. Retrieve the track names that have been streamed on Spotify more than YouTube.
SELECT track
FROM spotify
GROUP BY track
HAVING 
    SUM(CASE WHEN most_played_on = 'Spotify' THEN stream ELSE 0 END)
  > SUM(CASE WHEN most_played_on = 'YouTube' THEN stream ELSE 0 END);

  -- Q11. Top 3 most-viewed tracks for each artist

WITH ranking_artist AS (
    SELECT 
        artist,
        track,
        SUM(views) AS total_views,
        DENSE_RANK() OVER (
            PARTITION BY artist 
            ORDER BY SUM(views) DESC
        ) AS rnk
    FROM spotify
    GROUP BY artist, track
)

SELECT artist, track, total_views ,rnk
FROM ranking_artist
WHERE rnk <= 3;

-- Q12. Write a query to find tracks where the liveness score is above the average.
  SELECT track  
  FROM spotify 
  WHERE liveness > (SELECT AVG(liveness) AS avg_live FROM spotify)


-- Q13. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.

WITH cte AS
(
  SELECT album,
  MAX(energy) AS highest_energy,
  MIN(energy) AS lowest_energy
  FROM spotify
   GROUP BY album
 )
 SELECT album ,
 highest_energy - lowest_energy as energy_diff
 FROM cte
   
