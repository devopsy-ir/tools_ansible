openssl genrsa -out ca.key 2048

openssl req -new -x509 -days 365 -key ca.key -subj "/C=CN/ST=GD/L=SZ/O=Acme, Inc./CN=Acme Root CA" -out ca.crt

openssl req -newkey rsa:2048 -nodes -keyout priv.key -subj "/C=CN/ST=GD/L=SZ/O=Acme, Inc./CN=*.insa.lr" -out cert.crt

openssl x509 -req -extfile <(printf "subjectAltName=DNS:insa.lr,DNS:www.insa.lr") -days 365 -in cert.crt -CA ca.crt -CAkey ca.key -CAcreateserial -out cert.crt

........................
[Remote machine]
sudo scp root@192.168.122.117:/root/tools/nginx/insa/certs/ssl/insa.lr/ca.crt ./ca-self-signed-openssl.crt

sudo cat ca-self-signed-openssl.crt >> /etc/ssl/certs/ca-certificates.crt

sudo update-ca-certificates --fresh

sudo docker login docker.insa.lr
