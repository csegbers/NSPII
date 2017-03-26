---------------------------------------------------------------------------------------
-- people details scene
---------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
local myApp = require( "myapp" ) 

--local parse = require( myApp.utilsfld .. "mod_parse" ) 
local common = require( myApp.utilsfld .. "common" )

local currScene = (composer.getSceneName( "current" ) or "unknown")
print ("Inxxxxxxxxxxxxxxxxxxxxxxxxxxxxx " .. currScene .. " Scene")

local sceneparams
local sceneid
local sceneinfo
local container
local myList
local runit  
local justcreated  
local myRoundedRect
local myMap
local myName
local myAddress
local myIcon
local itemGrp
local myObject     -- response object from the services call or nil if no hit or if existing like agent info
local objectgroup -- pointer to the mappings stuff
local curitemGrpy  
local curmyListy 


------------------------------------------------------
-- Row is rendered
------------------------------------------------------
local  onRowRender = function ( event )

         --Set up the localized variables to be passed via the event table

         local row = event.row
         local id = row.index
         local params = event.row.params

         if ( event.row.params ) then    
 
            row.titleText = display.newText( myApp.objecttypes[params.fieldtype].title, 0, 0, myApp.fontBold, sceneinfo.row.titletextfontsize )
            row.titleText.anchorX = 0
            row.titleText.anchorY = 0.5
            row.titleText:setFillColor( sceneinfo.row.titletextcolor )
            row.titleText.y = sceneinfo.row.titletexty
            row.titleText.x = sceneinfo.row.titletextx

            row.descText = display.newText( params.value, 0, 0, myApp.fontBold, sceneinfo.row.desctextfontsize )
            row.descText.anchorX = 0
            row.descText.anchorY = 0.5
            row.descText:setFillColor( sceneinfo.row.desctextColor )
            row.descText.y = sceneinfo.row.desctexty
            row.descText.x = sceneinfo.row.desctextx


            row:insert( row.titleText )
            row:insert( row.descText )

             -------------------------------------------------
             -- Icon ?
             -------------------------------------------------

            local iconimage = myApp.objecttypes[params.fieldtype].pic
            if iconimage then
                 row.myIcon = display.newImageRect(myApp.imgfld .. iconimage,  sceneinfo.row.iconwidth , sceneinfo.row.iconheight )
                 common.fitImage( row.myIcon,  sceneinfo.row.iconwidth   )
                 row.myIcon.y = sceneinfo.row.height / 2
                 row.myIcon.x = sceneinfo.row.iconwidth/2 + sceneinfo.edge
                 row:insert( row.myIcon )
            end


         end
         return true
end
 
------------------------------------------------------
-- what launch object ?
------------------------------------------------------
local onRowTouch = function( event )
        local row = event.row
        local params = row.params
        local obgroup = myApp.objecttypes[row.params.fieldtype]
        local navgroup = obgroup.navigation

        -----------------------
        -- center the map if we got off wack
        ------------------------
        if navgroup.directions  then
            if myMap and myObject then 
              if myObject.geo then myMap:setCenter( myObject.geo.latitude, myObject.geo.longitude ,true ) end
            end
        end
        
        if event.phase == "press"  then     

        elseif event.phase == "tap" then
              
        elseif event.phase == "swipeLeft" then

        elseif event.phase == "swipeRight" then
 
        elseif event.phase == "release" then


           if navgroup then
               if navgroup.tabbar then
                  myApp.showScreen({instructions=myApp.tabs.btns[navgroup.tabbar.key]})
               else
                   -----------------------------
                   -- launching "external ? ""
                   ---------------------------- 
                   if navgroup.directions then  
                       myApp.navigationCommon ({launch = obgroup.launch, navigation = { directions = { address=string.format( (navgroup.directions.address or ""),  row.params.fulladdress )},},} )
                   else 
                       if navgroup.popup then 
                         myApp.navigationCommon ({launch = obgroup.launch, navigation = { popup = { type = navgroup.popup.type, options ={to=string.format( (navgroup.popup.options.to or ""),  row.params.value )},},} ,})
                       else
                           if navgroup.systemurl then 
                              myApp.navigationCommon( {launch = obgroup.launch, navigation = { systemurl = { url=string.format( (navgroup.systemurl.url or ""),  row.params.value )},},} )
                           else
                                if navgroup.composer then
                                    local locatelaunch =                          
                                         {
                                            title = obgroup.title, 
                                            text=myName.text,
                                            backtext = obgroup.backtext ,
                                            forwardtext = obgroup.forwardtext ,
                                            pic=obgroup.pic,
                                            -- htmlinfo = { 
                                            --               url=row.params.value ,
                                            --            },
                                            sceneinfo = obgroup.sceneinfo,
                                            navigation = 
                                             { 
                                                composer = 
                                                    { 
                                                       id = row.params.value ,
                                                       lua=navgroup.composer.lua,
                                                       time=navgroup.composer.time, 
                                                       effect=navgroup.composer.effect,
                                                       effectback=navgroup.composer.effectback,              
                                                    }
                                            ,}
                                        ,}
                                     locatelaunch.sceneinfo.htmlinfo.url =  row.params.value   
                                     local parentinfo =  sceneparams 
                                     -----------------------------------------
                                     -- are being used as a main tabbar scene ?
                                     -----------------------------------------
                                     if myApp.MainSceneNavidate(parentinfo) then
                                       myApp.navigationCommon(locatelaunch)
                                     else
                                        locatelaunch.callBack = function() myApp.showSubScreen({instructions=parentinfo,effectback="slideRight"}) end
                                        myApp.showSubScreen ({instructions=locatelaunch})
                                     end
                                     
                                end   -- if composer
                           end  -- if systemurl
                       end   -- popup
                   end -- directions
               end -- tabbar
           end   -- if navigation

            
        end
    return true
end


------------------------------------------------------
-- The map. centered and marked for the 1 item
------------------------------------------------------
local function buildMap( event )
      if  myObject   then   --  myObject = person
          if  myObject.geo  then
              native.setActivityIndicator( true ) 

              local mapheight = myApp.sceneHeight-myList.height-itemGrp.height-sceneinfo.edge*2
              myMap = native.newMapView( 0, 0, myApp.sceneWidth-sceneinfo.edge , mapheight  )   -- cause
              if myMap then
                 myMap.mapType = sceneinfo.map.type -- other mapType options are "satellite" or "hybrid"

              -- The MapView is just another Corona display object, and can be moved or rotated, etc.
                 myMap.x = myApp.cCx
                 myMap.y = myApp.sceneStartTop + itemGrp.height  + sceneinfo.edge+ mapheight/2 + sceneinfo.edge/2

                 
                 if myObject.geo.latitude and myObject.geo.longitude then
                    myMap:setCenter( myObject.geo.latitude, myObject.geo.longitude, false )
                    myMap:setRegion( myObject.geo.latitude, myObject.geo.longitude, sceneinfo.map.latitudespan, sceneinfo.map.longitudespan, false)

                    local options = { 
                              title=myObject.name, 
                              subtitle=(myObject.street or "") .. " " .. (myObject.city  or "") .. ", " .. (myObject.state  or "") .. " " .. (myObject.zip or "") , 
                               }
                    myMap:addMarker(  myObject.geo.latitude, myObject.geo.longitude, options )
                 end
                
              end

              native.setActivityIndicator( false ) 
          end
      end
end



------------------------------------------------------
-- Called first time. May not be called again if we dont recyle
------------------------------------------------------
function scene:create(event)
 
    print ("Create  " .. currScene)
    justcreated = true
    local group = self.view
    sceneparams = event.params            
     

end

function scene:show( event )

    local group = self.view
    local phase = event.phase

    print ("Show:" .. phase.. " " .. currScene)

    ----------------------------------
    -- Will Show
    ----------------------------------
    if ( phase == "will" ) then   
        ----------------------------
        -- sceneparams at this point contains prior
        -- KEEP IT THAT WAY !!!!!
        --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        ------------------------------
        -- Called when the scene is still off screen (but is about to come on screen).
        runit = true
        if sceneparams and justcreated == false then
          if  sceneparams.navigation.composer then
             --if sceneparams.navigation.composer.id == event.params.navigation.composer.id then
             if sceneid == event.params.navigation.composer.id then
               runit = false
             end
          end
        end

        ----------------------------
        -- now go ahead
        --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        ------------------------------
        sceneparams = event.params  
        sceneid = sceneparams.navigation.composer.id       --- new field otherwise it is a refernce and some calls here send a reference so comparing id's is useless         
        sceneinfo = myApp.persondetails

        ------------------------------------------------
        -- clear thing out for this luanhc
        ------------------------------------------------
        if (runit or justcreated) then 


             display.remove( container )           -- wont exist initially no biggie
             container = nil

             display.remove( myList )           -- wont exist initially no biggie
             myList = nil

             container  = common.SceneContainer()
             group:insert(container )

             ---------------------------------------------
             -- Header group
             -- text gets set in Show evvent
             ---------------------------------------------

             itemGrp = display.newGroup(  )
             local startX = 0
             local startY = 0 -myApp.cH/2 + sceneinfo.groupheight/2  + myApp.sceneStartTop

             local groupwidth = myApp.sceneWidth-sceneinfo.edge
             local dumText = display.newText( {text="X",font= myApp.fontBold, fontSize=sceneinfo.textfontsize})

             local textHeightSingleLine = dumText.height
             
             -------------------------------------------------
             -- Background
             -------------------------------------------------
             myRoundedRect = display.newRoundedRect(startX, startY , groupwidth-sceneinfo.groupstrokewidth*2,sceneinfo.groupheight, sceneinfo.cornerradius )
             myRoundedRect:setFillColor(sceneinfo.groupbackground.r,sceneinfo.groupbackground.g,sceneinfo.groupbackground.b,sceneinfo.groupbackground.a )
             itemGrp:insert(myRoundedRect)

             local startYother = startY- sceneinfo.groupheight/2  

             -------------------------------------------------
             -- Name text - will be set in show
             -------------------------------------------------
             myName = display.newText( {text="", x=startX , y=0, height=0,width=groupwidth-sceneinfo.edge*2 ,font= myApp.fontBold, fontSize=sceneinfo.textfontsize,align="left" })
             --myName.y=myRoundedRect.y --startYother+sceneinfo.groupheight - (myName.height) -  sceneinfo.textbottomedge
             myName.anchorY = 0
             myName.y = myRoundedRect.y - myRoundedRect.height/2 + sceneinfo.edge/2
             myName:setFillColor( sceneinfo.textcolor.r,sceneinfo.textcolor.g,sceneinfo.textcolor.b,sceneinfo.textcolor.a )
             itemGrp:insert(myName)

             -------------------------------------------------
             -- address text - will be set in show
             -------------------------------------------------
             myAddress = display.newText( {text="", x=startX , y=0, height=0,width=groupwidth-sceneinfo.edge*2 ,font= myApp.fontBold, fontSize=sceneinfo.textfontsizeaddress,align="left" })
             myAddress.anchorY = 0
             myAddress.y = 0 -- myRoundedRect.y - myRoundedRect.height/2 + sceneinfo.edge/2
             myAddress:setFillColor( sceneinfo.textcoloraddress.r,sceneinfo.textcoloraddress.g,sceneinfo.textcoloraddress.b,sceneinfo.textcoloraddress.a )
             itemGrp:insert(myAddress)

             container:insert(itemGrp)

             ------------------------------------------------------
             -- Table View
             ------------------------------------------------------
             myList = widget.newTableView {
                   x=0,
                   y= myApp.cH/2 -  sceneinfo.tableheight/2 - myApp.tabs.tabBarHeight-sceneinfo.edge, 
                   width = myApp.sceneWidth-sceneinfo.edge, 
                   height = sceneinfo.tableheight,
                   onRowRender = onRowRender,
                   onRowTouch = onRowTouch,
                   listener = scrollListener,
                }
             container:insert(myList )




            myObject = nil
            --myName.text = ""  
            --myAddress.text = ""  
            --myList:deleteAllRows()    -- really not needed
            if sceneinfo.animation then
               curitemGrpy = itemGrp.y
               curmyListy = myList.y
               itemGrp.y = itemGrp.y - itemGrp.height
               myList.y = myList.y + myList.height
            end
        end

    ----------------------------------
    -- Did Show
    ----------------------------------
    elseif ( phase == "did" ) then
        --parse:logEvent( "Scene", { ["name"] = currScene} )
        --objectgroup = myApp.mappings.objects[sceneparams.objecttype]     
        --print(sceneparams.objecttype .." queryval" .. (sceneparams.objectqueryvalue  or "")  .. " Existing " .. (sceneparams.objectexisting  or "") )

        local BuildTheScene = function (resp)
                myObject = resp    --person
                local haveitems = false
                ---------------------------------------------
                --  do we even have an object
                ---------------------------------------------
                itemGrp.isVisible = true
                myList.isVisible = true

                print("NAME" .. (myObject.name or ""))
                myName.text = (myObject.name or "") 
                myAddress.text = (myObject.street  or "") .. "\n"   
                if myObject.street2 then myAddress.text = myAddress.text ..myObject.street2  .. "\n"   end
                myAddress.text = myAddress.text  .. (myObject.city or "") .. ", " .. (myObject.state or "") .. " " .. (myObject.zip or "") 
                myAddress.y = myName.y+ myName.height  
                if sceneinfo.animation then
                    transition.to(  itemGrp, { time=sceneinfo.animationtime, y = curitemGrpy , transition=easing.outQuint})
                    transition.to(  myList, { time=sceneinfo.animationtime, y = curmyListy , transition=easing.outQuint})
                end
                if myObject.pic then
                   myIcon = display.newImageRect(myApp.imgfld .. myObject.pic, myObject.originaliconwidth or sceneinfo.iconwidth ,myObject.originaliconheight or sceneinfo.iconheight)
                   common.fitImage( myIcon,   sceneinfo.iconwidth ,myRoundedRect.height -sceneinfo.edge  )
                   itemGrp:insert(myIcon )
                  --myIcon.anchorX = 0
                   --myIcon.anchorY = 0
                   myIcon.x = myRoundedRect.x + myRoundedRect.width/2 - sceneinfo.iconwidth/2 - sceneinfo.edge/2
                   myIcon.y = myRoundedRect.y
               end  
                ---------------------------------------------
                -- Sort (key is critical !!)
                -- what laucnh objects are availble ? See if those fields came down via the service.
                -- they may not always exist
                --------------------------------------------- 
                local a = {}
                for n in pairs(myObject.launchobjects) do table.insert(a, n) end
                table.sort(a)


                local insertObject = function ( rowparms )
                      haveitems = true
                      myList:insertRow{
                        rowHeight = sceneinfo.row.height,
                        isCategory = false,
                        rowColor = sceneinfo.row.rowColor,
                        lineColor = sceneinfo.row.lineColor,

                        params = rowparms, --{
                                    -- fieldtype = rowparms.fieldtype,  -- will point to object table
                                   --  desc = rowparms.desc,      -- actual field vale
                                 -- }  -- params
                        }   --myList:insertRow
                end


 
                ---------------------------------------------
                -- Generate the rows for potential object launches like phne email
                --------------------------------------------- 
                for i,k in ipairs(a) do 
                    ---------------------------
                    -- is the field there  in the response?
                    ---------------------------
                    if myObject.launchobjects[k].field  then  
                       local fieldval = myObject.launchobjects[k].field 
                       if myObject.launchobjects[k].type == "phone" then fieldval = common.phoneformat(fieldval) end
                       insertObject({fieldtype = myObject.launchobjects[k].type,  value = fieldval, })
                    end   -- does field exist
                end   --loop

                ---------------------------------------------
                -- Generate a get directions row ?
                -- myApp.persondetails
                --------------------------------------------- 
                if sceneinfo.row.includedirections and myObject.street  then
                   local address = (myObject.street  or "") .. " " .. (myObject.city  or "") .. ", " .. (myObject.state  or "")   --.. " " .. (myObject[objectgroup.mapping.zip] or ""
                   local addresswithzip = address .. " " .. (myObject.zip or "")
                   insertObject({
                          fieldtype = "directions",
                          value = address, 
                          fulladdress = addresswithzip,
                          })
                end
               if haveitems then 
                  myList:scrollToIndex( 1 ) 
               end
        end 

     ------------------------------------------------------------
     -- get it started
     ------------------------------------------------------------
    
        if (runit or justcreated) then
           BuildTheScene(sceneparams.person)
        end
        buildMap()    -- do regardsless
       
 
        justcreated = false
    end   -- phase check
	

end

function scene:hide( event )
    local group = self.view
    local phase = event.phase
    print ("Hide:" .. phase.. " " .. currScene)

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        if myMap and myMap.removeSelf then
          myMap:removeSelf()
          myMap = nil
        end
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end

function scene:destroy( event )
	local group = self.view
    print ("Destroy "   .. currScene)
end


function scene:myparams( event )
       return sceneparams
end

function scene:overlay( parms )
     print ("overlay happening on top of " .. currScene .. " " .. parms.type .. " " .. parms.phase)
     if parms.phase == "will"  then
         local slidex = myApp.cW --/ 2  + myApp.tabs.tabBarHeight  + myApp.tSbch
         local alphatype = 0
         local slidextype = 1
         if parms.type == "hide"  then
            alphatype = 1
            slidextype = -1
         end
         if myMap then
            transition.to(  myMap, {  time=parms.time/2,alpha=alphatype})
         end
      --   transition.to(  myMap, {  time=parms.time/2,delta=true, x =  slidex * slidextype })
     end
end

---------------------------------------------------
-- use if someone wants us to transition away
-- for navigational appearnaces
-- used from the more button
---------------------------------------------------
function scene:morebutton( parms )
   if myMap then
     transition.to(  myMap, {  time=parms.time,delta=true, x = parms.x , transition=parms.transition})
   end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene