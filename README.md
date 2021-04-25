# composer-runtime-hlfv1

It's from [hyperledger-composer](https://github.com/hyperledger-archives/composer).

Projects in `./runtime/packages` is unmodified.

## Usage

1. place your network in `./def`
```shell
mkdir -p def
mv /path/to/bnd/* def
```

2. build docker image
```shell
docker build -t citacloud/composer-runtime-hlfv1 .
```

3.. run
```shell
# Replace `CORE_CHAINCODE_ID_NAME` with your business network name
docker run \
    -e CORE_CHAINCODE_ID_NAME="trade-network" \
    -e CORE_PEER_LOCALMSPID="Org1MSP" \
    -e CORE_PEER_TLS_ENABLED="false" \
    --network=host \
    -d \
    citacloud/composer-runtime-hlfv1 \
    --peer.address 127.0.0.1:7052
```
