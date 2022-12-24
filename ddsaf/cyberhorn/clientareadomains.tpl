{if $warnings}
    {include file="$template/includes/alert.tpl" type="warning" msg=$warnings textcenter=true}
{/if}
<div class="tab-content">
    <div class="tab-pane fade in active" id="tabOverview">




        {include file="$template/includes/tablelist.tpl" tableName="DomainsList" noSortColumns="0, 1, 6" startOrderCol="2" filterColumn="6"}
        <script type="text/javascript">
            jQuery(document).ready( function ()
            {
                var table = jQuery('#tableDomainsList').removeClass('hidden').DataTable();
                {if $orderby == 'domain'}
                    table.order(2, '{$sort}');
                {elseif $orderby == 'regdate' || $orderby == 'registrationdate'}
                    table.order(3, '{$sort}');
                {elseif $orderby == 'nextduedate'}
                    table.order(4, '{$sort}');
                {elseif $orderby == 'autorenew'}
                    table.order(5, '{$sort}');
                {elseif $orderby == 'status'}
                    table.order(6, '{$sort}');
                {/if}
                table.draw();
                jQuery('#tableLoading').addClass('hidden');
            });
        </script>

        <form id="domainForm" method="post" action="clientarea.php?action=bulkdomain">
            <input id="bulkaction" name="update" type="hidden" />
            <div class="table-container clearfix">
                <div class="table-top">
                        <label class="d-flex" data-inactive-domains="">
                        <span class="hideServices hidden" data-inactive-domains-text="hide">{$LANG.hide} <b>{math equation="y - x" x=$clientsstats['numactivedomains'] y=$clientsstats['numdomains']}</b> {$LANG.inactive} {$LANG.domains}</span>
                        <span data-inactive-domains-text="hidden" class="hiddenServices "><b>{math equation="y - x" x=$clientsstats['numactivedomains'] y=$clientsstats['numdomains']}</b> {$LANG.inactive} {$LANG.domains} {$LANG.hasbeenhidden}</span>
                        <div class="switch switch--sm ml-5">
                            <input class="switch__checkbox" type="checkbox" name="hideInactiveDomains" value="1" data-inactive-domains-checkbox="" checked>
                            <span class="switch__container"><span class="switch__handle"></span></span>
                        </div>
                    </label>

                </div>
                <style>
                .dropdown-btn-custom{
                
                display: inline;
                cursor:pointer;
                }
                .list-content-cu{
                 display:none;
                }
                .dropdown-menu-cu {
               
                    list-style: none;
                     background-color: white;
                    box-shadow: 0 1px 10px 0 rgb(69 90 100 / 20%);
                    position: absolute;
                    z-index: 100;
                   color: black;
                    padding: 25px 30px;
                    border-radius: 12px;
                    font-family: Roboto;
                }
                
                .dropdown-menu-cu > li {
                    font-weight: 500;
                    border: 0;
                    font-size: 12px;
                    padding: 8px 0px;
                    border-radius: 50px;
                    color: #6c757d;
                    background-color: transparent;
                }

 .dropdown-menu-cu .setBulkAction {
                display: flex!important;
                    align-items: center;
                    padding: 5px;
                    clear: both;
                    font-weight: 400;
                    line-height: var(--line-height-base);
                    color: var(--dropdown-link-color) ;
                    white-space: nowrap;
                }

                     .dropdown-menu-cu .setBulkAction:hover {
                         color: var(--link-color);
                         
                     }

                    .dropdown-menu-cu >li>a i {
                    font-size: 15px;
                    display: -webkit-inline-box;
                    display: -ms-inline-flexbox;
                    display: inline-flex;
                    -webkit-box-align: center;
                    -ms-flex-align: center;
                    align-items: center;
                    -webkit-box-pack: center;
                    -ms-flex-pack: center;
                    justify-content: center;
                    margin-right: 10px;
                    }

                  .hebrew  .dropdown-menu-cu >li>a i {
                    font-size: 15px;
                    display: -webkit-inline-box;
                    display: -ms-inline-flexbox;
                    display: inline-flex;
                    -webkit-box-align: center;
                    -ms-flex-align: center;
                    align-items: center;
                    -webkit-box-pack: center;
                    -ms-flex-pack: center;
                    justify-content: center;
                    margin-left: 10px;
                    }

                </style>
                <table id="tableDomainsList" class="table table-list hidden">
                    <thead>
                        <tr>
                            <th>
                            <div id="bulkact" style="display:none"><div class="badge badge-circle-lg badge-primary" id="domainSelectedCounter">1</div> 
                            <div class="dropdown-btn-custom"><span>Bulk Action&#9660;</span>
                            <div class="list-content-cu">
                            <ul class="dropdown-menu-cu" >
                                <li><a href="#" id="nameservers" class="setBulkAction"><i class="ico-globel"></i> {$LANG.domainmanagens}</a></li>
                                <li><a href="#" id="autorenew" class="setBulkAction"><i class="ico-repeat"></i> {$LANG.domainautorenewstatus}</a></li>
                                <li><a href="#" id="reglock" class="setBulkAction"><i class="ico-unlock"></i> {$LANG.domainreglockstatus}</a></li>
                                <li><a href="#" id="contactinfo" class="setBulkAction"><i class="ico-user"></i> {$LANG.domaincontactinfoedit}</a></li>
                                {if $allowrenew}
                                    <li><a href="#" id="renewDomains" class="setBulkAction"><i class="ico-refresh-cw"></i> {lang key='domainmassrenew'}</a></li>
                                {/if}
                            </ul>
                            </div>
                            </div>
                            </div>
                            </th>
                            <th></th>
                            <th>{$LANG.orderdomain}</th>
                            <th>{$LANG.regdate}</th>
                            <th>{$LANG.nextdue}</th>
                            <th>{$LANG.domainsautorenew}</th>
                            <th>{$LANG.domainstatus}</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    {foreach key=num item=domain from=$domains}
                        <tr onclick="clickableSafeRedirect(event, 'clientarea.php?action=domaindetails&amp;id={$domain.id}', false)">
                            <td>
                                <input type="checkbox" name="domids[]" class="domids stopEventBubble" value="{$domain.id}" />
                            </td>
                            <td class="text-center ssl-info" data-element-id="{$domain.id}" data-type="domain" data-domain="{$domain.domain}">
                                {if $domain.sslStatus}
                                    <img src="{$domain.sslStatus->getImagePath()}" data-toggle="tooltip" title="{$domain.sslStatus->getTooltipContent()}" class="{$domain.sslStatus->getClass()}"/>
                                {elseif !$domain.isActive}
                                    <img src="{$BASE_PATH_IMG}/ssl/ssl-inactive-domain.png" data-toggle="tooltip" title="{lang key='sslState.sslInactiveDomain'}">
                                {/if}
                            </td>
                            <td><a href="http://{$domain.domain}" target="_blank">{$domain.domain}</a></td>
                            <td><span class="hidden">{$domain.normalisedRegistrationDate}</span>{$domain.registrationdate}</td>
                            <td><span class="hidden">{$domain.normalisedNextDueDate}</span>{$domain.nextduedate}</td>
                            <td>
                                {if $domain.autorenew}
                                    <i class="fas fa-fw fa-check text-success"></i> {$LANG.domainsautorenewenabled}
                                {else}
                                    <i class="fas fa-fw fa-times text-danger"></i> {$LANG.domainsautorenewdisabled}
                                {/if}
                            </td>
                            <td>
                                <span class="label status status-{$domain.statusClass}">{$domain.statustext}</span>
                                <span class="hidden">
                                    {if $domain.expiringSoon}<span>{lang key="domainsExpiringSoon"}</span>{/if}
                                </span>
                            </td>
                            <td>
                                <div class="btn-group btn-group-sm" style="width:60px;">
                                    <a href="clientarea.php?action=domaindetails&id={$domain.id}" class="btn btn-default"><i class="fas fa-wrench"></i></a>
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                        <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    
                                </div>
                            </td>
                        </tr>
                    {/foreach}
                    </tbody>
                </table>
                <div class="text-center" id="tableLoading">
                    <p><i class="fas fa-spinner fa-spin"></i> {$LANG.loading}</p>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">

    jQuery(document).ready(function(){
        $('input[name="hideInactiveDomains"]').on('change', function(event) {
            jQuery("#Primary_Sidebar-My_Domains_Status_Filter-clientareaactive").trigger("click");
            if(jQuery(this).is(":checked")){
                jQuery(".hideServices").addClass("hidden");
                jQuery(".hiddenServices").removeClass("hidden");
            }else{
                jQuery(".hiddenServices").addClass("hidden");
                jQuery(".hideServices").removeClass("hidden");
            }
        });
        if(!jQuery("#Primary_Sidebar-My_Domains_Status_Filter-clientareaactive").hasClass("active")){
            $('input[name="hideInactiveDomains"]').trigger("click");
        }
 })


</script>
