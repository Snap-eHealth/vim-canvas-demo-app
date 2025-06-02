#!/bin/bash
openssl req -x509 -newkey rsa:4096 -keyout cert.key -out cert.crt -sha256 -days 3650 -nodes -subj "/CN=localhost" -extensions EXT -config <( \
   printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ./cert.crt