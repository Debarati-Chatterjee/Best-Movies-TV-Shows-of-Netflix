create database netflix_db;

use netflix_db;

create table `Best movie netflix`
(index1	int,
TITLE text(250),	
RELEASE_YEAR int,	
SCORE double,
NUMBER_OF_VOTES	int,
DURATION int,	
MAIN_GENRE text,	
MAIN_PRODUCTION text);

 LOAD DATA LOCAL INFILE "C:\\Users\\DEBARATI CHATTERJEE\\Downloads\\netflix\\Best Movie by Year Netflix.csv"
 INTO TABLE `Best movie by year netflix`
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

select *
from `Best movie by year netflix`
order by release_year desc
limit 10;


create table `Best movie by year netflix`
(index1	int,
TITLE	text(250),
RELEASE_YEAR int,
SCORE double,
MAIN_GENRE	text,
MAIN_PRODUCTION text);

select *
from `Best shows netflix`
order by score desc, NUMBER_OF_VOTES desc
limit 5;

select *
from `Best movie netflix`
order by score desc, NUMBER_OF_VOTES desc
limit 5;

select m.main_production, count(m.index1) as count1
from `Best movie netflix` m 
where main_production is not null
group by main_production;

select S.main_production, count(S.index) as count1
from `Best SHOWS netflix` S
where main_production is not null
group by main_production;



select m.main_production, m.title, max(m.score) 
from `Best movie netflix` m 
where main_production is not null
group by main_production;

select s.main_production, s.title, max(s.score) 
from `Best shows netflix` s
where main_production is not null
group by main_production;


select distinct m.main_production,  m.title, m.score
from `Best movie netflix` m 
where m.main_production ="IN"
order by m.score desc
limit 3;

select distinct s.main_production,  s.title, s.score
from `Best shows netflix` s 
where s.main_production ="IN"
order by s.score desc
limit 5;

select distinct m.main_genre, count( m.title)
from `Best movie netflix` m 
where m.main_genre is not null
group by m.main_genre;

select distinct s.main_genre, count( s.title)
from `Best shows netflix` s
where s.main_genre is not null
group by s.main_genre;


select distinct m.main_genre,  m.title, max(m.score)
from `Best movie netflix` m 
where m.main_genre is not null 
group by m.main_genre;


select distinct s.main_genre,  s.title, max(s.score)
from `Best shows netflix` s 
where s.main_genre is not null 
group by s.main_genre;

select type, count(*)
from raw_titles
group by type;

select type, title, max(imdb_score * imdb_votes) as highrated
from raw_titles
group by type;

select age_certification, count(*)
from raw_titles
group by age_certification;