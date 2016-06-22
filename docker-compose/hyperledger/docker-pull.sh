# BASE IMAGE
docker pull gbolo/hyperledger:latest
docker tag gbolo/hyperledger:latest hyperledger/fabric-baseimage:latest

# PEER
docker pull gbolo/hyperledger-peer:pbft

