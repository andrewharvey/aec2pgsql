DROP SCHEMA aec_2007 CASCADE;

CREATE SCHEMA aec_2007;

CREATE TABLE aec_2007.division
(
  "id" smallint PRIMARY KEY,
  "name" text,
  "state" char(3)
);

CREATE TABLE aec_2007.house_informal_votes
(
  "id" smallint PRIMARY KEY REFERENCES aec_2007.division(id),
  "formal_votes" integer,
  "informal_votes" integer
);

CREATE TABLE aec_2007.house_turnout
(
  "id" smallint PRIMARY KEY REFERENCES aec_2007.division(id),
  "enrolment" integer,
  "turnout" integer
);

CREATE TABLE aec_2007.house_votes
(
  "id" smallint PRIMARY KEY REFERENCES aec_2007.division(id),
  "ordinary_votes" integer,
  "absent_votes" integer,
  "provisional_votes" integer,
  "prepoll_votes" integer,
  "postal_votes" integer
);

CREATE TABLE aec_2007.senate_informal_votes
(
  "id" smallint PRIMARY KEY REFERENCES aec_2007.division(id),
  "formal_votes" integer,
  "informal_votes" integer
);

CREATE TABLE aec_2007.senate_turnout
(
  "id" smallint PRIMARY KEY REFERENCES aec_2007.division(id),
  "enrolment" integer,
  "turnout" integer
);

CREATE TABLE aec_2007.senate_votes
(
  "id" smallint PRIMARY KEY REFERENCES aec_2007.division(id),
  "ordinary_votes" integer,
  "absent_votes" integer,
  "provisional_votes" integer,
  "prepoll_votes" integer,
  "postal_votes" integer
);


