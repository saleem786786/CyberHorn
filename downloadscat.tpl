    <div class="search-box search-box-primary">
        <form role="form" method="post" action="{routePath('download-search')}">
            <div class="search-group">
                <div class="search-field search-field-lg">
                    <i class="search-field-icon fa fa-search"></i>
                    <input class="form-control form-control-lg" type="text" name="search" id="inputDownloadsSearch"  placeholder="{$LANG.downloadssearch}" />
                </div>
                <div class="search-group-btn">
                    <button class="btn btn-lg btn-primary-faded" type="submit" id="btnDownloadsSearch"/>{$LANG.search}</button>
                </div>
            </div>
        </form>
    </div>
    {if $dlcats}
        <div class="section">
            <div class="section-header">
                <h2 class="section-title">{$LANG.knowledgebasecategories}</h2>
            </div>
            <div class="section-body">
                <div class="list-group">
                    {foreach $dlcats as $dlcat}
                        <a class="list-group-item has-icon" href="{routePath('download-by-cat', $dlcat.id, $dlcat.urlfriendlyname)}">
                            <i class="list-group-item-icon fa fa-folder"></i>
                            <div class="list-group-item-body">
                                <div class="list-group-item-heading">{$dlcat.name} ({$dlcat.numarticles})</div>
                                {if $dlcat.description}<p class="list-group-item-text">{$dlcat.description}</p>{/if}
                            </div>
                        </a>
                    {/foreach}
                </div>
            </div>
        </div>
    {/if}
    {if $downloads}
        <div class="section">
            <div class="section-header">
                <h2 class="section-title">{$LANG.downloadsfiles}</h2>
            </div>
            <div class="section-body">
                <div class="list-group list-group-sm">
                    {foreach $downloads as $download}
                        <a class="list-group-item has-icon" href="{$download.link}">
                            <i class="list-group-item-icon fa fa-document"></i>
                            <div class="list-group-item-body">
                                <div class="list-group-item-heading">{$download.title} {if $download.clientsonly}<i class="fa fa-padlock text-faded"></i> {/if}</div>
                                <p class="list-group-item-text">{$download.filesize}<i class="fa fa-bullet-small"></i>{$download.description}</p>
                            </div>
                        </a>
                    {/foreach}
                </div>
            </div>
        </div>
    {else}
        <div class="section">
            <div class="section-body">
                <div class="message message-no-data">
                    <div class="message-image">
                        {include file="$template/includes/common/svg-icon.tpl" icon="downloads"}
                    </div>
                    <h6 class="message-title">{$LANG.downloadsnone}</h6>
                </div>
            </div>
        </div>
    {/if}
