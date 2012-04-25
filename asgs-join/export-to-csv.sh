#!/bin/sh

for dataset in 2010-house 2010-senate 2007-house 2007-senate
do
  psql --no-align --field-separator=',' --tuples-only -f $dataset-export.sql -o $dataset.csv
done
