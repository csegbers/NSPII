local awards = { 

--------------------------------------------------------
-- note: physical order of items does not matter. 
-- Order is based on alphabetical based on key 
--------------------------------------------------------
            headerfontsize = 16,
            groupheight = 120,

            items = { 

                       aaa = {
                             
                                   title = "F. Lee Brininger Award", 
                                   text="Investigator of the Year Award.",
                                   backtext = "<",
                                   doublewide = true,
                                   groupheight = 100,
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
                             
                                   title = "Outstanding Achievement Award", titlealt="Achievement Award",
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