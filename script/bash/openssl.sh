# ECDSA -------------------------------------------------------------------------------
# Create ECDSA keypair
openssl ecparam -name secp384r1 -genkey -noout -out /tmp/secp384r1-key.pem
# Extract public key if you want to...
openssl ec -in /tmp/secp384r1-key.pem -pubout -out /tmp/secp384r1-pub.pem
# Generate x509 cert signed by private key
openssl req -new -x509 -key /tmp/secp384r1-key.pem -out /tmp/secp384-x509.pem -days 365

# Validate matches - public key of x509 cert should match
openssl x509 -in /tmp/secp384-509.pem -noout -pubkey

# To sign certs (CA)
# create a CSR from a another keypair
openssl req -new -SHA384 -key /tmp/secp384r1-server1-key.pem -nodes -out /tmp/secp384r1-server1-csr.pem
# view CSR
openssl req -in /tmp/secp384r1-server1-csr.pem -noout -text
# sign it
openssl x509 -req -SHA384 -days 360 -in /tmp/secp384r1-server1-csr.pem -CA /tmp/secp384-x509.pem -CAkey /tmp/secp384-x509-key.pem -CAcreateserial -out /tmp/secp384r1-server1-x509.pem
# verify


# RSA fill this in later... ----------------------------------------------------------



# Connecting over https
openssl s_client -connect 127.0.0.1:7050
