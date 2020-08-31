# 镜像集成，也可以直接使用latest
FROM centos:8

# 安装依赖
RUN yum -y update  
RUN yum -y install wget gcc

# 安装node环境
ENV NODE_VERSION v12.18.1
RUN mkdir -p /node/$NODE_VERSION
RUN wget https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.gz
RUN tar xzf node-$NODE_VERSION-linux-x64.tar.gz -C /node/
ENV PATH  /node/node-$NODE_VERSION-linux-x64/bin:$PATH

WORKDIR /before-server-dir
RUN npm install before-server -g

# 暴露端口
EXPOSE 8000
EXPOSE 8443
EXPOSE 8555

CMD ["before-server"]
# 构建和运行
# docker pull docker.pkg.github.com/before-server-images/before-server
# docker run -dit --rm --name running-before-server -p 8000:8000 -p 8443:8443 -p 8555:8555 -v /your-custom-dir:/before-server-dir before-server
# 进入容器
# docker exec -it running-before-server bash
# 停止容器
# docker stop running-before-server
# 查看日志
# docker logs running-before-server

