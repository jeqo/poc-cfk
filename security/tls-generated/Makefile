all:

ca-pair:
	openssl genrsa -out ca-key.pem 2048
	openssl req -new -key ca-key.pem -x509 \
    	-days 1000 \
  		-out ca.pem \
  		-subj "/C=US/ST=CA/L=MountainView/O=Confluent/OU=Operator/CN=TestCA"

secret-tls-ca:
	kubectl create tls ca-pair-sslcerts --cert=ca.pem --key=ca-key.pem
