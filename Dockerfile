FROM hyperledger/fabric-ccenv:1.4
COPY runtime /runtime
WORKDIR /runtime
RUN npm install -g lerna@2.0.0 --unsafe-perm=true
RUN lerna bootstrap
