--====================================================================--
-- NSPII App
--====================================================================--
local myApp = require( "myapp" ) 

-------------------------------------------------------
-- Override print function make global
-------------------------------------------------------
reallyPrint = print
function print(...)
    if myApp.debugMode then
        reallyPrint("<-=====================->") 
        pcall(function() reallyPrint(myApp.appName .. "-> " .. unpack(arg)) end)
    end
end

-------------------------------------------------------
-- pop up messgae
------------------------------------------------------- 
function debugpopup(whatstr) 
  if myApp.debugMode then native.showAlert( myApp.appName ,whatstr ,{"ok"})  end
end

-----------------------------------------
-- launched from somehwre else ?
-----------------------------------------
 
local launchArgs = ...
local launchURL
if launchArgs and launchArgs.url then
   launchURL = launchArgs.url
   debugpopup("Launched in from another app - " .. launchURL)
end

-----------------------------------------
-- Creat unique sessionid
-----------------------------------------
math.randomseed( os.time() + os.clock() )
myApp.authentication.sessionId = string.gsub('xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx', '[xy]', function (c)  local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)   return string.format('%x', v)    end)
print ("sessionId  ".. myApp.authentication.sessionId)
print("time+ clock  "..  os.time() + os.clock()  ) 


Runtime:addEventListener( "startup", 
	function()  
    ---------------------------
    -- inline
    ---------------------------    
		require( myApp.utilsfld .. "startup" ) 
		require( myApp.utilsfld .. "common" )  

		local composer = require( "composer" )
		composer.isDebug = myApp.debugMode
		composer.recycleOnSceneChange = myApp.composer.recycleOnSceneChange

		local widget = require( "widget" )
		widget.setTheme(myApp.theme)

		require( myApp.utilsfld .. "backgroup" )   -- set the backgroup
		require( myApp.utilsfld .. "tabandtop" )   -- set the top and bottom sections

		---------------------------------------------------
		--  Sort everything in the correct z-index order
		----------------------------------------------------
		local stage = display.getCurrentStage()
		stage:insert( myApp.moreGroup )               -- if they hit the more button
		stage:insert( myApp.backGroup )               -- background if secnes etc... are transparent
		stage:insert( composer.stage )                -- composer
		stage:insert( myApp.TitleGroup )              -- the top title area
		stage:insert( myApp.tabBar )                  -- tabbar at bottom
		stage:insert( myApp.transContainer )          -- a container we turn on and off if they select more.select
		                                              -- this makes the slid out main area still somewhat appear but receive taps		                                            
		---------------------------------------------------
		--  Splash and launch first page
		----------------------------------------------------
		require( myApp.utilsfld .. "splash" )             -- transtion from the initial image and launch the first page
		myApp.fncUserLogEvent({type="_session.start"})    -- comes in as raw data

    end
    ---------------------------
    -- inline
    ---------------------------      
 ) 

-----------------------------------
-- actual start right here
-- when finished it will launch the above startup proc
-----------------------------------
require( myApp.utilsfld .. "initialload" )  
 
 









