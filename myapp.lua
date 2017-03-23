
-------------------------------------------------------
-- Store variables used across the entire app 
-------------------------------------------------------
local M = { 
            debugMode = true,
            justLaunched = true,
            appName = "NSPII App" ,
            appNameSmall = "NSPII App" ,
            appVersion = 0,
            appVersionFileName = "appversion.json",
            tabMyAgentKey = "",     -- will be key of myagent if used
            tabMyAccountKey = "",     -- will be key of myaccount if used
            tabCurrentKey = "",     -- will change as we tab
            urlScheme = "nspiiapp",
            cW = display.contentWidth,
            cH = display.contentHeight,
            cCx = display.contentCenterX,
            cCy = display.contentCenterY,
            tSbch = display.topStatusBarContentHeight,
            statusBarType = display.TranslucentStatusBar,    --   "display.DefaultStatusBar",    "display.DarkStatusBar",    "display.TranslucentStatusBar",
            saColor = { },
            saColorTrans = { },
            colorGray = { },
            isTall = false,
            colorDivisor = 255,
            isGraphics2 = true,
            is_iPad = false,
            titleBarHeight = 50,
            titleBarEdge = 10,
            titleBarTextColor = { r=255/255, g=255/255, b=255/255, a=1 },
            transparentcolor = { r=255/255, g=255/255, b=255/255, a=1 },
            transparentalpha = .7,
            ------------------------------
            -- folders
            ------------------------------
            imgfld = "images/",
            htmlfld = "html/",
            videofld = "videos/",
            myappadds = "myappadds.",
            scenesfld = "scenes.",
            utilsfld = "utils.",
            classfld = "classes.",

            ------------------------------
            -- database stuff
            ------------------------------            
            databasename= "nspiiapp.db",    -- be sure to put in protected file down below
            hashkey = "aXaLwATgS3lPh848glLpugq5sqcHi8T2jfDQeWz1",

            ------------------------------
            -- other stuff
            ------------------------------ 
            theme = "widget_theme_ios7",
            font =  "HelveticaNeue-Light",
            fontBold = "HelveticaNeue",
            fontItalic = "HelveticaNeue-LightItalic",
            fontBoldItalic = "Helvetica-BoldItalic",
            sceneStartTop = 0,     -- set elsewhere
            sceneHeight = 0,     -- set elsewhere
            sceneWidth = 0,     -- set elsewhere
            sceneBackgroundcolor = { r=241/255, g=242/255, b=243/255, a=1 },
            sceneBackgroundmorecolor = { r=56/255, g=106/255, b=76/255, a=1 },

            directories = {
                 d = system.DocumentsDirectory ,
                 c = system.CachesDirectory ,
                 t = system.TemporaryDirectory ,
                 r = system.ResourceDirectory 
              },

            methods = {
                logout = function() Runtime:dispatchEvent{ name="logmeout" } end,
                alert = function() local alert = native.showAlert( "hi", "hi there", { "Okay" }  ) end,

              },
            ------------------------------
            -- used by scrollblocks
            ------------------------------ 
            scrollblocks = { 
                              groupwidth = 120,
                              groupheight = 140,
                              groupmaxwidth = 170, 
                              groupheaderheight = 30,
                              groupbetween = 10,
                              --groupheader = { r=25/255, g=75/255, b=150/255, a=1 },
                              groupheaderstyle = {
                                                        type = 'gradient',
                                                        color1 = { 43/255, 143/255, 82/255, 1 }, 
                                                        color2 = { 161/255, 200/255, 177/255, 1 },
                                                        -- stateautoswitch
                                                     --   color1 = { 189/255, 203/255, 220/255, 1 }, 
                                                     -- color2 = { 89/255, 116/255, 152/255, 1 },
                                                        direction = "down"
                                                   },
                                      
                              groupbackground = { r=255/255, g=255/255, b=255/255, a=1 },
                              --groupheaderstyle = {},
                              headercolor = { r=255/255, g=255/255, b=255/255, a=1 },  
                              headerfontsize = 13, 
                              textcolor = { r=1/255, g=1/255, b=1/255, a=1 },   
                              textfontsize=12   , 
                              textbottomedge =12   ,  
                              iconwidth = 60,    -- can be overidden in item
                              iconheight = 60,   -- can be overidden in item
                          },

            scenemaskFile = "",
            splash = {image = "splash.png", delay = 150, },
            promptforphonecalls = true,


            composer = {
                          recycleOnSceneChange = false,      --- if true then scenes are destoyed
                          inoverlay = false,        -- our internal tracker
                       },


            webview = {
                         pageloadwaittime = 10000,
                         timeoutmessage = "Page taking too long to load.",
                     },
            lobinfo = {
                          default = {
                                   image = "lobdefault.png",
                              },
                          autop = {
                                   image = "lobautop.png",
                                   vehicles = true,
                              },
                          home = {
                                   image = "lobhome.png",
                              },
                          pumbr = {
                                   image = "lobpumbr.png",
                                   vehicles = true,
                              },
                           },
            docimages = {
                               default = {image ="docdefault.png",},
                               pdf = { image =  "pdf.png",  },          -- keep lower case !!!
 
                           },
            vehinfo = {
                               default = {
                                    image = "vehdefault.png",
                                    autoids = false,
                                       },
                               auto = {
                                    image = "vehauto.png",            -- keep lower case !!!}
                                    autoids = true,
                                      },
                               trailer = {
                                    image = "vehtrailer.png",            -- keep lower case !!!}
                                    autoids = false,
                                      },
                           },
            objecttypes = {
                        fax = {
                              launch="phone",
                              pic="phone.png",
                              title="Fax",
                              navigation = { systemurl = { url="tel:%s" },},
                            },            
                        phone = {
                              launch="phone",
                              pic="phone.png",
                              title="Phone",
                              navigation = { systemurl = { url="tel:%s" },},
                            },
                        email = {
                              launch="email",
                              pic="email.png",
                              title="Email",
                              navigation = { popup = { type="mail" ,options={to="%s" },},},
                            },
                        sms = {
                              launch="sms",
                              pic="sms.png",
                              title="SMS Text",
                              navigation = { popup = { type="sms" ,options={to="%s" },},},
                            },
                        web = {
                              launch="web",
                              pic="web.png",
                              title="Web Site",
                              --navigation = { systemurl = { url="%s" },},


                              text="Sample web page",
                              backtext = "<",
                              forwardtext = ">",
                              -- htmlinfo = {
                              --               url="",    --- dyanamically changed
                              --             },
                             sceneinfo = { 
                                               htmlinfo = { url="", } ,  --- dyanamically changed  
                                               scrollblockinfo = { },
                                         },
                              navigation = { composer = {
                                         id = "", --- dyanamically changed
                                         lua="webview",
                                         time=250, 
                                         effect="slideLeft",
                                         effectback="slideRight",
                                      },},

                            },
                        facebook = {
                              launch="facebook",
                              pic="facebook.png",
                              title="Facebook",
                              navigation = { systemurl = { url="%s" },},
                            },
                        twitter = {
                              launch="twitter",
                              pic="twitter.png",
                              title="Twitter",
                              navigation = { systemurl = { url="%s" },},
                            },
                        directions = {
                              launch="directions",
                              pic="map.png",
                              title="Get Directions",
                              navigation = { directions = { address="%s" },},
                            },

                         -- xxdirections = {
                         --                  title = "Contact State Auto", 
                         --                  launch="directions",
                         --                  pic="truck.png",
                         --                  backtext = "<",
                         --                  sceneinfo = { 
                         --                       htmlinfo = {},
                         --                       scrollblockinfo = { object="contactus" , navigate = "subscene"},
                         --                               },
                         --                  navigation = { composer = { id = "contactus",lua="scrollblocks" ,time=250, effect="slideLeft" ,effectback="slideRight", },},
                         --              },


                           },    --objecttypes


            ------------------------------
            -- maps
            ------------------------------            
            maps = {
                      --googlemapapp = "comgooglemaps-x-callback://",
                      google = 
                             { 
                                 app = "comgooglemaps-x-callback://",
                                 directions = {
                                                 additions = "&directionsmode=driving",
                                              },
                                 search = {
                                                 additions = "&zoom=14",
                                              },
                            },
                      apple = 
                             {
                                 app = "http://maps.apple.com/",
                                 directions = {
                                                 additions = "",
                                              },
                                 search = {
                                                 additions = "",   --&spn=.50
                                              },
                             },
                   },
            ------------------------------
            -- gps
            ------------------------------            
            gps = {
                     --timer = 30000,                           --30 seconds
                     --timebetweenattempts = 100,              --1 seconds
                     --attempts = 0,                             -- cointer
                     --maxattempts = 10,                     
                     --event= "",                               -- set elsewhere
                     haveaccuratelocation = false ,               -- set elsewhere
                     currentlocation = {},                     -- set elsewhere
                     nearestaddress = {},                      -- set elsewhere
                     debug = {                                -- will be used if in debugmode
                                latitude=39.896311,
                                longitude=-82.7674464,
                              },
                     addresslocate = {
                                errortitle = "Not Valid Location",
                                errormessage = "Cannot Determine Location: ",
                                loadwaittime = 12000,
                                timeoutmessage = "Taking too long to determine location.",
                                    },
                     currentlocate = {
                                errortitle = "No GPS Signal",
                                errormessage = "Can't sync with GPS. Error: ",
                                    },
                     nearestlocate= {
                                errortitle = "Not Valid Address",
                                errormessage = "Cannot Determine Address: ",
                                loadwaittime = 5000,
                                timeoutmessage = "Taking too long to determine address.",
                                    },
                                  
                  },


            ------------------------------
            -- authentication
            ------------------------------            
            authentication = {
                                  loggedin = false,
                                  launchonstart = true,
                                  email="",
                                  emailVerified = false,
                                  username = "",
                                  objectId = "",       -- internal userid key
                                  sessionToken="",
                                  policies = {},
                                  agencies = {},
                                  agencycode = "",      -- will be first code if multiple policieis
                              },

            titleGradient = {
                    type = 'gradient',
                    color1 = { 43/255, 143/255, 82/255, 1 }, 
                    color2 = { 161/255, 200/255, 177/255, 1 },
                    -- stateautoswitch
                 -- color1 = { 189/255, 203/255, 220/255, 1 }, 
                  -- color2 = { 89/255, 116/255, 152/255, 1 },
                    direction = "down"
             },
            icons = "",
            iconinfo = 
               {
                       icondimensions = {
                              width = 40,
                              height = 40,
                              numFrames = 20,
                              sheetContentWidth = 200,
                              sheetContentHeight = 160
                              },
                        sheet = "ios7icons.png",
                },
            ------------------------------
            -- aws
            ------------------------------            
           aws = {
                        ClientId = '1br0l7moqel6h915ceimtohsju',
                        IDP = {
                                url = "https://cognito-idp.us-east-1.amazonaws.com/",
                                headers =
                                         {
                                           a = {name = "Host",value="cognito-idp.us-east-1.amazonaws.com"},
                                           b = {name = "Content-Type", value = "application/x-amz-json-1.1"},
                                           c = {name = "X-AMZ-TARGET", value = "com.amazonaws.cognito.identity.idp.model.AWSCognitoIdentityProviderService.{actionname}"}
                                         },
  
                                Actions = {
                                             SignUp = {name = "SignUp", httpaction="POST"}
                                          },
                              },

                        -- endpoints = {
                        --                 config  = {
                        --                              endpoint = "/config",
                        --                              verb = "GET",
                        --                           },
                                 
                        --                 appopened  = {
                        --                              endpoint = "/events/AppOpened",
                        --                              verb = "POST",
                        --                           },
                        --                 customevent  = {
                        --                              endpoint = "/events",    -- pass in actual eventname
                        --                              verb = "POST",
                        --                           },


                        --           },
                    },
            ------------------------------
            -- parse
            ------------------------------            
           parse = {
                        appId = 'nShcc7IgtlMjqroizNXtlVwjtwjfJgLsiRVgvUfA',
                        restApikey = 'DeOzYBpk6bBSha0SJ9cRUc36EbWUmuseajSyBrlF',
                        url = "https://api.parse.com/1",
                        -- endpoints = {
                        --                 config  = {
                        --                              endpoint = "/config",
                        --                              verb = "GET",
                        --                           },
                                 
                        --                 appopened  = {
                        --                              endpoint = "/events/AppOpened",
                        --                              verb = "POST",
                        --                           },
                        --                 customevent  = {
                        --                              endpoint = "/events",    -- pass in actual eventname
                        --                              verb = "POST",
                        --                           },


                        --           },
                    },


            --========================
            --== Device
            --========================
            deviceinfo = {
                            infoname = {name="name",title="Name"},
                            infoenvironment = {name="environment",title="Environment"},
                            infoplatform = {name="platform",title="PlatForm"},
                            infoplatformName = {name="platformName",title="Plat Name"},
                            infoplatformVersion = {name="platformVersion",title="Plat Version"},
                            infoversion = {name="version",title="Version"},
                            infobuild = {name="build",title="Corona BLD"},
                            infotextureMemoryUsed = {name="textureMemoryUsed",title="Memory Used"},
                            infoarchitectureInfo = {name="architectureInfo",title="Architecture"},
                            pref1 = {cat="ui",name="language",title="UI Lang"},
                            pref2 = {cat="locale",name="country",title="Loc Country"},
                            pref3 = {cat="locale",name="identifier",title="Loc ID"},
                            pref4 = {cat="locale",name="language",title="Loc Lang"},
                        },

            mydb = {   -- Databse info   other stuff will be added at startup
                      lCC  = {},    -- used to store user defaults from db record
                   },    

                   -- 
            --========================
            --== additional files
            --========================  
             files = {
                         config = { 
                                       performdl= false,
                                       url = "https://s3.amazonaws.com/nspii/config/",
                                       fileloc = system.TemporaryDirectory,    -- always override so put here
                                       timeout = 5,
                                       name = "appconfig.json",
                                       errortitle = "Network Error",
                                    },
                         download = { 
                                       performdl= false,
                                       url = "https://s3.amazonaws.com/nspii/myappadds/",
                                       origfileloc = system.ResourceDirectory,
                                       fileloc = system.DocumentsDirectory,
                                       timeout = 5,
                                       errortitle = "Network Error",
                                    },

                         items = {
                                    tabs = {name="myapptabs" },
                                    moreinfo = {
                                                  name="myappmoreinfo.json",download=true,json=true,
                                                  initialload = { 
                                                                        imsliding = false,     -- will be updated in app
                                                                        transitiontime = 700,
                                                                        transitiontimealpha = 200,
                                                                        direction = "left",     -- initial direction
                                                                        movefactor = 1.2,      -- how much left or right. Less means less showing of the main screen
                                                                        morebutton = {
                                                                                        defaultFile="morebutton.png",
                                                                                        overFile="morebutton-down.png",
                                                                                        },
                                                                    },                      

                                                },
                                    homepage = {name="myapphomepage.json",json=true ,download=true ,downloadatstartup = true},
                                    news = {name="myappnews.json" ,json=true ,download=true},
                                    contactus = {name="myappcontactus.json",download=true,json=true},
                                    extras = {name="myappextras.json" ,download=true,json=true},
                                    
                                    awards = {name="myappawards.json",json=true ,download=true},
                                    awardsnational = {name="myappawards.json",json=true,section="awardsnational" ,download=true },
                                    awardsohio = {name="myappawards.json",json=true,section="awardsohio" ,download=true },

                                    social = {name="myappsocial.json" ,download=true,json=true},
                                    --mappings = {name="myappmappings" },
                                    otherscenes = {name="myappotherscenes" },

                                    --locate = {name="myapplocate",section="locate" },
                                    --locatepre = {name="myapplocate",section="locatepre" },
                                    --locatedetails = {name="myapplocate",section="locatedetails" },

                                    people = {name="myapppeople.json",json=true,download=true,downloadatstartup = true},

                                    chapters = {name="myappchapters.json",json=true,download=true},
                                    nationalchapter = {name="myappchaptersdetails.json",json=true,section="nationalchapter" ,download=true},
                                    chaptercommittees = {name="myappchaptersdetails.json",json=true,section="chaptercommittees" ,download=true},
                                    statechapters = {name="myappchaptersdetails.json",json=true,section="statechapters" ,download=true},

                                    resources = {name="myappresources.json",json=true,download=true },
                                    respsa = {name="myappresourcedetails.json",json=true,download=true ,section="respsa" },
                                    resref = {name="myappresourcedetails.json",json=true,download=true,section="resref" },
                                    resfraud = {name="myappresourcedetails.json",json=true,download=true,section="resfraud"  },
                                    restools = {name="myappresourcedetails.json",json=true,download=true,section="restools" },
                                    resnews = {name="myappresourcedetails.json",json=true,download=true,section="resnews" },
                                    reslegal = {name="myappresourcedetails.json",json=true,download=true,section="reslegal" },
                                    resyoutube = {name="myappresourcedetails.json",json=true,download=true,section="resyoutube"  },
                                },
                        },

        }





return M
-- print ("json  -  " .. require("json").encode(require( M.myappadds .. "myappresourcedetails" )))


--M.tabs     = require( M.myappadds .. M.files.tabs.name)  
--M.moreinfo = require( M.myappadds .. M.files.moreinfo.name )  
--M.homepage = require( M.myappadds .. M.files.homepage.name )  

--M.news = require( M.myappadds .. "myappnews" )  
--M.contactus = require( M.myappadds .. "myappcontactus" )  
--M.extras = require( M.myappadds .. "myappextras" )  

--M.awards = require( M.myappadds .. "myappawards" ) 
--M.awardsnational = require( M.myappadds .. "myappawardsdetails" ).awardsnational
--M.awardsohio = require( M.myappadds .. "myappawardsdetails" ).awardsohio

--M.social = require( M.myappadds .. "myappsocial" )  
--M.mappings = require( M.myappadds .. "myappmappings" )  
--M.otherscenes = require( M.myappadds .. "myappotherscenes" ) 

--M.locate = require( M.myappadds .. "myapplocate" ).locate 
--M.locatepre = require( M.myappadds .. "myapplocate" ).locatepre
--M.locatedetails = require( M.myappadds .. "myapplocate" ).locatedetails

--M.people = require( M.myappadds .. "myapppeople" ) 

--M.chapters = require( M.myappadds .. "myappchapters" ) 
--M.chapnational = require( M.myappadds .. "myappchaptersdetails" ).national 
--M.chapcommittees = require( M.myappadds .. "myappchaptersdetails" ).committees 
--M.chapstate = require( M.myappadds .. "myappchaptersdetails" ).state




--M.resources = require( M.myappadds .. "myappresources" ) 
--M.respsa = require( M.myappadds .. "myappresourcedetails" ).respsa
--M.resref = require( M.myappadds .. "myappresourcedetails" ).resref
--M.resfraud = require( M.myappadds .. "myappresourcedetails" ).resfraud
--M.restools = require( M.myappadds .. "myappresourcedetails" ).restools
--M.resnews = require( M.myappadds .. "myappresourcedetails" ).resnews
--M.reslegal = require( M.myappadds .. "myappresourcedetails" ).reslegal
--M.resyoutube = require( M.myappadds .. "myappresourcedetails" ).resyoutube


 

-- The following string values are supported for the effect key of the options table:

-- "fade"
-- "crossFade"
-- "zoomOutIn"
-- "zoomOutInFade"
-- "zoomInOut"
-- "zoomInOutFade"
-- "flip"
-- "flipFadeOutIn"
-- "zoomOutInRotate"
-- "zoomOutInFadeRotate"
-- "zoomInOutRotate"
-- "zoomInOutFadeRotate"
-- "fromRight" — over current scene
-- "fromLeft" — over current scene
-- "fromTop" — over current scene
-- "fromBottom" — over current scene
-- "slideLeft" — pushes current scene off
-- "slideRight" — pushes current scene off
-- "slideDown" — pushes current scene off
-- "slideUp" — pushes current scene off