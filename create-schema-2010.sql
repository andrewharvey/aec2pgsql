DROP SCHEMA aec_2010 CASCADE;

CREATE SCHEMA aec_2010;

CREATE TABLE aec_2010.division
(
  "id" smallint PRIMARY KEY,
  "name" text,
  "state" char(3)
);

CREATE TABLE aec_2010.house_informal_votes
(
  "id" smallint PRIMARY KEY REFERENCES aec_2010.division(id),
  "formal_votes" integer,
  "informal_votes" integer
);

CREATE TABLE aec_2010.house_turnout
(
  "id" smallint PRIMARY KEY REFERENCES aec_2010.division(id),
  "enrolment" integer,
  "turnout" integer
);

CREATE TABLE aec_2010.house_votes
(
  "id" smallint PRIMARY KEY REFERENCES aec_2010.division(id),
  "ordinary_votes" integer,
  "absent_votes" integer,
  "provisional_votes" integer,
  "prepoll_votes" integer,
  "postal_votes" integer
);

CREATE TABLE aec_2010.senate_informal_votes
(
  "id" smallint PRIMARY KEY REFERENCES aec_2010.division(id),
  "formal_votes" integer,
  "informal_votes" integer
);

CREATE TABLE aec_2010.senate_turnout
(
  "id" smallint PRIMARY KEY REFERENCES aec_2010.division(id),
  "enrolment" integer,
  "turnout" integer
);

CREATE TABLE aec_2010.senate_votes
(
  "id" smallint PRIMARY KEY REFERENCES aec_2010.division(id),
  "ordinary_votes" integer,
  "absent_votes" integer,
  "provisional_votes" integer,
  "prepoll_votes" integer,
  "postal_votes" integer
);


