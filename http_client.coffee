http = require 'http'
http.globalAgent.maxSockets = 1000

s = http.createServer (req, resp) ->
   options =
      hostname: 'localhost',
      port: 8888,
      method: 'POST'

    req2 = http.request options, (res) ->
      res.on 'data', (data) ->
        resp.end()

    req2.write('a simple request')

process.on 'uncaughtException', (e) ->
  console.log e.stack

s.listen 8889
