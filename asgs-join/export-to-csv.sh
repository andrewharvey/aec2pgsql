#!/bin/sh

for dataset in 2010-house 2010-senate 2007-house 2007-senate
do
  psql --no-align --field-separator=',' -f $dataset-export.sql | head  --lines=-1 > $dataset.csv
done
