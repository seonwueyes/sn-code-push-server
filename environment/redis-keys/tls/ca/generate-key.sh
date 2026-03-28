# CA 개인 키 생성
openssl genpkey -algorithm RSA -out ca.key

# CA 인증서 생성 (유효기간 10년)
openssl req -x509 -new -nodes -key ca.key -sha256 -days 18250 -out ca.crt -subj "/CN=MyRedisCA"

