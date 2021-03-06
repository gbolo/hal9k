# ECDSA -------------------------------------------------------------------------------
# Create ECDSA keypair
openssl ecparam -name secp384r1 -genkey -noout -out /tmp/secp384r1-key.pem
# View the private/public key portions
openssl ec -in /tmp/secp384r1-key.pem -text -noout
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
openssl verify -verbose -CAfile /tmp/secp384-x509.pem /tmp/secp384r1-server1-x509.pem
# verify over https



# RSA fill this in later... ----------------------------------------------------------


# Converting certs --------------------------------------------------------------------
# from der to pem
openssl x509 -inform der -in test.der -out test.pem
# from pem to der
openssl x509 -outform der -in test.pem -out test.der


# Viewing Certs ----------------------------------------------------------------------
# Check a Certificate Signing Request (CSR)
openssl req -text -noout -verify -in CSR.csr
# Check a private key
openssl rsa -in privateKey.key -check
# Check a certificate
openssl x509 -in certificate.crt -text -noout
# Check a PKCS#12 file (.pfx or .p12)
openssl pkcs12 -info -in keyStore.p12

# Connecting over https
openssl s_client -connect 127.0.0.1:7050

# performance testing -----------------------------------------------------------------
# basic aes tests software only (no hardware aes-in)
openssl speed aes-128-cbc aes-192-cbc aes-256-cbc
# enable hardware aes-in
openssl speed -evp aes-128-cbc aes-192-cbc aes-256-cbc
# increase threads
openssl speed -elapsed -evp aes-128-cbc -multi 4

