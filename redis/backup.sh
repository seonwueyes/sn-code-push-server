#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_ROOT="${ROOT_DIR}/backup"
DATA_DIR="${ROOT_DIR}/redis-data"

TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
OUT_DIR="${BACKUP_ROOT}/${TIMESTAMP}"

mkdir -p "${OUT_DIR}"

# Create a consistent RDB dump via TLS using the redis-cli container
docker-compose -f "${ROOT_DIR}/docker-compose.yml" exec -T redis-cli \
  /bin/sh -c "redis-cli -h redis-server -p 6379 -a 'passw0rd' \
  --tls --cert /opt/bitnami/redis/certs/client.crt \
  --key /opt/bitnami/redis/certs/client.key \
  --cacert /opt/bitnami/redis/certs/ca.crt \
  --rdb /tmp/dump.rdb >/dev/null 2>&1 && cat /tmp/dump.rdb" \
  > "${OUT_DIR}/dump.rdb"

cp -f "${DATA_DIR}/dump.rdb" "${OUT_DIR}/dump.rdb.local" 2>/dev/null || true
cp -f "${DATA_DIR}"/appendonly* "${OUT_DIR}/" 2>/dev/null || true

echo "Backup completed: ${OUT_DIR}"
