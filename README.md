# remap-rest
Making the RESTful data access to ReMap data over HTTP

#  Examples from the Web

## MongoDB at EBI variation
 https://github.com/EBIvariation/eva-pipeline/wiki/MongoDB-schema
 The database technology used to store the variation data is MongoDB. The schema is comprised of 2 collections described below.

## Mongodb: What'S The Most Efficient Way To Store A Genomic Position
https://www.biostars.org/p/2517/

## MongoDB : install MongoDB Community Edition on OS X
 https://docs.mongodb.com/manual/tutorial/install-mongodb-on-os-x/
 
 ```
curl -O https://fastdl.mongodb.org/osx-ssl/mongodb-osx-ssl-x86_64-3.4.10.tgz
tar -zxvf mongodb-osx-ssl-x86_64-3.4.10.tgz
mkdir -p mongodb
cp -R -n mongodb-osx-ssl-x86_64-3.4.10/ mongodb
export PATH=<mongodb-install-directory>/bin:$PATH
(Replace <mongodb-install-directory> with the path to the extracted MongoDB archive.)
```

## MongoDB : Create the data directory
Create the directory to which the mongod process will write data. By default, the mongod process uses the /data/db directory. If you create a directory other than this one, you must specify that directory in the dbpath option when starting the mongod process later in this procedure.

The following example command creates the default ```/data/db``` directory:

```mkdir -p /data/db```
## Copy ReMap BEDs 
copy ReMap beds into a beds/ folder

## MongoDB : Run MongoDB

```mongod ```



