<div class="container-fluid main-fluid normal-sec pb-0">
{if $twitterusername}
	<div class="row">
		<div class="col-md-12">
			<div class="main-title center-text">
                <h2>{$LANG.twitterlatesttweets}</h2>
                <p>{$LANG.announcementsdescription}</p>
            </div>
		</div>
	</div>
    <div id="twitterFeedOutput">
        <p class="text-center"><img src="{$BASE_PATH_IMG}/loading.gif" /></p>
    </div>
    <script type="text/javascript" src="{assetPath file='twitter.js'}"></script>
{elseif $announcements}
	<div class="row">
		<div class="col-md-12">
			<div class="main-title center-text">
                <h2>{$LANG.latestannouncements}</h2>
                <p>{$LANG.announcementsdescription}</p>
            </div>
		</div>
	</div>			
	<div class="row">
	{foreach $announcements as $announcement}
	{if $announcement@index < 3}
		<div class="col-md-4">
			<div class="news-content">
				<h5>{$announcement.title}</h5>
				<p>{$announcement.summary}</p>
				<div class="news-content-footer">
					<span>{$carbon->translatePassedToFormat($announcement.rawDate, 'M jS')}</span>
					<a class="btn btn-extrasmall btn-prussian-medio" href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}"> {$LANG.readmore} <i class="ico-eye f-14 w-icon"></i></a>
				</div>
			</div>
		</div>
	{/if}
	{/foreach}				
	</div>
{/if}
</div>