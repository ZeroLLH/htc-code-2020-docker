if   [  $SERVER_PORT == 8002  ];
then
  /usr/local/src/jdk1.8.0_271/bin/java -Dserver.port=$SERVER_PORT -Xms1500m -Xmx1500m -server -jar /usr/local/src/trace-aggregator-0.0.1-SNAPSHOT.jar
else
  /usr/local/src/jdk1.8.0_271/bin/java -Dserver.port=$SERVER_PORT -Xms3500m -Xmx3500m -server -jar /usr/local/src/trace-filter-0.0.1-SNAPSHOT.jar --htc.filter.parallelPoolSize=10
fi