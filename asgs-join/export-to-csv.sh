#!/bin/sh

mkdir -p csv-exports
for dataset in 2010-house 2010-senate 2007-house 2007-senate
do
  psql --no-align --field-separator=',' -f asgs-join/$dataset-export.sql | head  --lines=-1 > csv-exports/$dataset.csv
done
