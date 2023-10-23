local http = require "resty.http"
local json = require "cjson"

local TokenHandler = {
  PRIORITY = 1000,
  VERSION = "0.1",
}

function TokenHandler:access(conf)
  kong.log.inspect(conf)
  
  local httpc = http.new()
  httpc:connect(conf.auth_host, conf.auth_port)

  local auth_check_query =  "httpMethod=" .. kong.request.get_method() .."&&" .."requestPath="..kong.request.get_path()
  local jwt_token = kong.request.get_header(conf.token_header)
  local headers = kong.request.get_headers()

  kong.log.inspect(headers)

  if jwt_token then
    headers[conf.token_header] = jwt_token
  end

  local res, err = httpc:request({
    method = "GET",
    path = conf.auth_urlpath,
    headers = headers,
    query = auth_check_query,
    body = json.encode({
      clientIP = kong.client.get_ip(),
      method = kong.request.get_method(),
      urlPath = kong.request.get_path(),
      queryString = kong.request.get_raw_query(),
    }),
  })

  local req_set_header = ngx.req.set_header

  kong.log.debug("40")
  kong.log.inspect(res)
  kong.log.debug("42")
  kong.log.inspect(req_set_header)
  kong.log.inspect(res.headers["access_token"])
  kong.log.debug("44")



  local reader = res.body_reader
  local buffer_size = 16384
  local rstl = ''
  repeat
      local buffer, err = reader(buffer_size)
      if err then
          ngx.log(ngx.ERR, err)
          break
      end
      if buffer then
        rstl = rstl .. buffer
      end
  until not buffer

  kong.log.inspect(rstl)

  if not res then
    kong.log.err("Failed to call auth_endpoint:", err)
    return kong.response.exit(500)
  end

  if res.status ~= 200 then
    if res.status == 500 then
      kong.log.err("Internal server error", res.status)
    end
    return kong.response.exit(res.status,  rstl , {
      ["Content-Type"] = "application/json"
    })



  end
end

return TokenHandler
