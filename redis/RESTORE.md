## Redis 백업/복구

### 백업

```bash
# PWD: redis
./backup.sh
```

백업 결과는 `redis/backup/<timestamp>/`에 생성된다.

### 복구

1. Redis 컨테이너 중지
```bash
# PWD: redis
docker-compose down
```

2. 기존 데이터 디렉토리 백업
```bash
mv redis-data "redis-data.bak.$(date +%Y%m%d-%H%M%S)"
mkdir -p redis-data
```

3. 백업본 복원
```bash
# 예시: redis/backup/20260329-101010
cp backup/<timestamp>/dump.rdb redis-data/dump.rdb
cp backup/<timestamp>/appendonly* redis-data/ 2>/dev/null || true
```

4. Redis 컨테이너 재기동
```bash
docker-compose up -d
```

5. 정상 동작 확인
```bash
docker-compose exec -T redis-cli /bin/sh -c \
  "redis-cli -h redis-server -p 6379 -a 'passw0rd' \
  --tls --cert /opt/bitnami/redis/certs/client.crt \
  --key /opt/bitnami/redis/certs/client.key \
  --cacert /opt/bitnami/redis/certs/ca.crt \
  PING"
```
