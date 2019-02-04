FROM heroku/heroku:18
RUN curl -sSL https://github.com/jpillora/chisel/releases/download/1.3.1/chisel_linux_amd64.gz | gzip -d - > /bin/chisel
RUN chmod +x /bin/chisel
RUN useradd -m heroku
USER heroku
EXPOSE 5000
CMD chisel server --auth $CHISEL_AUTH --socks5
