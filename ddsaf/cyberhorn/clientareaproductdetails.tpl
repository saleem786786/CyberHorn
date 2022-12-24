{if $modulecustombuttonresult}
    {if $modulecustombuttonresult|strstr: "cuccess"}
        {include file="$template/includes/alert.tpl" type="success" msg="{$modulecustombuttonresult|replace: 'cuccess':''}" textcenter=true idname="alertModuleCustomButtonSuccess"}
    {elseif $modulecustombuttonresult == "success"}
        {include file="$template/includes/alert.tpl" type="success" msg=$LANG.moduleactionsuccess textcenter=true idname="alertModuleCustomButtonSuccess"}
    {else}
        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.moduleactionfailed|cat:' ':$modulecustombuttonresult textcenter=true idname="alertModuleCustomButtonFailed"}
    {/if}
{/if}

{if $pendingcancellation}
    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.cancellationrequestedexplanation textcenter=true idname="alertPendingCancellation"}
{/if}

{if $unpaidInvoice}
    <div class="alert alert-{if $unpaidInvoiceOverdue}danger{else}warning{/if}" id="alert{if $unpaidInvoiceOverdue}Overdue{else}Unpaid{/if}Invoice">
        <div class="pull-right">
            <a href="viewinvoice.php?id={$unpaidInvoice}" class="btn btn-xs btn-default">
                {lang key='payInvoice'}
            </a>
        </div>
        {$unpaidInvoiceMessage}
    </div>
{/if}

<div class="tab-content margin-bottom">
    <div class="tab-pane fade in active" id="tabOverview">

        {if $tplOverviewTabOutput}
            {$tplOverviewTabOutput}
        {else}

            <div class="product-details clearfix">

         <div class="row">
            <div class="col-md-2 col-xs-6" style="margin-bottom: 10px;" >
               <div class="product-overbox {$rawstatus|strtolower}" style="min-height: 183px; background: #efeff4;">
                  <div class="prod-info-abso" style="top: 42%;">
                     <i class="fas fa-{if $type eq "hostingaccount" || $type == "reselleraccount"}hdd{elseif $type eq "server"}database{else}archive{/if}"  style="background: #c7e9f4;"></i>
                     <h3 style="color: #878484; border: 2px solid #878484;">{$product}</h3>
                     <h4 style="color: #353535">{$groupname}</h4>
                  </div>
                  <div class="product-status-text">
                     {$status}
                  </div>
               </div>
               {if $showcancelbutton || $packagesupgrade}
               <div class="row">
                  {if $packagesupgrade}
                  <div class="col-xs-12">
                     <a style="padding: 10px 10px; font-size: 12px; text-align: center; border-radius: 10px; margin-top: 10px;" href="upgrade.php?type=package&amp;id={$id}" class="btn-block btn-success">{$LANG.upgrade}</a>
                  </div>
                  {/if}
                  {if $showcancelbutton}
                  <div class="col-xs-12">
                     <a style="padding: 10px 10px; font-size: 12px; text-align: center; border-radius: 10px; margin-top: 10px;" href="clientarea.php?action=cancel&amp;id={$id}" class="btn-block btn-danger {if $pendingcancellation}disabled{/if}">{if $pendingcancellation}{$LANG.cancellationrequested}{else}{$LANG.clientareacancelrequestbutton}{/if}</a>
                  </div>
                  {/if}
               </div>
               {/if}
            </div>
            <div class="col-md-2 col-xs-6" style="margin-bottom: 10px;">
               <div class="product-overbox {$rawstatus|strtolower}" style="min-height: 183px; background: #efeff4;">
                  <div class="prod-info-abso" style="top: 42%;">
                     <i class="fas fa-user-clock" style="background: #c7e9f4;"></i>
                     <h3 style="color: #878484; border: 2px solid #878484;">{$LANG.clientareahostingregdate}</h3>
                     <h4 style="color: #353535">{$regdate}</h4>
                  </div>
               </div>
               {* <span>{$LANG.clientareahostingregdate}<strong class="badge badge-success">{$regdate}</strong></span> *}
            </div>
            <div class="col-md-2 col-xs-6" style="margin-bottom: 10px;">

               {if $billingcycle != $LANG.orderpaymenttermonetime && $billingcycle != $LANG.orderfree}
               <div class="product-overbox {$rawstatus|strtolower}" style="min-height: 183px; background: #efeff4;">
                  <div class="prod-info-abso" style="top: 42%;">
                     <i class="fas fa-money-bill" style="background: #c7e9f4;"></i>
                     <h3 style="color: #878484; border: 2px solid #878484;">{$LANG.recurringamount}</h3>
                     <h4 style="color: #353535">{$recurringamount}</h4>
                  </div>
               </div>
               {* <span>{$LANG.recurringamount}<strong class="badge badge-success">{$recurringamount}</strong></span> *}
               {/if}
               {if $quantitySupported && $quantity > 1}
               <h4 style="color: #353535">{lang key='quantity'}</h4>
               {$quantity}
               {/if}
            </div>
            <div class="col-md-2 col-xs-6" style="margin-bottom: 10px;">
               <div class="product-overbox {$rawstatus|strtolower}" style="min-height: 183px; background: #efeff4;">
                  <div class="prod-info-abso" style="top: 42%;">
                     <i class="fas fa-hurricane" style="background: #c7e9f4;"></i>
                     <h3 style="color: #878484; border: 2px solid #878484;">{$LANG.orderbillingcycle}</h3>
                     <h4 style="color: #353535">{$billingcycle}</h4>
                  </div>
               </div>
               {* <span>{$LANG.orderbillingcycle}<strong class="badge badge-success">{$billingcycle}</strong></span> *}
            </div>
            <div class="col-md-2 col-xs-6" style="margin-bottom: 10px;">
               <div class="product-overbox {$rawstatus|strtolower}" style="min-height: 183px; background: #efeff4;">
                  <div class="prod-info-abso" style="top: 42%;">
                     <i class="fas fa-calendar" style="background: #c7e9f4;"></i>
                     <h3 style="color: #878484; border: 2px solid #878484;">{$LANG.clientareahostingnextduedate}</h3>
                     <h4 style="color: #353535">{$nextduedate}</h4>
                  </div>
               </div>
               {* <span>{$LANG.clientareahostingnextduedate}<strong class="badge badge-success">{$nextduedate}</strong></span>                     *}
            </div>
            <div class="col-md-2 col-xs-6" style="margin-bottom: 10px;">
               <div class="product-overbox {$rawstatus|strtolower}" style="min-height: 183px; background: #efeff4;">
                  <div class="prod-info-abso" style="top: 42%;">
                     <i class="fas fa-credit-card" style="background: #c7e9f4;"></i>
                     <h3 style="color: #878484; border: 2px solid #878484;">{$LANG.orderpaymentmethod}</h3>
                     <h4 style="color: #353535">{$paymentmethod}</h4>
                  </div>
               </div>
               {* <span>{$LANG.orderpaymentmethod}<strong class="badge badge-success">{$paymentmethod}</strong></span>                     *}
            </div>
         </div>

            </div>

            {foreach $hookOutput as $output}
                <div>
                    {$output}
                </div>
            {/foreach}

            {if $domain || $moduleclientarea || $configurableoptions || $customfields || $lastupdate}
                <div class="row clearfix">
                    <div class="col-xs-12">
                        <ul class="nav nav-tabs nav-tabs-overflow">
                            {if $domain}
                                <li class="active">
                                    <a href="#domain" data-toggle="tab"><i class="fas fa-globe fa-fw"></i> {if $type eq "server"}{$LANG.sslserverinfo}{elseif ($type eq "hostingaccount" || $type eq "reselleraccount") && $serverdata}{$LANG.hostingInfo}{else}{$LANG.clientareahostingdomain}{/if}</a>
                                </li>
                            {elseif $moduleclientarea}
                                <li class="active">
                                    <a href="#manage" data-toggle="tab"><i class="fas fa-globe fa-fw"></i> {$LANG.manage}</a>
                                </li>
                            {/if}
                            {if $configurableoptions}
                                <li{if !$domain && !$moduleclientarea} class="active"{/if}>
                                    <a href="#configoptions" data-toggle="tab"><i class="fas fa-cubes fa-fw"></i> {$LANG.orderconfigpackage}</a>
                                </li>
                            {/if}
                            {if $customfields}
                                <li{if !$domain && !$moduleclientarea && !$configurableoptions} class="active"{/if}>
                                    <a href="#additionalinfo" data-toggle="tab"><i class="fas fa-info fa-fw"></i> {$LANG.additionalInfo}</a>
                                </li>
                            {/if}
                            {* {if $lastupdate}
                                <li{if !$domain && !$moduleclientarea && !$configurableoptions && !$customfields} class="active"{/if}>
                                    <a href="#resourceusage" data-toggle="tab"><i class="fas fa-inbox fa-fw"></i> {$LANG.resourceUsage}</a>
                                </li>
                            {/if} *}
                        </ul>
                    </div>
                </div>

                <div class="tab-content product-details-tab-container">
                    {if $domain}
                        <div class="tab-pane fade in active text-center" id="domain">

                            {if $moduleclientarea}
                                <div class="text-center module-client-area">
                                    {$moduleclientarea}
                                </div>
                            {/if}
                        </div>
                        {if $sslStatus}
                            <div class="tab-pane fade text-center" id="ssl-info">
                                {if $sslStatus->isActive()}
                                    <div class="alert alert-success" role="alert">
                                        {lang key='sslActive' expiry=$sslStatus->expiryDate->toClientDateFormat()}
                                    </div>
                                {else}
                                    <div class="alert alert-warning ssl-required" role="alert">
                                        {lang key='sslState.sslInactive'}
                                    </div>
                                {/if}
                            </div>
                        {/if}
                    {elseif $moduleclientarea}
                        <div class="tab-pane fade{if !$domain} in active{/if} text-center" id="manage">
                            {if $moduleclientarea}
                                <div class="text-center module-client-area">
                                    {$moduleclientarea}
                                </div>
                            {/if}
                        </div>
                    {/if}
                    {if $configurableoptions}
                        <div class="tab-pane fade{if !$domain && !$moduleclientarea} in active{/if} text-center" id="configoptions">
                            {foreach from=$configurableoptions item=configoption}
                                <div class="row">
                                    <div class="col-sm-5">
                                        <strong>{$configoption.optionname}</strong>
                                    </div>
                                    <div class="col-sm-7 text-left">
                                        {if $configoption.optiontype eq 3}{if $configoption.selectedqty}{$LANG.yes}{else}{$LANG.no}{/if}{elseif $configoption.optiontype eq 4}{$configoption.selectedqty} x {$configoption.selectedoption}{else}{$configoption.selectedoption}{/if}
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                    {if $customfields}
                        <div class="tab-pane fade{if !$domain && !$moduleclientarea && !$configurableoptions} in active{/if} text-center" id="additionalinfo">
                            {foreach from=$customfields item=field}
                                <div class="row">
                                    <div class="col-sm-5">
                                        <strong>{$field.name}</strong>
                                    </div>
                                    <div class="col-sm-7 text-left">
                                        {$field.value}
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                    {* {if $lastupdate}
                        <div class="tab-pane fade text-center" id="resourceusage">
                            <div class="col-sm-10 col-sm-offset-1">
                                <div class="col-sm-6">
                                    <h4>{$LANG.diskSpace}</h4>
                                    <input type="text" value="{$diskpercent|substr:0:-1}" class="dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
                                    <p>{$diskusage}MB / {$disklimit}MB</p>
                                </div>
                                <div class="col-sm-6">
                                    <h4>{$LANG.bandwidth}</h4>
                                    <input type="text" value="{$bwpercent|substr:0:-1}" class="dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
                                    <p>{$bwusage}MB / {$bwlimit}MB</p>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                            <p class="text-muted">{$LANG.clientarealastupdated}: {$lastupdate}</p>

                            <script src="{$BASE_PATH_JS}/jquery.knob.js"></script>
                            <script type="text/javascript">
                            jQuery(function() {ldelim}
                                jQuery(".dial-usage").knob({ldelim}'format':function (v) {ldelim} alert(v); {rdelim}{rdelim});
                            {rdelim});
                            </script>
                        </div>
                    {/if} *}
                </div>
            {/if}
            <script src="{$BASE_PATH_JS}/bootstrap-tabdrop.js"></script>
            <script type="text/javascript">
                jQuery('.nav-tabs-overflow').tabdrop();
            </script>

        {/if}

    </div>
    <div class="tab-pane fade in" id="tabDownloads">

        <h3>{$LANG.downloadstitle}</h3>

        {include file="$template/includes/alert.tpl" type="info" msg="{lang key="clientAreaProductDownloadsAvailable"}" textcenter=true}

        <div class="row">
            {foreach from=$downloads item=download}
                <div class="col-xs-10 col-xs-offset-1">
                    <h4>{$download.title}</h4>
                    <p>
                        {$download.description}
                    </p>
                    <p>
                        <a href="{$download.link}" class="btn btn-default"><i class="fas fa-download"></i> {$LANG.downloadname}</a>
                    </p>
                </div>
            {/foreach}
        </div>

    </div>
    <div class="tab-pane fade in" id="tabAddons">

        <h3>{$LANG.clientareahostingaddons}</h3>

        {if $addonsavailable}
            {include file="$template/includes/alert.tpl" type="info" msg="{lang key="clientAreaProductAddonsAvailable"}" textcenter=true}
        {/if}

        <div class="row">
            {foreach from=$addons item=addon}
                <div class="col-xs-10 col-xs-offset-1">
                    <div class="panel panel-default panel-accent-blue">
                        <div class="panel-heading">
                            {$addon.name}
                            <div class="pull-right status-{$addon.rawstatus|strtolower}">{$addon.status}</div>
                        </div>
                        <div class="row panel-body">
                            <div class="col-md-6">
                                <p>
                                    {$addon.pricing}
                                </p>
                                <p>
                                    {$LANG.registered}: {$addon.regdate}
                                </p>
                                <p>
                                    {$LANG.clientareahostingnextduedate}: {$addon.nextduedate}
                                </p>
                            </div>
                        </div>
                        <div class="panel-footer">
                            {$addon.managementActions}
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>

    </div>
    <div class="tab-pane fade in" id="tabChangepw">

        <h3>{$LANG.serverchangepassword}</h3>

        {if $modulechangepwresult}
            {if $modulechangepwresult == "success"}
                {include file="$template/includes/alert.tpl" type="success" msg=$modulechangepasswordmessage textcenter=true}
            {elseif $modulechangepwresult == "error"}
                {include file="$template/includes/alert.tpl" type="error" msg=$modulechangepasswordmessage|strip_tags textcenter=true}
            {/if}
        {/if}

        <form class="form-horizontal using-password-strength" method="post" action="{$smarty.server.PHP_SELF}?action=productdetails#tabChangepw" role="form">
            <input type="hidden" name="id" value="{$id}" />
            <input type="hidden" name="modulechangepassword" value="true" />

            <div id="newPassword1" class="form-group has-feedback">
                <label for="inputNewPassword1" class="col-sm-4 control-label">{$LANG.newpassword}</label>
                <div class="col-sm-5">
                    <input type="password" class="form-control" id="inputNewPassword1" name="newpw" autocomplete="off" />
                    <span class="form-control-feedback glyphicon"></span>
                    {include file="$template/includes/pwstrength.tpl"}
                </div>
                <div class="col-sm-3">
                    <button type="button" class="btn btn-default generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
                        {$LANG.generatePassword.btnLabel}
                    </button>
                </div>
            </div>
            <div id="newPassword2" class="form-group has-feedback">
                <label for="inputNewPassword2" class="col-sm-4 control-label">{$LANG.confirmnewpassword}</label>
                <div class="col-sm-5">
                    <input type="password" class="form-control" id="inputNewPassword2" name="confirmpw" autocomplete="off" />
                    <span class="form-control-feedback glyphicon"></span>
                    <div id="inputNewPassword2Msg">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-6 col-sm-6">
                    <input class="btn btn-primary" type="submit" value="{$LANG.clientareasavechanges}" />
                    <input class="btn" type="reset" value="{$LANG.cancel}" />
                </div>
            </div>

        </form>

    </div>
</div>
