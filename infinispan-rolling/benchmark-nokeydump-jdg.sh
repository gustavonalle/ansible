set -e

ENTRIES=$1

echo "Purging data source cluster"
./jdg-cache-clear.sh -l cluster1

echo "Purging data target cluster"
./jdg-cache-clear.sh -l cluster2

echo "Loading data in source cluster"
./jdg-cache-load.sh -l cluster1 --entries $1 

echo "Sync data on target cluster"
./jdg-cache-synchronize-data.sh -l cluster2

echo "Finished, source cluster size after load"
./jdg-cache-size.sh -l cluster1
echo "Finished, target cluster size after load"
./jdg-cache-size.sh -l cluster2
