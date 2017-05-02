
-------------------------------------------------------
-- Store variables used across the entire app 
-------------------------------------------------------
local tabs = { 
  
        tabbtnw = 28,tabbtnh = 28, tabBarHeight = 50,frameWidth = 20,launchkey = "ahome", transitiontime = 200,
        images = {    backgroundFile  ="tabBarBg7.png",
                      tabSelectedLeftFile =  "tabBar_tabSelectedLeft7.png",       
                      tabSelectedRightFile =   "tabBar_tabSelectedRight7.png",     
                      tabSelectedMiddleFile =  "tabBar_tabSelectedMiddle7.png",  
                 } ,
                 -- stateautoswitch
       -- images = {    backgroundFile  ="sa-tabBarBg7.png",
       --               tabSelectedLeftFile =  "sa-tabBar_tabSelectedLeft7.png",       
       --               tabSelectedRightFile =   "sa-tabBar_tabSelectedRight7.png",     
       --               tabSelectedMiddleFile =  "sa-tabBar_tabSelectedMiddle7.png",  
       --          } ,
        btns = {
            ahome = {
                        label="Home", title="NSPII" ,def="nspii.png",over="nspii-down.png",
                        sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { object="homepage" , navigate = "mainscene"},
                                             },
                        navigation = { composer = { id = "home",lua="scrollblocks" ,time=250, effect="crossFade" },},
                    },
           --[[ bnews = {
                        label="News & Events" ,title="News & Events" ,def="news.png",over="news-down.png",
                        objecttype = "Agency",
                        objectexisting = "myagent",
                        sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { },
                                               usage = { navigate = "mainscene"},

                                             },
                        navigation = { composer = {id = "myagent", lua="locatedetails" ,time=250, effect="crossFade" },},
                                
                    },]]
            cchapters = {
                        label="Chapters",  title="Chapters" ,def="chapter.png",over="chapter-down.png",
                        sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { object="chapters" , navigate = "mainscene"},
                                             },
                        navigation = { composer = { id = "chapters",lua="scrollblocks" ,time=250, effect="crossFade" },},
                    },
            daccount = {
                        label="My Account",  title="My Account" ,def="myaccount.png",over="myaccount-down.png",
                         objecttype = "",  -- not used
                         objectexisting = "myaccount",
                         sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { },
                                               usage = { navigate = "mainscene"},
                                             },
                        navigation = { composer = { id = "debug",lua="debugapp" ,time=250, effect="crossFade" },},
                    },

            zdebug = {
                     label="Debug" ,title="Debug" ,def="nspii.png",over="nspii-down.png" ,showonlyindebugMode=true,
                     sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { },
                                             },
                    navigation = { composer = { id = "debug",lua="debugapp" ,time=250, effect="crossFade" },},
                  }
                }
        } 

         

return tabs
-- The following string values are supported for the effect key of the options table:

-- "fade"
-- "crossFade"
-- "zoomOutIn"
-- "zoomOutInFade"
-- "zoomInOut"
-- "zoomInOutFade"
-- "flip"
-- "flipFadeOutIn"
-- "zoomOutInRotate"
-- "zoomOutInFadeRotate"
-- "zoomInOutRotate"
-- "zoomInOutFadeRotate"
-- "fromRight" — over current scene
-- "fromLeft" — over current scene
-- "fromTop" — over current scene
-- "fromBottom" — over current scene
-- "slideLeft" — pushes current scene off
-- "slideRight" — pushes current scene off
-- "slideDown" — pushes current scene off
-- "slideUp" — pushes current scene off