redis-cli -h redis-server -p 6379 -a 'passw0rd' --tls --cert /opt/bitnami/redis/certs/client.crt --key /opt/bitnami/redis/certs/client.key --cacert /opt/bitnami/redis/certs/ca.crt

redis-cli -h redis-server -p 6379 -a 'passw0rd' \
  --tls \
  --cert /opt/bitnami/redis/certs/client.crt \
  --key /opt/bitnami/redis/certs/client.key \
  --cacert /opt/bitnami/redis/certs/ca.crt
