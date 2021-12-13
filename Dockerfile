FROM debian:testing
RUN apt-get update -y && \
    apt-get full-upgrade --autoremove -y && \
    apt-get install texlive-full -y && \
    rm -rf /var/lib/apt/lists/*
