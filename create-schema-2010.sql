-- Author: Andrew Harvey (http://andrewharvey4.wordpress.com/)
--
-- To the extent possible under law, the person who associated CC0
-- with this work has waived all copyright and related or neighboring
-- rights to this work.
-- http://creativecommons.org/publicdomain/zero/1.0/

-- This work is based on the schema used in the source CSV files as downloaded
-- by the Makefile.
-- Credit for the original schema goes to the Australian Electoral Commission,
-- http://www.aec.gov.au/


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

