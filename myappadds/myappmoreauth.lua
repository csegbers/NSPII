
local moreauth = { 

   textfontsize= 16,
   groupheight= 25,
   xxgroupheaderheight= 50,
   hederfontsize= 16,
   items= {
    alogin= {
      navigation= {
        composer= {
          otherscenes= "login"
        }
      },
      text= "",
      headerfontsize= 16,
      title= "Login",
      backtext= "<",
      doublewide= true
    },
    bloginforgot= {
      navigation= {
        composer= {
          otherscenes= "loginforgot"
        }
      },
      text= "",
      headerfontsize= 16,
      title= "Forgot/Reset Password Email",
      showonlyinforgotpassword= true,
      backtext= "<",
      doublewide= true
    },    
    ccreate= {
      navigation= {
        composer= {
          otherscenes= "logincreate"
        }
      },
      text= "",
      headerfontsize= 16,
      title= "Create An Account",
      backtext= "<",
      doublewide= true
    },
   dconfirm= {
      showwhennotconfirmed =true,
      navigation= {
        composer= {
          otherscenes= "loginconfirm"
        }
      },
      text= "",
      headerfontsize= 16,
      title= "Confirm Account Creation Email",
      backtext= "<",
      doublewide= true
    }    
  }
 
}     

         

return moreauth