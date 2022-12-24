<div class="user-register user-register-step-1 signup-step1" x-show="step==1">
    <h1 class="login-title">{$LANG.register}</h1>
    {if $linkableProviders}
        <div class="providerLinkingFeedback"></div>
    {/if}
    <div>
        {$social_media_login_integration}
    </div>
    <style>
        .login-layout_LoginLayout__1IkN9 .login-layout_inputsWrapper__1jd6B {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: white;
        }
        .flex{
            display: flex;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .h-1{
            height: .25rem;
        }
        .bg-green-300{
            background-color:#9ae6b4;
        }
        .bg-gray-300{
            background-color: #edf2f7;
        }
        .w-1\/4{
            width: 25%
        }
        .mx-3{
            margin-left: 0.75rem;
            margin-right: 0.75rem;
        }
        .m-l-3{
            margin-left: 0.75rem;
        }
        .bg-red-300{
            background-color:rgb(239, 72, 54);
        }
        .bg-orange-300{
            background-color: rgb(246, 180, 77);
        }
        .bg-blue-300{
            background-color: rgb(43, 144, 239);
        }
    </style>
    <script type="text/javascript">
        jQuery( document ).ready(function() {
            jQuery('.step_1rgtrbtn').click(function(){
               jQuery('.signup-all-steps').addClass("step_2page");
            });
           
            //jQuery('.signup-all-steps').addClass("step_2page");
        });
    </script>
    <script type="text/javascript" src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
    <script>
        window.langPasswordStrength = "{$LANG.pwstrength}";
        window.langPasswordWeak = "{$LANG.pwstrengthweak}";
        window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
        window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
    </script>
        <div class="form-group field_username">
            <img src="./../../fonts/cyberpowersvg/user-auth.svg">
            <input type="email" name="email" class="form-control" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus tabindex="1" data-rules='["required","email"]' x-model="registerform.email">
            <span id="helpBlockinputEmail" class="help-block" x-show="emailerror.errorMessage.length>0" x-text="emailerror.errorMessage"></span>
        </div>
        <div class="form-group field_username">
           <img src="./../../fonts/cyberpowersvg/password.svg">
           <input type="hidden" name="password2" x-model="registerform.password">
           <input type="password" name="password" class="form-control" id="inputPassword" placeholder="{$LANG.clientareapassword}" autocomplete="off" tabindex="2" data-rules='["required","strongpass"]' x-model="registerform.password">
           <span id="helpBlockinputPassword" class="help-block" x-show="passworderror.errorMessage.length>0" x-text="passworderror.errorMessage"></span>
       </div>
        <div class="flex w-full mt-3">
            <span class="h-1 w-1/4 rounded"
                  x-bind:class="pwcolor(1)"></span>
            <span class="h-1 w-1/4 rounded mx-3"
                  x-bind:class="pwcolor(2)"></span>
            <span class="h-1 w-1/4 rounded"
                  x-bind:class="pwcolor(3)"></span>
            <span class="h-1 w-1/4 m-l-3 rounded"
                  x-bind:class="pwcolor(4)"></span>
        </div>
    <div x-show="(registerErrorMessage.length>0)" x-text="registerErrorMessage" class="alert alert-danger"></div>
    <button class="btn btn-lg btn-primary btn-block step_1rgtrbtn" id="btn-register" x-on:click="nextStep($event)">{$LANG.clientregistertitle}</button>
    {include file="$template/includes/flashmessage.tpl"}

    <div class="login-footer">
        <div class="text-center text-light">{$LANG.alreadyregistered} <a href="{$WEB_ROOT}/login">{$LANG.logininnow}</a> </div>
    </div>

{* {include file="$template/includes/login/language-chooser.tpl" type="login"} *}

</div>
