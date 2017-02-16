
-------------------------------------------------------
-- Store variables used across the entire app 
-------------------------------------------------------
local contactus = { 

--------------------------------------------------------
-- note: physical order of items does not matter. 
-- Order is based on alphabetical based on key 
--------------------------------------------------------

            groupwidth = 120,
            groupmaxwidth = 170,     -- we will allow to grow to fit better if there is extra edging. This would be max however
            groupheight = 140,
            groupheaderheight = 20,
            groupbetween = 10,
            groupbackground = { r=255/255, g=255/255, b=255/255, a=1 },
            groupheader = { r=25/255, g=75/255, b=150/255, a=1 },
            iconwidth = 60,    -- can be overidden in item
            iconheight = 60,   -- can be overidden in item
            headercolor = { r=255/255, g=255/255, b=255/255, a=1 },   
            headerfontsize = 13,  
            textcolor = { r=1/255, g=1/255, b=1/255, a=1 },   
            textfontsize=12   ,       
            textbottomedge =12   ,           
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
                             groupheaderheight = 30, 
                             groupheaderstyle = {
                                      type = 'gradient',
                                      color1 = { 43/255, 143/255, 82/255, 1 }, 
                                      color2 = { 161/255, 200/255, 177/255, 1 },
                                      direction = "down"
                               },
                             headerfontsize = 16 ,
                             navigation = { systemurl = { url="tel:888-677-4498"},},
                                    
                                },


                     ggg = {
                                  title = "Social Media", 
                                  --doublewide=true,
                                  pic="socialmedia.png",
                                  text="NSPII On Social Media",
                                  iconwidth = 90,      -- height will be scaled appropriately
                                  groupheader = { r=90/255, g=50/255, b=90/255, a=1 },
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

                            -- dtt= {title = "CNN Launch separate", 
                            --   pic="web.png",
                            --   text="Sample web page",
                            --   backtext = "<",
                            --   navigation = { systemurl = {
                            --        url="http://www.cnn.com/"
                            --     },},
                                      
                            --     },


                          -- eb44 = {title = "Nearby gas stations", pic="gas.png",text="Locate nearby gas stations" ,
                          --      navigation = { search = { q="Gas Station" },},
                                      
                          --         },
                         iii = {title = "Email NSPII", pic="email.png",text="Email NSPII your question", 
                               navigation = { popup = { type="mail", options= {to="webmaster@stateauto.com", subject="General Question"},},},
                                 },


                          kkk = {title = "Mailing Address", pic="map.png",text="P.O. BOX 88 Delaware,Ohio 43015" ,
                               navigation = { directions = { address="P.O. BOX 88 Delaware,Ohio 43015" },},
                                      
                                  },
                     },   --items
            }
      
return contactus