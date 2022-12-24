<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/css/selectize.bootstrap3.min.css" integrity="sha256-ze/OEYGcFbPRmvCnrSeKbRTtjG4vGLHXgOqsyLFTRjg=" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/js/standalone/selectize.min.js" integrity="sha256-+C0A5Ilqmu4QcSPxrlGpaZxJ04VjsRjKu+G82kl5UJk=" crossorigin="anonymous"></script>

<div class="reg-step-2 user-register-step-2" x-show="step==2">
    <h3 class="login-title">{$LANG.clientareapersonalinfo}</h3>
    {if $linkableProviders}
        <div class="providerLinkingFeedback"></div>
    {/if}

    <style>
        .field_username i {
            position: absolute;
            top: 16px;
            left: 13px;
            font-size: 20px;
            color: #bbbbbb;
        }

        .flex {
            display: flex;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .h-1 {
            height: .25rem;
        }

        .bg-green-300 {
            background-color: #9ae6b4;
        }

        .bg-gray-300 {
            background-color: #edf2f7;
        }

        .w-1\/4 {
            width: 25%
        }

        .mx-3 {
            margin-left: 0.75rem;
            margin-right: 0.75rem;
        }

        .m-l-3 {
            margin-left: 0.75rem;
        }

        .bg-red-300 {
            background-color: rgb(239, 72, 54);
        }

        .bg-orange-300 {
            background-color: rgb(246, 180, 77);
        }

        .bg-blue-300 {
            background-color: rgb(43, 144, 239);
        }
    </style>
    <script type="text/javascript" src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
    <script>
        window.langPasswordStrength = "{$LANG.pwstrength}";
        window.langPasswordWeak = "{$LANG.pwstrengthweak}";
        window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
        window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
    </script>

    <script>
        jQuery( document ).ready(function() {
            jQuery('#step1_back').click(function(){
               jQuery(".backToSite").show();
               jQuery('.signup-all-steps').removeClass("step_2page");
            });
            // jQuery(".backToSite a").attr("href", "https://cyberpower.co.il/");
            // jQuery(".backToSite a").attr("onclick", "").unbind("click");
            // jQuery('.step_2rgtrbtn').click(function(){
            //    //jQuery('.signup-all-steps').removeClass("step_2page");
            // });
            //jQuery('.signup-all-steps').addClass("step_2page");
        });
    </script>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group field_username mrgn">
                <!-- <img src="./../../fonts/cyberpowersvg/user-auth-gray.svg"> -->
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4 22C4 19.8783 4.84285 17.8434 6.34315 16.3431C7.84344 14.8429 9.87827 14 12 14C14.1217 14 16.1566 14.8429 17.6569 16.3431C19.1571 17.8434 20 19.8783 20 22H18C18 20.4087 17.3679 18.8826 16.2426 17.7574C15.1174 16.6321 13.5913 16 12 16C10.4087 16 8.88258 16.6321 7.75736 17.7574C6.63214 18.8826 6 20.4087 6 22H4ZM12 13C8.685 13 6 10.315 6 7C6 3.685 8.685 1 12 1C15.315 1 18 3.685 18 7C18 10.315 15.315 13 12 13ZM12 11C14.21 11 16 9.21 16 7C16 4.79 14.21 3 12 3C9.79 3 8 4.79 8 7C8 9.21 9.79 11 12 11Z" fill="#2D34B2"></path></svg>
                <input type="text" name="firstname" class="form-control" id="inputFirstname"
                    placeholder="{$LANG.orderForm.firstName}" value="{$clientfirstname}" {if !in_array('firstname', $optionalFields)}required{/if} autofocus tabindex="1" data-rules='["required"]'
                    x-model="registerform.firstname">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group field_username mrgn">
                <!--img src="./../../fonts/cyberpowersvg/user-auth-gray.svg"-->
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4 22C4 19.8783 4.84285 17.8434 6.34315 16.3431C7.84344 14.8429 9.87827 14 12 14C14.1217 14 16.1566 14.8429 17.6569 16.3431C19.1571 17.8434 20 19.8783 20 22H18C18 20.4087 17.3679 18.8826 16.2426 17.7574C15.1174 16.6321 13.5913 16 12 16C10.4087 16 8.88258 16.6321 7.75736 17.7574C6.63214 18.8826 6 20.4087 6 22H4ZM12 13C8.685 13 6 10.315 6 7C6 3.685 8.685 1 12 1C15.315 1 18 3.685 18 7C18 10.315 15.315 13 12 13ZM12 11C14.21 11 16 9.21 16 7C16 4.79 14.21 3 12 3C9.79 3 8 4.79 8 7C8 9.21 9.79 11 12 11Z" fill="#2D34B2"></path></svg>
                <input type="text" name="lastname" class="form-control" id="inputLastname"
                    placeholder="{$LANG.clientarealastname}" value="{$clientlastname}" {if !in_array('lastname', $optionalFields)}required{/if} autocomplete="off" tabindex="2" data-rules='["required"]'
                    x-model="registerform.lastname">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="form-group ">

                <input type="tel" name="phonenumber" id="inputPhone" class="form-control" placeholder="{$LANG.orderForm.phoneNumber}" value="{$clientphonenumber}" x-model="registerform.phonenumber">
            </div>
        </div>
        <h3 class="login-title">{$LANG.billingdetails}</h3>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group field_username mrgn">
                <i class="fa fa-building"></i>
                <input type="text" name="address1" class="form-control lightgray" id="inputEmail"
                placeholder="{$LANG.orderForm.streetAddress}" value="{$clientaddress1}"  {if !in_array('address1', $optionalFields)}required{/if}   tabindex="1"
                    data-rules='["required"]' x-model="registerform.address1">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group field_username mrgn">
                <i class="fa fa-building"></i>
                <input type="text" name="companyname" class="form-control lightgray" id="inputCompanyname"
                    placeholder="{$LANG.orderForm.companyName} " value="{$clientcompanyname}" autocomplete="off" tabindex="2"
                    data-rules='["required"]' x-model="registerform.companyname">
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group field_username mrgn">
                <i class="fa-regular fa-building"></i>
                <input type="text" name="city" class="form-control lightgray " id="inputCity"
                    placeholder="{$LANG.orderForm.city}" value="{$clientcity}"  {if !in_array('city', $optionalFields)}required{/if}  tabindex="1" data-rules='["required"]'
                    x-model="registerform.city">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group field_username mrgn">
                <i class="fa fa-map-signs"></i>
                <input type="text" name="state" class="form-control lightgray" id="inputState"
                placeholder="{$LANG.orderForm.state}" value="{$clientstate}"  {if !in_array('state', $optionalFields)}required{/if}  autocomplete="off" tabindex="2" data-rules='["required"]'
                    x-model="registerform.state">
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group field_username mrgn">
                <i class="fa fa-certificate"></i>
                <input type="text" name="postcode" class="form-control lightgray" id="inputPostcode"
                    placeholder="{$LANG.orderForm.postcode}" value="{$clientpostcode}" {if !in_array('postcode', $optionalFields)}required{/if}  tabindex="1" data-rules='["required","email"]'
                    x-model="registerform.postcode">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group field_username mrgn">
                <i class="fa fa-globe"></i>
                <select name="country" id="inputCountry" class="field form-control" style="padding: 0 0 0 40px; height: 52px" x-model="registerform.country">
                    {foreach $clientcountries as $countryCode => $countryName}
                    <option value="{$countryCode}"{if (!$clientcountry && $countryCode eq $defaultCountry) || ($countryCode eq $clientcountry)} selected="selected"  {/if}>
                        {$countryName}
                    </option>
                {/foreach}
                </select>
            </div>
        </div>
    </div>
    <div class="row term-nd-condition">
        <div class="col-lg-12">
            <div class="form-group">
               <label style="display:inline-flex">
                <input class="icheck-control accepttos"  x-model="registerform.terms" type="checkbox" name="accepttos" >
                <span>{$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a></span>
            </label>
        </div>
        </div>
    </div>
    <div class="captch-button-register">
        <div class="row">
            <div class="col-md-12">
                {if $captcha->isEnabled()}
                    <div class="registration-captcha">
                        {include file="$template/includes/captcha.tpl"}
                    </div>
                {/if}
                <div x-show="(registerErrorMessage.length>0)" x-text="registerErrorMessage" class="alert alert-danger"></div>
            </div>
            <div class="col-md-12">
                <input class="btn btn-lg btn-primary btn-block {$captcha->getButtonClass($captchaForm)} lft-mrgn step_2rgtrbtn" id="btn-register"
                        type="submit" value="{$LANG.clientregistertitle}" />
                    {include file="$template/includes/flashmessage.tpl"}
            </div>
        </div>     
     
    </div>
    <div class="login-footer">
    <div class="text-left text-light registration-backbtn" >
        <a href="javascript:void(0);" @click="step=1" id="step1_back"><img
            src="./../../fonts/cyberpowersvg/arrow-left.svg"> {$LANG.registerback}</a>
    </div>
    <div class="text-right text-light">{$LANG.alreadyregistered}
        <a href="{$WEB_ROOT}/login.php" {* @click="openLoginForm($event)" *}>{$LANG.logininnow}</a>
        <!-- <a href="{$WEB_ROOT}/login.php" >{$LANG.logininnow}</a> -->
    </div>
    </div>

    {* {include file="$template/includes/login/language-chooser.tpl" type="login"} *}

</div>
<script type="text/javascript">
$(document).ready(function(){
  $('#inputCountry').selectize();
});
</script>