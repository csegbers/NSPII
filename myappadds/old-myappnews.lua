-------------------------------------------------------
-- Store variables used across the entire app 
-------------------------------------------------------
local news = { 

--------------------------------------------------------
-- note: physical order of items does not matter. 
-- Order is based on alphabetical based on key 
--------------------------------------------------------



            items = {

                          -- ccc = {title = "Roadside Assistance", pic="towing.png",text="Locate nearby towing services" ,
                          --      navigation = { search = { q="Towing" },},
                                      
                          --         },


                               -- bb5 = {title = "video", 
                               --             pic="video.png",
                               --             text="Flat tire, out of gas ? We can help",
                               --             backtext = "<",

                               --            sceneinfo = { 
                               --                  htmlinfo = {
                               --                      youtubeid="6EKIB8vhki8" ,
                               --                  },
                               --                 scrollblockinfo = { },
                               --               },
                               --            navigation = { composer = {
                               --                 id = "term",
                               --                 lua="webview",
                               --                 time=250, 
                               --                 effect="slideLeft",
                               --                 effectback="slideRight",
                               --              },},
                               --           },
                     aaa = {title = "Call NSPII", pic="phone.png",text="NSPII Phone Line 888-677-4498" ,
                             doublewide=true, 
                             textfontsize=18   ,   

                             headerfontsize = 16 ,
                             navigation = { systemurl = { url="tel:888-677-4498"},},
                                    
                                },


                     ggg = {
                                  title = "Social Media", 
                                  --doublewide=true,
                                  pic="socialmedia.png",
                                  text="NSPII On Social Media",
                                  iconwidth = 90,      -- height will be scaled appropriately
                                  --groupheader = { r=90/255, g=50/255, b=90/255, a=1 },

                                  backtext = "<",
                                  sceneinfo = { 
                                       htmlinfo = {},
                                       scrollblockinfo = { object="social" , navigate = "subscene"},
                                     },
                                  navigation = { composer = { id = "social",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight", },},
                              },   

                       hhh = {title = "NSPII Web", 
                              pic="web.png",
                              text="NSPII Main Website",
                              backtext = "<",
                              forwardtext = ">",


                             sceneinfo = { 
                                  htmlinfo = {     url="http://www.nspii.com/" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "nspiiweb",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                                },


                     },   --items
            }
      
return news