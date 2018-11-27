# UMLS to PostgreSQL with PgAdmin
This docker container will load UMLS data into a PostgreSQL database and also provide PgAdmin for postgres. 

## Requirements
- `docker 18.06.1-ce` or higer
- `docker-compose 1.22.0` or higher
- The UMLS data prepared using `MetamorphoSys`


## How to run
1. Place all your `.RRF` files from `META` into a folder, e.g. /data/META/<all .RRF files>
2. Run the preparation script that will escape some characters in the .RRF data
```
cd <umls github repo>
./escape.sh "/data/META"    # Path to the META folder with .RRF files
# If the path to your data is /data/META  all is ready. If non open the docker-compose.yml and edit the bind for the /data directory
docker-compose build
docker-compose up     # Optional add -d 
```
3. Once the data import is done (it can take hours depending on your machine), you can access the PgAdmin on IP:1234 and PostgreSQL on IP:1234 

Note:
 Username and password for PgAdmin are the ones in docker-compose.yml

## Escaping the `\` in RRF files
To fix some bugs when importing, escape all the `\` in input data.
```
chmod a+x escape.sh
./escape.sh "<path to the folder containing RRF files>"

#e.g.
./escape.sh "/data/META"
```
Take care not to run this script multiple times, as it will escape the escaped chars.


## Problems
Importing the data can be sometimes problematic:
- There are some problems with the `\` - escape chars, easiest solution is to run the small bash script that will escape the `\` chars. 
- RRF format has bugs and missing rows/columns, sometimes, depending on the UMLS version. You will have to manually check the log of the container to be sure everything was imported nicely
- All tables are not always present, be sure to remove the tables you don't need from the `./postgres/scripts/1_pgsql_all_tables.sql`. If you don't do that the improt tends to fail. Or you will have to manually run the scripts using `psql`.

## Ancknowledgements
Some parts of the import sql scripts were taken from:
``` PostgreSQL load & index scripts - by Steve Bedrick, Yeb Havinga ``` available at [umls](https://www.nlm.nih.gov/research/umls/implementation_resources/community/index.html)
