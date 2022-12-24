<li>
	<div class="dropdown lang-drop">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown" >
			<img src="{$WEB_ROOT}/templates/{$template}/assets/img/flags/{$language}.svg" class="br-50 img-20" alt="{$activeLocale.localisedName}">
		</a>		
		<div class="dropdown-menu dropdown-menu-right notification lang-container">
			<div class="notify-header">
				<h6>{$LANG.chooselanguage}</h6>
					{if $activeLocale.localisedName|lower eq "english"}
					 	<a class="btn btn-default btn-xxs langbtns"   href="{$currentpagelinkback}language=hebrew">עברית</a>
					 	<a class="btn btn-outline btn-xxs langbtns"  href="{$currentpagelinkback}language=english">English</a>
					{else}
					 	<a class="btn btn-default btn-xxs langbtns" style="float: left;" href="{$currentpagelinkback}language=hebrew">עברית</a>
					 	<a class="btn btn-outline btn-xxs langbtns"  style="float: left;" href="{$currentpagelinkback}language=english">English</a>
					{/if}				{* <a>{$activeLocale.localisedName}</a> *}
			</div>
			{* <ul>
				{foreach $locales as $locale}
				<li><a href="{$currentpagelinkback}language={$locale.language}">{$locale.localisedName}</a></li>
				{/foreach}
			</ul> *}
		</div>
	</div>
</li>
