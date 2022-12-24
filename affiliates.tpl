{if $inactive}
{include file="$template/includes/alert.tpl" type="danger" msg=$LANG.affiliatesdisabled textcenter=true}
{else}
<style>
    .affiliate-referral-link{
        position: relative;
    }
    .copied {
      font-family: 'Roboto', sans-serif;
      width: 120px;
      display: none;
      position:absolute;
      top: -35px;
      right: 1px;
      margin: auto;
      color:#000;
      padding: 6px 6px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 3px 15px #b8c6db;
      -moz-box-shadow: 0 3px 15px #b8c6db;
      -webkit-box-shadow: 0 3px 15px #b8c6db;
  }
  .affiliate-referral-link span{
    font-size: 1rem;
  }
  .copy-btn {
      width:32px;
      background-color: #eaeaeb;
      font-size: 15px;
      padding: 6px 5px;
      border-radius: 3px;
      border:none;
      color:#6c6c6c;
      margin-left:-38px;
      transition: all .4s;
      position: absolute;
      z-index: 3;
      top: 10px;
  }
  .copy-btn:hover {
      transform: scale(1.3);
      color:#1a1a1a;
      cursor:pointer;
  }

  .copy-btn:focus {
      outline:none;
  }
  #copyClipboard:focus{
    border-color: transparent;
  }

</style>

    <div class="row mb-20">
        <div class="col-lg-3">
            <img src="{$WEB_ROOT}/templates/{$template}/assets/img/banners/affiliate-banner-{$language}.png"  class="img-responsive" alt="" style="background:#fff;">
        </div>
        <div class="col-lg-9">
            <div class="row">

                <div class="col-xs-12 col-sm-4 col-md-4">
                    <div class="tile content-serv" >
                        <div class="tile-icon-absolute"><i class="ico-globel  p-5 br-50 "></i></div>
                        <div class="tile-stat">{$visitors}</div>
                        <div class="tile-title">{$LANG.affiliatesclicks}</div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-4 ">
                    <div class="tile content-serv" >
                        <div class="tile-icon-absolute"><i class="ico-user-plus  p-5 br-50 "></i></div>
                        <div class="tile-stat">{$signups}</div>
                        <div class="tile-title">{$LANG.affiliatessignups}</div>
                    </div>

                </div>

                <div class="col-xs-12 col-sm-4 col-md-4 ">
                    <div class="tile content-serv" >
                        <div class="tile-icon-absolute"><i class="ico-pie-chart  p-5 br-50 "></i></div>
                        <div class="tile-stat">{$conversionrate}</div>
                        <div class="tile-title">{$LANG.affiliatesconversionrate}</div>
                    </div>
                </div>
            </div>
            <div class="row mt-20 mb-20">
                <div class="col-md-12 ">
                    <div class="affiliate-link">
                        <div class="affiliate-referral-link">
                            <div class="input-group input-group-lg flex-column-sm">
                                <div class="input-group-addon">{$LANG.affiliatesreferallink}</div>
                                <input class="form-control m-0" type="text" readonly="" id="copyClipboard"  value="{$referrallink}">
                                <button class="copy-btn" id="copyButton" onclick="copy()"><i class="ico-copy"></i></button>

                            </div>
                            <div id="copied-success" class="copied">
                              <span>Copied !</span>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>

  </div>

  <div class="row">
    <div class="col-md-12 table-responsive">
        <table class="table table-striped table-rounded">
            <tr>
                <td>{$LANG.affiliatescommissionspending}:</td>
                <td><strong>{$pendingcommissions}</strong></td>
            </tr>
            <tr>
                <td>{$LANG.affiliatescommissionsavailable}:</td>
                <td><strong>{$balance}</strong></td>
            </tr>
            <tr>
                <td>{$LANG.affiliateswithdrawn}:</td>
                <td><strong>{$withdrawn}</strong></td>
            </tr>
        </table>
    </div>
</div>
<div class="row">
    <div class="col-lg-12 withdrawal-body">

        {if $withdrawrequestsent}
        <div class="alert alert-success">
            <p>{$LANG.affiliateswithdrawalrequestsuccessful}</p>
        </div>
        {else}
        <p>
            <a href="{$smarty.server.PHP_SELF}?action=withdrawrequest" class="btn btn-lg btn-danger{if !$withdrawlevel}disabled" disabled="disabled{/if}">
                <i class="fas fa-university"></i> {$LANG.affiliatesrequestwithdrawal}
            </a>
        </p>
        {if !$withdrawlevel}
        <p class="text-muted mb-50">{lang key="affiliateWithdrawalSummary" amountForWithdrawal=$affiliatePayoutMinimum}</p>
        {/if}
        {/if}

    </div>
</div>
<div class="row">
    <div class="col-lg-12 withdrawal-body">
        {include file="$template/includes/subheader.tpl" title=$LANG.affiliatesreferals}

        {include file="$template/includes/tablelist.tpl" tableName="AffiliatesList"}
        <script type="text/javascript">
            jQuery(document).ready( function ()
            {
                var table = jQuery('#tableAffiliatesList').removeClass('hidden').DataTable();
                {if $orderby == 'regdate'}
                table.order(0, '{$sort}');
                {elseif $orderby == 'product'}
                table.order(1, '{$sort}');
                {elseif $orderby == 'amount'}
                table.order(2, '{$sort}');
                {elseif $orderby == 'status'}
                table.order(4, '{$sort}');
                {/if}
                table.draw();
                jQuery('#tableLoading').addClass('hidden');
            });
        </script>
        <div class="table-container clearfix">
            <table id="tableAffiliatesList" class="table table-list hidden">
                <thead>
                    <tr>
                        <th>{$LANG.affiliatessignupdate}</th>
                        <th>{$LANG.orderproduct}</th>
                        <th>{$LANG.affiliatesamount}</th>
                        <th>{$LANG.affiliatescommission}</th>
                        <th>{$LANG.affiliatesstatus}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$referrals item=referral}
                    <tr class="text-center">
                        <td><span class="hidden">{$referral.datets}</span>{$referral.date}</td>
                        <td>{$referral.service}</td>
                        <td data-order="{$referral.amountnum}">{$referral.amountdesc}</td>
                        <td data-order="{$referral.commissionnum}">{$referral.commission}</td>
                        <td><span class='label status status-{$referral.rawstatus|strtolower}'>{$referral.status}</span></td>
                    </tr>
                    {/foreach}
                </tbody>
            </table>
            <div class="text-center" id="tableLoading">
                <p><i class="fas fa-spinner fa-spin"></i> {$LANG.loading}</p>
            </div>
        </div>

        {if $affiliatelinkscode}
        {include file="$template/includes/subheader.tpl" title=$LANG.affiliateslinktous}
        <div class="margin-bottom text-center">
            {$affiliatelinkscode}
        </div>
        {/if}
    </div>
</div>

{/if}
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
            // jQuery(".content-serv").css("height",jQuery(".content-serv").outerWidth());


        }
    }
});

// Observe one or multiple elements
ro.observe(document.querySelector('#main-body'));
var observer = new MutationObserver(function(mutations) {
    mutations.forEach(function(mutation) {
        var attributeValue = $(mutation.target).prop(mutation.attributeName);
        // jQuery(".content-serv").css("height",jQuery(".content-serv").outerWidth());
    });
});
jQuery(document).ready(function(){
    // jQuery(".content-serv").css("height",jQuery(".content-serv").outerWidth());

});
function copy() {
  var copyText = document.getElementById("copyClipboard");
  copyText.select();
  copyText.setSelectionRange(0, 99999);
  document.execCommand("copy");

  $('#copied-success').fadeIn(800);
  $('#copied-success').fadeOut(800);
}


</script>



