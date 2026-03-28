# 클라이언트용 개인 키 생성
openssl genpkey -algorithm RSA -out client.key

# 클라이언트 인증서 서명 요청 (CSR) 생성
openssl req -new -key client.key -out client.csr -subj "/CN=redis-client"

# 클라이언트 인증서 서명 (유효기간 50년)
openssl x509 -req -in client.csr -CA ../ca/ca.crt -CAkey ../ca/ca.key -CAserial ../ca/ca.srl -CAcreateserial -out client.crt -days 18250 -sha256

# ca.crt 복사 
cp ../ca/ca.crt .

