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

local currScene = "loginconfirm"
print ("Inxxxxxxxxxxxxxxxxxxxxxxxxxxxxx " .. currScene .. " Scene")

local sceneparams
local container
local cancelButton
local nameField
local txtUserLabel
local txtNameLabel
local createButton
local resendButton
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
             txtUserLabel = display.newText({text= myApp.fncGetUD("email"), font= myApp.fontBold, fontSize=sceneinfo.textfontsize,align="left" })
             txtUserLabel:setFillColor( sceneinfo.textcolor.r,sceneinfo.textcolor.g,sceneinfo.textcolor.b,sceneinfo.textcolor.a )
             txtUserLabel.anchorX = 0
             txtUserLabel.anchorY = 0
             txtUserLabel.x = background.x - background.width/2 + sceneinfo.edge/2
             txtUserLabel.y = background.y - background.height/2 + sceneinfo.edge/2
             
             container:insert(txtUserLabel)

   
             -------------------------------------------------
             -- name text
             -------------------------------------------------
             txtNAMELabel = display.newText({text=sceneinfo.namelabel, font= myApp.fontBold, fontSize=sceneinfo.textfontsize,align="left" })
             txtNAMELabel:setFillColor( sceneinfo.textcolor.r,sceneinfo.textcolor.g,sceneinfo.textcolor.b,sceneinfo.textcolor.a )
             txtNAMELabel.anchorX = 0
             txtNAMELabel.anchorY = 0
             txtNAMELabel.x = background.x - background.width/2 + sceneinfo.edge/2
             txtNAMELabel.y = txtUserLabel.y + txtUserLabel.height +   sceneinfo.edge
             
             container:insert(txtNAMELabel)

              -------------------------------------------------
             -- resend pwd buttoin
             -------------------------------------------------
            resendButton = widget.newButton {
                    label = sceneinfo.btnresendlabel ,
                    width =  1,    -- will recalucualte
                    labelColor = sceneinfo.btnresendlabelColor,
                    fontSize = sceneinfo.btnresendfontsize,
                    font = myApp.fontBold,      
                    onRelease = function() 
                                    native.setActivityIndicator( true )
                                    --{
                                    --"ClientId": "7m7p7tk8ta4qlb4ai15nqmh8a1",
                                    --"Username": "craig@segbers.com"
                                    --}
                                    
                                    local userDataTable = {}
                                    userDataTable.ClientId = myApp.aws.ClientId
                                    userDataTable.Username = myApp.fncGetUD("email")

                                    local jed = json.encode(userDataTable)
                                    print ("resendconfirmationCode  -  " .. jed)
                                    local aws = aws_auth:new({})
                                    aws:resendconfirmationCode( myApp.aws,
                                                      jed,  
                                                      function(event)
                                                           native.setActivityIndicator( false )
                                                           if (event.status ) == 200 then 
                                                             native.showAlert( sceneinfo.btnresendmessage.successtitle, sceneinfo.btnresendmessage.successmessage, { "Okay" } )
                                                               return true 
                                                           else
                                                               print ("error on return   -  " .. json.encode(event))
                                                               native.showAlert( sceneinfo.btnresendmessage.failuretitle, (event.responseHeaders["x-amzn-ErrorMessage"] or "Unknown"), { "Okay" } )
                                                           end
                                                      end    --- return function from parse
                                                     )   -- end of parse
                                         
                                 end,    -- end onrelease
               }

             resendButton.x = 0 - background.width/2 + resendButton.width/2 + sceneinfo.edge
             resendButton.y = txtNAMELabel.y + txtNAMELabel.height  + sceneinfo.namefieldheight*2
             container:insert(resendButton)
             -------------------------------------------------
             -- create pwd buttoin
             -------------------------------------------------
            createButton = widget.newButton {
                    shape=sceneinfo.btnshape,
                    fillColor = { default={ sceneinfo.btncreatedefcolor.r,  sceneinfo.btncreatedefcolor.g, sceneinfo.btncreatedefcolor.b, sceneinfo.btncreatedefcolor.a}, over={ sceneinfo.btncreateovcolor.r, sceneinfo.btncreateovcolor.g, sceneinfo.btncreateovcolor.b, sceneinfo.btncreateovcolor.a } },
                    label = sceneinfo.btncreatelabel,
                    labelColor = { default={ sceneinfo.btncreatedeflabelcolor.r,  sceneinfo.btncreatedeflabelcolor.g, sceneinfo.btncreatedeflabelcolor.b, sceneinfo.btncreatedeflabelcolor.a}, over={ sceneinfo.btncreateovlabelcolor.r, sceneinfo.btncreateovlabelcolor.g, sceneinfo.btncreateovlabelcolor.b, sceneinfo.btncreateovlabelcolor.a } },
                    fontSize = sceneinfo.btnfontsize,
                    font = myApp.fontBold,
                    width = sceneinfo.btnwidth*2-sceneinfo.edge,
                    height = sceneinfo.btnheight,    
                    onRelease = function() 
                                        local inputcode = nameField.textField.text or ""
                                        if inputcode == "" then
                                           native.showAlert( sceneinfo.btncreatemessage.errortitle, sceneinfo.btncreatemessage.errormessage, { "Okay" } )
                                        else
                                            native.setActivityIndicator( true )

                                            --{
                                            --"ClientId": "7m7p7tk8ta4qlb4ai15nqmh8a1",
                                            --"ConfirmationCode": "631134",
                                            --"Username": "craig@segbers.com"
                                            --}
                                            
                                            local userDataTable = {}
                                            userDataTable.ClientId = myApp.aws.ClientId
                                            userDataTable.ConfirmationCode = inputcode
                                            userDataTable.Username = myApp.fncGetUD("email")

                                            local jed = json.encode(userDataTable)
                                            print ("confirmsignUp  -  " .. jed)
                                            local aws = aws_auth:new({})
                                            aws:confirmsignUp(       myApp.aws,
                                                              jed,  
                                                              function(event)
                                                                   native.setActivityIndicator( false )
                                                                   if (event.status ) == 200 then 
                                                                     myApp.fncPutUD("accountconfirmed",1)                                                                    
                                                                     native.showAlert( sceneinfo.btncreatemessage.successtitle, sceneinfo.btncreatemessage.successmessage, { "Okay" } )
                                                                     --timer.performWithDelay(10,function () myApp.hideOverlay({callback=nill}) end) 
                                                                     -- stay here becuase they most likely will get the email and need to login again  
                                                                      btnpushed = true
                                                                      timer.performWithDelay(10,function () myApp.hideOverlay({callback=nil}) end)  
                                                                      return true 
                                                                   else
                                                                     print ("error on return   -  " .. json.encode(event))
                                                                     native.showAlert( sceneinfo.btncreatemessage.failuretitle, (event.responseHeaders["x-amzn-ErrorMessage"] or "Unknown"), { "Okay" } )
                                                                   end
                                                              end    --- return function from parse
                                                             )   -- end of parse
                                         end -- end of checking for valid input
                                 end,    -- end onrelease
               }

             createButton.anchorX = 0
             createButton.anchorY = 0
             createButton.x = background.x + background.width/2  - createButton.width - sceneinfo.edge/2 
             createButton.y = background.y + background.height/2 - sceneinfo.btnheight - sceneinfo.edge/2   -- background uses .5 anchor

             container:insert(createButton)
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
                                         timer.performWithDelay(10,function () myApp.hideOverlay({callback=nil}) end)  
                                         return true 
                                  end
                       end,

                  }
               cancelButton.anchorX = 0
               cancelButton.anchorY = 0
               cancelButton.x = txtUserLabel.x  
               cancelButton.y = createButton.y
               --debugpopup (background.y .. " " .. background.height)
               container:insert(cancelButton)



               group:insert(container)




    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.

             -------------------------------------------------
             -- nameField field
             -------------------------------------------------
            nameField = widget.newTextField({
                
                width = container.width - sceneinfo.edge*2  ,
                height = sceneinfo.namefieldheight,
                cornerRadius = sceneinfo.namefieldcornerradius,
                strokeWidth = 0,
                text = "", 
                fontSize = sceneinfo.namefieldfontsize,
                placeholder = sceneinfo.namefieldplaceholder,
                font = myApp.fontBold,
                labelWidth = 0,
                listener = function()   if ( "submitted" == event.phase ) then native.setKeyboardFocus( nil )end end,
            })
            -- Hide the native part of this until we need to show it on the screen.
            
            lbX, lbY = txtNAMELabel:localToContent( 0,0 )
            nameField.x = lbX - txtNAMELabel.width/2 + nameField.width / 2
            nameField.y = lbY + sceneinfo.namefieldheight

            group:insert(nameField)      -- insertng into container messes up


            native.setKeyboardFocus( nameField )
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

        nameField:removeSelf()
        nameField = nil

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
     transition.to(  nameField, {  time=parms.time,delta=true, x = parms.x , transition=parms.transition})

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene