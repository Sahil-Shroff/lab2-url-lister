USER := $(shell whoami)

##
## Configure the Hadoop classpath for the GCP dataproc environment
##
HADOOP_CLASSPATH := $(shell hadoop classpath)

UrlCount.jar: UrlCount.java
	javac -source 11 -target 11 -classpath $(HADOOP_CLASSPATH) -d ./ UrlCount.java
	jar cf UrlCount.jar UrlCount*.class
	-rm -f UrlCount*.class

prepare: filesystem
	hdfs dfs -mkdir -p /user/$(USER)/input
	curl -L https://en.wikipedia.org/wiki/Apache_Hadoop > /tmp/input.txt
	hdfs dfs -put -f /tmp/input.txt /user/$(USER)/input/file01
	curl -L https://en.wikipedia.org/wiki/MapReduce > /tmp/input.txt
	hdfs dfs -put -f /tmp/input.txt /user/$(USER)/input/file02

filesystem:
	hdfs dfs -mkdir -p /user
	hdfs dfs -mkdir -p /user/$(USER)

run: UrlCount.jar prepare
	-hdfs dfs -rm -r -f /user/$(USER)/output
	hadoop jar UrlCount.jar UrlCount /user/$(USER)/input /user/$(USER)/output

##
## You may need to change the path for this depending
## on your Hadoop / java setup
##
HADOOP_V=3.3.4
STREAM_JAR = /usr/local/hadoop-$(HADOOP_V)/share/hadoop/tools/lib/hadoop-streaming-$(HADOOP_V).jar

stream:
	-rm -rf stream-output
	hadoop jar $(STREAM_JAR) \
	-mapper Mapper.py \
	-reducer Reducer.py \
	-file Mapper.py -file Reducer.py \
	-input input -output stream-output
