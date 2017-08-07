---------------------------------------------------------------------------------------
-- webview scene
---------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
local myApp = require( "myapp" ) 

--local parse = require( myApp.utilsfld .. "mod_parse" ) 
local common = require( myApp.utilsfld .. "common" )
local assetmgr = require( myApp.utilsfld .. "assetmgr" )

local currScene = (composer.getSceneName( "current" ) or "unknown")
print ("Inxxxxxxxxxxxxxxxxxxxxxxxxxxxxx " .. currScene .. " Scene")

local sceneparams
local webView

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
            --parse:logEvent( "Scene", { ["name"] = currScene} )
            local pagewasloaded = false

            local function webListener( event )
                if event.type == "loaded" or event.type == "timeout"  and pagewasloaded == false then
                    pagewasloaded = true
                    if webView then
                       webView.isVisible = true
                       webView:removeEventListener( "urlRequest", webListener)
                    end
                    native.setActivityIndicator( false )
                    if  event.type == "timeout"  then
                        native.showAlert( myApp.appName ,myApp.webview.timeoutmessage ,{"ok"}) 
                    end
                end
            end
            -------------------------------------
            -- note this wont show in windows simulator but 
            -- doesnt error. 
            -------------------------------------
            webView = native.newWebView( myApp.sceneWidth / 2, myApp.sceneHeight  /2 + myApp.sceneStartTop,myApp.sceneWidth,myApp.sceneHeight )
            
            webView.isVisible = false
            --webView:reload()
            webView:addEventListener( "urlRequest", webListener )
            --debugpopup(sceneparams.htmlinfo.url )
            local url = sceneparams.sceneinfo.htmlinfo.url

            timer.performWithDelay(myApp.webview.pageloadwaittime, function() webListener({type="timeout"}) end) 
            if sceneparams.sceneinfo.htmlinfo.url then
                if string.sub(url, 1, 4):upper() ~= "HTTP" then  url = "http://" .. url end
                native.setActivityIndicator( true )
                webView:request( url )
            elseif  sceneparams.sceneinfo.htmlinfo.htmlfile then
                
                local fnchavehtml = function( event )
                   ------------------------------
                   -- any issues or no file to dl just use one came with the app
                   ------------------------------
                   if ( event.isError or (common.fileexists(sceneparams.sceneinfo.htmlinfo.htmlfile,myApp.files.html.fileloc) ~= true  ) ) then
                      webView:request( myApp.htmlfld .. sceneparams.sceneinfo.htmlinfo.htmlfile , myApp.directories[sceneparams.sceneinfo.htmlinfo.dir] )
                   else
                      webView:request( sceneparams.sceneinfo.htmlinfo.htmlfile , myApp.files.html.fileloc)
                   end
                   
                end

                -------------------------------------
                -- is there a replcaement to download ?
                --  
                -------------------------------------
                if myApp.files.html.performdl  then
                    assetmgr.getasset(
                                              {
                                                errortitle = myApp.files.html.errortitle,
                                                objectname = sceneparams.sceneinfo.htmlinfo.htmlfile,
                                                filename = sceneparams.sceneinfo.htmlinfo.htmlfile,
                                                fileloc = myApp.files.html.fileloc,
                                                callback = fnchavehtml,
                                                networkurl = myApp.files.html.url,
                                                timeout = myApp.files.html.timeout,
                                                performdl = myApp.files.html.performdl,

                                                --------------------
                                                -- cannot get reference to work so callback must update
                                                -------------------------
                                                --tableobject = myApp[sceneparams.sceneinfo.scrollblockinfo.object],
                                              }
                                          )
                else
                    fnchavehtml() 
                end


            elseif sceneparams.sceneinfo.htmlinfo.youtubeid   then

                     local temphtml = "youtube.html"
                     local temphtmlpath  = system.pathForFile( temphtml, system.TemporaryDirectory )
                     local fh, errStr = io.open( temphtmlpath, "w" )
 
                     if fh then
                        print( "Created file" )
                        fh:write("<!doctype html>\n<html>\n<head>\n<meta charset=\"utf-8\">")
                        fh:write("<meta name=\"viewport\" content=\"width=320; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;\"/>\n")
                        fh:write("<style type=\"text/css\">\n html { -webkit-text-size-adjust: none; font-family: HelveticaNeue-Light, Helvetica, Droid-Sans, Arial, san-serif; font-size: 1.0em; } h1 {font-size:1.25em;} p {font-size:0.9em; } </style>")
                         fh:write("</head>\n<body>\n")
                        if sceneparams.title then
                           fh:write("<h1>" .. sceneparams.title .. "</h1>\n")
                        end
                        fh:write([[<iframe width="100%" height="]] .. math.floor(display.contentWidth / 16 * 9) .. [[" src="http://www.youtube.com/embed/]] .. sceneparams.sceneinfo.htmlinfo.youtubeid .. [[?html5=1" frameborder="0" allowfullscreen></iframe>]])
                      --   fh:write([[<iframe width="100%" height="]] .. math.floor(display.contentWidth / 16 * 9) .. [[" src="http://www.youtube.com/embed/]] .. sceneparams.sceneinfo.htmlinfo.youtubeid  .. [[?rel=0&autoplay=1" allowfullscreen frameborder="0"/>]])
                        if sceneparams.text then
                           fh:write( "<h5>" .. sceneparams.text .. "</h5>\n" )
                        end                     
                         fh:write("</body></html>")
                        io.close( fh )
                     else
                         print( "Create file failed!" )
                    end

                    webView:request( temphtml , system.TemporaryDirectory )

            end
            myApp.scenetransition = false
            
    end	

end

function scene:hide( event )
    local group = self.view
    local phase = event.phase
    print ("Hide:" .. phase.. " " .. currScene)

    if ( phase == "will" ) then
        if webView and webView.removeSelf then
            native.setActivityIndicator( false )     -- just incase
            webView:removeSelf()
            webView = nil
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
         transition.to(  webView, {  time=parms.time/2,alpha=alphatype})
         transition.to(  webView, {  time=parms.time/2,delta=true, y =  slidey * slideytype })
       --  transition.to(  webView, {  time=parms.time,delta=true, y=(parms.height + 20 -parms.height/2)* deltamult  , height = (parms.height+40) *deltamult*-1  , transition=parms.transition})
     end
end
---------------------------------------------------
-- use if someone wants us to transition away
-- for navigational appearnaces
-- used from the more button
---------------------------------------------------
function scene:morebutton( parms )
     transition.to(  webView, {  time=parms.time,delta=true, x = parms.x , transition=parms.transition})
end

---------------------------------------------------
-- Title bar navigation hit. Do we do something ?
---------------------------------------------------
function scene:navigationhit( parms )

     local returncode = false
     if parms.phase == "back" and webView.canGoBack then
        returncode = true
        webView:back()
     elseif parms.phase == "forward"  then     -- go ahead and set true even if we cant go forward since no other nav is needed
        returncode = true
        if  webView.canGoForward then
           webView:forward()
        end
     end
     return returncode
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene