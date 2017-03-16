
-------------------------------------------------------
-- Store variables used across the entire app 
-------------------------------------------------------
local awards = { 

--------------------------------------------------------
-- note: physical order of items does not matter. 
-- Order is based on alphabetical based on key 
--------------------------------------------------------
       
            items = { 

                          aaa= {title = "National Awards", 
                              pic="nspii-down.png",
                              text="Each year at its Annual Seminar, the Society honors as many as four individuals.",
                              doublewide=true,
                              backtext = "<",
                              textfontsize=16   ,
                                
                               headerfontsize = 16,
                                  sceneinfo = { 
                                       htmlinfo = {},
                                       scrollblockinfo = { object="awardsnational" , navigate = "subscene"},
                                     },
                                  navigation = { composer = { id = "awardsnational",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight", },},
                     
                                },

                          bbb= {title = "Lifetime Members", 
                              pic="nspii-down.png",
                               
                               headerfontsize = 16,
                              text="Any member who has given continuous exemplary service to the Society for not less than 10 years may be recommended for Lifetime Membership",
                              doublewide=true,
                              backtext = "<",
                               sceneinfo = { 
                                                htmlinfo = {
                                                    htmlfile="lifetimemembers.html" ,
                                                    dir = system.ResourceDirectory ,
                                                },
                                               scrollblockinfo = { },
                                             },
                                          navigation = { composer = {
                                               id = "lifetimemembers",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                
                                },
                            
                          ccc= {title = "Indiana Chapter", 
                              pic="nspii-down.png",
                              text="Indiana Chapter",
                              --doublewide=true,
                              backtext = "<",
                               sceneinfo = { 
                                                htmlinfo = {
                                                    htmlfile="indianaaward.html" ,
                                                    dir = system.ResourceDirectory ,
                                                },
                                               scrollblockinfo = { },
                                             },
                                          navigation = { composer = {
                                               id = "indianaaward",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                
                                },
                          ddd= {title = "Ohio Chapter", 
                              pic="nspii-down.png",
                              text="Ohio Chapter",
                              --doublewide=true,
                              backtext = "<",
                              sceneinfo = { 
                                       htmlinfo = {},
                                       scrollblockinfo = { object="awardsohio" , navigate = "subscene"},
                                     },
                                  navigation = { composer = { id = "awardsohio",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight", },},
                     
                                
                                },
                         --[[ bbb= {title = "NSPII Facebook", 
                              pic="facebook.png",
                              text="State Auto Facebook Page",
                              doublewide=true,
                              backtext = "<",
                            navigation = { app = {
                                    url="fb://profile/125377646434",
                                    urlfallback = "https://www.facebook.com/stateauto",
                                 },},
                                
                                },  --]]
                          --[[ ccc= {title = "NSPII Youtube", 
                              pic="youtube.png",
                              text="State Auto Youtube Channel",
                              doublewide=true,
                              backtext = "<",
                            navigation = { systemurl = {
                                    url="https://www.youtube.com/StateAutoInsurance",
                                 },},
                                
                                },  --]]
            },

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
      
return awards