DROP TABLE conferences;
DROP TABLE shuttles;
DROP SEQUENCE conference_seq;
DROP SEQUENCE shuttle_seq;

CREATE TABLE conferences (
  id		int,
  city		varchar(80),
  airport	char(3),
  seats		int
);
CREATE SEQUENCE conference_seq START 1;
CREATE UNIQUE INDEX conference_index ON conferences(id);
GRANT ALL ON conferences TO guest;
GRANT ALL ON conference_seq TO guest;

CREATE TABLE shuttles (
  id		int,
  airport	char(3),
  time		time,
  seats		int
);
CREATE SEQUENCE shuttle_seq START 1;
CREATE UNIQUE INDEX shuttle_index ON shuttles(id);
GRANT ALL ON shuttles TO guest;
GRANT ALL ON shuttle_seq TO guest;


-- some test data

INSERT INTO conferences
VALUES (NEXTVAL('conference_seq'), 'Austin', 'AUS', 45);
INSERT INTO conferences
VALUES (NEXTVAL('conference_seq'), 'Las Angeles', 'LAX', 37);
INSERT INTO conferences
VALUES (NEXTVAL('conference_seq'), 'New York', 'JFK', 0);
INSERT INTO conferences
VALUES (NEXTVAL('conference_seq'), 'Houston', 'IAH', 11);
INSERT INTO conferences
VALUES (NEXTVAL('conference_seq'), 'Boston', 'BOS', 0);
INSERT INTO conferences
VALUES (NEXTVAL('conference_seq'), 'San Francisco', 'SFO', 12);

INSERT INTO shuttles
VALUES (NEXTVAL('shuttle_seq'), 'AUS', '9:40', 10);
INSERT INTO shuttles
VALUES (NEXTVAL('shuttle_seq'), 'AUS', '12:00', 12);
INSERT INTO shuttles
VALUES (NEXTVAL('shuttle_seq'), 'AUS', '14:15', 0);
INSERT INTO shuttles
VALUES (NEXTVAL('shuttle_seq'), 'LAX', '12:15', 10);
INSERT INTO shuttles
VALUES (NEXTVAL('shuttle_seq'), 'LAX', '16:35', 10);
INSERT INTO shuttles
VALUES (NEXTVAL('shuttle_seq'), 'IAH', '9:30', 0);
INSERT INTO shuttles
VALUES (NEXTVAL('shuttle_seq'), 'JFK', '12:15', 10);
INSERT INTO shuttles
VALUES (NEXTVAL('shuttle_seq'), 'BOS', '16:35', 10);
INSERT INTO shuttles
VALUES (NEXTVAL('shuttle_seq'), 'SFO', '9:30', 10);


