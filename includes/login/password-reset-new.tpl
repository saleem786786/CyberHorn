<div class="login">
    <div class="login-header">
        <a class="logo" href="{$WEB_ROOT}/index.php"><img src="https://cyberpower.co.il/img/nlogo.png" title="{$companyname}" alt="{$companyname}"></a>
    </div>
    <div class="login-wrapper">
        <div class="login-body">
            <h1 class="login-title">{$LANG.pwreset}</h1>
            {if $loggedin && $innerTemplate}
            {include file="$template/includes/alert.tpl" type="error" msg=$LANG.noPasswordResetWhenLoggedIn textcenter=true}
            {else}
            {if $successMessage}
            {include file="$template/includes/common/message.tpl" type="success" msg=$successTitle desc=$successMessage textcenter=true}
            {else}
            {if $errorMessage}
            {include file="$template/includes/alert.tpl" type="error" msg=$errorMessage textcenter=true}
            {/if}
            {if $innerTemplate}
            {include file="$template/password-reset-$innerTemplate.tpl"}
            {/if}
            {/if}
            {/if}
        </div>
        {if $condlinks.allowClientRegistration}
        <div class="login-footer">
            <div class="text-light">{$LANG.registerintro} <a href="{$WEB_ROOT}/register" tabindex="5" >{$LANG.orderForm.createAccount}</a></div>
        </div>
        {/if}
    </div>
    {include file="$template/includes/login/language-chooser.tpl" type="login"}
</div>
