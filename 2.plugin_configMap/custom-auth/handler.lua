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
  kong.log.inspect(httpc)

  local auth_check_query =  "?httpMethod=" .. kong.request.get_method() .."&&" .."requestPath="..kong.request.get_path()
  local jwt_token = kong.request.get_header(conf.token_header)
  local headers = kong.request.get_headers()

  kong.log.inspect(headers)

  if jwt_token then
    headers[conf.token_header] = jwt_token
  end

  -- todo : need to modify shcema (http) : etc... 
  local auth_check_uri = "http://" ..conf.auth_host .. ":" ..conf.auth_port .. conf.auth_urlpath

  local res, err = httpc:request_uri(auth_check_uri, {
    method = "GET",
    headers = headers,
    query = auth_check_query,
    body = json.encode({
      clientIP = kong.client.get_ip(),
      method = kong.request.get_method(),
      urlPath = kong.request.get_path(),
      queryString = kong.request.get_raw_query(),
    }),
  })

  if not res then
    ngx.log(ngx.ERR, "request failed: ", err)
    return
  end

  kong.log.debug("http://" ..conf.auth_host .. ":" ..conf.auth_port )
  kong.log.inspect(res)

  if res.status ~= 200 then
    if res.status == 500 then
      kong.log.err("Internal server error", res.status)
    end
    return kong.response.exit(res.status,  res.body , {
      ["Content-Type"] = "application/json"
    })
  end

  -- renew access token send to Upstream API & to Client (Front)
  local renew_access = res.headers["access_token"]
  local req_set_header = ngx.req.set_header
  if renew_access ~= nil then 
    kong.response.set_header("extra-header-for-request", "YANGJINA")
    req_set_header("Authorization", res.headers["access_token"] )
    kong.response.set_header("access_token", res.headers["access_token"] )
  end

  -- TokenHandler 끝 
end

return TokenHandler
