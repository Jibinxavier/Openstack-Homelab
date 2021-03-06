#!/usr/bin/env bash
# openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
#   -keyout example.key -out example.crt -extensions san -config \
#   <(echo "[req]"; 
#     echo distinguished_name=req; 
#     echo "[san]"; 
#     echo subjectAltName=DNS:example.com,DNS:www.example.net,IP:10.0.0.1
#     ) \
#   -subj "/CN=example.com"


# openssl x509 -req -in creq.pem -sha1 -CA example.crt-CAkey skey.pem -CAcreateserial -out ccert.pem




# openssl req -x509 -newkey rsa:4096 -sha256 -days 3650   -nodes \
#   -keyout client.key -out client.crt -extensions san -config \
#   <(echo "[req]"; 
#     echo distinguished_name=req; 
#     echo "[san]"; 
#     echo subjectAltName=DNS:assa.com,DNS:www.asa.net,IP:11.0.0.1
#     ) \
#   -subj "/CN=test.client.com"



# #Convert a certificate to a certificate request:

#  openssl req -newkey rsa:1024 -nodes -sha1 -keyout rootkey.pem -out rootreq.pem
# #sign
#  openssl x509 -req -in rootreq.pem -sha1 -signkey rootkey.pem -out rootcert.pem


#  openssl req -newkey rsa:1024   -nodes -sha1 -keyout ckey.pem -out creq.pem

# openssl x509 -req -in creq.pem -sha1 -CA rootcert.pem -CAkey rootkey.pem -CAcreateserial -out ccert.pem


# openssl verify -CAfile rootcert.pem ccert.pem


