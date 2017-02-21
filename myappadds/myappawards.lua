
-------------------------------------------------------
-- Store variables used across the entire app 
-------------------------------------------------------
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

                          aaa= {title = "National Awards", 
                              pic="nspii-down.png",
                              text="Each year at its Annual Seminar, the Society honors as many as four individuals.",
                              doublewide=true,
                              backtext = "<",
                              textfontsize=16   ,
                               groupheaderheight = 30, 
                               headerfontsize = 16,
                                  sceneinfo = { 
                                       htmlinfo = {},
                                       scrollblockinfo = { object="awardsnational" , navigate = "subscene"},
                                     },
                                  navigation = { composer = { id = "awardsnational",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight", },},
 

                                
                                },

                          bbb= {title = "Lifetime Members", 
                              pic="nspii-down.png",
                                groupheaderheight = 30, 
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