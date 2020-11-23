if   [  $SERVER_PORT == 8002  ];
then
  /usr/local/src/jdk1.8.0_271/bin/java -Dserver.port=$SERVER_PORT -jar /usr/local/src/trace-aggregator-0.0.1-SNAPSHOT.jar
else
  /usr/local/src/jdk1.8.0_271/bin/java -Dserver.port=$SERVER_PORT -jar /usr/local/src/trace-filter-0.0.1-SNAPSHOT.jar
fi