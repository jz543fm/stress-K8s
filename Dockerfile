FROM ubuntu:latest

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget curl openssl ca-certificates nmap memtester

WORKDIR /usr

# Build stress from source.
RUN apt-get install -y g++ make curl autoconf && \
    curl -sSLO https://github.com/resurrecting-open-source-projects/stress/releases/download/1.0.7/stress-1.0.7.tar.gz && \
    tar -xvf stress-1.0.7.tar.gz && rm -rf stress-1.0.7.tar.gz &&  cd stress-1.0.7 && ./autogen.sh && ./configure && make && make install && cp -r src/stress /usr/local/bin

# Clean up the package cache to reduce the image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*