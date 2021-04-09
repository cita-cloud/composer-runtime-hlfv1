# composer-runtime-hlfv1

It's from [hyperledger-composer](https://github.com/hyperledger-archives/composer).

Projects in `./packages` is unmodified.

## Usage
1. build docker image
```shell
docker build -t composer-runtime-hlfv1 .
```

2. run
```shell
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ENABLED="false"
# Replace this with your business network name
export CORE_CHAINCODE_ID_NAME="BusinessNetworkName"
```

```shell
# Replace /path/to/bnd with your bnd path
docker run \
    -e CORE_PEER_TLS_ENABLED \
    -e CORE_PEER_LOCALMSPID \
    -e CORE_CHAINCODE_ID_NAME \
    --network=host \
    -v /path/to/bnd:/def \
    -d \
    citacloud/composer-runtime-hlfv1 \
    --peer.address 127.0.0.1:7052
```
