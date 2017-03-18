
-------------------------------------------------------
-- Store variables used across the entire app 
-------------------------------------------------------
local moreinfo = { 
                      -- in items     showonlyindebugMode = true    showonlyinloggedin
                      imsliding = false,     -- will be updated in app
                      transitiontime = 700,
                      transitiontimealpha = 200,
                      direction = "left",     -- initial direction
                      movefactor = 1.2,      -- how much left or right. Less means less showing of the main screen
                      morebutton = {
                                      defaultFile="morebutton.png",
                                      overFile="morebutton-down.png",
                                      },

                      row = {
                              over={ 1, 0.5, 0, 0.2 },
                              linecolor={ 200/255 },
                              height = 40,
                              indent = 25,
                              textcolor = 1,
                              textfontsize=16 ,
                              catheight = 30,
                              catcolor = { default={ 180 /255, 200/255, 230/255, 0.7} },
                            },
                      items = {

                               AAAlogin = {
                                   title = "Authentication", 
                                   isCategory = true,
                                      },
                               aalogout = {
                                   includeline  = false,       -- needed if prior is header otherwise it looks bad 
                                   title = "Logout", 
                                   showonlyinloggedin=true,
                                   pic="trustedchoice.png",
                                   originaliconwidth = 196,
                                   originaliconheight = 77,
                                   iconwidth = 120,      -- height will be scaled appropriately
                                   text="xxxxx",
                                   backtext = "<",
                                   --sceneinfo = { 
                                   --            htmlinfo = {},
                                   --            scrollblockinfo = { },
                                    --         },
                                   navigation = { execute = {  method = function() Runtime:dispatchEvent{ name="logmeout" } end, },},
                                           
                                       },
                              ablogin = {
                                   includeline  = false,       -- needed if prior is header otherwise it looks bad 
                                   title = "Login", 
                                   showonlyinloggedout=true,
                                   pic="trustedchoice.png",
                                   originaliconwidth = 196,
                                   originaliconheight = 77,
                                   iconwidth = 120,      -- height will be scaled appropriately
                                   text="xxxxx",
                                   backtext = "<",
                                   --sceneinfo = { 
                                   --            htmlinfo = {},
                                   --            scrollblockinfo = { },
                                    --         },
                                   navigation = { composer = {
                                               otherscenes = "login",
                                            },},
                                       },

                               bb0head = {
                                   title = "About", 
                                   isCategory = true,
                                      },
                               bb1 = {title = "Mission", 
                                           pic="xx.png",
                                           text="xx",
                                           backtext = "<",

                                          sceneinfo = { 
                                                htmlinfo = {
                                                    htmlfile="mission.html" ,
                                                    dir = system.ResourceDirectory ,
                                                },
                                               scrollblockinfo = { },
                                             },
                                          navigation = { composer = {
                                               id = "mission",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                         },


                                   bb2= {title = "Antitrust", 
                                    
                                    pic="xx.png",
                                    text="xx",
                                    backtext = "<",
                                          sceneinfo = { 
                                                htmlinfo = {
                                                    htmlfile="antitrust.html" ,
                                                    dir = system.ResourceDirectory ,
                                                },
                                               scrollblockinfo = { },
                                             },
                                          navigation = { composer = {
                                               id = "antitrust",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                            
                                      },


 
                               bb3 = {title = "Help", 

                                           pic="truck.png",
                                           text="Flat tire, out of gas ? We can help",
                                           backtext = "<",

                                          sceneinfo = { 
                                                htmlinfo = {
                                                    htmlfile="help.html" ,
                                                    dir = system.ResourceDirectory ,
                                                },
                                               scrollblockinfo = { },
                                             },
                                          navigation = { composer = {
                                               id = "help",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                         },
                                 bb4 = {
                                       includeline  = false,
                                          title = "Contact NSPII", 
                                          pic="truck.png",
                                          backtext = "<",
                                          sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { object="contactus" , navigate = "subscene"},
                                             },
                                          navigation = { composer = { id = "contactus",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight", },},
                                      },

                               xx0 = {
                                   title = "Foundation", 
                                   isCategory = true,
                                      },
                               xx1 = {
                                   title = "NSPII Foundation", 
                                   backtext = "<",
                                  -- groupheader = { r=15/255, g=75/255, b=100/255, a=1 },   -- can override
                                   sceneinfo = { 
                                                htmlinfo = {
                                                    htmlfile="foundation.html" ,
                                                    dir = system.ResourceDirectory ,
                                                },
                                               scrollblockinfo = { },
                                             },
                                          navigation = { composer = {
                                               id = "foundation",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },
                               xx2 = {
                                   includeline  = false,       -- needed if prior is header otherwise it looks bad 
                                   title = "Past Award Recipients", 
                                   backtext = "<",
                                  -- groupheader = { r=15/255, g=75/255, b=100/255, a=1 },   -- can override
                                   sceneinfo = { 
                                                htmlinfo = {
                                                    htmlfile="pastawards.html" ,
                                                    dir = system.ResourceDirectory ,
                                                },
                                               scrollblockinfo = { },
                                             },
                                          navigation = { composer = {
                                               id = "pastawards",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },
                               zz0 = {
                                   title = "Extras", 
                                   isCategory = true,
                                      },

                              --[[ zz1 = {title = "Where Am I ?"  ,
                                     backtext = "<",
                                     navigation = { composer = {
                                               otherscenes = "whereami",
                                            },},
                                 },--]]
                                zz2 = {
                                          title = "Resources", 
                                          backtext = "<",
                                          sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { object="resources" , navigate = "subscene"},
                                             },
                                          navigation = { composer = { id = "resources",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight", },},
                                      },                                    
  
                                 zz3 = {
                                          title = "Social Media", 
                                          backtext = "<",
                                          sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { object="social" , navigate = "subscene"},
                                             },
                                          navigation = { composer = { id = "social",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight", },},
                                      },                                    
                                   
                                 zz4 = {
                                          title = "Awards", 
                                          backtext = "<",
                                          sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { object="awards" , navigate = "subscene"},
                                             },
                                          navigation = { composer = { id = "awards",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight", },},
                                      },
                              -- zz5 = {title = "Home page"  ,
                              --        backtext = "<",
                              --        navigation = { tabbar = {
                              --                  key = "ahome",
                              --               },},

                                      
                              --     },
                              },  --items

     }
                        
        
return moreinfo