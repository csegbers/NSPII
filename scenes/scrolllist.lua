---------------------------------------------------------------------------------------
-- peoplelist scene
---------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
local myApp = require( "myapp" ) 
--local parse = require( myApp.utilsfld .. "mod_parse" )  
local common = require( myApp.utilsfld .. "common" )
local assetmgr = require( myApp.utilsfld .. "assetmgr" )

local currScene = (composer.getSceneName( "current" ) or "unknown")
local sceneparams
local sceneid
local sbi
local container
local listView
local justcreated  
local runit  
------------------------------------------------------
-- Called first time. May not be called again if we dont recyle
--
-- self.view -> Container -> SCrollvew -> primgroup -> individual item groups
------------------------------------------------------
function scene:create(event)
     print ("Create  " .. currScene)
     justcreated = true
     sceneparams = event.params or {}
      
 
end

function scene:show( event )

    local group = self.view
    local phase = event.phase
    print ("Show:" .. phase.. " " .. currScene)

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).


        ----------------------------
        -- sceneparams at this point contains prior
        -- KEEP IT THAT WAY !!!!!
        --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        ------------------------------
        -- Called when the scene is still off screen (but is about to come on screen).
        runit = true
        if sceneparams and justcreated == false then
          print ("scene compare " .. sceneparams.navigation.composer.id .. " " .. event.params.navigation.composer.id )
          if  sceneparams.navigation.composer then
             if sceneid == event.params.navigation.composer.id then
               runit = false
             end
          end
        end

        --------------------
        -- update sceneparams now, not before as we check prior scene
        --------------------
        sceneparams = event.params or {}
        sceneid = sceneparams.navigation.composer.id       --- new field otherwise it is a refernce and some calls here send a reference so comparing id's is useless         


       --debugpopup (sceneparams.sceneinfo.scrollblockinfo.navigate)
        local function fnchaveobject( event )
            native.setActivityIndicator(false)
            if (runit or justcreated) then 
                --------------------------------------
                -- since this scene can be used for multiple purposes
                -- sbi will point to the table for what items to show etc...etc
                --
                -- if event.tableobject then we came from a download.. update main object
                ---------------------------------------
                if event and event.tableobject then
                    --------------------------------------
                    -- is this object a section of 1 larger file used for myltuke sections?
                    -- if so since we will only download once, grb all sections
                    --------------------------------------
        
                    if myApp.files.items[sceneparams.sceneinfo.scrollblockinfo.object].section then
                        myApp.loadsectionsfromdownload(event)
                    else
                        myApp[sceneparams.sceneinfo.scrollblockinfo.object] = event.tableobject -- do this incase file is used for master as well. If section is subset it will be overridden
                        myApp.loadsectionsfromdownload(event)   -- need to do incase main file is also used to house sections
                    end
                end
                sbi = myApp[sceneparams.sceneinfo.scrollblockinfo.object]
                -- print  ("table load scrollbloack")
                --require( myApp.utilsfld .. "loadsave" ).print_r (sbi)

                display.remove( container )           -- wont exist initially no biggie
                container = nil

                display.remove( listView )           -- wont exist initially no biggie
                listView = nil

                container = common.SceneContainer()
                group:insert(container)


                local function launchDetailsScene(detailfile,id) 

                          local objecttype = detailfile.type    -- person, future others

                          if objecttype == "person" then
                              local persondetails = {  
                                         objecttype = objecttype,
                                         sceneinfo = detailfile.sceneinfo,
                                         title = detailfile.items[id].name, 
                                         pic=detailfile.pic,
                                         originaliconwidth = detailfile.originaliconwidth,
                                         originaliconheight = detailfile.originaliconheight,
                                         iconwidth = detailfile.iconwidth,      -- height will be scaled appropriately
                                         backtext = detailfile.backtext,
                                         person=detailfile.items[id],

                                         navigation = { 
                                               composer = {
                                                              -- this id setting this way we will rerun if different than prior request either object type, value etc etc...
                                                             id = id,   
                                                             lua=detailfile.navigation.composer.lua ,
                                                             time=detailfile.navigation.composer.time, 
                                                             effect=detailfile.navigation.composer.effect,
                                                             effectback=detailfile.navigation.composer.effectback,
                                                          },
                                                     },
                                         }      

                                 local parentinfo =  sceneparams 
                                 persondetails.callBack = function() myApp.showSubScreen({instructions=parentinfo,effectback="slideRight"}) end
                                 myApp.showSubScreen ({instructions=persondetails})
                         end

                end

                local onRowTouch = function( event )
                        local row = event.row
                        local v = sbi.items[event.row.params.k]
                        ------------------------------
                        -- grab the people file to use
                        ------------------------------
                        local p = myApp[sbi.type.object] or {}
                        if p.items == nil then p.items = {}  end  -- should never happen but in case they point to non existient people file
                        if p.items[v.id] == nil then p.items[v.id] = {} end

                        if event.phase == "press"  then     

                                print ("press")
                        elseif event.phase == "tap" then
                               print ("tap")
                        elseif event.phase == "swipeLeft" then

                               print ("sl")
                        elseif event.phase == "swipeRight" then
                               print ("sr")
                 
                        elseif event.phase == "release" then
                               print ("release")
                               if p.items[v.id].name then  launchDetailsScene( p,v.id ) end
                            -- force row re-render on next TableView update
                            
                        end
                    return true
                end       

                local function onRowRender( event )
                     if sbi.type.display == "positions" then
                             local row = event.row
                             local v = sbi.items[event.row.params.k]
                             ------------------------------
                             -- grab the people file to use
                             ------------------------------
                             local p = myApp[sbi.type.object] or {}
                             if p.items == nil then p.items = {}  end  -- should never happen but in case they point to non existient people file
                             if p.items[v.id] == nil then p.items[v.id] = {} end

                             if v.isCategory then
                                 row.nameText = display.newText( v.text or "", 0, 0, myApp.fontBold,sbi.row.catfontsize )
                                 row.nameText.anchorX = 0
                                 row.nameText.anchorY = 0.5
                                 row.nameText:setFillColor( sbi.row.cattextcolor)
                                 row.nameText.y = row.height / 2
                                 row.nameText.x = sbi.row.picindent/2 
                                 row:insert( row.nameText )
                             else
                                  -------------------------------------------------
                                 -- Pic ?
                                 -------------------------------------------------
                                 if p.items[v.id].pic then
                                     row.myIcon = display.newImageRect(myApp.imgfld .. p.items[v.id].pic, p.items[v.id].originaliconwidth or sbi.iconwidth  ,p.items[v.id].originaliconheight or sbi.iconheight )
                                     common.fitImage( row.myIcon,   sbi.row.iconwidth ,row.height-10  )
                                     row.myIcon.anchorX = 0
                                     row.myIcon.x = sbi.row.picindent
                                     row.myIcon.y = row.height/2
                                     row:insert( row.myIcon )

                                 end  

                                 local textstart = 30
                                 local xpos = sbi.row.picindent + sbi.row.iconwidth + sbi.row.picindent
                                  
                                 if v.text then  textstart =  textstart - 10 end 
                                 if v.subtext then  textstart =  textstart - 10 end


                                 if v.text then
                                     row.nameTitle = display.newText( v.text or "", 0, 0, myApp.font, sbi.row.titlefontsize )
                                     row.nameTitle.anchorX = 0
                                     row.nameTitle.anchorY = 0
                                     row.nameTitle:setFillColor( sbi.row.titlecolor )
                                     row.nameTitle.y = textstart
                                     textstart =  textstart + 20
                                     row.nameTitle.x = xpos
                                     row:insert( row.nameTitle )
                                 end

                                 row.nameName = display.newText( p.items[v.id].name or v.id, 0, 0, myApp.fontBold, sbi.row.textfontsize )
                                 row.nameName.anchorX = 0
                                 row.nameName.anchorY = 0
                                 row.nameName:setFillColor( sbi.row.textcolor )
                                 row.nameName.y = textstart
                                 textstart =  textstart + 20
                                 row.nameName.x = xpos
                                 row:insert( row.nameName )

                                 if v.subtext then 
                                     row.nameSubtext = display.newText( v.subtext or "", 0, 0, myApp.fontBold, sbi.row.subtextfontsize )
                                     row.nameSubtext.anchorX = 0
                                     row.nameSubtext.anchorY = 0
                                     row.nameSubtext:setFillColor( sbi.row.subtextcolor )
                                     row.nameSubtext.y = textstart
                                     textstart =  textstart + 20
                                     row.nameSubtext.x = xpos
                                     row:insert( row.nameSubtext )
                                 end

                                 row.rightArrow = display.newImageRect(myApp.icons, 15 , 40, 40)
                                 row.rightArrow.x = display.contentWidth - 20
                                 row.rightArrow.y = row.height / 2
                                 row:insert(row.rightArrow)
                             end

                             
                     end
                     return true
                end

                ---------------------------------------------
                -- create the listview
                ---------------------------------------------
                listView = widget.newTableView{ 
                    x = 0,
                    y = 0,
                    width = myApp.sceneWidth, 
                    height =  myApp.sceneHeight,
                    hideBackground=true,
                    --maskFile = maskFile,
                    --listener = tableViewListener,
                    hideBackground = true, 
                    onRowRender = onRowRender,
                    onRowTouch = onRowTouch 
                 }    
                 container:insert(listView)  

                 --------------------------------------------
                 -- must sort otherwise order is not honered
                 -- so the KEYS must be in alphabetical order you want !!
                 --------------------------------------------

                 local a = {}
                 for n in pairs(sbi.items) do table.insert(a, n) end
                 table.sort(a)
                 local row = 1
                 local col = 1
                 for i,k in ipairs(a) do 
                     local v = sbi.items[k]
                     
                     local defaultcolor ={myApp.sceneBackgroundcolor.r,myApp.sceneBackgroundcolor.g,myApp.sceneBackgroundcolor.b}
                     local rowHeight = sbi.row.height
                     local rowColor = { default=defaultcolor, over=sbi.row.over }
                     local lineColor =  sbi.row.linecolor
                     local isCategory= false

                     if (v.isCategory) then
                          isCategory = true
                          rowHeight = sbi.row.catheight
                          rowColor = sbi.row.catcolor
                          lineColor = defaultcolor
                     end

                     print ("listView page item " .. k)
                       listView:insertRow({
                          rowHeight = rowHeight, 
                          rowColor =  rowColor,
                          lineColor = lineColor,
                          isCategory = v.isCategory or false,
                          params = { k = k}
                       })
                  end     -- end for
                 
                   print ("end of will show")
            end -- runit ?
        end

        if myApp.files.items[sceneparams.sceneinfo.scrollblockinfo.object].download  then
            assetmgr.getjsonasset(
                                      {
                                        errortitle = myApp.files.download.errortitle,
                                        objectname = sceneparams.sceneinfo.scrollblockinfo.object,
                                        filename = myApp.files.items[sceneparams.sceneinfo.scrollblockinfo.object].name,
                                        fileloc = myApp.files.download.fileloc,
                                        callback = fnchaveobject,
                                        networkurl = myApp.files.download.url,
                                        timeout = myApp.files.download.timeout,
                                        performdl = myApp.files.download.performdl,

                                        --------------------
                                        -- cannot get reference to work so callback must update
                                        -------------------------
                                        --tableobject = myApp[sceneparams.sceneinfo.scrollblockinfo.object],
                                      }
                                  )
        else
            fnchaveobject() 
        end
      
    elseif ( phase == "did" ) then
         print ("end of did show")
        --parse:logEvent( "Scene", { ["name"] = currScene} )
         myApp.launchlogin()
         justcreated = false
    end
    

end

function scene:hide( event )
    local group = self.view
    local phase = event.phase
    print ("Hide:" .. phase.. " " .. currScene)

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
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
-- if an overlay is happening to us
-- type (hide show)
-- phase (will did)
---------------------------------------------------
function scene:overlay( parms )
     print ("overlay happening on top of " .. currScene .. " " .. parms.type .. " " .. parms.phase)
     -- local deltamult
     -- if parms.phase == "will"  then
     --     if parms.type == "show"  then
     --        deltamult = 1
     --     else     -- parms.type == "hide"then
     --        deltamult = -1
     --     end
     --     transition.to(  container, {  time=parms.time,delta=true, y=(parms.height + 20 )* deltamult  , height = (parms.height+40) *deltamult*-1  , transition=parms.transition})
     -- end
end


---------------------------------------------------
-- use if someone wants us to transition away
-- for navigational appearnaces
-- used from the more button
---------------------------------------------------
function scene:replaceself( parms )

    transition.to(  container, {  time=parms.time,delta=true, x=parms.x  })
    return true    -- return otherwise caller does not know we exist
end
---------------------------------------------------
-- use if someone wants us to transition away
-- for navigational appearnaces
-- used from the more button
---------------------------------------------------
function scene:morebutton( parms )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene