<div class="login" x-show="showlogin" x-cloak>
    <h1 class="login-title">{$LANG.clientareahomeloginbtn}</h1>
    {if $linkableProviders}
    <div class="providerLinkingFeedback"></div>
    {/if}
    <div>
        {$social_media_login_integration}
    </div>
    <form class="login-form" method="post" x-init="
    loginAction='{$WEB_ROOT}/auth.php?action=doLogin'
    " action="{routePath('login-validate')}"  role="form" @submit.prevent="doLogin">
        <div class="form-group  field_username" :class="{literal}{'has-error': usernameerror.errorMessage.length>0}{/literal}">
            <img src="./../../fonts/cyberpowersvg/user-auth.svg" />
            <input type="email" name="username" class="form-control" data-rules='["required"]' x-model="loginform.username" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus tabindex="1">
        </div>
        
        <div class="form-group field_username" :class="{literal}{'has-error': passworderror.errorMessage.length>0}{/literal}">
            <img src="./../../fonts/cyberpowersvg/password.svg" />
            <input type="password" name="password" class="form-control" data-rules='["required"]' id="inputPassword" x-model="loginform.password" placeholder="{$LANG.clientareapassword}" autocomplete="off" tabindex="2" />
        </div>
        <div class="remember-pwd">
            <div class="form-group">
                <label class="checkbox m-b-2x">
                    <input class="icheck-control" type="checkbox" name="rememberme" />
                    {$LANG.loginrememberme}
                </label>
            </div>
        <div class="d-flex space-between ">
            <a href="{routePath('password-reset-begin')}" @click="openResetForm($event)" style="font-size: 16px"
            tabindex="3">{$LANG.loginforgotten}</a>
        </div>
    </div>
        
        {if $captcha->isEnabled()}
        <div class="login-captcha">
            {include file="$template/includes/captcha.tpl"}
        </div>
        {/if}
        <div x-show="(loginErrorMessage.length>0)" x-text="loginErrorMessage" class="alert alert-danger"></div>
        <input class="btn btn-lg btn-primary btn-block {$captcha->getButtonClass($captchaForm)}"  id="login-btn"  type="submit" tabindex="4" value="{$LANG.loginbutton}"  >
        {include file="$template/includes/flashmessage.tpl"}
    </form>

    {if $condlinks.allowClientRegistration}
    <div class="login-footer">
        <div class="text-light">{$LANG.registerintro} <a href="register.php" tabindex="5">{$LANG.orderForm.createAccount}</a>
        </div>
    </div>
    {/if}

</div>
