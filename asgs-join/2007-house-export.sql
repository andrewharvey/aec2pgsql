SELECT
  *
FROM
  aec_2010_asgs_join
JOIN aec_2007.house_informal_votes USING (id)
JOIN aec_2007.house_turnout USING (id)
JOIN aec_2007.house_votes USING (id);
