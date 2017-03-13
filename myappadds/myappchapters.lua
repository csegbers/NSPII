
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
                                       htmlinfo = {},
                                       scrollblockinfo = { object="social" , navigate = "subscene"},
                                     },
                                  navigation = { composer = { id = "social",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight", },},
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