CREATE OR REPLACE VIEW aec_2010_asgs_join AS
(
  SELECT
    aec.id as id,
    ced.code as ced_code,
    aec.name as name
  FROM
    aec_2010.division as aec
  JOIN asgs_2011.ced as ced ON ( lower(aec.name) = lower(ced.name) )
);
