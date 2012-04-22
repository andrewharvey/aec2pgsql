About
=======

These scripts are designed to load the Australian Electoral Commission data into
a PostgreSQL database.

At the moment only the Votes, Turnout & Informal Votes datasets are imported for
years 2010 and 2007.

Copyright
=======
According to http://www.aec.gov.au/footer/Copyright.htm the AEC data presented
on their website at aec.gov.au is Copyright by the Commonwealth as represented
by the Australian Electoral Commission (AEC) and is licensed under a [Creative
Commons Attribution 3.0 Australia Licence](http://creativecommons.org/licenses/by/3.0/au/)
(CC BY 3.0).

Thanks to the AEC for releasing this data under a free and open license.

All the files within this aec2pgsql repository are released under the
[CC0](http://creativecommons.org/publicdomain/zero/1.0/) license by
Andrew Harvey <andrew.harvey4@gmail.com>. Although not required, I would prefer
you give Attribution and release derived works or modifications under the same
CC0 license.

    To the extent possible under law, the person who associated CC0
    with this work has waived all copyright and related or neighboring
    rights to this work.
    http://creativecommons.org/publicdomain/zero/1.0/

Requirements
=======

Debian Dependencies: `postgresql-client, libtext-csv-perl, wget`

The scripts assume you have a PostgreSQL database up and running and set up your
PG* environment variables such that a plain call to psql will give you access to
the database (though I give some pointers in the next section).

Running the Scripts
=======
If you don't already have a database and database user set up, then you can set
up the user and database on Debian using,

    sudo su - postgres
    createuser --no-createdb --no-createrole --superuser aec
    createdb --owner=aec aec
    exit

Once that is set up, the rest of the process is as follows.

You need to set up and export some PG environment variables otherwise the
PostgreSQL defaults will be used. For example,

    export PGHOST=localhost
    export PGDATABASE=aec
    export PGUSER=aec

Refer to the [PostgreSQL documentation](http://www.postgresql.org/docs/current/static/libpq-envars.html)
for details on the environment variables which you can set.

Next just run,

    make

That will download the raw CSV files, run some tests on them, create the schema
in PostgreSQL, and finally load the data into PostgreSQL.
