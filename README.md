# IPL Data Analysis Using SQL

## Project Overview

This project analyzes Indian Premier League (IPL) match data using SQL.
The goal is to extract meaningful insights such as team performance, player achievements, venue statistics, and match outcomes using SQL queries.

The project demonstrates practical SQL skills commonly used in data analysis and data science workflows.

---

## Database Schema

A database named **`ipl_analysis`** was created with the table:

### Table: `ipl_matches`

This table contains information about IPL matches including:

* Match ID
* Season
* City
* Match date
* Teams playing
* Toss winner and decision
* Match winner
* Result margin
* Player of the match
* Venue
* Umpires

---

## Analysis Performed

The SQL queries answer several analytical questions such as:

* Which team won the most IPL matches
* Which player received the most **Player of the Match** awards
* Which city hosted the most IPL matches
* Highest win margins by runs and wickets
* Number of matches won after winning the toss
* Comparison of wins batting first vs chasing
* Matches with narrow victories (1 run or 1 wicket)
* Teams with the highest wins at specific venues
* Teams with the most wins against a specific opponent
* Total matches played by each team

---

## SQL Concepts Used

This project demonstrates the following SQL concepts:

* Data Definition Language (DDL)

  * `CREATE DATABASE`
  * `CREATE TABLE`

* Data Querying

  * `SELECT`
  * `WHERE`

* Aggregations

  * `COUNT()`
  * `SUM()`

* Grouping and Sorting

  * `GROUP BY`
  * `ORDER BY`

* Query Limiting

  * `LIMIT`

* Conditional Logic

  * `CASE` statements

* Joins

  * Self Join

* Subqueries

* Set Operations

  * `UNION ALL`

---

## Project Structure

```
ipl-sql-analysis
│
├── ipl_analysis.sql
└── README.md
```

---

## Skills Demonstrated

* SQL data analysis
* Query optimization
* Aggregation and grouping
* Subqueries and joins
* Analytical thinking with SQL

---

## Tools Used

* MySQL
* SQL
* Relational Database Concepts
