local loadsave = require( "utils." .. "loadsave" )
local socket = require( "socket" )
print "In assetmgr.lua"
-------------------------------------------------------
-- common functions used in any app
-------------------------------------------------------
local M = { }

-------------------------------------------------------
-- wont work for functions and other types in the table
-------------------------------------------------------
-- function M.DeepCopy(t)
--    local t2 = {};
--    if type(t) == "table" then
--       t2 = json.decode(json.encode(t))
--    end
--    return t2
-- end
function M.fileexists(filename,filepath)
    local path = system.pathForFile( filename, filepath )
    local fhd = io.open( path )
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

function M.testNetworkConnection()
    local netConn = socket.connect('www.google.com', 80)
    if netConn == nil then
         return false
    end
    netConn:close()
    return true
end

function M.getjsonasset(parms)

        local networkListener = function( event )
            native.setActivityIndicator(false)
            if ( event.isError ) then
                local alert = native.showAlert( parms.errortitle, event.response, { "Okay" } , onAlertComplete)
            else
                ---------------------------------
                -- update app table object
                ---------------------------------
                 --print  ("table load pre aaaaaa " .. parms.objectname)
                --loadsave.print_r (parms.tableobject)
                if M.fileexists(parms.filename,parms.fileloc) then
                   event.tableobject  = loadsave.loadTable(parms.filename,parms.fileloc)
                end
                -- require( "myapp" )[parms.objectname]  = loadsave.loadTable(parms.filename,parms.fileloc)
               -- print  ("table load after bbbbbb")
                --loadsave.print_r (parms.tableobject)
            end
            event.objectname = parms.objectname
            event.name= parms.filename 
            event.fileloc= parms.fileloc 
            parms.callback(event)
            return true
        end

        if (M.fileexists(parms.filename,parms.fileloc) ~= true or parms.overrideexistingfile) and parms.performdl == true then
            print ("attempt dl")
            if M.testNetworkConnection()  then
                 
                native.setActivityIndicator( parms.setActivityIndicator or true)
                 
                network.download(parms.networkurl .. parms.filename, "GET", networkListener,{timeout = parms.timeout}, parms.filename, parms.fileloc)
            else
                parms.callback({name= parms.filename,fileloc= parms.fileloc,objectname = parms.objectname,isError = true, response="Network Unreachable"})
            end
        else
            parms.callback({name= parms.filename,fileloc= parms.fileloc,objectname = parms.objectname,isError = false, response="File already downloaded or no attempt"})
        end

end


return M