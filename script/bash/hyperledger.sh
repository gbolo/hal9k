# chaincode deploy
/opt/fabric/peer/bin/peer --logging-level warning chaincode deploy \
-n cc2 -u jim \
-p github.com/hyperledger/fabric/examples/chaincode/go/chaincode_example02 \
-c '{"function":"init","args": ["a","100", "b", "200"]}'

/opt/fabric/peer/bin/peer --logging-level warning chaincode deploy \
-n cc4 -u jim \
-p github.com/hyperledger/fabric/examples/chaincode/go/chaincode_example04 \
-c '{"function":"init","args": ["some", "5"]}'

# deploy membersrvc gui
mkdir /tmp/db
cp -rp /opt/fabric/membersrvc/data/cadir/*.db /tmp/db/
docker run --name membersrvc-gui \
-d -p 8080:80 \
-v /tmp/db:/data/nginx/www/api/db \
gbolo/docker-membersvc-gui
