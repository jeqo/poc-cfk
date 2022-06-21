all: clean tls

clean: tls-rm

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

