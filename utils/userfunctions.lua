-------------------------------------------------------
-- Loaded once in main, used to override variables and create some common functions
-------------------------------------------------------
local myApp = require( "myapp" ) 
local aws_auth = require( myApp.utilsfld .. "aws_auth" )
local json = require("json")  

function myApp.fncUserLogEvent (event)
         ------------------------------------------
     -- _session.start
     ------------------------------------------
      
            local iso_dte = os.date('!%Y-%m-%dT%H:%M:%SZ', os.time())
           
            local userDataTable = {}
            userDataTable.events = {}

            local userDataEvents = {}
            userDataEvents.eventType = event.type
            userDataEvents.timestamp = iso_dte
            userDataEvents.session = {}
            userDataEvents.session.startTimestamp = iso_dte
            userDataEvents.session.id = myApp.authentication.sessionId
            userDataEvents.attributes = event.attributes
            userDataEvents.metrics = event.metrics
            table.insert (userDataTable.events,userDataEvents)

            local jed = json.encode(userDataTable)
            print ("fncUserLogEVent  -  " .. jed)

            local aws = aws_auth:new({aws_key = myApp.aws.Key,aws_secret  = myApp.aws.Secret,aws_region  =   myApp.aws.Region,
                         aws_request = myApp.aws.Request, content_type   = myApp.aws.ContentType, request_body    = jed, })
            aws:analyticsEvent(   myApp.aws,
                                  jed,  
                                  function(event)
                                       if (event.status ) == 200 or (event.status ) == 202 then 
                                          print ("return from  analyticsEvent  -  " .. json.encode(event))
                                       else
                                          print ("error on return analyticsEvent  -  " .. json.encode(event))
                                       end
                                  end   
                             )             
end

function myApp.fncUserGetId (event)
         ------------------------------------------
     -- Identity
     ------------------------------------------
     print ("myApp.aws.IdentityPoolId   -  " .. myApp.aws.IdentityPoolId )
     local userDataTable = {}
     userDataTable.IdentityPoolId = myApp.aws.IdentityPoolId 
     userDataTable.Logins = {}
     userDataTable.Logins[myApp.aws.IDP.Host .. "/" .. myApp.aws.UserPoolId] =  myApp.authentication.IdToken 
     local jed = json.encode(userDataTable)

    --     {
    --    "IdentityPoolId": "us-east-1:xxxxxx",
    --    "Logins": { 
    --                    "cognito-idp.us-east-1.amazonaws.com/us-east-1_xxxx" : "xx" 
    --              }
  --  }


    --jed = "{\"AuthFlow\": \"ADMIN_NO_SRP_AUTH\", \"AuthParameters\":{\"USERNAME\:\".. inputemail .. \",\"PASSWORD\":\"gh%%3322SSsD\"},\"UserPoolId\":\"us-east-1_6p997uKVk\",\"ClientId\":\"7m7p7tk8ta4qlb4ai15nqmh8a1\"}"
     print ("getid jed  -  " .. jed)
    ---------------------------
    -- map user to identity pool in aws
    -----------------------------
     myApp.authentication.IdentityId = ""     -- map user to identity pool in aws
     
     local aws = aws_auth:new({})    
     aws:clearSessionToken()
     aws:getId( myApp.aws, jed,  
                       function(event) 
                          print ("Return from getid" .. json.encode(event)) 
                          if (event.status ) == 200 then 
                              myApp.authentication.IdentityId = json.decode(event.response).IdentityId
                              print ("myApp.authentication.IdentityId " .. myApp.authentication.IdentityId) 
                          end
                       end 
              )
end
function myApp.fncUserGetUser (event)
         ------------------------------------------
     -- Identity
     ------------------------------------------
     local userDataTable = {}
     userDataTable.AccessToken = myApp.authentication.AccessToken
     local jed = json.encode(userDataTable)
    --jed = "{\"AuthFlow\": \"ADMIN_NO_SRP_AUTH\", \"AuthParameters\":{\"USERNAME\:\".. inputemail .. \",\"PASSWORD\":\"gh%%3322SSsD\"},\"UserPoolId\":\"us-east-1_6p997uKVk\",\"ClientId\":\"7m7p7tk8ta4qlb4ai15nqmh8a1\"}"
     print ("getUser jed  -  " .. jed)
    ---------------------------
    -- map user to identity pool in aws
    -----------------------------
     myApp.authentication.User = {}     -- User Info
     myApp.authentication.Groups = {}     -- Groups Info    delete here incase fail on getuser

     local aws = aws_auth:new({})    
     aws:clearSessionToken()
     aws:getUser( myApp.aws, jed,  
                       function(event) 
                          print ("Return from getuser" .. json.encode(event)) 
                          if (event.status ) == 200 then 
                              local retusertbl = json.decode(event.response)
 
                              for index,value in ipairs(retusertbl.UserAttributes) do
                                myApp.authentication.User[value.Name] = value.Value
                                print ("value.Name .. " .. value.Name .. "   value.Value .. " .. value.Value )
                              end

                              myApp.fncPutUD("name",myApp.authentication.User.name)    -- just in case it changed
                              print ("myApp.authentication.User " .. json.encode(myApp.authentication.User))
                              myApp.fncUserGetUserGroups()
                          end
                       end 
              )
end

function myApp.fncUserGetUserGroups (event)
         ------------------------------------------
     -- Identity
     ------------------------------------------
     local userDataTable = {}
     userDataTable.Lilmit = 50
     userDataTable.Username = myApp.authentication.userid
     userDataTable.UserPoolId = myApp.aws.UserPoolId
     local jed = json.encode(userDataTable)
    --jed = "{\"AuthFlow\": \"ADMIN_NO_SRP_AUTH\", \"AuthParameters\":{\"USERNAME\:\".. inputemail .. \",\"PASSWORD\":\"gh%%3322SSsD\"},\"UserPoolId\":\"us-east-1_6p997uKVk\",\"ClientId\":\"7m7p7tk8ta4qlb4ai15nqmh8a1\"}"
     print ("getUserGroups jed  -  " .. jed)

     myApp.authentication.Groups = {}     -- Groups Info
    ---------------------------
    -- map user to identity pool in aws
    -----------------------------
     
     local aws = aws_auth:new({
                                aws_key     = myApp.aws.Key,
                                aws_secret  = myApp.aws.Secret,
                                aws_region  = myApp.aws.Region,
                                aws_request = myApp.aws.Request,
                                content_type   = myApp.aws.ContentType,
                                request_body    = jed,
                              }) 
     aws:clearSessionToken()
     aws:getUserGroups( myApp.aws, jed,  
                       function(event) 
                          print ("Return from getusergroups" .. json.encode(event)) 
                          if (event.status ) == 200 then 
                              local retgrptbl = json.decode(event.response)
                              for index,value in ipairs(retgrptbl.Groups) do
                                  myApp.authentication.Groups[value.GroupName] = true
                                  print ("value.Name .. " .. value.GroupName  )
                              end
                              print ("myApp.authentication.Groups " .. json.encode(myApp.authentication.Groups))
                          end
                       end 
              )
end
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


     myApp.fncUserGetId()
     myApp.fncUserGetUser()

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
                                aws_request = myApp.aws.Request,
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
     myApp.authentication.IdentityId = ""

     local curLoggedin = myApp.authentication.loggedin or false
     myApp.authentication.loggedin = false   

     if myApp.authentication.loggedin ~= curLoggedin then
         Runtime:dispatchEvent{ name="loginchanged", value=myApp.authentication.loggedin }
     end   


                                             
end