---
title: 加速Jenkins初始化安装插件
date: 2020-02-24 16:17:02
tags:
---

```shell
docker run -d --name jenkins -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
docker exec -t jenkins car /var/jenkins_home/secrets/initialAdminPassword
sed -i 's/http:\/\/updates.jenkins-ci.org\/download/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins/g' default.json && sed -i 's/http:\/\/www.google.com/https:\/\/www.baidu.com/g' default.json
```
