
--[[  
local config = {
  aws_host       = "example.amazonaws.com",
  aws_key        = "AKIDEXAMPLE",
  aws_secret     = "wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY",
  aws_region     = "us-east-1",
  aws_service    = "service",
  aws_request    = 'aws4_request',
  content_type   = "application/x-amz-json-1.1",
  request_method = "GET",
  request_querystr = "Param1=value1&Param2=value2" ,  -- always in asc order !!! empty string if nothing
  request_path   = "/",    -- "/" if nothing 20150830T123600Z
  iso_date       = os.time({year=2015, month=08, day=30, hour=08, min=36,  sec=00}),   -- comment out in run. Only used for debug remeber iso time so set hour 4 hours early
  request_body   =  ""
} --]]
--local aws = aws_auth:new(config)

local crypto  =  require("crypto")
local json = require( "json" )
local aws_key, aws_secret, aws_region, aws_service, aws_host, aws_request
local iso_date, iso_tz, cont_type, req_method, req_path, req_body, req_querystr
local signed_header= 'host;x-amz-date'
local sessionToken

local _M = {
  _VERSION = '0.1.0'
}

local mt = { __index = _M }

-- init new aws auth
function _M.new(self, config)
  aws_key     = config.aws_key
  aws_secret  = config.aws_secret
  aws_region  = config.aws_region
  aws_service = config.aws_service
  aws_request = config.aws_request
  aws_host    = config.aws_host
  cont_type   = config.content_type  
  req_method  = config.request_method or "POST"
  req_path    = config.request_path   or "/"
  req_querystr= config.request_querystr or ""
  req_body    = config.request_body or ""
  sessionToken= nil
  -- set default time
  self:set_iso_date(config.iso_date or os.time())
  return setmetatable(_M, mt)
end

---Clears the Parse sessionToken.
--
-- NOTE: This does not clear or reset a user session with Parse, it only clears the sessionToken internally, in case you need to apply a new sessionToken.
-- @usage
-- parse:clearSessionToken()
function _M.clearSessionToken(self)
  print ("Clear Session")
  sessionToken = nil
end


function _M.newRequestParams(self, objMetaTable, objMetaTableKey, bodyData,awsAction)
  --set up headers
  local headers = {}
  local k,v
  local addheader 
  local headvalue 
  for k,v in pairs(objMetaTable[objMetaTableKey].headers) do 
    addheader = true
    if objMetaTable[objMetaTableKey].Actions[awsAction].authtype ~= true then
       if v.authtype == true then addheader = false  end
    end
    if addheader then
      headvalue =  v.value 
      headvalue = string.gsub( headvalue, "{actionname}", objMetaTable[objMetaTableKey].Actions[awsAction].name)
      headvalue = string.gsub( headvalue, "{contenttype}", objMetaTable.ContentType)
      headvalue = string.gsub( headvalue, "{host}", objMetaTable[objMetaTableKey].Host)
      headvalue = string.gsub( headvalue, "{utc}",iso_tz)
      headvalue = string.gsub( headvalue, "{appId}",objMetaTable.appId)
      headvalue = string.gsub( headvalue, "{appNameSmall}",objMetaTable.appNameSmall)
      headvalue = string.gsub( headvalue, "{appVersion}",objMetaTable.appVersion)
      headvalue = string.gsub( headvalue, "{platform}",function() 
                                                                 local awsplatname = "linux"    -- defualt to something, it is required
                                                                 local cornplat = system.getInfo("platform") 
                                                                 if cornplat == "android" then awsplatname = "android"  end
                                                                 if cornplat == "ios" then awsplatname = "iphoneos"  end
                                                                 if cornplat == "winphone" then awsplatname = "windowsphone"  end
                                                                 if cornplat == "macos" then awsplatname = "macos"  end
                                                                 if cornplat == "win32" then awsplatname = "windows"  end
                                                                 return awsplatname
                                                       end)
      headvalue = string.gsub( headvalue, "{model}",system.getInfo("model")  or "" )
      headvalue = string.gsub( headvalue, "{manufacturer}", system.getInfo("manufacturer") or "" )
      headvalue = string.gsub( headvalue, "{platform_version}",system.getInfo("platformVersion") or "" )
      headvalue = string.gsub( headvalue, "{analyticsappid}",objMetaTable.AnalyticsAppId)

     --                                                d = {name = "X-Amz-Client-Context", value = "{\"client\":{\"client_id\":\"{appId}\",\"app_title\":\"{appNameSmall}\",\"app_version_name\":\"{appVersion}\"},\"custom\":{},\"env\":{\"platform\":\"{platform}\",\"model\":\"{model}\",\"make\":\"{manufacturer}\",\"platform_version\":\"{platform_version}\"},\"services\":{\"mobile_analytics\":\"{\"app_id\":\"{analyticsappid}\"}}}" },
 
      ----------------------------------
      -- dont do all this logic if not needed
      ----------------------------------
      if string.find( headvalue, "{signature}" ) then
          aws_service = objMetaTable[objMetaTableKey].Service
          headvalue = string.gsub( headvalue, "{signature}",self:get_authorization_header())
      end
      
      print ("**************** HEAD VALUE *****************")
      print ("**************** HEAD VALUE *****************")
      print (v.name .. ": " .. headvalue)
      print ("**************** HEAD VALUE *****************")
      print ("**************** HEAD VALUE *****************")
      headers[v.name] = headvalue
    end
  end  

 
  --populate parameters for the network call
  local requestParams = {}
  requestParams.headers = headers
  requestParams.body = bodyData

  return requestParams
end

function _M.buildRequestParams(self, objMetaTable, objMetaTableKey, withDataTable,awsAction)
--  local postData = json.encode( withDataTable )
--  return self:newRequestParams(objMetaTable, objMetaTableKey, postData,awsAction) --for use in a network request
   return self:newRequestParams(objMetaTable, objMetaTableKey, withDataTable,awsAction) --for use in a network request

end


function _M.sendRequest( self, objMetaTable, objMetaTableKey, requestParamsTbl,  awsAction, _callback )
  print ("awsaction  " .. awsAction)
  local requestParams = self:buildRequestParams(objMetaTable,objMetaTableKey ,requestParamsTbl,awsAction)
  
  print ("network.request  -  " .. json.encode(requestParams))
  requestId = network.request( objMetaTable[objMetaTableKey].url, objMetaTable[objMetaTableKey].Actions[awsAction].httpaction, _callback, requestParams )
  
  return  requestId

 --[[ local q = { 
    requestId = network.request( objMetaTable[objMetaTableKey].url, objMetaTable[objMetaTableKey].Actions[awsAction].httpaction, function(e) Parse:onResponse(e); end, requestParams ),
    requestType = requestType,
    _callback = _callback,
  }
  table.insert( self.requestQueue, q )
  
  return q.requestId--]]
end


function _M.signUp( self, objMetaTable, objDataTable, _callback )
  return self:sendRequest( objMetaTable,"IDP", objDataTable, "SignUp", _callback )
end

function _M.signIn( self, objMetaTable, objDataTable, _callback )
  return self:sendRequest( objMetaTable,"IDP", objDataTable, "SignIn", _callback )
end

function _M.confirmsignUp( self, objMetaTable, objDataTable, _callback )
  return self:sendRequest( objMetaTable,"IDP", objDataTable, "ConfirmSignUp", _callback )
end

function _M.resendconfirmationCode( self, objMetaTable, objDataTable, _callback )
  return self:sendRequest( objMetaTable,"IDP", objDataTable, "ResendConfirmationCode", _callback )
end

function _M.forgotPassword( self, objMetaTable, objDataTable, _callback )
  return self:sendRequest( objMetaTable,"IDP", objDataTable, "ForgotPassword", _callback )
end

function _M.confirmForgotPassword( self, objMetaTable, objDataTable, _callback )
  return self:sendRequest( objMetaTable,"IDP", objDataTable, "ConfirmForgotPassword", _callback )
end

function _M.changePassword( self, objMetaTable, objDataTable, _callback )
  return self:sendRequest( objMetaTable,"IDP", objDataTable, "ChangePassword", _callback )
end

function _M.globalSignOut( self, objMetaTable, objDataTable, _callback )
  return self:sendRequest( objMetaTable,"IDP", objDataTable, "GlobalSignOut", _callback )
end

function _M.getUser( self, objMetaTable, objDataTable, _callback )
  return self:sendRequest( objMetaTable,"IDP", objDataTable, "GetUser", _callback )
end

function _M.getUserGroups( self, objMetaTable, objDataTable, _callback )
  return self:sendRequest( objMetaTable,"IDP", objDataTable, "GetUserGroups", _callback )
end

function _M.updateUserAttributes( self, objMetaTable, objDataTable, _callback )
  return self:sendRequest( objMetaTable,"IDP", objDataTable, "UpdateUserAttributes", _callback )
end





function _M.getId (self, objMetaTable, objDataTable, _callback )
  return self:sendRequest( objMetaTable,"IDENTITY", objDataTable, "GetId", _callback )
end



function _M.analyticsEvent (self, objMetaTable, objDataTable, _callback )
  return self:sendRequest( objMetaTable,"MOBILEANALYTICS", objDataTable, "LogEvent", _callback )
end


-- generate sha256 from the given string
function _M.get_sha256_digest(self, s)
    local sr =crypto.digest( crypto.sha256, s )  -- will hash and convert to hext
    return sr
end

-- required for testing
function _M.set_iso_date(self, microtime)
  local mt = microtime
  --mt = os.time({year=2017, month=02, day=11, hour=05, min=10,  sec=00})     --'2015-08-30T12:36:00Z')
  iso_date = os.date('!%Y%m%d', mt)
  iso_tz   = os.date('!%Y%m%dT%H%M%SZ', mt)
  print ("ise_date " .. iso_date)
  print ("iso_tz " .. iso_tz)
end

-- create canonical headers
-- header must be sorted asc  and lowercase for the names
function _M.get_canonical_header(self)
  local h = {
   -- 'content-type:' .. cont_type,
    'host:' .. aws_host,
    'x-amz-date:' .. iso_tz
  }
  return table.concat(h, '\n')
end


function _M.get_signed_request_body(self)
  local params = req_body
  if type(req_body) == 'table' then
    --table.sort(params)    -- do we need to sort ?
    params = json.encode(params)
  end
     print ("***************reqbody*************")
  print ("***************reqbody*************")
  print ("***************reqbody*************")
  print (params)
  print ("***************reqbody*************")
  print ("***************reqbody*************")
  print ("***************reqbody*************") 
  local digest = self:get_sha256_digest(params or '')
  return string.lower(digest) -- hash must be in lowercase hex string
end

-- get canonical request
-- https://docs.aws.amazon.com/general/latest/gr/sigv4-create-canonical-request.html
function _M.get_canonical_request(self)
  --local signed_header = 'content-type;host;x-amz-date'
 -- local signed_header = 'host;x-amz-date'
  local canonical_header = self:get_canonical_header()
  local signed_body = self:get_signed_request_body()
  local param  = {
    req_method,
    req_path,
    req_querystr , -- canonical querystr
    canonical_header,
    '',   -- required
    signed_header,
    signed_body
  }
  local canonical_request = table.concat(param, '\n')
    print ("***************CANICAL*************")
  print ("***************CANICAL*************")
  print ("***************CANICAL*************")
  print (canonical_request)
  print ("***************CANICAL*************")
  print ("***************CANICAL*************")
  print ("***************CANICAL*************")
  return string.lower(self:get_sha256_digest(canonical_request))
end
-- get string
function _M.get_string_to_sign(self)
  local param = { iso_date, aws_region, aws_service, aws_request }
  local cred  = table.concat(param, '/')
  local req   = self:get_canonical_request()
  print ("***************HASHED CANICAL*************")
  print ("***************HASHED CANICAL*************")
  print ("***************HASHED CANICAL*************")
  print ("***************HASHED CANICAL*************")
  print (table.concat({ 'AWS4-HMAC-SHA256', iso_tz, cred, req}, '\n'))
  print ("***************HASHED CANICAL*************")
  print ("***************HASHED CANICAL*************")
  print ("***************HASHED CANICAL*************")
  return table.concat({ 'AWS4-HMAC-SHA256', iso_tz, cred, req}, '\n')
end
-- generate signature
function _M.get_signature(self)
 -- local  signing_key = self:get_signing_key()
  local  string_to_sign = self:get_string_to_sign()
  --return self:str_to_hex(crypto.hmac(crypto.sha256,signing_key, string_to_sign))

--string_to_sign = "AWS4-HMAC-SHA256" .. "\n"  
--string_to_sign = string_to_sign .. "20150830T123600Z" .. "\n"  
--string_to_sign = string_to_sign .. "20150830/us-east-1/service/aws4_request" .. "\n" 
--string_to_sign = string_to_sign .. "816cd5b414d056048ba4f7c5386d6e0533120fb1fcfa93762cf0fc39e2cf19e0"  

local signat =   crypto.hmac(crypto.sha256,string_to_sign,crypto.hmac(crypto.sha256, aws_request,crypto.hmac(crypto.sha256, aws_service,crypto.hmac(crypto.sha256, aws_region,crypto.hmac(crypto.sha256, iso_date,'AWS4' .. aws_secret ,true),true ) ,true) ,true ))

 --local signat =   crypto.hmac(crypto.sha256, crypto.hmac(crypto.sha256,crypto.hmac(crypto.sha256,crypto.hmac(crypto.sha256,crypto.hmac(crypto.sha256,'AWS4' .. aws_secret, iso_date,true), aws_region,true), aws_service,true), aws_request,true ), string_to_sign)   -- will convert to hex

 --local signat =   crypto.hmac(crypto.sha256, crypto.hmac(crypto.sha256,crypto.hmac(crypto.sha256,crypto.hmac(crypto.sha256,crypto.hmac(crypto.sha256,'AWS4' .. aws_secret, iso_date,true), aws_region,true), aws_service,true), aws_request,true ), string_to_sign)   -- will convert to hex
-- local signat =   crypto.hmac(crypto.sha256, signing_key, string_to_sign)   -- will convert to hex
  print ("***************signature*************")
print ("***************signature*************")
print ("***************signature*************")
print ("***************signature*************")
print ("***************signature*************")
print (signat)
  print ("***************signature*************")
print ("***************signature*************")
print ("***************signature*************")
print ("***************signature*************")
print ("***************signature*************")

  return signat   -- will convert to hext
 --return signing_key
end

-- get authorization string
-- x-amz-content-sha256 required by s3
function _M.get_authorization_header(self)
  local  param = { aws_key, iso_date, aws_region, aws_service, aws_request }
  local header = {
    'AWS4-HMAC-SHA256 Credential=' .. table.concat(param, '/'),
    --'SignedHeaders=content-type;host;x-amz-date',
    'SignedHeaders=' .. signed_header,
    'Signature=' .. self:get_signature()

  }
  return table.concat(header, ', ')
end

-- get the current timestamp in iso8601 basic format
function _M.get_amz_date_header()
  return iso_tz
end

return _M
