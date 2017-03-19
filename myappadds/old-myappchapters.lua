
-------------------------------------------------------
-- Store variables used across the entire app 
-------------------------------------------------------
local chapters = { 

--------------------------------------------------------
-- note: physical order of items does not matter. 
-- Order is based on alphabetical based on key 
--------------------------------------------------------


 
            groupheight = 25, 
            headerfontsize = 16,


            items = {



                     a = {
                                  title = "National Board", 
                                  doublewide=true,
                                  
                                   
                                  iconwidth = 90,      -- height will be scaled appropriately
                                  --groupheader = { r=90/255, g=50/255, b=90/255, a=1 },

                                  backtext = "<",
                                  sceneinfo = { 
                                               feedName = "myappchaptersdetails.json",
                                               feedURL = "https://s3.amazonaws.com/nspii/myappchaptersdetails.json",
                                               icons = "fixed",
                                               reachablemsg = {
                                                      errortitle = "No Feed", 
                                                      errormessage = "Feed temporarily unavaialble." ,
                                                   } ,
                                              },
                                    child={
                                                 navigation = { composer = {
                                                     id = "xx",    -- dynamiclaly changed
                                                     lua="webview",
                                                     time=250, 
                                                     effect="slideLeft",
                                                     effectback="slideRight",
                                                  },},
                                             },

                                   ---------------------------
                                    -- note if calling same lua from same lua... effect wont do much of course
                                     ---------------------------
                                     navigation = { composer = { id = "national",lua="peoplelist" ,time=250, effect="slideLeft" ,effectback="slideRight",},},
                                  },   


                     b = {
                                  title = "Committees", 
                                  doublewide=true,
                                  
                                   
                                  iconwidth = 90,      -- height will be scaled appropriately
                                  --groupheader = { r=90/255, g=50/255, b=90/255, a=1 },

                                  backtext = "<",
                                  sceneinfo = { 
                                       htmlinfo = {},
                                       scrollblockinfo = { object="social" , navigate = "subscene"},
                                     },
                                  navigation = { composer = { id = "social",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight", },},
                              },  
                     c = {
                                  title = "State Chapters", 
                                  doublewide=true,
                                   
                                   
                                  iconwidth = 90,      -- height will be scaled appropriately
                                  --groupheader = { r=90/255, g=50/255, b=90/255, a=1 },

                                  backtext = "<",
                                  sceneinfo = { 
                                       htmlinfo = {},
                                       scrollblockinfo = { object="social" , navigate = "subscene"},
                                     },
                                  navigation = { composer = { id = "social",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight", },},
                              }, 

                     },   --items
            }
      
return chapters