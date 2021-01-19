#!/bin/bash

#chmod +x import.sh

echo "----------------------------------------------"
echo "--------Execute mongo-seed/import.sh----------"
echo "----------------------------------------------"

#mongorestore --verbose --host=mongodb /data/db/mongodump/remap2020/
mongoimport --host mongodb --db=remap2020 --collection=hsap_all_peaks --type json --file /mongo-seed/census.json --jsonArray

echo "-----------END mongorestore-------------"