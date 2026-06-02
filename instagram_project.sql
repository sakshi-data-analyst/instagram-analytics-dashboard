CREATE DATABASE INSTAGRAM_PROJECT;
USE INSTAGRAM_PROJECT;
SHOW TABLES;
DESCRIBE instagram_analytics;
SELECT*FROM instagram_analytics;
#TOTAL POSTS COUNT
SELECT COUNT(*) AS total_posts FROM instagram_analytics;
#TOTAL LIKES
SELECT SUM(likes) AS total_likes FROM instagram_analytics;
#AVERAGE ENGAGEMENT RATE
SELECT AVG(engagement_rate) AS average_engagement FROM instagram_analytics;
#TOP CONTENT CATEGORIES
SELECT
 content_category,
 SUM(likes) AS  total_likes
 FROM instagram_analytics
 GROUP BY content_category
 ORDER BY total_likes DESC;
 #BEST MEDIA TYPE
 SELECT 
 media_type,
 AVG(engagement_rate) AS avg_engagement
 FROM instagram_analytics
 GROUP BY media_type
 ORDER BY avg_engagement DESC;
 #TRAFFIC SOURCE ANALYSIS
 SELECT
 traffic_source,
 SUM(reach) AS total_reach
 FROM instagram_analytics
 GROUP BY traffic_source
 ORDER BY total_reach DESC;
 #HIGH VS LOW ENGAGEMENT
 SELECT
 post_id,
 likes,
 CASE
 WHEN likes > 10000 then 'High Engagement'
 WHEN likes > 5000 then 'Medium Engagement'
 ELSE 'Low Engagement'
 END AS  engagement_level
 FROM  instagram_analytics;
 #Monthly Growth Analysis
 SELECT
 MONTH(post_date) AS month,
 SUM(followers_gained) AS followers
 FROM  instagram_analytics
 GROUP BY MONTH(post_date)
 ORDER BY month;SELECT  post_date
 FROM instagram_analytics
 LIMIT 10;
 DESCRIBE instagram_analytics;
 
 
 #safe mode on/off
 SET SQL_SAFE_UPDATES = 1;
 
 UPDATE instagram_analytics
SET post_date = STR_TO_DATE(post_date,'%d-%m-%Y');
 
 ALTER TABLE instagram_analytics
MODIFY post_date DATE;

SELECT post_date
FROM instagram_analytics
LIMIT 10;

SELECT
MONTH(post_date) AS month,
SUM(followers_gained) AS followers
FROM instagram_analytics
GROUP BY MONTH(post_date)
ORDER BY month;


 
 SELECT*FROM instagram_analytics
 WHERE post_date IS NULL;
 #count null dates
 SELECT COUNT(*) AS null_dates
 FROM instagram_analytics
 WHERE post_date IS NULL;
 # check non- null date
 SELECT* FROM instagram_analytics
 WHERE post_date IS NOT NULL
 LIMIT 20;
 #CHECK DATE FORMATE
 SELECT post_date FROM  instagram_analytics LIMIT 20;
 
 SELECT COUNT(DISTINCT account_id)
 FROM instagram_analytics;
 
SELECT COUNT(DISTINCT account_id) AS total_users
FROM instagram_analytics;
 #top 5 best posts
 SELECT
post_id,
likes,
comments,
engagement_rate
FROM instagram_analytics
ORDER BY engagement_rate DESC
LIMIT 5;


#media type performance 
SELECT
media_type,
AVG(engagement_rate) AS avg_engagement
FROM instagram_analytics
GROUP BY media_type
ORDER BY avg_engagement DESC;

#Traffic Source Analysis
SELECT
traffic_source,
SUM(reach) AS total_reach
FROM instagram_analytics
GROUP BY traffic_source
ORDER BY total_reach DESC;

