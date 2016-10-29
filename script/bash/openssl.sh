# ECDSA -------------------------------------------------------------------------------
# Create ECDSA keypair
openssl ecparam -name secp384r1 -genkey -noout -out /tmp/secp384r1-key.pem
# Extract public key if you want to...
openssl ec -in /tmp/secp384r1-key.pem -pubout -out /tmp/secp384r1-pub.pem
# Generate x509 cert signed by private key
openssl req -new -x509 -key /tmp/secp384r1-key.pem -out /tmp/secp384-509.pem -days 365

# Validate matches - public key of x509 cert should match
openssl x509 -in /tmp/secp384-509.pem -noout -pubkey



# RSA fill this in later... ----------------------------------------------------------
