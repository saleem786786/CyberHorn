{include file="$template/includes/tablelist.tpl" tableName="ServicesList" filterColumn="4" noSortColumns="0"}
<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = jQuery('#tableServicesList').removeClass('hidden').DataTable();
        {if $orderby == 'product'}
        table.order([1, '{$sort}'], [4, 'asc']);
        {elseif $orderby == 'amount' || $orderby == 'billingcycle'}
        table.order(2, '{$sort}');
        {elseif $orderby == 'nextduedate'}
        table.order(3, '{$sort}');
        {elseif $orderby == 'domainstatus'}
        table.order(4, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').addClass('hidden');
    });
</script>
{*
<div class="text-right">
    <span class="hideServices hidden">Hide {math equation="y - x" x=$clientsstats['productsnumactive'] y=$clientsstats['productsnumtotal']} inactive services </span><span class="hiddenServices ">{math equation="y - x" x=$clientsstats['productsnumactive'] y=$clientsstats['productsnumtotal']} inactive services has been hidden</span> <input type="checkbox" name="hidePending" class="toggle-switch-success" id="hidePending" data-size ="mini" data-on-color  ="primary" checked>
</div> *}
<div class="table-container clearfix">
    <div class="table-top">
        <label class="d-flex" data-inactive-services="">
        <span class="hideServices hidden" data-inactive-services-text="hide">{$LANG.hide} <b>{math equation="y - x" x=$clientsstats['productsnumactive'] y=$clientsstats['productsnumtotal']}</b> {$LANG.inactive} {$LANG.services}</span>
        <span data-inactive-services-text="hidden" class="hiddenServices "><b>{math equation="y - x" x=$clientsstats['productsnumactive'] y=$clientsstats['productsnumtotal']}</b> {$LANG.inactive} {$LANG.services} {$LANG.hasbeenhidden}</span>
        <div class="switch switch--sm">
            <input class="switch__checkbox" type="checkbox" name="hideInactiveSercices" value="1" data-inactive-services-checkbox="" checked>
            <span class="switch__container"><span class="switch__handle"></span></span>
        </div>
    </label>

</div>
<table id="tableServicesList" class="table table-list hidden">
    <thead>
        <tr>
            <th></th>
            <th>{$LANG.orderproduct}</th>
            <th>{$LANG.clientareaaddonpricing}</th>
            <th>{$LANG.clientareahostingnextduedate}</th>
            <th>{$LANG.clientareastatus}</th>
            <th class="responsive-edit-button" style="display: none;"></th>
        </tr>
    </thead>
    <tbody>

        {foreach key=num item=service from=$services}
        <tr onclick="clickableSafeRedirect(event, 'clientarea.php?action=productdetails&amp;id={$service.id}', false)">
            <td class="text-center{if $service.sslStatus} ssl-info{/if}" data-element-id="{$service.id}" data-type="service"{if $service.domain} data-domain="{$service.domain}"{/if}>
                {if $service.sslStatus}
                <img src="{$service.sslStatus->getImagePath()}" data-toggle="tooltip" title="{$service.sslStatus->getTooltipContent()}" class="{$service.sslStatus->getClass()}"/>
                {elseif !$service.isActive}
                <img src="{$BASE_PATH_IMG}/ssl/ssl-inactive-domain.png" data-toggle="tooltip" title="{lang key='sslState.sslInactiveService'}">
                {/if}
            </td>
            <td>
                <span style="display: inline-flex; vertical-align: middle;">
                    {if $service.product|strstr:"Dedicated Server"}
                    <img class="svg mb-10" style="width: 25px;" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/svg/managedserver.svg">
                    {elseif $service.product|strstr:"Cloud"}
                    <img class="svg mb-10" style="width: 25px;" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/svg/cloudserver.svg">
                    {elseif $service.product|strstr:"Google"}
                    <img class="svg mb-10"  style="width: 25px;" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/svg/gcp.png">
                    {elseif $service.product|strstr:"Digital Ocean"}
                    <img class="svg mb-10" style="width: 25px;" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/svg/digitalocean.svg">
                    {elseif $service.product|strstr:"Hetzner"}
                    <img class="svg mb-10"  style="width: 25px;" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/svg/hetzner.svg">
                    {elseif $service.product|strstr:"OVH"}
                    <img class="svg mb-10"  style="width: 25px;" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/svg/ovh.svg">
                    {elseif $service.product|strstr:"AWS"}
                    <img class="svg mb-10"  style="width: 25px;" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/svg/aws.svg">
                    {elseif $service.product|strstr:"Vultr"}
                    <img class="svg mb-10"  style="width: 25px;" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/svg/vultr.svg">
                    {elseif $service.product|strstr:"Linode"}
                    <img class="svg mb-10"  style="width: 25px;" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/svg/linode.png">
                    {else}
                    <img class="svg mb-10"  style="width: 25px;" src="{$WEB_ROOT}/templates/{$template}/assets/fonts/svg/cloudmanaged.svg">
                    {/if}
                </span>
                <strong>{$service.product}</strong>{if $service.domain}<br /><a href="http://{$service.domain}" target="_blank">{$service.domain}</a>{/if} {if $service.dedicatedip} ( {$service.dedicatedip} ){/if}</td>
                <td class="text-center" data-order="{$service.amountnum}">{$service.amount}<br />{$service.billingcycle}</td>
                <td class="text-center"><span class="hidden">{$service.normalisedNextDueDate}</span>{$service.nextduedate}</td>
                <td class="text-center"><span class="label status status-{$service.status|strtolower}">{$service.statustext}</span></td>
                <td class="responsive-edit-button" style="display: none;">
                    <a href="clientarea.php?action=productdetails&amp;id={$service.id}" class="btn btn-block btn-info">
                        {$LANG.manageproduct}
                    </a>
                </td>
            </tr>
            {/foreach}
        </tbody>
    </table>
    <div class="text-center" id="tableLoading">
        <p><i class="fas fa-spinner fa-spin"></i> {$LANG.loading}</p>
    </div>
</div>
<script type="text/javascript">

    jQuery(document).ready(function(){
        $('input[name="hideInactiveSercices"]').on('change', function(event) {
            jQuery("#Primary_Sidebar-My_Services_Status_Filter-Active").trigger("click");
            if(jQuery(this).is(":checked")){
                jQuery(".hideServices").addClass("hidden");
                jQuery(".hiddenServices").removeClass("hidden");
            }else{
                jQuery(".hiddenServices").addClass("hidden");
                jQuery(".hideServices").removeClass("hidden");
            }
        });
        if(!jQuery("#Primary_Sidebar-My_Services_Status_Filter-Active").hasClass("active")){
            $('input[name="hideInactiveSercices"]').trigger("click");
        }
 })


</script>
