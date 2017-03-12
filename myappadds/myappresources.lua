
-------------------------------------------------------
-- Store variables used across the entire app 
-------------------------------------------------------
local resources = { 

--------------------------------------------------------
-- note: physical order of items does not matter. 
-- Order is based on alphabetical based on key 
--------------------------------------------------------

             
                 -- we will allow to grow to fit better if there is extra edging. This would be max however


            items = {
 
                     avid= {title = "PSA Videos", 
                             picx="phone.png",
                             text="In conjunction with CAIF, NSPII provides videos involving Insurance Fraud" ,
                             doublewide=true, 
                             textfontsize=18   ,   
                             groupheight = 110, 

                             headerfontsize = 16 ,
                             sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { object="respsa" , navigate = "subscene"},
                                             },
                                      navigation = { composer = { id = "respsa",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight",},},
                                    
                                },


                     bref= {
                                           title = "Insurance References", 
                                           groupheight = 25, 
                                           doublewide = true,
                                           backtext = "<",
                                           text="",
                                           textfontsize=16   ,
                                            
                                           headerfontsize = 16,

                                       sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { object="resref" , navigate = "subscene"},
                                             },
                                      navigation = { composer = { id = "resref",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight",},},
                               },

                     cfraud= {
                                           title = "Insurance Fraud Links", 
                                           groupheight = 25, 
                                           doublewide = true,
                                           backtext = "<",
                                           text="",
                                           textfontsize=16   ,
                                            
                                           headerfontsize = 16,

                                        sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { object="resfraud" , navigate = "subscene"},
                                             },
                                      navigation = { composer = { id = "resfraud",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight",},},

                               },
                     dtools ={
                                           title = "Investigation Tools", 
                                           groupheight = 90, 
                                           doublewide = true,
                                           backtext = "<",
                                           text="",
                                           textfontsize=18   ,
                                            text="Insurance Investigation Tools and References" ,
                                           headerfontsize = 16,

                                      sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { object="restools" , navigate = "subscene"},
                                             },
                                      navigation = { composer = { id = "restools",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight",},},

                               },

                     enews = {
                                           title = "Insurance News Sources", 
                                           groupheight = 25, 
                                           doublewide = true,
                                           backtext = "<",
                                           text="",
                                           textfontsize=16   ,
                                            
                                           headerfontsize = 16,

                                        sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { object="resnews" , navigate = "subscene"},
                                             },
                                      navigation = { composer = { id = "resnews",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight",},},

                               },
                     flegal= {
                                           title = "National Legal Links", 
                                           groupheight = 25, 
                                           doublewide = true,
                                           backtext = "<",
                                           text="",
                                           textfontsize=16   ,
                                            
                                           headerfontsize = 16,

                                        sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { object="reslegal" , navigate = "subscene"},
                                             },
                                      navigation = { composer = { id = "reslegal",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight",},},

                               },
                     fyoutube= {
                                           title = "YouTube Videos", 
                                           groupheight = 25, 
                                           doublewide = true,
                                           backtext = "<",
                                           text="",
                                           textfontsize=16   ,
                                            
                                           headerfontsize = 16,

                                        sceneinfo = { 
                                               htmlinfo = {},
                                               scrollblockinfo = { object="resyoutube" , navigate = "subscene"},
                                             },
                                      navigation = { composer = { id = "resyoutube",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight",},},

                               },



                     },   --items
            }
      
return resources