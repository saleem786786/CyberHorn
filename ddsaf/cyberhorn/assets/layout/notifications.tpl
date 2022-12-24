<li class="notify-container">
    <div class="dropdown">
        <a class="dropdown-toggle f-15" href="#" data-toggle="dropdown"><img class="svg icohorn" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/icohorn/bell.svg" >{if count($clientAlerts) > 0}<div class="dotted-animation"><span class="animate-circle"></span><span class="main-circle"></span></div>{/if}</a>
        <div class="dropdown-menu dropdown-menu-right notification">
            <div class="notify-header">
                <h6 class="d-inline-block m-b-0">{$LANG.notifications}</h6>
                <span class="notify-number">{if count($clientAlerts) > 0} {count($clientAlerts)} {else}0{/if}</span>
            </div>
            <div class="notify-content">
                {if count($clientAlerts) > 0}
                <ul class="client-alerts">
                    {foreach $clientAlerts as $alert}
                    <li><a href="{$alert->getLink()}">
                        <i class="ico-{if $alert->getSeverity() == 'danger'}help-circle{elseif $alert->getSeverity() == 'warning'}alert-circle{elseif $alert->getSeverity() == 'info'}info{else}check-circle{/if}"></i>
                        <div class="">{$alert->getMessage()}</div>
                    </a></li>
                    {/foreach}
                </ul>
                {else}
                <span class="alert alert-warning notify-alert"> {$LANG.notificationsnone} <i class="ico-alert-circle"></i></span>
                {/if}
            </div>

        </div>
    </div>
</li>
