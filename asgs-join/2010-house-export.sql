SELECT
  *
FROM
  aec_2010_asgs_join
JOIN aec_2010.house_informal_votes USING (id)
JOIN aec_2010.house_turnout USING (id)
JOIN aec_2010.house_votes USING (id);
