if   [  $SERVER_PORT  ];
then
   /usr/local/src/jdk1.8.0_271/bin/java -Dserver.port=$SERVER_PORT -Xms4g -Xmx4g -jar /usr/local/src/trace-filter-0.0.1-SNAPSHOT.jar
else
   /usr/local/src/jdk1.8.0_271/bin/java -Dserver.port=8000 -Xms4g -Xmx4g -jar /usr/local/src/trace-filter-0.0.1-SNAPSHOT.jar
fi