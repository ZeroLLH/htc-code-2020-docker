#HTC-CODE-2020-DOCKER
##Docker run DEMO
###Requirement
```
系统安装并启动了docker
```
###Command
```
docker pull registry.cn-hangzhou.aliyuncs.com/cloud_native_match/tail-base-sampling:0.2
docker run --rm -it  --net host -e "SERVER_PORT=8000" --name "clientprocess1" -d registry.cn-hangzhou.aliyuncs.com/cloud_native_match/tail-base-sampling:0.2
docker run --rm -it  --net host -e "SERVER_PORT=8001" --name "clientprocess2" -d registry.cn-hangzhou.aliyuncs.com/cloud_native_match/tail-base-sampling:0.2
docker run --rm -it  --net host -e "SERVER_PORT=8002" --name "backendprocess" -d registry.cn-hangzhou.aliyuncs.com/cloud_native_match/tail-base-sampling:0.2

docker pull registry.cn-hangzhou.aliyuncs.com/cloud_native_match/scoring:0.1
docker run --rm --net host -e "SERVER_PORT=8081" --name scoring -d registry.cn-hangzhou.aliyuncs.com/cloud_native_match/scoring:0.1
```
###Scoring Output
```
begin output result :
{"score":1008,"f1":80000000,"checkSumRightCount":800,"checkSumWrongCount":0,"checkSumMissCount":0,"noErrorTracingCount":0,"useTime":79289,"startTime":1606067213316,"endTime":1606067292605}
 end output result.
```
##Docker run Max's app
###Requirement
```
系统安装并启动了docker
```
###Steps
```
1. 把jdk8-271(重命名为jdk8.tar.gz)放进trace-aggregator和trace-filter的文件夹中(或者改start.sh的jdk版本)
2. 把打好的jar分别放进trace-image的文件夹中
3. docker build -t "trace-image" .
```
###Running Commands
```
docker run --rm -it  --net host -e "SERVER_PORT=8000" -m=4G --memory-swap=0 --cpuset-cpus="0,1" --name "trace-filter1" -d trace-image
docker run --rm -it  --net host -e "SERVER_PORT=8001" -m=4G --memory-swap=0 --cpuset-cpus="2,3" --name "trace-filter2" -d trace-image
docker run --rm -it  --net host -e "SERVER_PORT=8002" -m=2G --memory-swap=0 --cpuset-cpus="4" --name "trace-aggregator" -d trace-image
docker run --rm --net host -e "SERVER_PORT=8081" -m=1G --memory-swap=0 --cpuset-cpus="5,6" --name scoring -d registry.cn-hangzhou.aliyuncs.com/cloud_native_match/scoring:0.1
```
###Push Commands
```
docker login --username=ethanlhliang registry.cn-shanghai.aliyuncs.com
docker tag trace-image registry.cn-shanghai.aliyuncs.com/htc-code-2020/htc-code-2020:<version>
docker push registry.cn-shanghai.aliyuncs.com/htc-code-2020/htc-code-2020:<version>
```