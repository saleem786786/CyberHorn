<style>
.rc-anchor-normal {
    height: 74px;
    width: 100% !important;
}

form.login-form .checkbox.m-b-2x {
    margin-left: 0 !important;
    margin-right: 0 !important;
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
<div class="main-body-has-sidebar main-body-has-sidebar-left">
    <div class="main-body-sidebar main-body-sidebar-secondary">
        <div class="sidebar-logo logo-container">
            <a class="logo" href="{$WEB_ROOT}/index.html"><img src="https://cyberpower.co.il/img/nlogo.png" title="RS STUDIO" alt="RS STUDIO"></a>
        </div>
        <div class="sidebar-content">
            <img src="./templates/cyberhorn/images/login5.png" style="width: 100%;" title="Userv logo" alt="Userv Logo">
        </div>
    </div>
    <div class="main-body-content">
        <div class="login">
            <div class="login-header">
                <a class="logo" href=""><img src="https://cyberpower.co.il/img/nlogo.png" title="RS STUDIO" alt="RS STUDIO"></a>

            </div>

            <div class="login-wrapper" >
                <div class="login-body">
                    <h1 class="login-titles">{$LANG.clientareahomeloginbtn}</h1>
                    {include file="$template/includes/flashmessage.tpl"}
                    <div>
                        {* {include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true} *}
                        {$social_media_login_integration}
                        <div class="divider">
                            <span></span>
                            <span>{$LANG.remoteAuthn.titleOr}</span>
                            <span></span>
                        </div>
                    </div>
                    <div class="providerLinkingFeedback"></div>
                    <form class="login-form" method="post" action="{routePath('login-validate')}" role="form">
                        <div class="form-group">
                            <label for="inputEmail">{$LANG.clientareaemail}</label>
                            <input type="email" name="username" class="form-control input-lg" id="inputEmail" value="" placeholder="{$LANG.enteremail}" autofocus="">
                        </div>
                        <div class="form-group">
                            <div class="d-flex space-between">
                                <label for="inputPassword">{$LANG.clientareapassword}</label>
                                <a href="{$WEB_ROOT}/password/reset">{$LANG.generals.forgot_label}</a>
                            </div>
                            <input type="password" name="password" class="form-control input-lg" id="inputPassword" value="" placeholder="{$LANG.clientareapassword}" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label class="checkbox m-b-2x">
                                <input class="icheck-control" type="checkbox" name="rememberme" />  {$LANG.generals.rememberme}
                            </label>
                        </div>
                        {if $captcha->isEnabled()}
                        <div class="login-captcha" style="width: 100% !important">
                            {include file="$template/includes/captcha.tpl"}
                        </div>
                        {/if}
                        <button class="btn btn-lg btn-primary btn-block {$captcha->getButtonClass($captchaForm)}" id="login" type="submit">{$LANG.generals.login}</button>

                    </form>

                </div>
                {if $condlinks.allowClientRegistration}
                <div class="login-footer">
                    <div class="text-light">{$LANG.generals.notmemberlabel} <a href="{$WEB_ROOT}/register.php" tabindex="5" >{$LANG.generals.createnewaccount}</a></div>
                </div>
                {/if}
            </div>
            <div class="login-language dropdown dropup language" data-language-select="">
                <span>{$LANG.language}:&nbsp;</span>
                <a class="dropdown-toggle"  href="{$WEB_ROOT}/login?language={$LANG.generals.language_lable}">
                  {$LANG.generals.language_lable}
                </a>
               
                <div class="dropdown-menu-item dropdown-menu-no-data">
                    <span class="text-info text-large" style="display: none">
                        No Records Found
                    </span>
                </div>
            </div>
        </div>

    </div>

</div>
</div>

<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/assets/js/login.js"></script>

