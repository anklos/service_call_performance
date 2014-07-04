net = require 'net'
http = require 'http'

s = http.createServer (req, resp) ->

  client = net.connect {port: 8888}, () ->
    client.write('hello')

  client.on 'data', (data) ->
    client.end()
    resp.end()

s.listen 8889



