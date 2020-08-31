# before-server-images
```sh
# 构建和运行
docker pull docker.pkg.github.com/zy445566/before-server-images/before-server:latest
# /your-custom-dir必须要有.bsrc.js文件，既before-server的配置文件
docker run -dit --rm --name running-before-server -p 8000:8000 -p 8443:8443 -p 8555:8555 -v /your-custom-dir:/before-server-dir before-server
# 进入容器
docker exec -it running-before-server bash
# 停止容器
docker stop running-before-server
# 查看日志
docker logs running-before-server
```
