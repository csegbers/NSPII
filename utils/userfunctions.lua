-------------------------------------------------------
-- Loaded once in main, used to override variables and create some common functions
-------------------------------------------------------
local myApp = require( "myapp" ) 
local aws_auth = require( myApp.utilsfld .. "aws_auth" )
local json = require("json")  

-------------------------------
-- 
-------------------------------
function myApp.fncUserLogInfo (event)
     print ("fncUserLoggedIn  .. "  .. require("json").encode(event))

     myApp.fncPutUD("forgotpassword",0) 
     myApp.fncPutUD("accountcreated",1)
     myApp.fncPutUD("accountconfirmed",1) 
 
     myApp.authentication.email = myApp.fncGetUD("email")
     myApp.authentication.userid = myApp.fncGetUD("userid")               -- for now this is email
    -- myApp.authentication.objectId = userObject.objectId                -- internal userid
    local authResult =  event.AuthenticationResult 
     myApp.authentication.AccessToken = authResult.AccessToken
     myApp.authentication.IdToken = authResult.IdToken
     myApp.authentication.RefreshToken = authResult.RefreshToken

     local curLoggedin = myApp.authentication.loggedin or false
     myApp.authentication.loggedin =  true


     local userDataTable = {}
     userDataTable.IdentityPoolId = myApp.aws.IdentityPoolId 
     userDataTable.Logins = {"cognito-idp.us-east-1.amazonaws.com/" .. myApp.aws.UserPoolId , myApp.authentication.IdToken}
     local jed = json.encode(userDataTable)

    --jed = "{\"AuthFlow\": \"ADMIN_NO_SRP_AUTH\", \"AuthParameters\":{\"USERNAME\:\".. inputemail .. \",\"PASSWORD\":\"gh%%3322SSsD\"},\"UserPoolId\":\"us-east-1_6p997uKVk\",\"ClientId\":\"7m7p7tk8ta4qlb4ai15nqmh8a1\"}"
     print ("getid jed  -  " .. jed)
    ---------------------------
    -- always login even if changing password
    -----------------------------
     local aws = aws_auth:new({
                                aws_key     = myApp.aws.Key,
                                aws_secret  = myApp.aws.Secret,
                                aws_region  = myApp.aws.Region,
                                aws_service = myApp.aws.Service,
                                aws_request = myApp.aws.Request,
                                aws_host    = myApp.aws.Host,
                                content_type   = myApp.aws.ContentType,
                                request_body    = jed,
                              })    
     aws:clearSessionToken()
     aws:getId( myApp.aws, jed,  function(event) print ("Return from getid" .. json.encode(event)) end )

     -----------------------------
     -- dispatch event if login status changed
     -----------------------------
     if myApp.authentication.loggedin ~= curLoggedin then
         Runtime:dispatchEvent{ name="loginchanged", value=myApp.authentication.loggedin }
     end

     ----------------------------
     -- first time logging in ?
     -- event it in case we want to do something
     ----------------------------
     if myApp.authentication.loggedin   then
          myApp.fncPutUD ("everloggedin",1)     --- if still a 0 will update and trigger event
     end

end

-------------------------------
-- Log em out
-------------------------------
function myApp.fncUserLoggedOut (event)
     print "fncUserLoggedOut  "

     local userDataTable = {}
     userDataTable.AccessToken = myApp.authentication.AccessToken 
     local jed = json.encode(userDataTable)

    --jed = "{\"AuthFlow\": \"ADMIN_NO_SRP_AUTH\", \"AuthParameters\":{\"USERNAME\:\".. inputemail .. \",\"PASSWORD\":\"gh%%3322SSsD\"},\"UserPoolId\":\"us-east-1_6p997uKVk\",\"ClientId\":\"7m7p7tk8ta4qlb4ai15nqmh8a1\"}"
     print ("logout ed  -  " .. jed)
    ---------------------------
    -- always login even if changing password
    -----------------------------
     local aws = aws_auth:new({
                                aws_key     = myApp.aws.Key,
                                aws_secret  = myApp.aws.Secret,
                                aws_region  = myApp.aws.Region,
                                aws_service = myApp.aws.Service,
                                aws_request = myApp.aws.Request,
                                aws_host    = myApp.aws.Host,
                                content_type   = myApp.aws.ContentType,
                                request_body    = jed,
                              })    
     aws:clearSessionToken()
     aws:globalSignOut( myApp.aws, jed,  function(event) print ("Return from logout" .. json.encode(event)) end )


     myApp.authentication.email = "" 
     myApp.authentication.userid = ""          
     myApp.authentication.AccessToken = ""    
     myApp.authentication.IdToken = ""    
     myApp.authentication.RefreshToken = "" 

     local curLoggedin = myApp.authentication.loggedin or false
     myApp.authentication.loggedin = false   

     if myApp.authentication.loggedin ~= curLoggedin then
         Runtime:dispatchEvent{ name="loginchanged", value=myApp.authentication.loggedin }
     end   


                                             
end