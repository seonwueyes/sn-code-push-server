current_dir=$(pwd)

# ca 생성 
cd "$current_dir"
cd ca; ./generate-key.sh
echo "generate ca."

# server key 생성 
cd "$current_dir"
cd server; ./generate-key.sh
echo "generate server."

# client key 생성 
cd "$current_dir"
cd client; ./generate-key.sh
echo "generate client."


# client redis key api 프로젝트로 복사  
cd "$current_dir"
mkdir -p ../../../api/redis-key
cp ./client/client.crt ../../../api/redis-key/
cp ./client/client.key ../../../api/redis-key/
cp ./client/ca.crt ../../../api/redis-key/
echo "copy client key to api."
