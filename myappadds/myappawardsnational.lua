local awards = { 

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
            groupheader = { r=80/255, g=120/255, b=30/255, a=1 },
            iconwidth = 60,    -- can be overidden in item
            iconheight = 60,   -- can be overidden in item
            headercolor = { r=255/255, g=255/255, b=255/255, a=1 },   
            headerfontsize = 13,  
            textcolor = { r=1/255, g=1/255, b=1/255, a=1 },   
            textfontsize=12   ,       
            textbottomedge =12   ,           
            items = { 

                       aaa = {
                             
                                   title = "F. Lee Brininger Award", 
                                   text="Investigator of the Year Award.",
                                   backtext = "<",
                                   doublewide = true,
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
                       bbb = {
                             
                                   title = "Public Service Award", 
                                   text="To be given to a member of the public sector for 'professionalism, dedication, and accomplishment in the fight against fraudulent insurance claims and/or arson.'",
                                   backtext = "<",
                                   doublewide = true,
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
                         ccc = {
                             
                                   title = "Outstanding Achievement Award", 
                                   text="To be given to a Society member for 'outstanding achievement in the fight against fraudulent insurance claims.'",
                                   backtext = "<",
                                   doublewide = true,
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
                         ddd = {
                             
                                   title = "President's Award", 
                                   text="To be given to a Society member for 'outstanding and exceptional service to the Society.' Awarded at the discretion of the outgoing NSPII President.",
                                   backtext = "<",
                                   doublewide = true,
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


            },

            
          }
      
return awards