CREATE DATABASE ipl_analysis;

USE ipl_analysis;

CREATE TABLE ipl_matches (
    id INT PRIMARY KEY,
    season INT,
    city VARCHAR(50),
    date DATE,
    match_type VARCHAR(255),
    player_of_match VARCHAR(255),
    venue VARCHAR(255),
    team1 VARCHAR(255),
    team2 VARCHAR(255),
    toss_winner VARCHAR(255),
    toss_decision VARCHAR(255),
    winner VARCHAR(255),
    result VARCHAR(255),
    result_margin INT,
    target_runs INT,
    target_overs INT,
    super_over CHAR(1),
    method VARCHAR(50),
    umpire1 VARCHAR(255),
    umpire2 VARCHAR(255)
);

-- Q1. Which team won the most matches in IPL?

SELECT winner, COUNT(*) AS matches_won
FROM ipl_matches
WHERE winner IS NOT NULL
GROUP BY winner
ORDER BY matches_won DESC
LIMIT 1;

-- Q2. Which player won the most 'Player of the Match' awards?

SELECT player_of_match, COUNT(*) AS most_player_of_match
FROM ipl_matches
WHERE player_of_match IS NOT NULL
GROUP BY player_of_match
ORDER BY most_player_of_match DESC
LIMIT 1;

-- Q3. Which city hosted the most matches?

SELECT city, COUNT(*) AS matches_hosted
FROM ipl_matches
WHERE city IS NOT NULL
GROUP BY city
ORDER BY matches_hosted DESC
LIMIT 1;

-- Q4. What was the highest win by runs (defending)? Which team achieved it?

SELECT winner, result, result_margin
FROM ipl_matches
WHERE result = "runs"
ORDER BY result_margin DESC
LIMIT 1;

-- Q5. What was the highest win by wickets (chasing)? Which team achieved it?

SELECT winner, result, result_margin
FROM ipl_matches
WHERE result = "wickets"
ORDER BY result_margin DESC
LIMIT 1;

-- Q6. How many matches were won by teams that won the toss?

SELECT COUNT(*) AS toss_winner_match_winner
FROM ipl_matches
WHERE toss_winner = winner;


-- Q7. How many matches were decided by runs vs wickets?

SELECT result, COUNT(*) AS count
FROM ipl_matches
WHERE result IN ('runs', 'wickets')
GROUP BY result;

-- Q8. Which venues hosted the most matches?

SELECT venue, COUNT(*) AS matches_hosted
FROM ipl_matches
GROUP BY venue
ORDER BY matches_hosted DESC
LIMIT 1;

-- Q9. How many matches did each team win?

SELECT winner, COUNT(*) AS matches_won
FROM ipl_matches
WHERE winner IS NOT NULL
GROUP BY winner
ORDER BY matches_won DESC;

-- Q10. Which toss decision (bat/field) led to more wins?

SELECT t.toss_decision, COUNT(*) AS wins
FROM ipl_matches m
JOIN ipl_matches t ON m.id = t.id AND m.winner = t.toss_winner
GROUP BY t.toss_decision;

-- Q11. List all matches where the team won by more than 50 runs.

SELECT *
FROM ipl_matches
WHERE result = 'runs' AND result_margin > 50;

-- Q12. List all matches that ended with a 1-run or 1-wicket victory (nail-biters).

SELECT *
FROM ipl_matches
WHERE (result = 'runs' AND result_margin = 1) OR (result = 'wickets' AND result_margin = 1);


-- Q13. Get the number of matches each team played (as team1 or team2).

SELECT team, SUM(matches_played) as total_matches
FROM (
    SELECT team1 AS team, COUNT(*) AS matches_played FROM ipl_matches GROUP BY team1
    UNION ALL
    SELECT team2 AS team, COUNT(*) AS matches_played FROM ipl_matches GROUP BY team2
) AS all_matches
GROUP BY team
ORDER BY total_matches DESC;

-- Q14. Which team won the most matches after choosing to bat first?

SELECT winner, COUNT(*) AS wins_batting_first
FROM ipl_matches
WHERE toss_decision = 'bat' AND toss_winner = winner
GROUP BY winner
ORDER BY wins_batting_first DESC
LIMIT 1;

-- Q15. What percentage of toss-winning teams also won the match?

SELECT
    (SELECT COUNT(*) FROM ipl_matches WHERE toss_winner = winner) * 100.0 /
    (SELECT COUNT(*) FROM ipl_matches) AS percentage_toss_win_match_win;
    
-- Q16. List the matches with no margin (tie or no result).

SELECT *
FROM ipl_matches
WHERE super_over = 'Y' OR winner IS NULL;


-- Q17. Top 5 players with the most ‘Player of the Match’ awards.

SELECT player_of_match, COUNT(*) AS awards
FROM ipl_matches
WHERE player_of_match IS NOT NULL
GROUP BY player_of_match
ORDER BY awards DESC
LIMIT 5;

-- Q18. Compare the number of wins for each team when batting first vs. chasing.

SELECT
    winner,
    SUM(CASE 
			WHEN toss_decision = 'bat' THEN 1 ELSE 0 END) AS wins_batting_first,
    SUM(CASE 
			WHEN toss_decision = 'field' THEN 1 ELSE 0 END) AS wins_chasing
FROM ipl_matches
WHERE winner IS NOT NULL
GROUP BY winner;

-- Q19. Which team won the most matches at a specific venue (e.g., Mumbai)?

SELECT winner, COUNT(*) AS wins_in_mumbai
FROM ipl_matches
WHERE city = 'Mumbai' AND winner IS NOT NULL
GROUP BY winner
ORDER BY wins_in_mumbai DESC
LIMIT 1;


-- Q20. Which team won the most matches against a specific opponent (e.g., against 'RCB')?

SELECT winner, COUNT(*) AS wins_against_rcb
FROM ipl_matches
WHERE (team1 = 'Royal Challengers Bangalore' OR team2 = 'Royal Challengers Bangalore')
  AND winner != 'Royal Challengers Bangalore' AND winner IS NOT NULL
GROUP BY winner
ORDER BY wins_against_rcb DESC
LIMIT 1;


