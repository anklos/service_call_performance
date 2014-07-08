HTTP call vs Socket call
========================

##HTTP

Run `coffee http_client.coffee` and `coffee http_server.coffee` to start two http servers.

##Socket
Run`coffee socket_client.coffee` and `coffee socket_server.coffee` to start two socket servers.

##Socket pool
Run`coffee socket_pool_client.coffee` and `coffee socket_pool_server.coffee` to start two socket pool servers.


##Performance
Run `ab -n 2000 -c 100  http://localhost:8889/`


##Result

### socket pool
```
  50%     13
  66%     14
  75%     15
  80%     15
  90%     19
  95%     22
  98%     24
  99%     24
 100%     25 (longest request)

  50%     12
  66%     13
  75%     14
  80%     14
  90%     15
  95%     21
  98%     26
  99%     26
 100%     26 (longest request)


  50%     13
  66%     14
  75%     15
  80%     15
  90%     18
  95%     22
  98%     25
  99%     25
 100%     25 (longest request)
```

### socket
```
  50%     25
  66%     26
  75%     27
  80%     29
  90%     32
  95%     36
  98%     38
  99%     40
 100%     41 (longest request)

  50%     25
  66%     26
  75%     28
  80%     29
  90%     32
  95%     34
  98%     37
  99%     39
 100%     39 (longest request)

  50%     24
  66%     26
  75%     27
  80%     28
  90%     33
  95%     37
  98%     37
  99%     39
 100%     39 (longest request)
```

### http
```
  50%     46
  66%     52
  75%     54
  80%     55
  90%     63
  95%     75
  98%     78
  99%     79
 100%     81 (longest request)

  50%     38
  66%     43
  75%     46
  80%     46
  90%     49
  95%     59
  98%     62
  99%     62
 100%     71 (longest request)

  50%     38
  66%     41
  75%     43
  80%     45
  90%     48
  95%     50
  98%     50
  99%     51
 100%     56 (longest request)
```

