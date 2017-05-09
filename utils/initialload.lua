local myApp = require( "myapp" ) 

local physicalVersion = myApp.appVersion
local physicalused = false

local function fileexists(filename,filepath)
    local path = system.pathForFile( filename, filepath )
    local fhd = nil 
    if path then  fhd = io.open( path )  end
    local rc = false
      
    -- Determine if file exists
    if fhd then
       print( "File exists" )
       fhd:close()
       rc = true
    else
        print( "File does not exist!" )
    end
    return rc
end

local function sectioncheck(event)
   print ("home page item " .. event.objectname)
   ------------------------
   -- vreq could be nil if file is only downloaded
   -------------------------
   if event.vreq then
       if myApp.files.items[event.objectname].section then
          myApp[event.objectname] = event.vreq[myApp.files.items[event.objectname].section]  
       else
          myApp[event.objectname] = event.vreq
       end
       --------------------------------------
       -- included objects that arent identified on myApp ?
       --------------------------------------
       if event.vreq.includedsections then
           local a = {}
           local n,i,k
           for n in pairs(event.vreq.includedsections.items) do table.insert(a, n) end
           for i,k in ipairs(a) do 
                 myApp.files.items[k] = {}
                 myApp.files.items[k].section = k
                 myApp.files.items[k].name = myApp.files.items[event.objectname].name
                 myApp.files.items[k].json = myApp.files.items[event.objectname].json
                 myApp.files.items[k].download = myApp.files.items[event.objectname].download
                 myApp[k] = event.vreq[k]
           end
       end       
   end

end
local function loadjsonfile(event)
  ------------------------
  -- any error revert back to original file included in app
  ------------------------------
  if ( event.isError ) then
    vreq = require( myApp.utilsfld .. "loadsave" ).loadTable(event.name,myApp.files.download.origfileloc)
  else
    if event.tableobject then
        vreq = event.tableobject
    else
        ----------------------------
         -- double check because we may not get an error on network request bt if file
         -- does not exist there is nothing to load
         -------------------------------------
        if fileexists(event.name,event.fileloc) then
          print ("here aaaa")
           vreq = require( myApp.utilsfld .. "loadsave" ).loadTable(event.name,event.fileloc)
        else
           print ("here bbbb")
           vreq = require( myApp.utilsfld .. "loadsave" ).loadTable(event.name,myApp.files.download.origfileloc)
        end
    end        
  end
  event.vreq = vreq
  sectioncheck(event)
end  

local function loadmyappfiles()
    -------------------------------------------
    -- note: json files do not have to exist in project if they are being download either at  startup or later
    -------------------------------------------
    local a = {}
    local n,i,k
    for n in pairs(myApp.files.items) do table.insert(a, n) end
    for i,k in ipairs(a) do 
       local v = myApp.files.items[k]
       ----------------------------------
       -- in case a file only exists in cloud but we rely on some initial fields, you can do an initial oad
       ----------------------------------
       if v.initialload then
          myApp[k] = v.initialload
       end
       local vreq = {}
     
       if v.json then
           local fileloc = myApp.files.download.origfileloc
           local dlfe = false
           -------------------------
           -- has a new copy been downloaded  and we have it ? Use it.  .fileloc
           -----------------------------------
           print ("---------------------------")
           print (v.name)
           print ("---------------------------")
           if v.download and fileexists(v.name,myApp.files.download.fileloc) == true then
              fileloc = myApp.files.download.fileloc
              dlfe = true
           end

           if v.download and dlfe == false and v.downloadatstartup then
               require( myApp.utilsfld .. "assetmgr" ).getjsonasset(
                                        {
                                          errortitle = myApp.files.download.errortitle,
                                          objectname = k,
                                          filename = v.name,
                                          fileloc = myApp.files.download.fileloc,
                                          callback = loadjsonfile,
                                          networkurl = myApp.files.download.url,
                                          timeout = myApp.files.download.timeout,
                                          setActivityIndicator = false,
                                          performdl = myApp.files.download.performdl,
                                          --------------------
                                          -- cannot get reference to work so callback must update
                                          -------------------------
                                          --tableobject = myApp[sceneparams.sceneinfo.scrollblockinfo.object],
                                        }
                                    )       
           else
              loadjsonfile({objectname = k,name=v.name,fileloc=fileloc})
           end
       else   -- not json ... inlline lua table file ... in the myApp.myappadds suubfolder
           vreq = require( myApp.myappadds .. v.name)
           sectioncheck({vreq=vreq,objectname=k})
       end

    end
    -------------------------------------
    -- get everything else rolling
    -- we are done here
    -------------------------------------
    Runtime:dispatchEvent{ name="startup" }
   -- print ("json  -  " .. require("json").encode(myApp.persondetails ))
end

local function removedlfiles()
       ---------------------------------------
       -- delete all previously downloaded config files
       -- if the new version > than what we have
       -- even though some config files may not have changed, no biggie
       ---------------------------------------

       local lfs = require( "lfs" )
       local doc_path = system.pathForFile( "", myApp.files.download.fileloc )
       local filedel = {}
       local i,v

       for file in lfs.dir( doc_path ) do
            -----------------------------------------
            -- exclude certain files
            -----------------------------------------
            if file == myApp.databasename or file == myApp.appVersionFileName or file == "." or file == ".." then
            else
               table.insert(filedel, file)
            end
       end

       for i,v in ipairs(filedel) do
            local result, reason = os.remove( system.pathForFile( v, myApp.files.download.fileloc ) )
            if result then
               print( v .. "   xxxxxxxxxxxxxxxxxxxxxxxxxxxx >>>>>File removed" )
            else
               print( v .. "  xxxxxxxxxxxxxxxxxxxxxxx >>>>>File does not exist", reason )  --> File does not exist    apple.txt: No such file or directory
            end
       end
end

-----------------------------
-- get config file
--
-- this could point to dynamic tables used for scrollblocks etc..
--
-----------------------------
local function loadconfigfile(event)
      if ( event.isError ) then         
      else
        if event.tableobject then
           ----------------------------------
           -- what app version ?
           ----------------------------------
           if event.tableobject.appVersion then
              if event.tableobject.appVersion > myApp.appVersion then
                 require( myApp.utilsfld .. "loadsave" ).saveTable({appVersion=event.tableobject.appVersion},myApp.appVersionFileName,system.DocumentsDirectory)
                 removedlfiles()
              end
           end
           ----------------------
           -- additional files ?
           --
           -- files { items { .....}}
           -- 
           -- we wont actually download unless called upon
           ----------------------  
           if event.tableobject.files then
              if event.tableobject.files.items then
                  local a = {}
                  local n,i,k
                  for n in pairs(event.tableobject.files.items) do table.insert(a, n) end
                  for i,k in ipairs(a) do 
                      -----------------------------------
                      -- first add to avaiable files
                      -- 
                      -- must have name, json=true, download=true
                      -----------------------------------
                      myApp.files.items[k] = event.tableobject.files.items[k]
                      ------------------------------------
                      --  by chance is the file already downloaded and is still in the cache or temp or wherever?
                      --  get it into the main M table because the rest of the app wont do that , it assume it would have already been loaded
                      -- otherwise no downloadatstartup  ... just get when needed
                      ------------------------------------
                      if fileexists(myApp.files.items[k].name,myApp.files.download.fileloc) == true then
                         loadjsonfile({objectname = k,name=myApp.files.items[k].name,fileloc=myApp.files.download.fileloc})
                      end
                  end
              end
           end 

        end        
      end
      ----------------------------------
      -- now continue on and load other myapp
      -----------------------------------
      loadmyappfiles()
end  


-------------------------------------------
-- start here !!!!
-- be sure to have an appconfig with current version
-- lets us know what version they are on for downloading purposes
-------------------------------------------
if fileexists(myApp.appVersionFileName,system.DocumentsDirectory) ~= true then
   require( myApp.utilsfld .. "loadsave" ).saveTable({appVersion=myApp.appVersion},myApp.appVersionFileName,system.DocumentsDirectory)
end
myApp.appVersion = require( myApp.utilsfld .. "loadsave" ).loadTable(myApp.appVersionFileName,system.DocumentsDirectory).appVersion
--------------------------------------------
-- current physical verion newer than what has been downloaded ?
---------------------------------------------
if physicalVersion > myApp.appVersion then
   myApp.appVersion = physicalVersion
   require( myApp.utilsfld .. "loadsave" ).saveTable({appVersion=physicalVersion},myApp.appVersionFileName,system.DocumentsDirectory)
   physicalused = true
   removedlfiles()
end
print ("APP Version - " .. myApp.appVersion)

-----------------------------------
-- see if we are on current version
-----------------------------------

require( myApp.utilsfld .. "assetmgr" ).getjsonasset(
                        {
                          errortitle = myApp.files.config.errortitle,
                          filename = myApp.files.config.name,
                          fileloc = myApp.files.config.fileloc,
                          callback = loadconfigfile,
                          networkurl = myApp.files.config.url,
                          timeout = myApp.files.config.timeout,
                          overrideexistingfile = true,    -- always override
                          setActivityIndicator = false,
                          performdl = myApp.files.config.performdl,
                        }
                    )  