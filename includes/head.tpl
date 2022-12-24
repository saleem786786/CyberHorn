<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
    var csrfToken = '{$token}',
        markdownGuide = '{lang|addslashes key="markdown.title"}',
        locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
        saved = '{lang|addslashes key="markdown.saved"}',
        saving = '{lang|addslashes key="markdown.saving"}',
        whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}",
        requiredText = '{lang|addslashes key="orderForm.required"}',
        recaptchaSiteKey = "{if $captcha}{$captcha->recaptcha->getSiteKey()}{/if}";
</script>
<!-- Styling -->
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600|Raleway:400,700" rel="stylesheet">

<link href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" rel="stylesheet">

<!-- Mandatory Styling -->
<link href="{$WEB_ROOT}/templates/{$template}/assets/css/flickity.min.css" rel="stylesheet" >
<link href="{$WEB_ROOT}/templates/{$template}/assets/css/aos.min.css" rel="stylesheet" >

<!-- Icons Styling -->
<link href="{$WEB_ROOT}/templates/{$template}/assets/fonts/evafeat/evafeat.css" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/assets/fonts/cloudicon/cloudicon.css" rel="stylesheet">

<!-- Multilingual Condition to RTL & LTR Language -->
{if $language eq 'arabic' || $language eq 'farsi' || $language eq 'hebrew'}<html dir="rtl">
<link href="{$WEB_ROOT}/templates/{$template}/css/custom.css" rel="stylesheet">
<meta name="description" content="VPS ייעודי ואיכותי חדשני, אירוח וורדפרס, שרת VPS מנוהל, אחסון בענן המספק שירותים ברחבי העולם כחברת פתרונות הענן הטובים ביותר של Wordl">


{if $pagetitle|lower|trim == "הרשמה"}
  <link rel="canonical" href="https://cyberpower.co.il/register.php?language=Hebrew">
{elseif $pagetitle|lower|trim == "איפוס סיסמה"}
  <link rel="canonical" href="https://cyberpower.co.il/password/reset">
  {elseif $pagetitle|lower|trim == "התחברות"}
  <link rel="canonical" href="https://cyberpower.co.il/password/reset">
  {elseif $pagetitle|lower|trim == "lost password reset"}
  <link rel="canonical" href="https://cyberpower.co.il/password/reset">
  {elseif $pagetitle|lower|trim == "login"}
    <link rel="canonical" href="https://cyberpower.co.il/login?language=Hebrew">
  
  
  {else}
    <link rel="canonical" href="https://cyberpower.co.il/{$pagetitle|lower|trim}.php">
  
{/if}

<link href="{$WEB_ROOT}/templates/{$template}/assets/css/auto-rtl/all.css" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/assets/css/auto-rtl/main.css" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/assets/css/auto-rtl/bootstrap-rtl.min.css?v={$versionHash}" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/assets/css/auto-rtl/rtl.css?v={$versionHash}" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/assets/css/auto-rtl/custom-rtl.css" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/css/hebrew.css" rel="stylesheet" >

{else}
  <meta name="description" content="Innovative Quality Dedicated VPS, Wordpress Hosting, Managed VPS Server, Cloud Storage Providing Services Globally As Wordl Best Cloud Solutions Company">
  
  {if $pagetitle|lower|trim == "lost password reset"}
    <link rel="canonical" href="https://cyberpower.co.il/password/reset">
    {elseif $pagetitle|lower|trim == "login"}
      <link rel="canonical" href="https://cyberpower.co.il/login">
    
    {else}
      <link rel="canonical" href="https://cyberpower.co.il/{$pagetitle|lower|trim}.php">
    
  {/if}

<link href="{assetPath file='all.min.css'}?v={$versionHash}" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/assets/css/main.min.css" rel="stylesheet">
{assetExists file="custom.css"}
<link href="{$__assetPath__}" rel="stylesheet">
{/assetExists}

{/if}

{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}

<script src="{assetPath file='scripts.min.js'}?v={$versionHash}"></script>
<script defer src="{$WEB_ROOT}/templates/{$template}/assets/js/jquery.slimscroll.min.js"></script>
<script defer src="{$WEB_ROOT}/templates/{$template}/assets/js/flickity.pkgd.min.js"></script>
<script defer src="{$WEB_ROOT}/templates/{$template}/assets/js/flickity-fade.min.js"></script>
<script defer src="{$WEB_ROOT}/templates/{$template}/assets/js/aos.min.js"></script>
<script defer src="{$WEB_ROOT}/templates/{$template}/assets/js/md5.min.js"></script>
<script defer src="{$WEB_ROOT}/templates/{$template}/assets/js/main.js"></script>
<script defer src="{$WEB_ROOT}/templates/{$template}/assets/js/custom.js"></script>


<link href="{$WEB_ROOT}/templates/{$template}/assets/css/colors/cyber.css" rel="stylesheet" title="cyber"/>
