{include file="$template/includes/flashmessage.tpl"}
<div class="row " style="">
    <div class="col-lg-3 homeleftpanel">
        <div class="row container-clientarea">
            <div class="col-md-12 col-sm-12 clientarea-new-header">
                <div class="client-avatar">
                    <a href="clientarea.php?action=details" class="badge feat bg-deepblue"  ><i class="ico-edit-3 "></i>
                    </a>
                </div>
                <div class="header-accout-details">
                    <div class="username">{$clientsdetails.firstname} {$clientsdetails.lastname} !</div>
                    <div class="adress">
                        {if $clientsdetails.address1}
                        <em>{$clientsdetails.address1}</em><br>
                        {/if}
                        {if $clientsdetails.address2}
                        <em>{$clientsdetails.address2}</em><br />
                        {/if}
                        {if $clientsdetails.city}
                            <em>{$clientsdetails.city} ,</em>
                        {/if}
                        {if $clientsdetails.state}
                        <em>{$clientsdetails.state},</em>
                        {/if}
                        <em> {$clientsdetails.postcode}</em> <br> <em>{$clientsdetails.countryname}</em></div>
                    </div>
                </div>
                <div class="col-md-12 btnrow1">
                        <a href="clientarea.php?action=addfunds" class="badge feat bg-success" data-toggle="tooltip" data-placement="top" title="" data-original-title="{$clientsstats.creditbalance}"><i class="ico-dollar-sign f-16"></i> </a>

                        <a href="clientarea.php?action=addcontact" class="badge feat bg-prussian-light" data-toggle="tooltip" data-placement="top" title="" data-original-title="{$LANG.clientareanavaddcontact}"><i class="ico-user-plus f-16"></i>
                        </a>
                        <a href="clientarea.php?action=emails" class="badge feat bg-prata" data-toggle="tooltip" data-placement="top" title="" data-original-title="{$LANG.clientareaemails}"><i class="ico-message-circle f-16"></i></a>

                </div>
                <div class="col-md-12  mb-8  btnrow2">
                    <div class="header-features-icons">
                        <a href="clientarea.php?action=details" class="btn btn-default btn-sm ">
                            {$LANG.orderForm.update}</a>
                        <a href="{$WEB_ROOT}/logout.php" class="btn btn-outline btn-sm ml-8">
                           {$LANG.logouttitle}
                       </a>


                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-9  home-banner-panel ">
            <div class="row">
                <div class="col-lg-12 hidden-xs">
                    <div class="shadow1"><img src="{$WEB_ROOT}/templates/{$template}/assets/img/banners/banner2-{$language}.png"  class="img-responsive hidden staticbanner" alt="" style="background:#fff;"></div>
                    <div class="alert alert-success homebanner p-0 mb-30 shadow1">
                        <img src="{$WEB_ROOT}/templates/{$template}/assets/img/banners/banner1-{$language}.png"  class="img-responsive" width="1400" alt="">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                </div>
            </div>

            <div class="area-discreted-info-user ">
                <div class="row">
                    <div class="col-md-3">
                        <a class="tile content-serv" href="clientarea.php?action=services">
                            <div class="tile-icon-absolute"><i class="ico-settings  p-5 br-50 "></i></div>
                            <div class="tile-stat">{$clientsstats.productsnumactive}</div>
                            <div class="tile-title">{$LANG.navservices}</div>
                        </a>
                       {*  <a href="clientarea.php?action=services" class="tile">
                            <div class="content-serv">
                                <div class="icon">
                                    <i class="ico-settings  p-5 br-50 "></i>
                                </div>
                                <div class="number">{$clientsstats.productsnumactive}</div>
                                <div class="title"> {$LANG.navservices}</div>
                            </div>
                        </a> *}
                    </div>
                    <div class="col-md-3">
                        {if $clientsstats.numdomains || $registerdomainenabled || $transferdomainenabled}
                        <a class="tile content-serv" href="clientarea.php?action=domains">
                            <div class="tile-icon-absolute"><i class="ico-globe  p-5 br-50 "></i></div>
                            <div class="tile-stat">{$clientsstats.numactivedomains}</div>
                            <div class="tile-title">{$LANG.navdomains}</div>
                        </a>
                        {elseif $condlinks.affiliates && $clientsstats.isAffiliate}
                        <a class="tile content-serv" href="clientarea.php?action=services">
                            <div class="tile-icon-absolute"><i class="ico-domains  p-5 br-50 "></i></div>
                            <div class="tile-stat">{$clientsstats.numaffiliatesignups}</div>
                            <div class="tile-title">{$LANG.affiliatessignups}</div>
                        </a>
                        {/if}

                    </div>
                    <div class="col-md-3">
                        <a class="tile content-serv" href="clientarea.php?action=invoices">
                            <div class="tile-icon-absolute"><i class="ico-file-text  p-5 br-50 text-danger"></i></div>
                            <div class="tile-stat text-danger">{$clientsstats.numunpaidinvoices}</div>
                            <div class="tile-title">{$LANG.navinvoices}</div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a class="tile content-serv" href="supporttickets.php">
                            <div class="tile-icon-absolute"><i class="ico-mail  p-5 br-50 "></i></div>
                            <div class="tile-stat">{$clientsstats.numactivetickets}</div>
                            <div class="tile-title">{$LANG.navtickets}</div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="row">
        {foreach key=num item=invoice from=$invoices}
        <div class="col-md-6">
            <div class="invoices-elements-tringo">
                <div class="invoice-elements-header">
                    <span data-toggle="tooltip" data-placement="left" title="{$LANG.invoicestitle}" class="number">{$invoice.invoicenum}</span>
                    <span data-toggle="tooltip" data-placement="top" title="{$LANG.invoicesdatecreated}" class="time">{$invoice.datecreated}</span>
                    <span data-toggle="tooltip" data-placement="top" title="{$LANG.invoicesdatedue}" class="time-end">{$invoice.datedue}</span>
                </div>

                <div class="invoice-elements-footer">
                    <span class="total" data-order="{$invoice.totalnum}"><span>{$LANG.ordertotalduetoday}</span> <b>{$invoice.total}</b></span>

                    <span class="invoice-elements-btns">
                        <a href="viewinvoice.php?id={$invoice.id}" class="invoice-pay-button status-{$invoice.statusClass}">{$invoice.status}</a>
                        <a href="viewinvoice.php?id={$invoice.id}" class="invoice-pay-button-now">pay now</a>
                    </span>
                </div>
            </div>
        </div>
        {/foreach}
    </div>
    {foreach from=$addons_html item=addon_html}
    <div>
        {$addon_html}
    </div>
    {/foreach}
    <div class="client-home-panels">
        <div class="row">

            <div class="col-sm-6">
                {function name=outputHomePanels}
                <div menuItemName="{$item->getName()}" class="panel panel-default panel-accent-{$item->getExtra('color')} {if $item->getName() == "Affiliate Program"}panel-affilaite-program panel-info{elseif $item->getName() == "Register a New Domain"}panel-domain-register{elseif $item->getName() == "Recent Support Tickets"}panel-support-tickets{elseif $item->getName() == "Active Products/Services"}panel-active-services{/if}  {if $item->getClass()} {$item->getClass()}{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>

                    <div class="panel-heading">
                        <h3 class="panel-title">
                            {if $item->getExtra('btn-link') && $item->getExtra('btn-text')}
                            <a href="{$item->getExtra('btn-link')}" class="badge feat bg-puretheme mr-30 mt-5" data-toggle="tooltip" data-placement="left" title="" data-original-title="{$item->getExtra('btn-text')}"><i class="ico-link-2 f-16"></i> </a>
                            {/if}
                            {$item->getLabel()}
                            {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                        </h3>
                    </div>
                    {if $item->hasBodyHtml()}
                    <div class="panel-body">
                        {$item->getBodyHtml()}
                    </div>
                    {/if}
                    {if $item->hasChildren()}
                    <div class="list-group{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}">

                        {foreach $item->getChildren() as $childItem}
                        {if $childItem->getUri()}

                        <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="list-group-item{if $childItem->getClass()} {$childItem->getClass()}{/if} {if $childItem->isCurrent()} active{/if}"{if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} id="{$childItem->getId()}">
                            {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                            {$childItem->getLabel()}
                            {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                        </a>
                        {else}
                        <div menuItemName="{$childItem->getName()}" class="list-group-item{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                            {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                            {$childItem->getLabel()}
                            {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                        </div>
                        {/if}
                        {/foreach}
                    </div>
                    {/if}
                </div>
                {/function}
                {foreach $panels as $item}
                {if $item@iteration is odd}
                {outputHomePanels}
                {/if}
                {/foreach}
            </div>
            <div class="col-sm-6">
                {foreach $panels as $item}
                {if $item@iteration is even}
                {outputHomePanels}
                {/if}
                {/foreach}
            </div>
        </div>
    </div>

{literal}
<script>

    var ro = new ResizeObserver(entries => {
        if(jQuery("body").outerWidth()>500){
            for (let entry of entries) {
                const cr = entry.contentRect;
                if(!jQuery(".navbar").hasClass("navbar-collapsed")){
                    jQuery("#main-body").addClass("navbar-open");
                }else{
                    jQuery("#main-body").removeClass("navbar-open");
                }
                jQuery(".content-serv").css("height",jQuery(".content-serv").innerWidth());
                if(jQuery(".homebanner").length){
                    // jQuery(".container-clientarea").css("height",jQuery(".homebanner").outerHeight());
                }else{
                    // jQuery(".container-clientarea").css("height",(jQuery(".staticbanner").outerHeight()+jQuery(".area-discreted-info-user").outerHeight()));
                }

            }
        }
    });

// Observe one or multiple elements
ro.observe(document.querySelector('.homeleftpanel'));
    var observer = new MutationObserver(function(mutations) {
    mutations.forEach(function(mutation) {
        var attributeValue = $(mutation.target).prop(mutation.attributeName);
        jQuery(".content-serv").css("height",jQuery(".content-serv").innerWidth());
        console.log("asdsadasd");
    });
});
// var $div=jQuery("nav.navbar")
// observer.observe($div[0], {
//   attributes: true,
//   attributeFilter: ['class']
// });

    jQuery(document).ready(function(){
        if(jQuery("body").outerWidth()>500){

            if(jQuery(".homebanner").length){
                // jQuery(".container-clientarea").css("height",jQuery(".homebanner").outerHeight());
            }else{
                // jQuery(".container-clientarea").css("height",(jQuery(".staticbanner").outerHeight()+jQuery(".area-discreted-info-user").outerHeight()));
            }
            jQuery(".content-serv").css("height",jQuery(".content-serv").innerWidth());
            // jQuery(".container-clientarea").css("height",jQuery(".homebanner").outerHeight());
            jQuery('.homebanner').on('closed.bs.alert', function () {
                jQuery(".staticbanner").removeClass("hidden");
                jQuery("#main-body").addClass("banner-closed")
                jQuery(".area-discreted-info-user").addClass("mt-30");
                // jQuery(".container-clientarea").css("height",(jQuery(".staticbanner").outerHeight()+jQuery(".area-discreted-info-user").outerHeight()));
            });
        }

    });

</script>
{/literal}
