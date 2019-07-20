# ansible-docker

[![nodesource/node](http://dockeri.co/image/kento75/ansible-docker)](https://hub.docker.com/r/kento75/ansible-docker/)

OS： CentOS 7  
モジュール： Ansible latest

## セットアップコマンド

```
# イメージ作成
$ docker build -t ansible-docker:latest ./

# コンテナ作成 & ログイン
$ docker run --name ansible-container -it ansible-docker bash

# 起動中のコンテナにログイン
$ docker exec -it ansible-container bash

# コンテナの起動
$ docker start ansible-container

# コンテナの停止
$ docker stop ansible-container
```
