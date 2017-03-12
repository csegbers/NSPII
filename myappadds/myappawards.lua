
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
                             navigation = { app = {
                                    --url="twitter://user?screen_name=StateAuto",
                                    urlfallback = "https://twitter.com/search?q=nspii",
                                 },},
                                
                                },
                          ccc= {title = "Indiana Chapter", 
                              pic="nspii-down.png",
                              text="Indiana Chapter",
                              --doublewide=true,
                              backtext = "<",
                             navigation = { app = {
                                    --url="twitter://user?screen_name=StateAuto",
                                    urlfallback = "https://twitter.com/search?q=nspii",
                                 },},
                                
                                },
                          ddd= {title = "Ohio Chapter", 
                              pic="nspii-down.png",
                              text="Ohio Chapter",
                              --doublewide=true,
                              backtext = "<",
                             navigation = { app = {
                                    --url="twitter://user?screen_name=StateAuto",
                                    urlfallback = "https://twitter.com/search?q=nspii",
                                 },},
                                
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

            
          }
      
return awards