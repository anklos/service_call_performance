_   = require 'lodash'
net = require 'net'
http = require 'http'
Q = require 'q'


POOL_SIZE = 3
MULTI_NUM = 200

socketPool = []

count = POOL_SIZE

initPool = () ->
  deferred = Q.defer()

  while count
    count--
    stream = net.connect {port: 8888}, () ->
      socketPool.push stream
      if count == 0
        deferred.resolve()

  return deferred.promise

initStreams = () ->
  for stream in socketPool
    #this particualr stream get data back
    #just check msn from data
    stream.on 'data', (msg) ->
      # decode data
      # find callback in the tunnel
      #
      data = msg.toString()

      while data.indexOf('*start*') > -1
       s = data.indexOf '*start*'
       e = data.indexOf '*end*'

       d = data[s+7..e-1]
       i = d.indexOf(' ')

       msn = parseInt d[0..i-1]

       # callback

       stream.tunnels[msn].callback d
       stream.tunnels[msn].callback = null

       data = data.substring(e+5)

    stream.tunnels = []
    for i in [0..MULTI_NUM-1]
      stream.tunnels[i] =
        msn:      i
        callback: null

initPool().then initStreams

pickFrom = (pool) ->
  for stream in pool
    tunnel = _.find stream.tunnels, (t) -> !t.callback
    if tunnel
      return [stream, tunnel]

server = http.createServer (req, resp) ->

  [stream, tunnel] = pickFrom socketPool

  # save resp reference in the callback
  tunnel.callback = (data) ->
    resp.end data

  buffer = new Buffer("*start*#{tunnel.msn} hello*end*")
  stream.write(buffer)

  #TODO handle partial chunk

server.listen 8889

server.on 'end', () ->
  _.map socketPool, (s) -> s.end()
