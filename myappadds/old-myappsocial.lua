
-------------------------------------------------------
-- Store variables used across the entire app 
-------------------------------------------------------
local social = { 
 
           
            groupheader = { r=90/255, g=50/255, b=90/255, a=1 },
            groupbackgroundstyle = {
                                      type = 'gradient',
                                      color1 = { 225/255, 245/255, 235/255, 1 }, 
                                      color2 = { 250/255, 250/255, 250/255, 1 },
                                      direction = "down"
                               }, 
              
            headerfontsize = 16,   
            textfontsize=18   ,    


            items = { 

                          aaa= {title = "NSPII LlinkedIn", 
                              pic="linkedin_icon.png",
                              text="Search NSPII On LinkedIn",
                              doublewide=true,
                              backtext = "<",

                             navigation = { app = {
                                    --url="twitter://user?screen_name=StateAuto",
                                    urlfallback = "http://www.linkedin.com/groups?gid=3733613&sik=1364930442625&viewmember",
                                 },},
                                
                                },

                          bbb= {title = "NSPII Twitter", 
                              pic="twitter.png",
                              text="Search NSPII On Twitter",
                              doublewide=true,
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
      
return social