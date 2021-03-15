chisel-heroku
=============

Deploy [chisel](https://github.com/jpillora/chisel) to [Heroku](https://www.heroku.com/) as a [SOCKS5](https://en.wikipedia.org/wiki/SOCKS) proxy.

### Getting started

Use this button [![Heroku Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/mrluanma/chisel-heroku)

Or create a Heroku app manually:

```
$ heroku create
$ heroku stack:set container
$ heroku config:set CHISEL_AUTH=user:pass
$ git push heroku main
...
remote: Verifying deploy... done.
To https://git.heroku.com/shrouded-springs-35880.git
 * [new branch]      main -> main
```

Connect your chisel client:

```
$ chisel --version
1.7.6
$ chisel client --keepalive 10s --auth user:pass https://shrouded-springs-35880.herokuapp.com socks
...
2019/02/05 02:16:33 client: Connected (Latency 263.548181ms)
```

Point your SOCKS5 clients to `127.0.0.1:1080`

```
$ curl --socks5 127.0.0.1:1080 ifconfig.co
54.80.138.214
```
