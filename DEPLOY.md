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

SeaweedFS는 S3 호환 오브젝트 스토리지로, 로컬 개발/테스트 환경에서 기본 스토리지로 사용한다.

```
// PWD : storage-seaweedfs
docker-compose up -d
```

### MinIO 컨테이너 생성 및 실행

MinIO는 S3 호환 오브젝트 스토리지이며, 이 프로젝트에서는 SeaweedFS 대신 선택적으로 사용할 수 있다.

```
// PWD : storage-minio
docker-compose up -d
```

### CodePush-API 컨테이너 생성 및 실행

CodePush-API는 컨테이너 내부에서 `pm2` + `node`로 실행된다. GitHub OAuth를 사용하며, 스토리지는 SeaweedFS(S3 호환)에 업로드한다.

1) 환경 변수 준비

`api/.env` 파일을 생성한다.

```
# Server
SERVER_URL=http://localhost:3000
API_PORT=3000

# GitHub OAuth
GITHUB_CLIENT_ID=YOUR_GITHUB_CLIENT_ID
GITHUB_CLIENT_SECRET=YOUR_GITHUB_CLIENT_SECRET

# Redis (TLS)
REDIS_HOST=redis-server
REDIS_KEY=passw0rd
CUSTOM_REDIS_TLS_CA=/app/redis-key/ca.crt
CUSTOM_REDIS_TLS_CRT=/app/redis-key/client.crt
CUSTOM_REDIS_TLS_KEY=/app/redis-key/client.key
CUSTOM_REDIS_TLS_SERVERNAME=redis-server

# S3 (SeaweedFS)
IS_AWS_S3=false
AWS_ENDPOINT=http://s3:8333
AWS_EXT_ENDPOINT=http://localhost:8333
AWS_BUCKET_NAME=codepush
AWS_ACCESS_KEY_ID=your_access_key
AWS_SECRET_ACCESS=your_secret_key
AWS_REGION=us-east-1
```

2) CodePush-API 컨테이너 실행

```
// PWD : api
docker-compose up -d --build
```

3) 정상 동작 확인

```
curl -s http://localhost:3000/ | head -n 1
```
