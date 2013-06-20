#!/bin/bash

# Automated script to start the NDB Management Server (ndb_mgmd), add data nodes to the cluster (ndbd) and start the mysql API daemon (mysqld)

# Start ndb_mgmd
/opt/mysql/server-5.5/bin/ndb_mgmd -f /home/stryker/venture/ground-control/mysql-cluster-data/conf/config.ini --initial --configdir=/home/stryker/venture/ground-control/mysql-cluster-data/conf/

# Add data nodes (ndbd) to the cluster
/opt/mysql/server-5.5/bin/ndbd -c localhost:1186
/opt/mysql/server-5.5/bin/ndbd -c localhost:1186
#ndbd -c localhost:1186

# Start mysql API daemon (mysqld)
if [ "true" == "$1" ]; then
	/opt/mysql/server-5.5/bin/mysqld --defaults-file=/home/stryker/venture/ground-control/mysql-cluster-data/conf/my.cnf &
fi

# Start memcached server
#/opt/mysql/server-5.5/bin/memcached -E /opt/mysql/server-5.5/lib/ndb_engine.so -e "connectstring=localhost:1186;role=ndb-caching"

exit 0

