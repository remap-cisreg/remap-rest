FROM mongo:4.4.3

COPY ./mongo/init-mongo.sh/.mongorc.js:/docker-entrypoint-initdb.d/init-mongo.sh/.mongorc.js

RUN /docker-entrypoint-initdb.d/ 

#-- Example Import
# CMD mongoimport --host mongodb --db reach-engine --collection MyDummyCollection --type json --file /init.json --jsonArray
# CMD mongoimport --db=remap2020 --collection=remap2020_hsap_all_peaks --type=json --file=~/data/db/mongodump/remap2020_hsap_all_peaks.json

#-- Example Import
CMD mongorestore ~/data/mongodump/dump/remap2020

