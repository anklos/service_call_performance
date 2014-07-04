HTTP call vs Socket call
========================

##HTTP

Run `coffee http_client.coffee` and `coffee http_server.coffee` to start two http servers.

##Socket
Run`coffee socket_client.coffee` and `coffee socket_server.coffee` to start two sockets servers.

##Performance
Run `ab -n 9000 -c 50  http://localhost:8889/`

