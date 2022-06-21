all: clean tls rbac

clean: tls-rm rbac-rm

tls: ca-pair

tls-rm:
	rm -rf tls
	mkdir -p tls

ca-pair:
	openssl genrsa -out tls/tls.key 2048
	openssl req -new -key tls/tls.key -x509 \
 	   	-days 1000 \
  		-out tls/tls.crt \
  		-subj "/C=US/ST=CA/L=MountainView/O=Confluent/OU=Operator/CN=TestCA"

rbac: rbac-token

rbac-rm:
	rm -rf rbac
	mkdir -p rbac

rbac-token:
	openssl genrsa -out rbac/mdsTokenKeyPair.pem 2048
	openssl rsa -in rbac/mdsTokenKeyPair.pem -outform PEM -pubout -out rbac/mdsPublicKey.pem

