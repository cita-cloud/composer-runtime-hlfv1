FROM hyperledger/fabric-ccenv:1.4
COPY runtime /runtime
WORKDIR /runtime
RUN npm install -g lerna@2.0.0 --unsafe-perm=true
RUN lerna bootstrap
COPY def /def
WORKDIR /def
ENTRYPOINT ["node", "/runtime/packages/composer-runtime-hlfv1/bin/start-network"]
