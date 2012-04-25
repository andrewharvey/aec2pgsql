SELECT
  *
FROM
  aec_2010_asgs_join
JOIN aec_2007.senate_informal_votes USING (id)
JOIN aec_2007.senate_turnout USING (id)
JOIN aec_2007.senate_votes USING (id);
