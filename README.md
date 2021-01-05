# remap-rest
Making the RESTful data access to ReMap data over HTTP

# Which REST server ?

## Lumen
The github repo is here https://github.com/laravel/lumen 
Lumen is a PHP micro-framework built to deliver microservices and blazing fast APIs. 

## Developing RESTful APIs with Lumen (A PHP Micro-framework)
Learn how to build and secure RESTful APIs with Lumen here https://auth0.com/blog/developing-restful-apis-with-lumen/

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

Or use (for Mac) the 'brew' alternative presented here: https://docs.mongodb.com/manual/tutorial/install-mongodb-on-os-x/  

- the configuration file (/usr/local/etc/mongod.conf)
- the log directory path (/usr/local/var/log/mongodb)
- the data directory path (/usr/local/var/mongodb)


## MongoDB : Create the data directory
Create the directory to which the mongod process will write data. By default, the mongod process uses the /data/db directory. If you create a directory other than this one, you must specify that directory in the dbpath option when starting the mongod process later in this procedure.

The following example command creates the default ```/data/db``` directory:

```mkdir -p ~/data/db```
## Get ReMap BEDs 
Get ReMap main bed file into a ```beds/``` folder

```
cd ~/data/db
mkdir -p beds/
wget http://remap.univ-amu.fr/storage/remap2020/hg38/MACS2/remap2020_all_macs2_hg38_v1_0.bed.gz
gunzip remap2020_all_macs2_hg38_v1_0.bed.gz
```


## MongoDB : Run MongoDB for MacOS

```mongod ```
```mongod --dbpath ~/data/db```

```
brew services start mongodb-community@4.4
brew services stop mongodb-community@4.4
```

to stop MongoDB, press ```Control+C``` in the terminal where the mongod instance is running.

## the Mongo prompt

The following creates both the database remap2020 and the collection `hsap_all_peaks` during the insertOne() operation:
``` 
mongo
use remap2020
db.hsap_all_peaks.insertOne( { x: 1 } );
```
For example, t

To switch databases, issue the use `db` helper, as in the following example:
```
use <database>
```



- `db` refers to the current database.
- `myCollection` is the name of the collection.

## Customize the mongo Prompt

Edit the `~/.mongorc.js` file with the following

```
host = db.serverStatus().host;
prompt = function() {
             return db+"@"+host+"$ ";
         }
```


## Importing Data into MongoDB

### Import DNA Methylation Data into Mongo
https://github.com/apfejes/epigenetics-software/wiki/Import-DNA-Methylation-Data-into-Mongo

### Import 200 millions rows
https://www.khalidalnajjar.com/insert-200-million-rows-into-mongodb-in-minutes/


### Import ReMap all peaks BED, as simple BED tab file
```
mongoimport -d remap2020 -c hsap_all_peaks --type tsv --file remap2020_all_macs2_hg38_v1_0.bed -f chrom,chromStart,chromEnd,name,score,strand,thickStart,thickEnd,itemRgb  --numInsertionWorkers 2

2021-01-05T14:11:11.874+0100	connected to: mongodb://localhost/
2021-01-05T14:11:14.874+0100	[........................] remap2020.hsap_all_peaks	51.7MB/13.4GB (0.4%)
[...]
2021-01-05T14:28:11.961+0100	[########################] remap2020.hsap_all_peaks	13.4GB/13.4GB (100.0%)
2021-01-05T14:28:11.961+0100	164732372 document(s) imported successfully. 0 document(s) failed to import.
```

Quick query
```
db.hsap_all_peaks.find( {} )
```


### Indexing 
```
db.hsap_all_peaks.createIndex(
	{chrom:1}
)
db.hsap_all_peaks.createIndex(
	{chrom:1,chromStart:1,chromEnd:1}
)

```
#-- returns
```
{
	"createdCollectionAutomatically" : false,
	"numIndexesBefore" : 1,
	"numIndexesAfter" : 2,
	"ok" : 1
}
```
Pour obtenir la liste de tous les index 
```
> db.hsap_all_peaks.getIndexes()
[
	{
		"v" : 2,
		"key" : {
			"_id" : 1
		},
		"name" : "_id_",
		"ns" : "remap2020.hsap_all_peaks"
	},
	{
		"v" : 2,
		"key" : {
			"chrom" : 1,
			"chromStart" : 1,
			"chromEnd" : 1
		},
		"name" : "chrom_1_chromStart_1_chromEnd_1",
		"ns" : "remap2020.hsap_all_peaks"
	}
]
```

Make some queries
```
db.hsap_all_peaks.find({ chrom: "chr2",  chromStart: {$gte: 50967094}, chromEnd:{$lte: 50970983} }  ).count()
db.hsap_all_peaks.find({ chrom: "chr18",  chromStart: {$gte: 50967094}, chromEnd:{$lte: 50970983} }  ).pretty()

```



###  mongoDB documentation in French
https://mongoteam.gitbooks.io/introduction-a-mongodb/content/01-presentation/index.html






