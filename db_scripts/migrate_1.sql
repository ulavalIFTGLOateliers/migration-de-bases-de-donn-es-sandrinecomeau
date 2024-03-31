ALTER TABLE singer RENAME TO musician;
ALTER TABLE musician ADD COLUMN role VARCHAR(50);
ALTER TABLE musician ADD COLUMN bandName VARCHAR(50);
ALTER TABLE musician CHANGE singerName musicianName VARCHAR(50);

CREATE TABLE IF NOT EXISTS band (
    bandName VARCHAR(50),
    creation YEAR,
    genre VARCHAR(50),
    PRIMARY KEY (bandName)
);

INSERT INTO band (bandName, creation, genre) VALUES
('Crazy Duo', 2015, 'rock'),
('Luna', 2009, 'classical'),
('Mysterio', 2019, 'pop');

ALTER TABLE album DROP FOREIGN KEY FK_A_singerName;
ALTER TABLE album ADD CONSTRAINT FK_A_singerName FOREIGN KEY (singerName) REFERENCES musician (musicianName);

UPDATE musician SET role='vocals', bandName='Crazy Duo' WHERE musicianName='Alina';
UPDATE musician SET role='guitar', bandName='Mysterio' WHERE musicianName='Mysterio';
UPDATE musician SET role='percussion', bandName='Crazy Duo' WHERE musicianName='Rainbow';
UPDATE musician SET role='piano', bandName='Luna' WHERE musicianName='Luna';
