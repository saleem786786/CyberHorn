<style>
form.login-form .checkbox.m-b-2x {
    margin-left: 0 !important;
    margin-right: 0 !important;
     float: left !important; 
    margin-top: 0 !important;
}

.login-form #login {
    border-radius: 0px !important;
}
 div.alert.alert-sm.alert-danger.m-b-0.m-t-3x > div > p{
    font-size: 13px !important;
}
 @media (max-width:991.98px) {
    .main-body-sidebar-secondary {
        display: none;
      }
    .login-header{
        display: block;
    }
    
    
    
    body{
        overflow-y: hidden;
        padding-top: 0 !important;
    }
}
</style>
<link href="{$WEB_ROOT}/templates/{$template}/css/login.css" rel="stylesheet">
<div class="lagom page-login register-page lagom-not-portal lagom-layout-top lagom-layout-condensed page-clientregister page-type-full">


<div class="main-body-has-sidebar main-body-has-sidebar-left ">
    <div class="main-body-sidebar main-body-sidebar-secondary">
        <div class="sidebar-logo logo-container">
            <a class="logo" href="https://my.netpower.co.il/login"><img src="./templates/cyberhorn/images/netpower.png" title="RS STUDIO" alt="RS STUDIO"></a>
        </div>
        <div class="sidebar-content">
            <img src="./templates/cyberhorn/images/login5.png" style="width: -webkit-fill-available;" title="Userv logo" alt="Userv Logo">
        </div>
    </div>
    <div class="main-body-content">
         
    
    
    
    
    
    




                        <div class=" login-lg">   
         
                    <div class="login-wrapper">
            <div class="login-body register" id="registration">                
                <h1 class="login-title">Register</h1>
                                     
         {include file="$template/includes/login/register-form.tpl" showLanguageChooser=true showLogo=true}
                </div> 
            <div class="login-footer">
                <div class="text-center text-light">?כבר רשום במערכת <a href="{$WEB_ROOT}/login.php">התחבר</a> </div>
            </div>
        </div>
                               
               
    </div>
 

</div>
</div>

</div>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/assets/js/login.js"></script>

