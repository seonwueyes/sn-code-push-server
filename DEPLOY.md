## 인증키 준비

### Redis Keys 생성

environment/redis-keys 디랙토리에 이동해서 다음의 명령어를 실행한다. 명령어를 수행하면 인증키를 만들고 api 프로젝트 하위에 redis-key 디랙토리를 만들고 복사한다.

```
// PWD : environment/redis-keys
generate-key.sh
```

### Redis 컨테이너 생성 및 실행

Redis 컨테이너를 docker-compose 명령어로 생성 및 실행한다. 다음의 명령어로 실행하면 redis-server, redis-client 서비스가 뜬다.

```
// PWD : redis
docker-compose up -d
```

redis-client에 컨테이너는 테스트 용도로 만든 것이며 이 컨테이너 안에 들어가서 'connect-cli.sh'의 명령어를 실행해 보면 정상적으로 redis-server에 접속되는 것이 확인할 수 있다.

### Redis 백업/복구

Redis는 RDB 스냅샷 + AOF를 사용한다. 백업/복구 절차는 아래 문서를 참고한다.

```
redis/RESTORE.md
```

### SeaweedFS 컨테이너 생성 및 실행

SeaweedFS는 AWS S3 형태의 오픈소스라고 생각하면 된다. AWS S3라고 가정하고 개발했기 때문에 여기서는 SeawedFS로 사용한다.

```
// PWD : storage-seaweedfs
docker-compose up -d
```

### MinIO 컨테이너 생성 및 실행

MinIO도 AWS S3 형태의 유료 서비스(오픈소스도 일부 제공)라고 생각하면 된다. AWS S3라고 가정하고 개발했기 때문에 여기서는 MinIO로 사용한다.

```
// PWD : storage-minio
docker-compose up -d
```

### CodePush-API 컨테이너 생성 및 실행

작성중...
