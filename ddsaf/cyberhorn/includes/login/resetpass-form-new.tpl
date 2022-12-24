<div class="login pass-reset" x-show="showresetpass" x-cloak>

    <h1 class="login-title">{$LANG.pwreset}</h1>

    <p class="login-desc">{$LANG.pwresetemailneeded}</p>

    <form class="login-form" method="post" action="{routePath('login-validate')}" x-init="
    resetAction='{$WEB_ROOT}/auth.php?action=doResetPass'
    "  role="form" @submit.prevent="doResetPass">
        <div class="form-group field_username">

            <img src="./../../fonts/cyberpowersvg/user-auth.svg">
            <input type="email" name="email" class="form-control input-lg" x-model="resetform.email" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus tabindex="1">
        </div>
        {if $captcha->isEnabled()}
        <div class="resetpass-captcha">
            {include file="$template/includes/captcha.tpl"}
        </div>
        {/if}
        <div x-show="(resetErrorMessage.length>0)" x-text="resetErrorMessage" class="alert alert-danger"></div>
        <div x-show="(resetSuccessMessage.length>0)" x-text="resetSuccessMessage" class="alert alert-success"></div>
        <button type="submit" class="mt-20 btn btn-lg btn-primary btn-block{$captcha->getButtonClass($captchaForm)}" id="btn-resetpass">
            {$LANG.pwresetsubmit}
        </button>
        {include file="$template/includes/flashmessage.tpl"}
    </form>

    {if $condlinks.allowClientRegistration}
    <div class="login-footer">
        <div class="text-light"><a href="login.php" tabindex="5" @click="openLoginForm($event)">{$LANG.gobacktologin}</a>
        </div>
    </div>
    {/if}
</div>
