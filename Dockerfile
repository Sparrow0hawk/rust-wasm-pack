FROM --platform=linux/amd64 rust:1.70-buster

# update apt
RUN apt update && apt install -y curl

# install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

RUN . ~/.bashrc && nvm install 18 && nvm use 18

# install wasm-pack
RUN curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

ENTRYPOINT ["bash","--login","-c"]
