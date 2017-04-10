---------------------------------------------------------------------------------------
-- Login Overlay scene
---------------------------------------------------------------------------------------
local myApp = require( "myapp" ) 
local aws_auth = require( myApp.utilsfld .. "aws_auth" )
local json = require("json")  

local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
local widgetExtras = require( myApp.utilsfld .. "widget-extras" )

local common = require( myApp.utilsfld .. "common" )

local currScene = "login"
print ("Inxxxxxxxxxxxxxxxxxxxxxxxxxxxxx " .. currScene .. " Scene")

local sceneparams
local container
local cancelButton
local userField
local pwdField
local txtUserLabel
local txtPWDLabel
local showpwdSwitch
local forgotButton
local loginButton
local btnpushed = true

------------------------------------------------------
-- Called first time. May not be called again if we dont recyle
--
-- self.view -> Container -> SCrollvew
------------------------------------------------------
function scene:create(event)
    print ("Create  " .. currScene)

end

function scene:show( event )

    local group = self.view
    local phase = event.phase
    print ("Show:" .. phase.. " " .. currScene)
    sceneparams = event.params   or {}         -- params contains the item table 
    local sceneinfo = sceneparams.sceneinfo -- myApp.otherscenes.login.sceneinfo

    -----------------------------
    -- call incase the parent needs to do any action
    ------------------------------
    pcall(function() event.parent:overlay({type="show",phase = phase,time=sceneparams.navigation.composer.time } ) end)
 

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).

            display.remove( container )           -- wont exist initially no biggie
            container = nil
            
            container = display.newContainer(myApp.sceneWidth-sceneinfo.edge*2,sceneinfo.height)
            container.y = myApp.sceneStartTop + container.height / 2 + sceneinfo.edge
            container.x = myApp.cW / 2


            local background = display.newRoundedRect(0, 0 ,container.width -sceneinfo.edge/2,container.height -sceneinfo.edge/2 , sceneinfo.cornerradius)
            background.strokeWidth = sceneinfo.strokewidth
            background:setStrokeColor( sceneinfo.strokecolor.r,sceneinfo.strokecolor.g,sceneinfo.strokecolor.b,sceneinfo.strokecolor.a )
            background:setFillColor(sceneinfo.groupbackground.r,sceneinfo.groupbackground.g,sceneinfo.groupbackground.b,sceneinfo.groupbackground.a)


            container:insert(background)

             -------------------------------------------------
             -- userid text
             -------------------------------------------------
             txtUserLabel = display.newText({text=sceneinfo.userlabel, font= myApp.fontBold, fontSize=sceneinfo.textfontsize,align="left" })
             txtUserLabel:setFillColor( sceneinfo.textcolor.r,sceneinfo.textcolor.g,sceneinfo.textcolor.b,sceneinfo.textcolor.a )
             txtUserLabel.anchorX = 0
             txtUserLabel.anchorY = 0
             txtUserLabel.x = background.x - background.width/2 + sceneinfo.edge/2
             txtUserLabel.y = background.y - background.height/2 + sceneinfo.edge/2
             
             container:insert(txtUserLabel)


             -------------------------------------------------
             -- pwd text
             -------------------------------------------------
             txtPWDLabel = display.newText({text=sceneinfo.pwdlabel, font= myApp.fontBold, fontSize=sceneinfo.textfontsize,align="left" })
             txtPWDLabel:setFillColor( sceneinfo.textcolor.r,sceneinfo.textcolor.g,sceneinfo.textcolor.b,sceneinfo.textcolor.a )
             txtPWDLabel.anchorX = 0
             txtPWDLabel.anchorY = 0
             txtPWDLabel.x = background.x - background.width/2 + sceneinfo.edge/2
             txtPWDLabel.y = txtUserLabel.y + txtUserLabel.height + sceneinfo.userfieldheight + sceneinfo.edge
             
             container:insert(txtPWDLabel)

             -------------------------------------------------
             -- show password switch
             -------------------------------------------------
             showpwdSwitch = widget.newSwitch
                {
                    style = sceneinfo.showpwdswitchstyle,
                    id = "showpwdSwitch",
                    initialSwitchState = false,
                    onRelease = function()  pwdField.textField.isSecure = not showpwdSwitch.isOn end ,
                }
             showpwdSwitch.x = txtPWDLabel.x + background.width - showpwdSwitch.width
             showpwdSwitch.y = txtPWDLabel.y + sceneinfo.pwdfieldheight + sceneinfo.edge/2
             container:insert(showpwdSwitch)

              -------------------------------------------------
             -- forgot pwd buttoin
             -------------------------------------------------
            forgotButton = widget.newButton {
                    label = sceneinfo.btnforgotlabel ,
                    width =  1,    -- will recalucualte
                    labelColor = sceneinfo.btnforgotlabelColor,
                    fontSize = sceneinfo.btnforgotfontsize,
                    font = myApp.fontBold,      
                    onRelease = function() 
                                        
                                      native.setActivityIndicator( true )

                                      --{
                                      --"ClientId": "xxxxx",
                                      --"Username": "craig@segbers.com"
                                      --}
                                      
                                      local userDataTable = {}
                                      userDataTable.ClientId = myApp.aws.ClientId
                                      userDataTable.Username = myApp.fncGetUD("email")

                                      local jed = json.encode(userDataTable)
                                      print ("ForgotPassword  -  " .. jed)
                                      local aws = aws_auth:new({})
                                      aws:forgotPassword( myApp.aws,
                                                        jed,  
                                                        function(event)
                                                             native.setActivityIndicator( false )
                                                             if (event.status ) == 200 then 
                                                               
                                                               native.showAlert( sceneinfo.btnforgotmessage.successtitle, sceneinfo.btnforgotmessage.successmessage, { "Okay" }, function(event) timer.performWithDelay(10, myApp.showSubScreen({instructions=myApp.otherscenes.loginconfirm})) end )
                                                               --timer.performWithDelay(10,function () myApp.hideOverlay({callback=nill}) end) 
                                                               -- stay here becuase they most likely will get the email and need to login again  
                                                                btnpushed = true
                                                                timer.performWithDelay(10,function () myApp.hideOverlay({callback=nil}) end)  
                                                                return true 
                                                             else
                                                               print ("error on return   -  " .. json.encode(event))
                                                               native.showAlert( sceneinfo.btnforgotmessage.failuretitle, (event.responseHeaders["x-amzn-ErrorMessage"] or "Unknown"), { "Okay" } )
                                                             end
                                                        end    --- return function from parse
                                                       )   -- end of parse
                                         
                                 end,    -- end onrelease
               }

             forgotButton.x = 0 - background.width/2 + forgotButton.width/2 + sceneinfo.edge
             forgotButton.y = txtPWDLabel.y + txtPWDLabel.height  + sceneinfo.userfieldheight*2
             container:insert(forgotButton)

             ---------------------------------------------
             -- Cancel button
             ---------------------------------------------
             cancelButton = widget.newButton {
                    shape=sceneinfo.btnshape,
                    fillColor = { default={ sceneinfo.btncanceldefcolor.r,  sceneinfo.btncanceldefcolor.g, sceneinfo.btncanceldefcolor.b, sceneinfo.btncanceldefcolor.a}, over={ sceneinfo.btncancelovcolor.r, sceneinfo.btncancelovcolor.g, sceneinfo.btncancelovcolor.b, sceneinfo.btncancelovcolor.a } },
                    label = sceneinfo.btncanceltext,
                    labelColor = { default={ sceneinfo.btncanceldeflabelcolor.r,  sceneinfo.btncanceldeflabelcolor.g, sceneinfo.btncanceldeflabelcolor.b, sceneinfo.btncanceldeflabelcolor.a}, over={ sceneinfo.btncancelovlabelcolor.r, sceneinfo.btncancelovlabelcolor.g, sceneinfo.btncancelovlabelcolor.b, sceneinfo.btncancelovlabelcolor.a } },
                    fontSize = sceneinfo.btnfontsize,
                    font = myApp.fontBold,
                    width = sceneinfo.btnwidth,
                    height = sceneinfo.btnheight,
                    ---------------------------------
                    -- stick inside a time to prevent the buton press from passing thru to the current scene
                    ---------------------------------
                    onRelease = 
                       function() if btnpushed == false then
                                         btnpushed = true
                                         timer.performWithDelay(10,function () myApp.hideOverlay({callback=nill}) end)  
                                         return true 
                                  end
                       end,

                  }
               cancelButton.anchorX = 0
               cancelButton.anchorY = 0
               cancelButton.x = txtUserLabel.x  
               cancelButton.y = background.y + background.height/2 - sceneinfo.btnheight - sceneinfo.edge/2   -- background uses .5 anchor
               --debugpopup (background.y .. " " .. background.height)
               container:insert(cancelButton)


             ---------------------------------------------
             -- Login button
             ---------------------------------------------
             loginButton = widget.newButton {
                    shape=sceneinfo.btnshape,
                    fillColor = { default={ sceneinfo.btnlogindefcolor.r,  sceneinfo.btnlogindefcolor.g, sceneinfo.btnlogindefcolor.b, sceneinfo.btnlogindefcolor.a}, over={ sceneinfo.btnloginovcolor.r, sceneinfo.btnloginovcolor.g, sceneinfo.btnloginovcolor.b, sceneinfo.btnloginovcolor.a } },
                    label = sceneinfo.btnlogintext,
                    labelColor = { default={ sceneinfo.btnlogindeflabelcolor.r,  sceneinfo.btnlogindeflabelcolor.g, sceneinfo.btnlogindeflabelcolor.b, sceneinfo.btnlogindeflabelcolor.a}, over={ sceneinfo.btnloginovlabelcolor.r, sceneinfo.btnloginovlabelcolor.g, sceneinfo.btnloginovlabelcolor.b, sceneinfo.btnloginovlabelcolor.a } },
                    fontSize = sceneinfo.btnfontsize,
                    font = myApp.fontBold,
                    width = sceneinfo.btnwidth,
                    height = sceneinfo.btnheight,
                    ---------------------------------
                    -- stick inside a time to prevent the buton press from passing thru to the current scene
                    ---------------------------------
                    onRelease = function() 
                                        local inputemail = userField.textField.text or ""
                                        local inputpwd = pwdField.textField.text or ""
                                        if inputemail == "" or inputpwd == "" then
                                           native.showAlert( sceneinfo.btnloginmessage.errortitle, sceneinfo.btnloginmessage.errormessage, { "Okay" } )
                                        else
                                            native.setActivityIndicator( true )
                                           -- local userDataTable = { ["username"] = inputemail, ["email"] = inputemail, ["password"] = inputpwd }
                                          --  local userDataTable = {}
                                          --  userDataTable.ClientId = myapp.aws.ClientId
                                           -- userDataTable.Password = inputpwd
                                           -- userDataTable.Username = inputemail
                                           -- userDataTable.UserAttributes = {}

                                           -- local jstr = '{"ClientId": "' .. myApp.aws.ClientId .. '","Password": "' .. inputpwd .. '","Username": "' .. inputemail .. '",'
                                          --  jstr = jstr .. '"UserAttributes": [{"Name": "email","Value": "' .. inputemail .. '"  }]}'
                                          --  local userDataTable = json.decode(jstr)
                                           -- print (json.encode(userDataTable))
                                            --parse:clearSessionToken ()

                                            
                                            local userDataTable = {}
                                            userDataTable.AuthFlow = "ADMIN_NO_SRP_AUTH"
                                            userDataTable.AuthParameters = {}
                                            userDataTable.AuthParameters.USERNAME = inputemail                                
                                            userDataTable.AuthParameters.PASSWORD = inputpwd
                                            userDataTable.UserPoolId = myApp.aws.UserPoolId
                                            userDataTable.ClientId = myApp.aws.ClientId

                                           -- local userDataTableAuth = {}
                                          --  userDataTableAuth.USERNAME = inputemail
                                          --  userDataTableAuth.PASSWORD = inputpwd
                                          --  table.insert (userDataTable.AuthParameters,userDataTableAuth)

                                            --{"AuthFlow": "ADMIN_NO_SRP_AUTH", "AuthParameters":{"USERNAME":"craig@segbers.com","PASSWORD":"gh%%3322SSsD"},"UserPoolId":"us-east-1_6p997uKVk","ClientId":"7m7p7tk8ta4qlb4ai15nqmh8a1"}
                                            
                                            local jed = json.encode(userDataTable)

                                            --jed = "{\"AuthFlow\": \"ADMIN_NO_SRP_AUTH\", \"AuthParameters\":{\"USERNAME\:\".. inputemail .. \",\"PASSWORD\":\"gh%%3322SSsD\"},\"UserPoolId\":\"us-east-1_6p997uKVk\",\"ClientId\":\"7m7p7tk8ta4qlb4ai15nqmh8a1\"}"
                                            print ("jed  -  " .. jed)
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
                                            aws:signIn(       myApp.aws,
                                                              jed,  
                                                              function(event)
                                                                   native.setActivityIndicator( false )
                                                                   myApp.fncPutUD("email",inputemail)
                                                                   if (event.status ) == 200 then 
                                                                      print ("Return from login" .. json.encode(event.response))
                                                                      myApp.fncUserLogInfo(event.response)
                                                                      btnpushed = true
                                                                      timer.performWithDelay(10,function () myApp.hideOverlay({callback=nil}) end)  
                                                                      return true 
                                                                     --timer.performWithDelay(10,function () myApp.hideOverlay({callback=nill}) end) 
                                                                     -- stay here becuase they most likely will get the email and need to login again  
                                                                   else
                                                                      print ("Return from login" .. json.encode(event))
                                                                      if  event.responseHeaders["x-amzn-ErrorType"]  == "UserNotConfirmedException:" then
                                                                          myApp.fncPutUD("accountconfirmed",0)  
                                                                      end
                                                                      native.showAlert( sceneinfo.btnloginmessage.failuretitle, (event.responseHeaders["x-amzn-ErrorMessage"] or "Unknown"), { "Okay" } )
                                                                   end
                                                              end    --- return function from parse
                                                             )   -- end of parse
                                         end -- end of checking for valid input
                                 end,    -- end onrelease
                  }
               loginButton.anchorX = 0
               loginButton.anchorY = 0
               loginButton.x = background.x + background.width/2  - sceneinfo.btnwidth - sceneinfo.edge/2 
               loginButton.y = background.y + background.height/2 - sceneinfo.btnheight - sceneinfo.edge/2   -- background uses .5 anchor
               --debugpopup (background.y .. " " .. background.height)
               container:insert(loginButton)

               group:insert(container)




    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.


              -------------------------------------------------
             -- userid field
             -------------------------------------------------
            userField = widget.newTextField({
                width = container.width - sceneinfo.edge*2,
                height = sceneinfo.userfieldheight,
                cornerRadius = sceneinfo.userfieldcornerradius,
                strokeWidth = 0,
                text = myApp.fncGetUD("email"),
                fontSize = sceneinfo.userfieldfontsize,
                placeholder = sceneinfo.userfieldplaceholder,
                font = myApp.fontBold,
                labelWidth = 0,
                inputType = "email",
                listener = function()     if ( "began" == event.phase ) then
                                          elseif ( "submitted" == event.phase ) then
                                             native.setKeyboardFocus( pwdField )
                                          end 
                            end,
                        })
            -- Hide the native part of this until we need to show it on the screen.
            
         --   local lbX, lbY = txtUserLabel:localToContent( txtUserLabel.width/2-sceneinfo.edge/2, 0 )
            local lbX, lbY = txtUserLabel:localToContent( 0 , 0 )     -- get center points relative to device
            userField.x = lbX - txtUserLabel.width/2 + userField.width / 2 
            userField.y = lbY + sceneinfo.userfieldheight
     
            group:insert(userField)      -- insertng into container messes up


              -------------------------------------------------
             -- pwd field
             -------------------------------------------------
            pwdField = widget.newTextField({
                
                width = container.width - sceneinfo.edge*2 - showpwdSwitch.width*1.5,
                height = sceneinfo.pwdfieldheight,
                cornerRadius = sceneinfo.pwdfieldcornerradius,
                strokeWidth = 0,
                text = "",
                fontSize = sceneinfo.pwdfieldfontsize,
                placeholder = sceneinfo.pwdfieldplaceholder,
                font = myApp.fontBold,
                labelWidth = 0,
                isSecure = not showpwdSwitch.isOn,    -- note a border shows up... cannot get rid of when issecure
                listener = function()   if ( "submitted" == event.phase ) then native.setKeyboardFocus( nil )end end,
            })
            -- Hide the native part of this until we need to show it on the screen.
            
            lbX, lbY = txtPWDLabel:localToContent( 0,0 )
            pwdField.x = lbX - txtPWDLabel.width/2 + pwdField.width / 2
            pwdField.y = lbY + sceneinfo.pwdfieldheight

            group:insert(pwdField)      -- insertng into container messes up



            if (userField.textField.text or "") ~= "" then
                native.setKeyboardFocus( pwdField )
            end

            ------------------
            -- allow buttons to be pushed
            -------------------
            btnpushed = false 
 
    end
	
 
end

function scene:hide( event )
    local group = self.view
    local phase = event.phase
    print ("Hide:" .. phase.. " " .. currScene)

    -----------------------------
    -- call incase the parent needs to do any action
    ------------------------------
    pcall(function() event.parent:overlay({type="hide",phase = phase,time=sceneparams.navigation.composer.time } ) end)
    if ( phase == "will" ) then
        userField:removeSelf()
        userField = nil

        pwdField:removeSelf()
        pwdField = nil

        native.setKeyboardFocus( nil )
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end

function scene:destroy( event )

    print ("Destroy "   .. currScene)
end

function scene:myparams( event )
       return sceneparams
end

---------------------------------------------------
-- use if someone wants us to transition away
-- for navigational appearnaces
-- used from the more button
---------------------------------------------------
function scene:morebutton( parms )
     transition.to(  userField, {  time=parms.time,delta=true, x = parms.x , transition=parms.transition})
     transition.to(  pwdField,  {  time=parms.time,delta=true, x = parms.x , transition=parms.transition})

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene