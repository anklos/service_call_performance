http = require 'http'

s = http.createServer (req, resp) ->
  resp.end 'a data'

s.listen 8888
