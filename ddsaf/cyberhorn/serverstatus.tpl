<div class="section network-status">
    <div class="network-status-body">
        {foreach from=$issues item=issue}
        <div class="panel">
            <div class="panel-heading">
                <div class="panel-title">
                    {$issue.title} <span>{$issue.status}</span>
                </div>
                {if $issue.clientaffected}{else}{/if}
            </div>
            <div class="panel-body">
                <div class="priority priority-{$issue.rawPriority|lower}">
                    <span class="priority-text">{$LANG.networkissuespriority} - {$issue.priority}</span>
                    {* <li class="list-group-item {if $issue.rawPriority == 'Critical'}list-group-item-danger{elseif $issue.rawPriority == 'High'}list-group-item-warning{elseif $issue.rawPriority == 'Low'}list-group-item-success{else}list-group-item-info{/if}"><strong>{$LANG.networkissuespriority}</strong> - {$issue.priority}</li> *}
                    {if $issue.server or $issue.affecting}<span class="priority-affectiong">{$LANG.networkissuesaffecting} {$issue.type} - {if $issue.type eq $LANG.networkissuestypeserver}{$issue.server}{else}{$issue.affecting}{/if}</span>{/if}
                </div>
                <p>{$issue.description}</p>
            </div>
            <div class="panel-footer text-small text-light">
                <div>{$LANG.networkissuesdate} - {$issue.startdate}{if $issue.enddate} - {$issue.enddate}{/if}</div>
                <div>{$LANG.networkissueslastupdated}- {$issue.lastupdate}</div>
            </div>
        </div>
        {foreachelse}
        {include file="$template/includes/common/message.tpl" type="success" msg=$noissuesmsg textcenter=true customClass="message-no-data"}
        {/foreach}
    </div>
    {if $issues}
    <div class="network-status-pagination pagination">
        <li class="paginate_button previous {if !$prevpage}disabled{/if}"><a href="{if $prevpage}{$smarty.server.PHP_SELF}?{if $view}view={$view}&amp;{/if}page={$prevpage}{else}#{/if}">{$LANG.previouspage}</a></li>
        <li class="paginate_button next {if !$nextpage}disabled{/if}"><a href="{if $nextpage}{$smarty.server.PHP_SELF}?{if $view}view={$view}&amp;{/if}page={$nextpage}{else}#{/if}">{$LANG.nextpage}</a></li>
    </div>
    {/if}
</div>
{if $servers}
<div class="section" data-template="{$template}">
    <div class="section-header">
        <h2 class="section-title">{$LANG.serverstatustitle}</h2>
        <p class="section-desc">{$LANG.serverstatusheadingtext}</p>
    </div>
    <div class="section-body">
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>{$LANG.servername}</th>
                        <th class="text-center">HTTP</th>
                        <th class="text-center">FTP</th>
                        <th class="text-center">POP3</th>
                        <th class="text-center">{$LANG.serverstatusphpinfo}</th>
                        <th class="text-center">{$LANG.serverstatusserverload}</th>
                        <th class="text-center">{$LANG.serverstatusuptime}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$servers key=num item=server}
                    <tr>
                        <td>{$server.name}</td>
                        <td class="text-center" id="port80_{$num}">
                            <div class="loader" >
                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}
                            </div>
                        </td>
                        <td class="text-center" id="port21_{$num}">
                            <div class="loader" >
                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}
                            </div>
                        </td>
                        <td class="text-center" id="port110_{$num}">
                            <div class="loader" >
                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}
                            </div>
                        </td>
                        <td class="text-center"><a href="{$server.phpinfourl}" target="_blank">{$LANG.serverstatusphpinfo}</a></td>
                        <td class="text-center" id="load{$num}">
                            <div class="loader" >
                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}
                            </div>
                        </td>
                        <td class="text-center" id="uptime{$num}">
                            <div class="loader" >
                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}
                            </div>
                            <script>
                                var templateName = $('[data-template]').data('template');
                                function checkLsPort(num, port) {
                                    WHMCS.http.jqClient.post('serverstatus.php', 'ping=1&num=' + num + '&port=' + port, function(data) {
                                        var str = data;
                                        var res = str.replace("assets/img", "templates/"+templateName+"/assets/img/serverstatus");
                                        res = res.replace("gif", "svg");
                                        jQuery("#port" + port + "_" + num).html(res);
                                    });
                                }
                                jQuery(document).ready(function() {
                                    checkLsPort({$num}, 80);
                                    checkLsPort({$num}, 21);
                                    checkLsPort({$num}, 110);
                                    getStats({$num});
                                });
                            </script>
                        </td>
                    </tr>
                    {foreachelse}
                    <tr>
                        <td colspan="7">{$LANG.serverstatusnoservers}</td>
                    </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>
{/if}
