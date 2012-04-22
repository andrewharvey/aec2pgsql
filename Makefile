# Author: Andrew Harvey (http://andrewharvey4.wordpress.com/)
#
# To the extent possible under law, the person who associated CC0
# with this work has waived all copyright and related or neighboring
# rights to this work.
# http://creativecommons.org/publicdomain/zero/1.0/


all : clean download check_source create_schema load

clean :
	rm -fr 2010 2007
	psql -c "DROP SCHEMA aec_2010 CASCADE;"
	psql -c "DROP SCHEMA aec_2007 CASCADE;"

download :
	# 2010 House of Rep Downloads page http://results.aec.gov.au/15508/Website/HouseDownloadsMenu-15508-csv.htm
	# 2010 Senate Downloads page http://results.aec.gov.au/15508/Website/SenateDownloadsMenu-15508-csv.htm

	mkdir -p 2010/House 2010/Senate 2007/House 2007/Senate

	wget -O 2010/House/Informal_Votes.csv "http://results.aec.gov.au/15508/Website/Downloads/HouseInformalByDivisionDownload-15508.csv" 
	wget -O 2010/House/Turnout.csv "http://results.aec.gov.au/15508/Website/Downloads/HouseTurnoutByDivisionDownload-15508.csv" 
	wget -O 2010/House/Votes.csv "http://results.aec.gov.au/15508/Website/Downloads/HouseVotesCountedByDivisionDownload-15508.csv" 

	wget -O 2010/Senate/Informal_Votes.csv "http://results.aec.gov.au/15508/Website/Downloads/SenateInformalByDivisionDownload-15508.csv" 
	wget -O 2010/Senate/Turnout.csv "http://results.aec.gov.au/15508/Website/Downloads/SenateTurnoutByDivisionDownload-15508.csv" 
	wget -O 2010/Senate/Votes.csv "http://results.aec.gov.au/15508/Website/Downloads/SenateVotesCountedByDivisionDownload-15508.csv"
	
	wget -O 2007/House/Informal_Votes.csv "http://results.aec.gov.au/13745/Website/Downloads/HouseInformalByDivisionDownload-13745.csv" 
	wget -O 2007/House/Turnout.csv "http://results.aec.gov.au/13745/Website/Downloads/HouseTurnoutByDivisionDownload-13745.csv" 
	wget -O 2007/House/Votes.csv "http://results.aec.gov.au/13745/Website/Downloads/HouseVotesCountedByDivisionDownload-13745.csv" 

	wget -O 2007/Senate/Informal_Votes.csv "http://results.aec.gov.au/13745/Website/Downloads/SenateInformalByDivisionDownload-13745.csv" 
	wget -O 2007/Senate/Turnout.csv "http://results.aec.gov.au/13745/Website/Downloads/SenateTurnoutByDivisionDownload-13745.csv" 
	wget -O 2007/Senate/Votes.csv "http://results.aec.gov.au/13745/Website/Downloads/SenateVotesCountedByDivisionDownload-13745.csv"	

check_source :
	./check-data.pl 2010
	./check-data.pl 2007

create_schema :
	psql -f create-schema-2010.sql
	psql -f create-schema-2007.sql

load :
	cat 2010/Senate/Votes.csv | tail -n +2 | cut -d, -f1-3 | psql -c 'COPY aec_2010.division FROM STDIN WITH (FORMAT csv, HEADER);'
	
	cat 2010/House/Informal_Votes.csv | tail -n +2 | cut -d, -f1,4-5 | psql -c 'COPY aec_2010.house_informal_votes FROM STDIN WITH (FORMAT csv, HEADER);'
	cat 2010/House/Turnout.csv | tail -n +2 | cut -d, -f1,4-5 | psql -c 'COPY aec_2010.house_turnout FROM STDIN WITH (FORMAT csv, HEADER);'
	cat 2010/House/Votes.csv | tail -n +2 | cut -d, -f1,4-8 | psql -c 'COPY aec_2010.house_votes FROM STDIN WITH (FORMAT csv, HEADER);'
	
	cat 2010/Senate/Informal_Votes.csv | tail -n +2 | cut -d, -f1,4-5 | psql -c 'COPY aec_2010.senate_informal_votes FROM STDIN WITH (FORMAT csv, HEADER);'
	cat 2010/Senate/Turnout.csv | tail -n +2 | cut -d, -f1,4-5 | psql -c 'COPY aec_2010.senate_turnout FROM STDIN WITH (FORMAT csv, HEADER);'
	cat 2010/Senate/Votes.csv | tail -n +2 | cut -d, -f1,4-8 | psql -c 'COPY aec_2010.senate_votes FROM STDIN WITH (FORMAT csv, HEADER);'
	
	cat 2007/Senate/Votes.csv | tail -n +2 | cut -d, -f1-3 | psql -c 'COPY aec_2007.division FROM STDIN WITH (FORMAT csv, HEADER);'
	
	cat 2007/House/Informal_Votes.csv | tail -n +2 | cut -d, -f1,4-5 | psql -c 'COPY aec_2007.house_informal_votes FROM STDIN WITH (FORMAT csv, HEADER);'
	cat 2007/House/Turnout.csv | tail -n +2 | cut -d, -f1,4-5 | psql -c 'COPY aec_2007.house_turnout FROM STDIN WITH (FORMAT csv, HEADER);'
	cat 2007/House/Votes.csv | tail -n +2 | cut -d, -f1,4-8 | psql -c 'COPY aec_2007.house_votes FROM STDIN WITH (FORMAT csv, HEADER);'
	
	cat 2007/Senate/Informal_Votes.csv | tail -n +2 | cut -d, -f1,4-5 | psql -c 'COPY aec_2007.senate_informal_votes FROM STDIN WITH (FORMAT csv, HEADER);'
	cat 2007/Senate/Turnout.csv | tail -n +2 | cut -d, -f1,4-5 | psql -c 'COPY aec_2007.senate_turnout FROM STDIN WITH (FORMAT csv, HEADER);'
	cat 2007/Senate/Votes.csv | tail -n +2 | cut -d, -f1,4-8 | psql -c 'COPY aec_2007.senate_votes FROM STDIN WITH (FORMAT csv, HEADER);'
