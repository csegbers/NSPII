
-------------------------------------------------------
-- Store variables used across the entire app 
-------------------------------------------------------
local M = { 

             respsa = {    
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

                      aa = {title = "NSPII Web", 
                              pic="web.png",
                              text="NSPII Main Website",
                              backtext = "<",
                              forwardtext = ">",
                              groupheaderstyle = {
                                      type = 'gradient',
                                      color1 = { 43/255, 143/255, 82/255, 1 }, 
                                      color2 = { 161/255, 200/255, 177/255, 1 },
                                      direction = "down"
                                  },

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
                          },
                                 
                       },
             resref = {    

                      groupwidth = 120,
                      groupmaxwidth = 170,     -- we will allow to grow to fit better if there is extra edging. This would be max however
                      groupheight = 120,
                      groupheaderheight = 30,
                      groupbetween = 10,
                      groupbackground = { r=255/255, g=255/255, b=255/255, a=1 },
                      groupheader = { r=25/255, g=75/255, b=150/255, a=1 },
                      iconwidth = 60,    -- can be overidden in item
                      iconheight = 60,   -- can be overidden in item
                      headercolor = { r=255/255, g=255/255, b=255/255, a=1 },   
                      headerfontsize = 16,  
                      textcolor = { r=1/255, g=1/255, b=1/255, a=1 },   
                      textfontsize=14   ,       
                      textbottomedge =12   ,           
                      items = {

                      aa = {title = "Resources", 
                              pic="web.png",
                              doublewide=true, 
                              groupheight = 100,
                              text="Barry Klein's Insurance Trade and Professional Associations",
                              backtext = "<",
                              forwardtext = ">",
                              groupheaderstyle = {
                                      type = 'gradient',
                                      color1 = { 43/255, 143/255, 82/255, 1 }, 
                                      color2 = { 161/255, 200/255, 177/255, 1 },
                                      direction = "down"
                                  },

                             sceneinfo = { 
                                  htmlinfo = {     url="http://www.barryklein.com/plnn/organizations.htm" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "barryklein",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                             },  -- end an item

                        bb = {title = "NHTSA", 
                              pic="web.png",
                              doublewide=true, 
                              text="National Highway Traffic Safety Admin. Child Safety Seats, Air Bag Safety & More",
                              backtext = "<",
                              forwardtext = ">",
                              groupheaderstyle = {
                                      type = 'gradient',
                                      color1 = { 43/255, 143/255, 82/255, 1 }, 
                                      color2 = { 161/255, 200/255, 177/255, 1 },
                                      direction = "down"
                                  },

                             sceneinfo = { 
                                  htmlinfo = {     url="https://www.nhtsa.gov/" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "nhtsa",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                             },  -- end an item
                         cc = {title = "Insurance Services Office", 
                              doublewide=true, 
                              pic="web.png",
                              text="Supplier of statistical, actuarial, and underwriting information for the property/casualty insurance industry.",
                              backtext = "<",
                              forwardtext = ">",
                              groupheight = 140,
                              groupheaderstyle = {
                                      type = 'gradient',
                                      color1 = { 43/255, 143/255, 82/255, 1 }, 
                                      color2 = { 161/255, 200/255, 177/255, 1 },
                                      direction = "down"
                                  },

                             sceneinfo = { 
                                  htmlinfo = {     url="http://www.iso.com" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "iso",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                             },  -- end an item                           
                          },   -- end items
                                 
                       }, 
             resfraud = {    
                          
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

                      aa = {title = "NSPII Web", 
                              pic="web.png",
                              text="NSPII Main Website",
                              backtext = "<",
                              forwardtext = ">",
                              groupheaderstyle = {
                                      type = 'gradient',
                                      color1 = { 43/255, 143/255, 82/255, 1 }, 
                                      color2 = { 161/255, 200/255, 177/255, 1 },
                                      direction = "down"
                                  },

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
                          },
                                 
                       },
             restools = {    
                          
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

                      aa = {title = "NSPII Web", 
                              pic="web.png",
                              text="NSPII Main Website",
                              backtext = "<",
                              forwardtext = ">",
                              groupheaderstyle = {
                                      type = 'gradient',
                                      color1 = { 43/255, 143/255, 82/255, 1 }, 
                                      color2 = { 161/255, 200/255, 177/255, 1 },
                                      direction = "down"
                                  },

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
                          },
                                 
                       },

             resnews= {    
                          
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

                      aa = {title = "NSPII Web", 
                              pic="web.png",
                              text="NSPII Main Website",
                              backtext = "<",
                              forwardtext = ">",
                              groupheaderstyle = {
                                      type = 'gradient',
                                      color1 = { 43/255, 143/255, 82/255, 1 }, 
                                      color2 = { 161/255, 200/255, 177/255, 1 },
                                      direction = "down"
                                  },

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
                          },
                                 
                       },

             reslegal= {    
                          
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

                      aa = {title = "NSPII Web", 
                              pic="web.png",
                              text="NSPII Main Website",
                              backtext = "<",
                              forwardtext = ">",
                              groupheaderstyle = {
                                      type = 'gradient',
                                      color1 = { 43/255, 143/255, 82/255, 1 }, 
                                      color2 = { 161/255, 200/255, 177/255, 1 },
                                      direction = "down"
                                  },

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
                          },
                                 
                       },



     }
                        
        
return M