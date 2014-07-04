net = require 'net'

s = net.createServer (c)->
  c.on 'data', (msg) ->
    # find buffer length
    # get the correct length of buffer
    # convert to string, get the msn
    # write msn and response data
    #
    c.write msg


s.listen 8888
