net = require 'net'

s = net.createServer (c)->
  c.on 'data', (msg) ->
    c.write 's1 received'

s.listen 8888

