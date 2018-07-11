FROM cita/cita-run:ubuntu-18.04-20180703
LABEL maintainer="Cryptape Technologies <contact@cryptape.com>"

RUN git clone https://github.com/cryptape/solidity.git \
    && cd solidity \
    && git checkout ubuntu-16 \
    && git submodule update --init --recursive \
    && ./scripts/install_ubuntu16_deps.sh \
    && ./scripts/build.sh \
    && cp /usr/local/bin/solc /usr/bin \
    && chmod +x /usr/bin/solc

COPY libsolidity.so /usr/local/lib/

WORKDIR /opt/cita-run

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
