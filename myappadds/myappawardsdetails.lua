-------------------------------------------------------
-- Store variables used across the entire app 
-------------------------------------------------------
local M = { 

     awardsnational = { 

--------------------------------------------------------
-- note: physical order of items does not matter. 
-- Order is based on alphabetical based on key 
--------------------------------------------------------
            headerfontsize = 16,
            groupheight = 120,

            items = { 

                       aa = {
                             
                                   title = "F. Lee Brininger Award", 
                                   text="Investigator of the Year Award.",
                                   backtext = "<",
                                   doublewide = true,
                                   groupheight = 100,
                                  -- groupheader = { r=15/255, g=75/255, b=100/255, a=1 },   -- can override
                                   sceneinfo = { 
                                                htmlinfo = {
                                                    htmlfile="brininger.html" ,
                                                    dir = system.ResourceDirectory ,
                                                },
                                               scrollblockinfo = { },
                                             },
                                          navigation = { composer = {
                                               id = "brininger",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },
                       bb = {
                             
                                   title = "Public Service Award", 
                                   text="To be given to a member of the public sector for 'professionalism, dedication, and accomplishment in the fight against fraudulent insurance claims and/or arson.'",
                                   backtext = "<",
                                   doublewide = true,
                                  -- groupheader = { r=15/255, g=75/255, b=100/255, a=1 },   -- can override
                                   sceneinfo = { 
                                                htmlinfo = {
                                                    htmlfile="publicserviceaward.html" ,
                                                    dir = system.ResourceDirectory ,
                                                },
                                               scrollblockinfo = { },
                                             },
                                          navigation = { composer = {
                                               id = "publicserviceaward",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },
                         cc = {
                             
                                   title = "Outstanding Achievement Award", titlealt="Achievement Award",
                                   text="To be given to a Society member for 'outstanding achievement in the fight against fraudulent insurance claims.'",
                                   backtext = "<",
                                   doublewide = true,
                                  -- groupheader = { r=15/255, g=75/255, b=100/255, a=1 },   -- can override
                                   sceneinfo = { 
                                                htmlinfo = {
                                                    htmlfile="oustandingaward.html" ,
                                                    dir = system.ResourceDirectory ,
                                                },
                                               scrollblockinfo = { },
                                             },
                                          navigation = { composer = {
                                               id = "oustandingaward",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },                
                         dd = {
                             
                                   title = "President's Award", 
                                   text="To be given to a Society member for 'outstanding and exceptional service to the Society.' Awarded at the discretion of the outgoing NSPII President.",
                                   backtext = "<",
                                   doublewide = true,
                                  -- groupheader = { r=15/255, g=75/255, b=100/255, a=1 },   -- can override
                                   sceneinfo = { 
                                                htmlinfo = {
                                                    htmlfile="presidentsaward.html" ,
                                                    dir = system.ResourceDirectory ,
                                                },
                                               scrollblockinfo = { },
                                             },
                                          navigation = { composer = {
                                               id = "presidentsaward",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },   


                },

            
          },

     awardsohio = { 

--------------------------------------------------------
-- note: physical order of items does not matter. 
-- Order is based on alphabetical based on key 
--------------------------------------------------------
            headerfontsize = 16,
            groupheight = 120,

            items = { 

                       aa = {
                             
                                   title = "Ohio Chapter Awards General Information", titlealt="General Information",
                                   text="The two current Ohio Chapter Awards are the Investigator of the Year Award and Outstanding Service Award.",
                                   backtext = "<",
                                   doublewide = true,
                                   groupheight = 100,
                                   headerfontsize = 15,
                                  -- groupheader = { r=15/255, g=75/255, b=100/255, a=1 },   -- can override
                                   sceneinfo = { 
                                                htmlinfo = {
                                                    htmlfile="ohioawardgeneral.html" ,
                                                    dir = system.ResourceDirectory ,
                                                },
                                               scrollblockinfo = { },
                                             },
                                          navigation = { composer = {
                                               id = "ohioawardgeneral",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },
                       bb = {
                             
                                   title = "Ohio Chapter Award Recipients", titlealt="Award Recipients",
                                   text="Ohio Chapter's current Investigator of the Year, Outstanding Service of the Year, and Contributor of the Year recipients'",
                                   backtext = "<",
                                   doublewide = true,
                                  -- groupheader = { r=15/255, g=75/255, b=100/255, a=1 },   -- can override
                                   sceneinfo = { 
                                                htmlinfo = {
                                                    htmlfile="ohioawardrec.html" ,
                                                    dir = system.ResourceDirectory ,
                                                },
                                               scrollblockinfo = { },
                                             },
                                          navigation = { composer = {
                                               id = "ohioawardrec",
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