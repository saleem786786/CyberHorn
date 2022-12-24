<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="{$WEB_ROOT}/templates/{$template}/assets/img/favicon.ico">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
    {include file="$template/includes/head.tpl"} 
	{$headoutput}
    </head>
     
    <body id="layout01" data-phone-cc-input="{$phoneNumberInputStyle}" class="page-{$templatefile} {$language}">
    {* <img class="svg" src="{$WEB_ROOT}/templates/{$template}/assets/img/bgbody.svg" id="bgbody" alt=""> *}
    {$headeroutput}
    {include file="$template/assets/layout/settings.tpl"}
    
	<!-- ***** LOADING PAGE ****** -->
    <div id="spinner-area">
      <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
        <div class="spinner-txt">{$LANG.loading}</div>
      </div>
    </div>
	{if $loginpage eq 0 and $templatefile ne "clientregister" and $templatefile ne "password-reset-container"}<!-- login and register page without the default header and footer -->
    <nav class="navbar default navbar-collapsed shadow1">
        <div class="navbar-wrapper">
            <div class="navbar-brand header-logo">
                <a class="mobmenu on" id="mobcol"><span></span></a>
                <a href="{$WEB_ROOT}/clientarea.php" class="logo-content">
                    <img class="logo" src="{$WEB_ROOT}/templates/{$template}/assets/img/logo.png" alt="{$companyname}"><!-- site logo image -->
                    <span class="b-title">{$companyname}</span><!-- website title -->
                </a>
            </div>
            <div class="navbar-content scroll-div">
                <ul class="nav inner-navbar">
                    {include file="$template/assets/layout/menu.tpl"}<!-- the main menu -->
                </ul>
            </div>
        </div>
    </nav>
    <header class="navbar header navbar-expand-lg navbar-light">
        <div class="m-header">
            <a class="mobmenu" id="mobcols" href="javascript:"><span></span></a>
            <a href="{$WEB_ROOT}/clientarea.php" class="logo-content">
                <img class="logo" src="{$WEB_ROOT}/templates/{$template}/assets/img/logo.png" alt="{$companyname}"><!-- site logo image -->
                <span class="b-title">{$companyname}</span><!-- website title -->
            </a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav">
                <li class="nav-item search-term">
                    <form class="main-search" method="post" action="{routePath('knowledgebase-search')}">
                        <a href="{$WEB_ROOT}/knowledgebase.php">
                            <img class="svg icohorn" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/plus-circle.svg" >
                        </a>
                        <input type="text" class="form-control" placeholder="{$LANG.tableentersearchterm}">
                    </form>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                {if $languagechangeenabled && count($locales) > 1}
    			{include file="$template/assets/layout/language.tpl"}<!-- language selector -->
    			{/if}
    			<li><a class="f-15" href="{$WEB_ROOT}/cart.php?a=view"><img class="svg icohorn" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/shopping-cart.svg" ></a></li>
    			{include file="$template/assets/layout/notifications.tpl"}<!-- the notifications -->
                {if $adminMasqueradingAsClient || $adminLoggedIn}
                <li class="notify-container">
                    <div class="dropdown">
                        <a class="dropdown-toggle f-15" href="javascript://" data-toggle="dropdown"><img class="svg icohorn" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/settings.svg" ></a>
                        <div class="dropdown-menu dropdown-menu-right notification">
                            <div class="notify-header">
                                <h6 class="d-inline-block m-b-0">WHMCS Admin Panel</h6>
                            </div>
                            <div class="notify-content">
                                <p>
                                {if $adminMasqueradingAsClient}{$LANG.adminmasqueradingasclient} {$LANG.logoutandreturntoadminarea}{else}{$LANG.adminloggedin} {$LANG.returntoadminarea}{/if}
                                </p>
                            </div>
                            <div class="notify-footer">
                                <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="btn btn-extrasmall btn-prussian-light"> {$LANG.admin.returnToAdmin} <i class="ico-arrow-right f-14 w-icon"></i></a>
                            </div>
                        </div>
                    </div>
                </li>
                {/if} 

    			{include file="$template/assets/layout/login.tpl"}<!-- account informations -->
            </ul>
        </div>
    </header>
    <div class="header-hight-fixed"></div>
	{if $templatefile == 'homepage'}
	{include file="$template/assets/layout/sections/slider.tpl"}
	{/if}
	{if $pagetitle eq "Shopping Cart"}
	{include file="$template/assets/layout/sections/storeslider.tpl"}
	{/if}
    <div class="main-container">
    <div class="wrapper">
        <div class="content main">
            <div class="inner-content">
                <div class="main-body">
                 <div class="page-wrapper">
                    {if $templatefile == 'homepage'}
                    <!-- Full Background Video -->
                    <!-- Section Plans -->
	                {include file="$template/assets/layout/sections/plans.tpl"}
                    <!-- Section Features -->
					{include file="$template/assets/layout/sections/features.tpl"}
	                {/if}	
                    {include file="$template/includes/validateuser.tpl"}			
                    {include file="$template/includes/verifyemail.tpl"}
                            <section id="{if $templatefile == 'homepage'} {else}main-body{/if}">
                                <div class="{if $skipMainBodyContainer}-fluid without-padding{/if} ">
                                    <div class="row">
                                        {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())} {if $primarySidebar->hasChildren() && !$skipMainBodyContainer}
                                        <div class="col-md-12 ">
                                            {include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=$showbreadcrumb}
                                        </div>
                                        {/if} 
										{/if}<!-- Container for main page display content -->
                                        <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-md-12{else}col-xs-12{/if} ">
                                            {if !$primarySidebar->hasChildren() && !$showingLoginPage && !$inShoppingCart && $templatefile != 'homepage' && !$skipMainBodyContainer}
											{include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=$showbreadcrumb}
											{/if}

                                            <div class="row">
                                            <div class="header-divider"></div>
                                            <div class="col-lg-12   main-content">

											{/if}<!-- login and register page without the default header and footer -->
