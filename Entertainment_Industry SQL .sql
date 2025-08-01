CREATE DATABASE new_ent_ind;

                                         ## Creating People Table ##

CREATE TABLE People (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    birth_country VARCHAR(50),
    gender ENUM('Male', 'Female', 'Other'),
    net_worth DECIMAL(15,2),
    is_active BOOLEAN DEFAULT TRUE
);

                                        ## Populating People Table ##
                                        
INSERT INTO People (first_name, last_name, birth_date, birth_country, gender, net_worth, is_active) VALUES
('Tom', 'Hanks', '1956-07-09', 'USA', 'Male', 400000000.00, TRUE),
('Meryl', 'Streep', '1949-06-22', 'USA', 'Female', 160000000.00, TRUE),
('Beyoncé', 'Knowles', '1981-09-04', 'USA', 'Female', 500000000.00, TRUE),
('Leonardo', 'DiCaprio', '1974-11-11', 'USA', 'Male', 260000000.00, TRUE),
('Taylor', 'Swift', '1989-12-13', 'USA', 'Female', 570000000.00, TRUE),
('Dwayne', 'Johnson', '1972-05-02', 'USA', 'Male', 320000000.00, TRUE),
('Jennifer', 'Lawrence', '1990-08-15', 'USA', 'Female', 160000000.00, TRUE),
('Will', 'Smith', '1968-09-25', 'USA', 'Male', 350000000.00, TRUE),
('Lady', 'Gaga', '1986-03-28', 'USA', 'Female', 320000000.00, TRUE),
('Robert', 'Downey Jr.', '1965-04-04', 'USA', 'Male', 300000000.00, TRUE),
('Scarlett', 'Johansson', '1984-11-22', 'USA', 'Female', 165000000.00, TRUE),
('Chris', 'Hemsworth', '1983-08-11', 'Australia', 'Male', 130000000.00, TRUE),
('Adele', 'Adkins', '1988-05-05', 'UK', 'Female', 190000000.00, TRUE),
('Brad', 'Pitt', '1963-12-18', 'USA', 'Male', 300000000.00, TRUE),
('Angelina', 'Jolie', '1975-06-04', 'USA', 'Female', 120000000.00, TRUE),
('Johnny', 'Depp', '1963-06-09', 'USA', 'Male', 150000000.00, TRUE),
('Rihanna', 'Fenty', '1988-02-20', 'Barbados', 'Female', 1400000000.00, TRUE),
('Ed', 'Sheeran', '1991-02-17', 'UK', 'Male', 200000000.00, TRUE),
('Emma', 'Watson', '1990-04-15', 'UK', 'Female', 85000000.00, TRUE),
('Morgan', 'Freeman', '1937-06-01', 'USA', 'Male', 250000000.00, TRUE);

## Creating Professions Table ##

CREATE TABLE Professions (
    profession_id INT AUTO_INCREMENT PRIMARY KEY,
    profession_name VARCHAR(50) NOT NULL,
    description TEXT
);

## Populating Professions ##

INSERT INTO Professions (profession_name, description) VALUES
('Actor', 'Performs in films, television, or theater'),
('Singer', 'Records and performs songs'),
('Director', 'Oversees the creative aspects of a film'),
('Producer', 'Manages the business and logistics of film production'),
('Songwriter', 'Writes lyrics and/or music for songs'),
('Dancer', 'Performs choreographed movements'),
('Screenwriter', 'Writes scripts for films or TV'),
('Composer', 'Creates musical scores for films'),
('Voice Actor', 'Provides voices for animated characters'),
('Stunt Performer', 'Performs dangerous scenes in films'),
('Music Producer', 'Oversees music recording and production'),
('Choreographer', 'Creates and teaches dance routines'),
('Cinematographer', 'Responsible for film photography'),
('Editor', 'Assembles raw footage into final product'),
('Costume Designer', 'Creates outfits for characters'),
('Makeup Artist', 'Applies makeup for characters'),
('DJ', 'Plays recorded music for audiences'),
('Stand-up Comedian', 'Performs comedic routines live'),
('Model', 'Models clothing or products'),
('Photographer', 'Takes photographs for publications');

## Creating People's Professions ##

CREATE TABLE People_Professions (
    person_id INT,
    profession_id INT,
    PRIMARY KEY (person_id, profession_id),
    FOREIGN KEY (person_id) REFERENCES People(person_id),
    FOREIGN KEY (profession_id) REFERENCES Professions(profession_id)
);

## Populating ##

INSERT INTO People_Professions (person_id, profession_id) VALUES
(1, 1), (1, 4),  -- Tom Hanks: Actor, Producer
(2, 1), (2, 7),  -- Meryl Streep: Actor, Screenwriter
(3, 2), (3, 5), (3, 11),  -- Beyoncé: Singer, Songwriter, Music Producer
(4, 1), (4, 4),  -- Leonardo DiCaprio: Actor, Producer
(5, 2), (5, 5),  -- Taylor Swift: Singer, Songwriter
(6, 1), (6, 4), (6, 10),  -- Dwayne Johnson: Actor, Producer, Stunt Performer
(7, 1),  -- Jennifer Lawrence: Actor
(8, 1), (8, 2),  -- Will Smith: Actor, Singer
(9, 2), (9, 1), (9, 6),  -- Lady Gaga: Singer, Actor, Dancer
(10, 1),  -- Robert Downey Jr.: Actor
(11, 1), (11, 9),  -- Scarlett Johansson: Actor, Voice Actor
(12, 1),  -- Chris Hemsworth: Actor
(13, 2), (13, 5),  -- Adele: Singer, Songwriter
(14, 1), (14, 4),  -- Brad Pitt: Actor, Producer
(15, 1), (15, 4),  -- Angelina Jolie: Actor, Producer
(16, 1), (16, 2),  -- Johnny Depp: Actor, Singer
(17, 2), (17, 19),  -- Rihanna: Singer, Model
(18, 2), (18, 5),  -- Ed Sheeran: Singer, Songwriter
(19, 1), (19, 18),  -- Emma Watson: Actor, Model
(20, 1), (20, 2);  -- Morgan Freeman: Actor, Singer

## Creating Works Table ##

CREATE TABLE Works (
    work_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT,
    work_type ENUM('Movie', 'Album', 'TV Show', 'Single'),
    genre VARCHAR(50),
    revenue DECIMAL(15,2),
    rating DECIMAL(3,1)
);
## Populating ##

INSERT INTO Works (title, release_year, work_type, genre, revenue, rating) VALUES
('Forrest Gump', 1994, 'Movie', 'Drama', 678000000.00, 8.8),
('The Devil Wears Prada', 2006, 'Movie', 'Comedy', 326000000.00, 6.9),
('Lemonade', 2016, 'Album', 'R&B', 65000000.00, 9.2),
('Titanic', 1997, 'Movie', 'Romance', 2200000000.00, 7.9),
('1989', 2014, 'Album', 'Pop', 10000000.00, 8.7),
('Jumanji: Welcome to the Jungle', 2017, 'Movie', 'Adventure', 962000000.00, 6.9),
('The Hunger Games', 2012, 'Movie', 'Sci-Fi', 694000000.00, 7.2),
('Men in Black', 1997, 'Movie', 'Sci-Fi', 589000000.00, 7.3),
('A Star is Born', 2018, 'Movie', 'Romance', 436000000.00, 7.6),
('Iron Man', 2008, 'Movie', 'Action', 585000000.00, 7.9),
('Lost in Translation', 2003, 'Movie', 'Drama', 119000000.00, 7.7),
('Thor: Ragnarok', 2017, 'Movie', 'Action', 854000000.00, 7.9),
('21', 2011, 'Album', 'Pop', 31000000.00, 8.5),
('Fight Club', 1999, 'Movie', 'Drama', 101000000.00, 8.8),
('Maleficent', 2014, 'Movie', 'Fantasy', 758000000.00, 7.0),
('Pirates of the Caribbean', 2003, 'Movie', 'Adventure', 654000000.00, 8.0),
('Anti', 2016, 'Album', 'R&B', 1000000.00, 8.8),
('÷', 2017, 'Album', 'Pop', 6000000.00, 8.0),
('Harry Potter and the Deathly Hallows', 2011, 'Movie', 'Fantasy', 1342000000.00, 8.1),
('The Shawshank Redemption', 1994, 'Movie', 'Drama', 73000000.00, 9.3);

CREATE TABLE People_Works (
    person_id INT,
    work_id INT,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (person_id, work_id, role),
    FOREIGN KEY (person_id) REFERENCES People(person_id),
    FOREIGN KEY (work_id) REFERENCES Works(work_id)
);

INSERT INTO People_Works (person_id, work_id, role) VALUES
(1, 1, 'Lead Actor'),  -- Tom Hanks in Forrest Gump
(2, 2, 'Lead Actress'),  -- Meryl Streep in The Devil Wears Prada
(3, 3, 'Lead Artist'),  -- Beyoncé in Lemonade
(4, 4, 'Lead Actor'),  -- Leonardo DiCaprio in Titanic
(5, 5, 'Lead Artist'),  -- Taylor Swift in 1989
(6, 6, 'Lead Actor'),  -- Dwayne Johnson in Jumanji
(7, 7, 'Lead Actress'),  -- Jennifer Lawrence in Hunger Games
(8, 8, 'Lead Actor'),  -- Will Smith in Men in Black
(9, 9, 'Lead Actress'), (9, 9, 'Singer'),  -- Lady Gaga in A Star is Born
(10, 10, 'Lead Actor'),  -- Robert Downey Jr. in Iron Man
(11, 11, 'Lead Actress'),  -- Scarlett Johansson in Lost in Translation
(12, 12, 'Lead Actor'),  -- Chris Hemsworth in Thor
(13, 13, 'Lead Artist'),  -- Adele in 21
(14, 14, 'Lead Actor'),  -- Brad Pitt in Fight Club
(15, 15, 'Lead Actress'),  -- Angelina Jolie in Maleficent
(16, 16, 'Lead Actor'),  -- Johnny Depp in Pirates
(17, 17, 'Lead Artist'),  -- Rihanna in Anti
(18, 18, 'Lead Artist'),  -- Ed Sheeran in ÷
(19, 19, 'Lead Actress'),  -- Emma Watson in Harry Potter
(20, 20, 'Lead Actor');  -- Morgan Freeman in Shawshank

## Awards Table ##

CREATE TABLE Awards (
    award_id INT AUTO_INCREMENT PRIMARY KEY,
    award_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    awarding_body VARCHAR(100),
    prestige_level ENUM('High', 'Medium', 'Low')
);

## Populate ##

INSERT INTO Awards (award_name, category, awarding_body, prestige_level) VALUES
('Oscar', 'Best Actor', 'Academy', 'High'),
('Oscar', 'Best Actress', 'Academy', 'High'),
('Grammy', 'Album of the Year', 'Recording Academy', 'High'),
('Golden Globe', 'Best Drama Actor', 'HFPA', 'High'),
('Grammy', 'Best Pop Vocal Album', 'Recording Academy', 'Medium'),
('MTV Movie Award', 'Best Performance', 'MTV', 'Medium'),
('Oscar', 'Best Original Song', 'Academy', 'High'),
('Golden Globe', 'Best Comedy/Musical Actress', 'HFPA', 'High'),
('BAFTA', 'Best Film', 'BAFTA', 'High'),
('Emmy', 'Outstanding Lead Actress', 'Television Academy', 'High'),
('Tony', 'Best Actor in a Play', 'Broadway League', 'High'),
('Grammy', 'Record of the Year', 'Recording Academy', 'High'),
('Oscar', 'Best Supporting Actor', 'Academy', 'High'),
('Golden Globe', 'Best Supporting Actress', 'HFPA', 'Medium'),
('Grammy', 'Best New Artist', 'Recording Academy', 'Medium'),
('MTV Video Music Award', 'Video of the Year', 'MTV', 'Medium'),
('Oscar', 'Best Director', 'Academy', 'High'),
('Golden Globe', 'Best Original Score', 'HFPA', 'Medium'),
('Grammy', 'Song of the Year', 'Recording Academy', 'High'),
('BAFTA', 'Best British Film', 'BAFTA', 'Medium');

## Creating Connection ##

CREATE TABLE People_Awards (
    person_id INT,
    award_id INT,
    work_id INT NULL,
    award_year INT NOT NULL,
    PRIMARY KEY (person_id, award_id, award_year),
    FOREIGN KEY (person_id) REFERENCES People(person_id),
    FOREIGN KEY (award_id) REFERENCES Awards(award_id),
    FOREIGN KEY (work_id) REFERENCES Works(work_id)
);

## Populate Connects ##

INSERT INTO People_Awards (person_id, award_id, work_id, award_year) VALUES
(1, 1, 1, 1995),  -- Tom Hanks Oscar for Forrest Gump
(2, 2, 2, 2007),  -- Meryl Streep Golden Globe for Devil Wears Prada
(3, 3, 3, 2017),  -- Beyoncé Grammy for Lemonade
(4, 4, 4, 1998),  -- Leonardo DiCaprio Golden Globe for Titanic
(5, 5, 5, 2016),  -- Taylor Swift Grammy for 1989
(6, 6, 6, 2018),  -- Dwayne Johnson MTV Award for Jumanji
(9, 7, 9, 2019),  -- Lady Gaga Oscar for A Star is Born song
(10, 13, 10, 2009),  -- Robert Downey Jr. Oscar nomination for Iron Man
(11, 14, 11, 2004),  -- Scarlett Johansson Golden Globe nomination for Lost in Translation
(13, 12, 13, 2012),  -- Adele Grammy for 21
(14, 1, 14, 2000),  -- Brad Pitt Oscar nomination for Fight Club
(15, 2, 15, 2015),  -- Angelina Jolie Golden Globe for Maleficent
(16, 1, 16, 2004),  -- Johnny Depp Oscar nomination for Pirates
(17, 16, 17, 2017),  -- Rihanna MTV Award for Anti
(18, 19, 18, 2018),  -- Ed Sheeran Grammy for ÷
(19, 10, 19, 2012),  -- Emma Watson Emmy nomination for Harry Potter
(20, 1, 20, 1995),  -- Morgan Freeman Oscar nomination for Shawshank
(2, 8, NULL, 2010),  -- Meryl Streep Golden Globe (career)
(3, 15, NULL, 2004),  -- Beyoncé Grammy for new artist
(5, 12, NULL, 2021);  -- Taylor Swift Grammy (general)

## Connections Table ##

CREATE TABLE Connections (
    connection_id INT AUTO_INCREMENT PRIMARY KEY,
    person1_id INT,
    person2_id INT,
    connection_type ENUM('Collaborator', 'Family', 'Romantic', 'Professional'),
    description TEXT,
    FOREIGN KEY (person1_id) REFERENCES People(person_id),
    FOREIGN KEY (person2_id) REFERENCES People(person_id)
);

DROP TABLE Connections;
## Populate ##

INSERT INTO Connections (person1_id, person2_id, connection_type, description) VALUES
(1, 4, 'Professional', 'Co-starred in Catch Me If You Can'),
(1, 20, 'Professional', 'Co-starred in multiple films'),
(2, 9, 'Professional', 'Both performed at Oscars'),
(3, 5, 'Professional', 'Collaborated on music project'),
(3, 17, 'Professional', 'Collaborated on music'),
(4, 14, 'Professional', 'Co-stars in Once Upon a Time in Hollywood'),
(5, 18, 'Professional', 'Performed together at awards show'),
(5, 18, 'Professional', 'Songwriting collaboration'),
(6, 10, 'Professional', 'Both in MCU films'),
(7, 19, 'Professional', 'Young actresses who rose to fame in franchises'),
(8, 17, 'Professional', 'Worked on music video together'),
(9, 11, 'Professional', 'Both in Marvel films'),
(10, 12, 'Professional', 'Both in Avengers films'),
(11, 15, 'Professional', 'Both represented by same agency'),
(12, 16, 'Professional', 'Co-starred in Rum Diary'),
(13, 18, 'Professional', 'British singers who collaborated'),
(14, 15, 'Romantic', 'Former spouses'),
(15, 16, 'Professional', 'Co-starred in The Tourist'),
(16, 20, 'Professional', 'Co-starred in The Shawshank Redemption'),
(17, 3, 'Professional', 'Collaborated on music'),
(19, 7, 'Professional', 'Young actresses in same generation');

## Top 5 Most Connected People ##

SELECT p.person_id, CONCAT(p.first_name, ' ', p.last_name) AS name, 
       COUNT(DISTINCT c.person2_id) AS connection_count
FROM People p
JOIN Connections c ON p.person_id = c.person1_id OR p.person_id = c.person2_id
GROUP BY p.person_id, name
ORDER BY connection_count DESC
LIMIT 5;

## 5 least Successful People in terms of Revenue ##

SELECT p.person_id, CONCAT(p.first_name, ' ', p.last_name) AS name,
       COALESCE(SUM(w.revenue), 0) AS total_revenue
FROM People p
LEFT JOIN People_Works pw ON p.person_id = pw.person_id
LEFT JOIN Works w ON pw.work_id = w.work_id
GROUP BY p.person_id, name
ORDER BY total_revenue ASC
LIMIT 5;

## Award Distn. Accross Cats ##

SELECT a.category, COUNT(*) AS award_count
FROM Awards a
JOIN People_Awards pa ON a.award_id = pa.award_id
GROUP BY a.category
ORDER BY award_count DESC;

## Trend of revenue for movies and songs by year ##

SELECT release_year, work_type, SUM(revenue) AS total_revenue
FROM Works
WHERE work_type IN ('Movie', 'Album', 'Single')
GROUP BY release_year, work_type
ORDER BY release_year, work_type;

## Most commonly won award categories ## 

SELECT a.category, COUNT(*) AS wins
FROM People_Awards pa
JOIN Awards a ON pa.award_id = a.award_id
GROUP BY a.category
ORDER BY wins DESC;

-- Connection data for network visualization
SELECT 
    p1.person_id AS source_id,
    CONCAT(p1.first_name, ' ', p1.last_name) AS source_name,
    p2.person_id AS target_id,
    CONCAT(p2.first_name, ' ', p2.last_name) AS target_name,
    c.connection_type,
    COUNT(*) AS connection_strength
FROM Connections c
JOIN People p1 ON c.person1_id = p1.person_id
JOIN People p2 ON c.person2_id = p2.person_id
GROUP BY source_id, source_name, target_id, target_name, connection_type;

-- Genre trends by release year
SELECT 
    release_year,
    genre,
    COUNT(*) AS work_count,
    AVG(rating) AS avg_rating,
    SUM(revenue) AS total_revenue
FROM Works
WHERE work_type = 'Movie'
GROUP BY release_year, genre
HAVING release_year >= 1990
ORDER BY release_year, total_revenue DESC;

-- Correlation between awards won and work revenue
SELECT 
    p.person_id,
    CONCAT(p.first_name, ' ', p.last_name) AS name,
    COUNT(DISTINCT pa.award_id) AS award_count,
    SUM(w.revenue) AS total_revenue
FROM People p
LEFT JOIN People_Awards pa ON p.person_id = pa.person_id
LEFT JOIN People_Works pw ON p.person_id = pw.person_id
LEFT JOIN Works w ON pw.work_id = w.work_id
GROUP BY p.person_id, name
ORDER BY award_count DESC, total_revenue DESC;

-- Genre trends by release year
SELECT 
    release_year,
    genre,
    COUNT(*) AS work_count,
    AVG(rating) AS avg_rating,
    SUM(revenue) AS total_revenue
FROM Works
WHERE work_type = 'Movie'
GROUP BY release_year, genre
HAVING release_year >= 1990
ORDER BY release_year, total_revenue DESC;

-- People with multiple professions and their success metrics
SELECT 
    p.person_id,
    CONCAT(p.first_name, ' ', p.last_name) AS name,
    COUNT(DISTINCT pp.profession_id) AS profession_count,
    COUNT(DISTINCT pa.award_id) AS award_count,
    SUM(w.revenue) AS total_revenue
FROM People p
JOIN People_Professions pp ON p.person_id = pp.person_id
LEFT JOIN People_Awards pa ON p.person_id = pa.person_id
LEFT JOIN People_Works pw ON p.person_id = pw.person_id
LEFT JOIN Works w ON pw.work_id = w.work_id
GROUP BY p.person_id, name
HAVING profession_count > 1
ORDER BY profession_count DESC, total_revenue DESC;

SELECT 
    p.person_id,
    CONCAT(p.first_name, ' ', p.last_name) AS artist_name,
    p.net_worth AS personal_net_worth,
    COALESCE(SUM(w.revenue), 0) AS total_work_revenue,
    COUNT(DISTINCT pw.work_id) AS number_of_works,
    COUNT(DISTINCT pa.award_id) AS number_of_awards
FROM 
    People p
LEFT JOIN 
    People_Works pw ON p.person_id = pw.person_id
LEFT JOIN 
    Works w ON pw.work_id = w.work_id
LEFT JOIN 
    People_Awards pa ON p.person_id = pa.person_id
GROUP BY 
    p.person_id, artist_name, personal_net_worth
ORDER BY 
    personal_net_worth DESC
LIMIT 5;


####### top 5 by their works #####
SELECT 
    p.person_id,
    CONCAT(p.first_name, ' ', p.last_name) AS artist_name,
    COALESCE(SUM(w.revenue), 0) AS total_revenue,
    COUNT(DISTINCT w.work_id) AS number_of_works,
    GROUP_CONCAT(DISTINCT pr.profession_name SEPARATOR ', ') AS professions
FROM 
    People p
LEFT JOIN 
    People_Works pw ON p.person_id = pw.person_id
LEFT JOIN 
    Works w ON pw.work_id = w.work_id
LEFT JOIN 
    People_Professions pp ON p.person_id = pp.person_id
LEFT JOIN 
    Professions pr ON pp.profession_id = pr.profession_id
GROUP BY 
    p.person_id, artist_name
HAVING 
    total_revenue > 0  -- Exclude people with no revenue data
ORDER BY 
    total_revenue DESC
LIMIT 5;


















