FROM mongo:4.4.3

COPY ./init-db.d/seed.js /docker-entrypoint-initdb.d

CMD mongoimport --host mongodb --db reach-engine --collection MyDummyCollection --type json --file /init.json --jsonArray