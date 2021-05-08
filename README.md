# composer-runtime-hlfv1

It's from [hyperledger-composer](https://github.com/hyperledger-archives/composer).

Projects in `./runtime/packages` is unmodified.

## Usage

1. build this basic image.
```shell
docker build -t citacloud/composer-runtime-hlfv1 .
```

2. build your business-network on top of this basic image.

```Dockerfile
# Add this Dockerfile in your business-network-definition folder.
FROM citacloud/composer-runtime-hlfv1
COPY . /bnd
WORKDIR /bnd
ENTRYPOINT ["node", "/runtime/packages/composer-runtime-hlfv1/bin/start-network"]
```
```sh
# In your business-network-definition folder, build the docker image.
docker build -t citacloud/trade-network:0.2.6 .
```

3.. run
```sh
# Replace `CORE_CHAINCODE_ID_NAME` with your business-network name
docker run \
    -e CORE_CHAINCODE_ID_NAME="trade-network" \
    -e CORE_PEER_LOCALMSPID="Org1MSP" \
    -e CORE_PEER_TLS_ENABLED="false" \
    --network=host \
    -d \
    citacloud/trade-network:0.2.6 \
    --peer.address 127.0.0.1:7052
```
