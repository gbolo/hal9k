# chaincode deploy
/opt/fabric/peer/bin/peer --logging-level warning chaincode deploy \
-u jim \
-p github.com/hyperledger/fabric/examples/chaincode/go/chaincode_example02 \
-c '{"function":"init","args": ["a","800", "b", "900"]}'

# chaincode invoke
/opt/fabric/peer/bin/peer --logging-level warning chaincode invoke \
-n 8f566701539fa5b42cf521e91c8a5309a37dc59363c86a644214c28c85923fa81f7a02d03c015d22aef7b0bde8447f14a4f78dab4ab997f4bc06bb68f9377148 \
-u jim \
-c '{"args":["invoke", "a", "b", "100"]}'

# chaincode query
/opt/fabric/peer/bin/peer --logging-level warning chaincode query \
-n 8f566701539fa5b42cf521e91c8a5309a37dc59363c86a644214c28c85923fa81f7a02d03c015d22aef7b0bde8447f14a4f78dab4ab997f4bc06bb68f9377148 \
-u jim \
-c '{"args":["query", "a"]}'

# deploy membersrvc gui
mkdir /tmp/db
cp -rp /opt/fabric/membersrvc/data/cadir/*.db /tmp/db/
docker run --name membersrvc-gui \
-d -p 8080:80 \
-v /tmp/db:/data/nginx/www/api/db \
gbolo/docker-membersvc-gui
