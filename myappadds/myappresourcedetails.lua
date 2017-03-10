
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
                      --groupheader = { r=25/255, g=75/255, b=150/255, a=1 },
                      groupheaderstyle = {
                                      type = 'gradient',
                                      color1 = { 43/255, 143/255, 82/255, 1 }, 
                                      color2 = { 161/255, 200/255, 177/255, 1 },
                                      direction = "down"
                                  },
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
                      -- groupheader = { r=25/255, g=75/255, b=150/255, a=1 },
                      groupheaderstyle = {
                                      type = 'gradient',
                                      color1 = { 43/255, 143/255, 82/255, 1 }, 
                                      color2 = { 161/255, 200/255, 177/255, 1 },
                                      direction = "down"
                                  },                      iconwidth = 60,    -- can be overidden in item
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
                         cc = {title = "Insurance Services Office", titlealt = "ISO",
                              doublewide=true, 
                              pic="web.png",
                              text="Supplier of statistical, actuarial, and underwriting information for the property/casualty insurance industry.",
                              backtext = "<",
                              forwardtext = ">",
                              groupheight = 140,


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
                      -- groupheader = { r=25/255, g=75/255, b=150/255, a=1 },
                      groupheaderstyle = {
                                      type = 'gradient',
                                      color1 = { 43/255, 143/255, 82/255, 1 }, 
                                      color2 = { 161/255, 200/255, 177/255, 1 },
                                      direction = "down"
                                  },
                      iconwidth = 60,    -- can be overidden in item
                      iconheight = 60,   -- can be overidden in item
                      headercolor = { r=255/255, g=255/255, b=255/255, a=1 },   
                      headerfontsize = 13,  
                      textcolor = { r=1/255, g=1/255, b=1/255, a=1 },   
                      textfontsize=12   ,       
                      textbottomedge =12   ,           
                      items = {

                      aa = {title = "ACFE", 
                              pic="web.png",
                              text="Association of Certified Fraud Examiners",
                              backtext = "<",
                              forwardtext = ">",


                             sceneinfo = { 
                                  htmlinfo = {     url="http://www.acfe.com/" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "ACFE",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                               },
                        bb = {title = "ATF", 
                              pic="web.png",
                              text="Bureau of Alcohol, Tobacco, Firearms and Explosives",
                              backtext = "<",
                              forwardtext = ">",

                             sceneinfo = { 
                                  htmlinfo = {     url="https://www.atf.gov/" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "ATF",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                               },   -- end item
                         cc = {title = "CAIF", 
                              pic="web.png",
                              text="Coalition Against Insurance Fraud",
                              backtext = "<",
                              forwardtext = ">",

                             sceneinfo = { 
                                  htmlinfo = {     url="http://www.insurancefraud.org/index.htm" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "CAIF",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                               },   -- end item     
                          dd = {title = "III", 
                              pic="web.png",
                              text=[["Insurance Fraud" Insurance Information Institute]],
                              backtext = "<",
                              forwardtext = ">",

                             sceneinfo = { 
                                  htmlinfo = {     url="http://www.iii.org/search/node/%22insurance%20fraud%22" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "III",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                               },   -- end item                          
                           ee = {title = "IASIU", 
                              pic="web.png",
                              text="International Association of Special Investigations Unit",
                              backtext = "<",
                              forwardtext = ">",

                             sceneinfo = { 
                                  htmlinfo = {     url="http://www.iasiu.org/" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "IASIU",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                               },   -- end item  
                         ff = {title = "IRS", 
                              pic="web.png",
                              text="Internal Revenue Service",
                              backtext = "<",
                              forwardtext = ">",

                             sceneinfo = { 
                                  htmlinfo = {     url="https://www.irs.gov/" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "IRS",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                               },   -- end item       
                          gg = {title = "Fraud.org", 
                              pic="web.png",
                              text="National Fraud Information Center",
                              backtext = "<",
                              forwardtext = ">",

                             sceneinfo = { 
                                  htmlinfo = {     url="http://www.fraud.org/" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "Fraudorg",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                               },   -- end item   
                        hh = {title = "NICB", 
                              pic="web.png",
                              text="National Insurance Crime Bureau ",
                              backtext = "<",
                              forwardtext = ">",

                             sceneinfo = { 
                                  htmlinfo = {     url="https://www.nicb.org/" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "NICB",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                               },   -- end item     
                       ii = {title = "NW3C", 
                              pic="web.png",
                              text="National White Collar Crime",
                              backtext = "<",
                              forwardtext = ">",

                             sceneinfo = { 
                                  htmlinfo = {     url="https://www.nw3c.org/" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "NW3C",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                               },   -- end item                                                              
                       jj = {title = "S.E.A.", 
                              pic="web.png",
                              text="Scientific Expert Analysis",
                              backtext = "<",
                              forwardtext = ">",

                             sceneinfo = { 
                                  htmlinfo = {     url="http://www.sealimited.com/" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "sea",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                               },   -- end item    

                          },
                                 
                       },
             restools = {    
                          
                      groupwidth = 120,
                      groupmaxwidth = 170,     -- we will allow to grow to fit better if there is extra edging. This would be max however
                      groupheight = 140,
                      groupheaderheight = 20,
                      groupbetween = 10,
                      groupbackground = { r=255/255, g=255/255, b=255/255, a=1 },
                      -- groupheader = { r=25/255, g=75/255, b=150/255, a=1 },
                      groupheaderstyle = {
                                      type = 'gradient',
                                      color1 = { 43/255, 143/255, 82/255, 1 }, 
                                      color2 = { 161/255, 200/255, 177/255, 1 },
                                      direction = "down"
                                  },
                      iconwidth = 60,    -- can be overidden in item
                      iconheight = 60,   -- can be overidden in item
                      headercolor = { r=255/255, g=255/255, b=255/255, a=1 },   
                      headerfontsize = 13,  
                      textcolor = { r=1/255, g=1/255, b=1/255, a=1 },   
                      textfontsize=12   ,       
                      textbottomedge =12   ,           
                      items = {

                      aa = {title = "Kelly Blue Book", 
                              pic="web.png",
                              doublewide=true, 
                              groupheight = 80,
                              text="Check the current value of a vehicle for free! ",
                              backtext = "<",
                              forwardtext = ">",


                             sceneinfo = { 
                                  htmlinfo = {     url="https://www.kbb.com/" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "kelly",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                             },  -- end an item
                      bb = {title = "NAIS Insurance Claims Resource Center",titlealt = "NAIS", 
                              pic="web.png",
                              doublewide=true, 
                              groupheight = 80,
                              text="NAIS Insurance Claims Resource Center",
                              backtext = "<",
                              forwardtext = ">",


                             sceneinfo = { 
                                  htmlinfo = {     url="http://www.pimall.com/nais/sur.rc.html" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "NAIS",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                             },  -- end an item
                      cc = {title = "PI Toolbox", 
                              pic="web.png",
                              doublewide=true, 
                              groupheight = 90,
                              text="National Association of Investigation Specialists PI Assistance Page ",
                              backtext = "<",
                              forwardtext = ">",


                             sceneinfo = { 
                                  htmlinfo = {     url="http://www.pimall.com/nais/in.menu.html" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "pitool",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                             },  -- end an item
                      dd = {title = "Surname, address & telephone search", titlealt="Switchboard",
                              pic="web.png",
                              doublewide=true, 
                              groupheight = 140,
                              text="Search for surnames or look up addresses and telephone numbers using this free national telephone criss-cross directory.  It can also be used as a conventional telephone information source.",
                              backtext = "<",
                              forwardtext = ">",


                             sceneinfo = { 
                                  htmlinfo = {     url="http://www.switchboard.com/" , },
                                 scrollblockinfo = { },
                                             },
                              navigation = { composer = {
                                   id = "switchboard",
                                   lua="webview",
                                   time=250, 
                                   effect="slideLeft",
                                   effectback="slideRight",
                                },},
                                
                             },  -- end an item
                          },
                                 
                       },

             resnews= {    
                      groupwidth = 120,
                      groupmaxwidth = 170,     -- we will allow to grow to fit better if there is extra edging. This would be max however
                      groupheight = 140,
                      groupheaderheight = 30,
                      groupbetween = 10,
                      groupbackground = { r=255/255, g=255/255, b=255/255, a=1 },
                      --groupheader = { r=25/255, g=75/255, b=150/255, a=1 },
                      groupheaderstyle = {
                                                type = 'gradient',
                                                color1 = { 43/255, 143/255, 82/255, 1 }, 
                                                color2 = { 161/255, 200/255, 177/255, 1 },
                                                direction = "down"
                                         },           
                      iconwidth = 60,    -- can be overidden in item
                      iconheight = 60,   -- can be overidden in item
                      headercolor = { r=255/255, g=255/255, b=255/255, a=1 },   
                      headerfontsize = 13,  
                      textcolor = { r=1/255, g=1/255, b=1/255, a=1 },   
                      textfontsize=12   ,       
                      textbottomedge =12   ,          
                      items = {
                           a= {
                                         title = "A.M. Best", 
                                          text="Best's Insurance Professionals and Claims Resource", 
                                         groupheight = 100, 
                                         pic="web.png",
                                         doublewide = true,
                                         backtext = "<",
                                         
                                         textfontsize=16   ,
                                          
                                         headerfontsize = 16,
                                         sceneinfo = { 
                                              htmlinfo = {     url="http://www3.ambest.com/DPSDirectorySearch/DirectoryCenter.aspx" , },
                                             scrollblockinfo = { },
                                                         },
                                          navigation = { composer = {
                                               id = "ambest",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },   -- end item
                           b= {
                                         title = "Claims Magazine", 
                                           text="National Underwriter Property & Casualty", 
                                         groupheight = 100, 
                                         pic="web.png",
                                         doublewide = true,
                                         backtext = "<",
                                         
                                         textfontsize=16   ,
                                          
                                         headerfontsize = 16,
                                         sceneinfo = { 
                                              htmlinfo = {     url="http://www.claimsmag.com/" , },
                                             scrollblockinfo = { },
                                                         },
                                          navigation = { composer = {
                                               id = "claimmag",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },   -- end item
                           c= {
                                         title = "Insurance News Network", 
                                          text="Insurance News Network", 
                                         groupheight = 100, 
                                         pic="web.png",
                                         doublewide = true,
                                         backtext = "<",
                                        
                                         textfontsize=16   ,
                                          
                                         headerfontsize = 16,
                                         sceneinfo = { 
                                              htmlinfo = {     url="http://www.insure.com/" , },
                                             scrollblockinfo = { },
                                                         },
                                          navigation = { composer = {
                                               id = "innet",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },   -- end item

                          },
                                 
                       },

             reslegal= {    
                          
                      groupwidth = 120,
                      groupmaxwidth = 170,     -- we will allow to grow to fit better if there is extra edging. This would be max however
                      groupheight = 140,
                      groupheaderheight = 30,
                      groupbetween = 10,
                      groupbackground = { r=255/255, g=255/255, b=255/255, a=1 },
                      --groupheader = { r=25/255, g=75/255, b=150/255, a=1 },
                      groupheaderstyle = {
                                                type = 'gradient',
                                                color1 = { 43/255, 143/255, 82/255, 1 }, 
                                                color2 = { 161/255, 200/255, 177/255, 1 },
                                                direction = "down"
                                         },           
                      iconwidth = 60,    -- can be overidden in item
                      iconheight = 60,   -- can be overidden in item
                      headercolor = { r=255/255, g=255/255, b=255/255, a=1 },   
                      headerfontsize = 13,  
                      textcolor = { r=1/255, g=1/255, b=1/255, a=1 },   
                      textfontsize=12   ,       
                      textbottomedge =12   ,          
                      items = {
                          a1= {
                                         title = "American Bar Association Network", titlealt="ABANET",
                                          text="American Bar Association Network", 
                                         groupheight = 90, 
                                         pic="web.png",
                                         doublewide = true,
                                         backtext = "<",
                                         
                                         textfontsize=16   ,
                                          
                                         headerfontsize = 16,
                                         sceneinfo = { 
                                              htmlinfo = {     url="http://www.abanet.org/" , },

                                             scrollblockinfo = { },
                                                         },
                                          navigation = { composer = {
                                               id = "abanet",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },   -- end item                     
                          a2= {
                                         title = "craig test youtube", titlealt="ABANET",
                                          text="American Bar Association Network", 
                                         groupheight = 90, 
                                         pic="web.png",
                                         doublewide = true,
                                         backtext = "<",
                                         
                                         textfontsize=16   ,
                                          
                                         headerfontsize = 16,
                                         sceneinfo = { 
                                              htmlinfo = {  youtubeid ="CV3xHLN5ErA"},--   url="http://www.abanet.org/" , },

                                             scrollblockinfo = { },
                                                         },
                                          navigation = { composer = {
                                               id = "abanet",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },   -- end item
                          a3= {
                                         title = "craig test video", titlealt="ABANET",
                                          text="American Bar Association Network", 
                                         groupheight = 90, 
                                         pic="web.png",
                                         doublewide = true,
                                         backtext = "<",
                                         
                                         textfontsize=16   ,
                                          
                                         headerfontsize = 16,
                                         sceneinfo = { 
                                              htmlinfo = {  video ="Big Screen.m4v",
                                                            dir = system.ResourceDirectory ,
                                                          },--   url="http://www.abanet.org/" , },

                                             scrollblockinfo = { },
                                                         },
                                          navigation = { composer = {
                                               id = "abanet",
                                               lua="videoview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },   -- end item
                           b= {
                                         title = "KuesterLaw", 
                                           text="Jeff Kuester's Technology Comprehensive Law List", 
                                         groupheight = 100, 
                                         pic="web.png",
                                         doublewide = true,
                                         backtext = "<",
                                         
                                         textfontsize=16   ,
                                          
                                         headerfontsize = 16,
                                         sceneinfo = { 
                                              htmlinfo = {     url="http://www.kuesterlaw.com/" , },
                                             scrollblockinfo = { },
                                                         },
                                          navigation = { composer = {
                                               id = "kuester",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },   -- end item
                           c= {
                                         title = "Law Journal Extra", 
                                          text="Legal Services Corporation", 
                                         groupheight = 90, 
                                         pic="web.png",
                                         doublewide = true,
                                         backtext = "<",
                                        
                                         textfontsize=16   ,
                                          
                                         headerfontsize = 16,
                                         sceneinfo = { 
                                              htmlinfo = {     url="http://www.law.com/" , },
                                             scrollblockinfo = { },
                                                         },
                                          navigation = { composer = {
                                               id = "law",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },   -- end item
 
                           d= {
                                         title = "Martindale-Hubbell", 
                                          text="Helps corporate counsel and law firm lawyers connect with lawyers and firms", 
                                         groupheight = 120, 
                                         pic="web.png",
                                         doublewide = true,
                                         backtext = "<",
                                        
                                         textfontsize=16   ,
                                          
                                         headerfontsize = 16,
                                         sceneinfo = { 
                                              htmlinfo = {     url="http://www.martindale.com/" , },
                                             scrollblockinfo = { },
                                                         },
                                          navigation = { composer = {
                                               id = "mart",
                                               lua="webview",
                                               time=250, 
                                               effect="slideLeft",
                                               effectback="slideRight",
                                            },},
                                       },   -- end item
                          },
                                 
                       },



     }
                        
        
return M