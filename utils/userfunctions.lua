-------------------------------------------------------
-- Loaded once in main, used to override variables and create some common functions
-------------------------------------------------------
local myApp = require( "myapp" ) 

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
     myApp.authentication.IdToken = authResult.IdToken
     myApp.authentication.RefreshToken = authResult.RefreshToken

     local curLoggedin = myApp.authentication.loggedin or false
     myApp.authentication.loggedin =  true

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
     myApp.authentication.email = "" 
     myApp.authentication.userid = ""          
     myApp.authentication.SessionToken = ""    
     myApp.authentication.IdToken = ""    
     myApp.authentication.RefreshToken = "" 

     local curLoggedin = myApp.authentication.loggedin or false
     myApp.authentication.loggedin = false   

     if myApp.authentication.loggedin ~= curLoggedin then
         Runtime:dispatchEvent{ name="loginchanged", value=myApp.authentication.loggedin }
     end   
end