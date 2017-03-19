
-------------------------------------------------------
-- Store variables used across the entire app 
-------------------------------------------------------
local people = { 

            items = {

                     coswald = {
                          name="Clayton O. Oswald",
                          corp="Taylor, Keller & Oswald, PLLC",
                          street="P.O. Box 3440",
                          city="London",
                          state="KY",
                          zip="40743",
                           ---------------------------
                          -- Object id are used for alphabetical sorting
                          ---------------------------
                          launchobjects = {
                                        a = {
                                               type="phone",
                                               desc="(606) 878-8844",
                                            },                                        
                                        b = {
                                               type="email",
                                               field="coswald@tkolegal.com",
                                            },
                                        c = {
                                               type="fax",
                                               desc="(606) 878-8850",
                                            },                                               
                                        [[-c = {
                                               type="web",
                                               field="agencyWWW",
                                            },  
                                        d = {
                                               type="facebook",
                                               field="agencyFacebook",
                                            },   
                                        e = {
                                               type="twitter",
                                               field="agencyTwitter",
                                            },     ]]                                      
                                     },   

                          },   -- end of person
                      tburris = {
                          name="Todd M. Burris",
                          corp="State Auto Insurance Co.",
                          street="P.O. Box 781022",
                          city="Indianapolis",
                          state="IN",
                          zip="46278",
                           ---------------------------
                          -- Object id are used for alphabetical sorting
                          ---------------------------
                          launchobjects = {
                                        a = {
                                               type="phone",
                                               desc="(317) 452-9615",
                                            },                                        
                                        b = {
                                               type="email",
                                               field="todd.burris@stateauto.com",
                                            },
                                        c = {
                                               type="fax",
                                               desc="(614) 719-0182",
                                            },                                               
                                    
                                     },   
                          },   -- end of person
                        dcomstock = {
                          name="David 'Chip' Comstock, Jr.",
                          corp="Bonezzi Switzer Polito & Hupp",
                          street="4137 Boardman-Canfield Rd.",
                          street2 = "Suite 101",
                          city="Canfield",
                          state="OH",
                          zip="44406",
                           ---------------------------
                          -- Object id are used for alphabetical sorting
                          ---------------------------
                          launchobjects = {
                                        a = {
                                               type="phone",
                                               desc="(330) 286-3701",
                                            },                                        
                                        b = {
                                               type="email",
                                               field="dcomstock@bsphlaw.com",
                                            },
                                        c = {
                                               type="fax",
                                               desc="(330) 286-3745",
                                            },                                               
                                   
                                     },   
                          },   -- end of person
                     },   --items
            }
      
return people