<style>
 .page-knowledgebase .list-group-item-heading {
	font-weight: normal;
        font-size: 17px;
        line-height: 28px;
        margin-bottom: 8px;
}  
.page-knowledgebase .list-group-item-text {
	font-weight: normal;
        line-height: 24px;
}
.page-knowledgebase .list-group-item-icon {
        line-height: 28px !important;
}
.page-knowledgebase i.list-group-item-icon.fa.fa-folder {
    font-size: 18px;
}
.page-knowledgebase .list-group-item.has-icon {
    border-color: #e9eaec;
}
.page-knowledgebase .list-group-item-heading .btn {
    font-weight: 500;
}
#btnKnowledgebaseSearch{
    border-top-left-radius: 3px;
    border-bottom-left-radius: 3px;
}
.hebrew #inputKnowledgebaseSearch {
    border-top-left-radius: 3px!important;
    border-bottom-left-radius: 3px!important;
}
.hebrew #btnKnowledgebaseSearch {
    border-top-right-radius: 3px!important;
    border-bottom-right-radius: 3px!important;
    margin-right: var(--spacing-2x);
}

div.header-lined .breadcrumb li a {
  
  font-weight: normal;
}


@media screen and (min-device-width: 480px) and (max-device-width: 767px) { 
   .search-group .search-field {
	flex: 69%;
	max-width: 69%;
}
#btnKnowledgebaseSearch {
	max-width: 26%;
	flex: 25%;
	margin-left: 20px;
	height: 52px;
}
}
 @media screen and (max-width: 479px) {
    #btnKnowledgebaseSearch {
        line-height: normal;
        height: 52px;
        margin-left: 0;
        margin-right: 0;
    }
}


</style>
<div class="article panel panel-default">
        <div class="panel-body">
            <div class="article-title">
                <h2 class="h3">{$kbarticle.title}</h2>
                {if $kbarticle.editLink}
                    <a href="{$kbarticle.editLink}" class="btn btn-default">
                        {$LANG.edit}
                    </a>
                {/if}
            </div>
            {if $kbarticle.voted}
                {include file="$template/includes/alert.tpl" type="success alert-bordered-left" msg="{lang key="knowledgebaseArticleRatingThanks"}" textcenter=true}
            {/if}
            <div class="article-content">
                {$kbarticle.text}
            </div>
        </div>
    </div>
    <div class="article-rate panel panel-default">
        <div class="panel-body">
            <form action="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" method="post">
                <input type="hidden" name="useful" value="vote">
                <div class="text">
                    {if $kbarticle.voted}{$LANG.knowledgebaserating}{else}{$LANG.knowledgebasehelpful}{/if}
                    <span><i class="fa fa-heart"></i> {$kbarticle.useful} {$LANG.knowledgebaseratingtext} ({$kbarticle.votes} {$LANG.knowledgebasevotes})</span>
                </div>
                <div>
                {if !$kbarticle.voted}
                    <button type="submit" name="vote" value="yes" class="btn btn-primary-faded"><i class="fa fa-thumbs-up"></i> {$LANG.knowledgebaseyes}</button>
                    <button type="submit" name="vote" value="no" class="btn btn-primary-faded"><i class="fa fa-thumbs-down"></i> {$LANG.knowledgebaseno}</button>
                {/if}
                </div>
            </form>
        </div>
    </div>
    {if $kbarticles}
        <div class="section">
            <div class="section-header">
                <h2 class="section-title">{$LANG.knowledgebasepopular}</h2>
            </div>
            <div class="section-body">
                <div class="list-group">
                    {foreach from=$kbarticles item=kbarticle}
                        <a class="list-group-item has-icon" href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}">
                            <i class="list-group-item-icon fa fa-file"></i>
                            <div class="list-group-item-body">
                                <div class="list-group-item-heading">{$kbarticle.title}{if $kbarticle.editLink} <button data-href="{$kbarticle.editLink}" class="btn btn-xs btn-default">{$LANG.edit}</button>{/if}</div>
                                {if $kbarticle.article}<p class="list-group-item-text">{$kbarticle.article|truncate:100:"..."}</p>{/if}
                            </div>
                        </a>
                    {/foreach}
                </div>
            </div>
        </div>
    {/if}
