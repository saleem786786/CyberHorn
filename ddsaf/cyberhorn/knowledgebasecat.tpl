<style>
 .list-group-item-heading {
	font-weight: normal;
        font-size: 17px;
        line-height: 28px;
        margin-bottom: 8px;
}  
.list-group-item-text {
	font-weight: normal;
        line-height: 24px;
}
.list-group-item-icon {
        line-height: 28px !important;
}
i.list-group-item-icon.fa.fa-folder {
    font-size: 18px;
}
.list-group-item.has-icon {
    border-color: #e9eaec;
}
.list-group-item-heading .btn {
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
<div class="search-box search-box-primary">
    <form role="form" method="post" action="{routePath('knowledgebase-search')}">
        <div class="search-group">
            <div class="search-field search-field-lg">
                <i class="search-field-icon fa fa-search"></i>
                <input class="form-control form-control-lg" type="text" id="inputKnowledgebaseSearch" name="search" placeholder="{$LANG.howcanwehelp}" value="{$searchterm}"  />
            </div>
            <button class="btn btn-lg btn-primary-faded" type="submit" id="btnKnowledgebaseSearch">{$LANG.search}</button>
        </div>
    </form>
</div>
{if $kbcats}
<div class="section">
    <div class="section-header">
        <h2 class="section-title">{$LANG.knowledgebasecategories}</h2>
    </div>
    <div class="section-body">
        <div class="list-group">
            {foreach from=$kbcats name=kbcats item=kbcat}
            <a class="list-group-item has-icon" href="{routePath('knowledgebase-category-view', {$kbcat.id}, {$kbcat.urlfriendlyname})}">
                <i class="list-group-item-icon fa fa-folder"></i>
                <div class="list-group-item-body">
                    <div class="list-group-item-heading">{$kbcat.name} ({$kbcat.numarticles}){if $kbcat.editLink} <button data-href="{$kbcat.editLink}" class="btn btn-xs btn-default">{$LANG.edit}</button>{/if}</div>
                    {if $kbcat.description}<p class="list-group-item-text">{$kbcat.description}</p>{/if}
                </div>
            </a>
            {/foreach}
        </div>
    </div>
</div>
{/if}
{if $kbarticles || !$kbcats}
<div class="section">
    <div class="section-header">
        {if $tag}
        <h2 class="section-title">>{$LANG.kbviewingarticlestagged} '{$tag}'</h2>
        {else}
        <h2 class="section-title">{$LANG.knowledgebasearticles}</h2>
        {/if}
    </div>
    <div class="section-body">
        {if $kbarticles}
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
        {else}
        <div class="message message-no-data">
            <div class="message-image">
                {include file="$template/includes/common/svg-icon.tpl" icon="article"}
            </div>
            <h6 class="message-title">{$LANG.knowledgebasenoarticles}</h6>
        </div>
        {/if}
    </div>
</div>
{/if}
