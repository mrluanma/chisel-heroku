chisel-heroku
=============

Deploy [chisel](https://github.com/jpillora/chisel) to [Heroku](https://www.heroku.com/) as a [SOCKS5](https://en.wikipedia.org/wiki/SOCKS) proxy.

### Getting started

Make sure you have a working Docker installation (eg. `docker ps`) and that you’re logged in to Heroku (`heroku login`).

Log in to Container Registry:

```
$ heroku container:login
```

Create a Heroku app:

```
$ heroku create
Creating app... done, ⬢ calm-cliffs-52507
https://calm-cliffs-52507.herokuapp.com/ | https://git.heroku.com/calm-cliffs-52507.git
```

Set CHISEL_AUTH config:

```
$ heroku config:set CHISEL_AUTH=user:pass
Setting CHISEL_AUTH and restarting ⬢ calm-cliffs-52507... done, v3
CHISEL_AUTH: user:pass
```

Build the image and push to Container Registry:

```
$ heroku container:push web
```

Connect your chisel client:

```
$ chisel client --auth user:pass https://calm-cliffs-52507.herokuapp.com socks
2018/01/07 12:09:59 client: Connecting to wss://calm-cliffs-52507.herokuapp.com:443
2018/01/07 12:09:59 client: tunnel#1 127.0.0.1:1080=>socks: Listening
2018/01/07 12:10:01 client: Fingerprint ff:60:33:4b:48:8e:02:7a:cb:89:5d:1a:b2:86:16:de
2018/01/07 12:10:02 client: Connected (Latency 306.990655ms)
```

Point your SOCKS5 clients to `127.0.0.1:1080`

```
$ curl --socks5 127.0.0.1:1080 ifconfig.co
54.80.138.214
```
