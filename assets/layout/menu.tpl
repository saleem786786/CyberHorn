{* <div class="nav-menu-title"><span>{$LANG.clientareanavservices}</span></div> *}
<li data-username="Home" class="nav-item">
	<a href="{$WEB_ROOT}/clientarea.php"><span class="icony"> <img class="svg" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/home.svg" alt=""></span><span class="sideinfo">{$LANG.clientareanavhome}</span></a>
</li>
{if $loggedin}


<li data-username="Services" class="nav-item">
	<a href="{$WEB_ROOT}/clientarea.php?action=services"><span class="icony"><img class="svg" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/my-services.svg" ></span><span class="sideinfo">{$LANG.clientareanavservices}</span></a>
</li>

{*

<li data-username="Services" class="nav-item hasmenu">
	<a><span class="icony"> <img class="svg" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/user.svg" alt=""></span><span class="sideinfo">{$LANG.navservices}</span></a>
	<ul class="submenu">
		<li><a href="{$WEB_ROOT}/clientarea.php?action=services">{$LANG.clientareanavservices}</a></li>
		<li><a class="svg" href="{$WEB_ROOT}/cart.php">{$LANG.navservicesorder}</a></li>
		<li><a href="{$WEB_ROOT}/cart.php?gid=addons">{$LANG.clientareaviewaddons}</a></li>
	</ul>
</li>
*}



{/if}
<li data-username="store" class="nav-item hasmenu">
	<a><span class="icony"><img class="svg" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/shop.svg" >
	</span><span class="sideinfo">{$LANG.navStore}</span> </span><span class="labelinfo">{$LANG.top}</span></a>
	
	<ul class="submenu">
		<li><a href="{$WEB_ROOT}/cart.php">{$LANG.navBrowseProductsServices}</a></li>
		{foreach from=$productgroups item=productgroup}
		<li><a href="{$WEB_ROOT}/cart.php?gid={$productgroup.gid}">{$productgroup.name}</a></li>
		{/foreach}

		{if $loggedin}
		{* <li><a href="{$WEB_ROOT}/cart.php?gid=addons">{$LANG.cartproductaddons}</a></li> *}
		
		{/if}
		{if $loggedin && $renewalsenabled}
		<li><a href="{$WEB_ROOT}/cart.php?gid=renewals">{$LANG.domainrenewals}</a></li>
		{/if}
		{if $registerdomainenabled}
		<li><a href="{$WEB_ROOT}/cart.php?a=add&domain=register">{$LANG.navregisterdomain}</a></li>
		{/if}
		{if $transferdomainenabled}
		<li><a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer">{$LANG.transferinadomain}</a></li>
		{/if}

	</ul>
</li>


{* <li data-username="domains" class="nav-item">
	<a href="{$WEB_ROOT}/clientarea.php?action=domains"><span class="icony"><img class="svg" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/domains.svg" ></span><span class="sideinfo">{$LANG.cartproductdomain}</span> </a>
</li> *}

<!--affiliate--->

<li data-username="support" class="nav-item hasmenu">
	<a><span class="icony"><img class="svg" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/helpdesk.svg" ></span><span class="sideinfo">{$LANG.navsupport}</span></a>
	<ul class="submenu">
		<li><a href="{$WEB_ROOT}/announcements.php">{$LANG.announcementstitle}</a></li>
		<li><a href="{$WEB_ROOT}/knowledgebase.php">{$LANG.knowledgebasetitle}</a></li>
		<li><a href="{$WEB_ROOT}/downloads.php">{$LANG.downloadstitle}</a></li>
		<li><a href="{$WEB_ROOT}/serverstatus.php">{$LANG.networkstatustitle}</a></li>
		<li><a href="{$WEB_ROOT}/supporttickets.php">{$LANG.navtickets}</a></li>
		<li><a href="{$WEB_ROOT}/submitticket.php">{$LANG.navopenticket}</a></li>
	</ul>
</li>


{if $loggedin}
<li data-username="store" class="nav-item hasmenu">
	<a><span class="icony"><img class="svg" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/billing.svg" ></span><span class="sideinfo">{$LANG.navbilling}</span></a>
	<ul class="submenu">
		<li><a href="{$WEB_ROOT}/clientarea.php?action=invoices">{$LANG.invoices}</a></li>
		{*<li><a href="{$WEB_ROOT}/clientarea.php?action=quotes">{$LANG.quotestitle}</a></li>*}
		<li><a href="{$WEB_ROOT}/clientarea.php?action=masspay&all=true">{$LANG.masspaytitle}</a></li>
	</ul>
</li>
{/if}
{* <div class="nav-menu-title"><span>{$LANG.navsupport}</span></div>
*}


<!---support--->

<li data-username="Home" class="nav-item">
	<a href="{$WEB_ROOT}/affiliates.php"><span class="icony"><img class="svg" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/affiliates.svg" ></span><span class="sideinfo">{$LANG.affiliatestitle}</span> <span class="labelinfo custom">{$LANG.domainCheckerSalesGroup.new}</span></a>
</li>

{* <li data-username="announcements" class="nav-item">
	<a href="{$WEB_ROOT}/announcements.php"><span class="icony"><img class="svg" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/announcements.svg" ></span><span class="sideinfo">{$LANG.announcementstitle}</span></a>
</li>
<li data-username="knowledgebase" class="nav-item">
	<a href="{$WEB_ROOT}/knowledgebase.php"><span class="icony"><img class="svg" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/file-text.svg" ></span><span class="sideinfo">{$LANG.knowledgebasetitle}</span></a>
</li>
<li data-username="Network" class="nav-item">
	<a href="{$WEB_ROOT}/serverstatus.php"><span class="icony"><img class="svg" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/pie-chart.svg" ></span><span class="sideinfo">{$LANG.networkstatustitle}</span></a>
</li> *}
{*<div class="nav-menu-title"><span>{$LANG.contactus}</span></div>
<li data-username="contact" class="nav-item">
	<a href="{$WEB_ROOT}/contact.php"><span class="icony"><img class="svg" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/mail.svg" ></span><span class="sideinfo">{$LANG.contactus}</span></a>
</li>*}
{if !$loggedin}
<li data-username="register" class="nav-item">
	<a href="{$WEB_ROOT}/register.php"><span class="icony"><img class="svg" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/unlock.svg" ></span><span class="sideinfo">{$LANG.register}</span></a>
</li>
{/if}
\
