FROM hyperledger/fabric-ccenv:1.4
WORKDIR /runtime
COPY . /runtime
RUN npm config set registry https://mirrors.huaweicloud.com/repository/npm/
RUN npm install -g lerna@2.0.0
RUN lerna bootstrap
WORKDIR /def
ENTRYPOINT ["node", "/runtime/packages/composer-runtime-hlfv1/bin/start-network"]
