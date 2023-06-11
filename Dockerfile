FROM --platform=linux/amd64 rust:1.70-buster

# update apt
RUN apt update && apt install -y curl

ENV NVM_DIR /usr/local/nvm 
ENV NODE_VERSION v18.12.0

RUN mkdir -p ${NVM_DIR}

# install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

ENV NODE_PATH $NVM_DIR/versions/node/$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH

RUN . ~/.bashrc && nvm install ${NODE_VERSION} && nvm use ${NODE_VERSION}

# install wasm-pack
RUN curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

ENTRYPOINT ["/bin/bash","-c"]
