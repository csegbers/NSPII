---------------------------------------------------------------------------------------
-- videoview scene
---------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
local myApp = require( "myapp" ) 

local parse = require( myApp.utilsfld .. "mod_parse" ) 
local common = require( myApp.utilsfld .. "common" )

local currScene = (composer.getSceneName( "current" ) or "unknown")
print ("Inxxxxxxxxxxxxxxxxxxxxxxxxxxxxx " .. currScene .. " Scene")

local sceneparams
local videoView

------------------------------------------------------
-- Called first time. May not be called again if we dont recyle
------------------------------------------------------
function scene:create(event)

    print ("Create  " .. currScene)
    local group = self.view
    sceneparams = event.params or {}

end

function scene:show( event )

    local group = self.view
    local phase = event.phase
    print ("Show:" .. phase.. " " .. currScene)
    sceneparams = event.params or {}

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then

            local function viewListener( event )
                print( "Event phase: " .. event.phase )
              
                if event.errorCode then
                    native.showAlert( "Error!", event.errorMessage, { "OK" } )
                end
            end
            -------------------------------------
            -- note this wont show in windows simulator but 
            -- doesnt error. 
            -------------------------------------
            videoView = native.newVideo( myApp.sceneWidth / 2, myApp.sceneHeight  /2 + myApp.sceneStartTop,myApp.sceneWidth,myApp.sceneHeight )
            
            videoView.isVisible = false
            --webView:reload()

            --debugpopup(sceneparams.htmlinfo.url )

            if sceneparams.sceneinfo.htmlinfo.video and sceneparams.sceneinfo.htmlinfo.dir then
                videoView:load( myApp.videofld .. sceneparams.sceneinfo.htmlinfo.video, sceneparams.sceneinfo.htmlinfo.dir )
                videoView:addEventListener( "video", viewListener )
                videoView.isVisible = true
                videoView:play()
            end
            myApp.scenetransition = false
            
    end	

end

function scene:hide( event )
    local group = self.view
    local phase = event.phase
    print ("Hide:" .. phase.. " " .. currScene)

    if ( phase == "will" ) then
        if videoView and videoView.removeSelf then
            native.setActivityIndicator( false )     -- just incase
            videoView:removeSelf()
            videoView = nil
        end

    elseif ( phase == "did" ) then

    end

end

function scene:destroy( event )
 
    print ("Destroy "   .. currScene)
end

---------------------------------------------------
-- use if someone wants us to transition away
-- for navigational appearnaces
---------------------------------------------------
function scene:myparams( event )
       return sceneparams
end
---------------------------------------------------
-- if an overlay is happening to us
-- type (hide show)
-- phase (will did)
--
-- must slide away so overlay scene can perform
---------------------------------------------------
function scene:overlay( parms )
     print ("overlay happening on top of " .. currScene .. " " .. parms.type .. " " .. parms.phase)
     if parms.phase == "will"  then
         local slidey = myApp.cH --/ 2  + myApp.tabs.tabBarHeight  + myApp.tSbch
         local alphatype = 0
         local slideytype = 1
         if parms.type == "hide"  then
            alphatype = 1
            slideytype = -1
         end
         transition.to(  videoView, {  time=parms.time/2,alpha=alphatype})
         transition.to(  videoView, {  time=parms.time/2,delta=true, y =  slidey * slideytype })
       --  transition.to(  webView, {  time=parms.time,delta=true, y=(parms.height + 20 -parms.height/2)* deltamult  , height = (parms.height+40) *deltamult*-1  , transition=parms.transition})
     end
end
---------------------------------------------------
-- use if someone wants us to transition away
-- for navigational appearnaces
-- used from the more button
---------------------------------------------------
function scene:morebutton( parms )
     transition.to(  videoView, {  time=parms.time,delta=true, x = parms.x , transition=parms.transition})
end

---------------------------------------------------
-- Title bar navigation hit. Do we do something ?
---------------------------------------------------
function scene:navigationhit( parms )
     return false
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene