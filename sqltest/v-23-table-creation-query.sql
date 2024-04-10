use school;
CREATE TABLE ICC_World_Cup (
    Team1 NVARCHAR(MAX),
    Team2 NVARCHAR(MAX),
    Winner NVARCHAR(MAX)
);
INSERT INTO ICC_World_Cup (Team1, Team2, Winner)
VALUES 
('India', 'Australia', 'India'),
('Pakistan', 'Sri Lanka', 'Pakistan'),
('England', 'South Africa', 'England'),
('New Zealand', 'West Indies', 'New Zealand'),
('Australia', 'Pakistan', 'Australia'),
('India', 'South Africa', 'India'),
('England', 'West Indies', 'England'),
('New Zealand', 'Sri Lanka', 'New Zealand'),
('Pakistan', 'South Africa', 'South Africa'),
('India', 'England', 'India'),
('Australia', 'West Indies', 'Australia'),
('New Zealand', 'South Africa', 'New Zealand'),
('Pakistan', 'England', 'Pakistan'),
('India', 'West Indies', 'India'),
('Australia', 'New Zealand', 'Australia');

