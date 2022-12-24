{if $emailVerificationIdValid}
	<div class="homepagewhmc-alert-fixed alert alert-success alert-dismissible" role="alert" wow fadeOutUp" data-wow-delay="12s">
  	{$LANG.emailAddressVerified}.
 	<button type="button" class="close set-close" data-dismiss="alert" aria-label="Close">
 	<span class="ico-plus" aria-hidden="true"></span>
 	</button>
	</div>
{elseif $emailVerificationIdValid === false}
	<div class="homepagewhmc-alert-fixed alert alert alert-warning alert-dismissible" role="alert" wow fadeOutUp" data-wow-delay="12s">
  	{$LANG.emailKeyExpired}.<button id="btnResendVerificationEmail" class="btn set-warning active">{$LANG.resendEmail}</button>
 	<button type="button" class="close set-close" data-dismiss="alert" aria-label="Close">
 	<span class="ico-plus" aria-hidden="true"></span>
 	</button>
	</div>
{elseif $emailVerificationPending && !$showingLoginPage}
	<div class="homepagewhmc-alert-fixed alert alert-warning alert-dismissible"role="alert wow fadeOutUp" data-wow-delay="12s">
  	{$LANG.verifyEmailAddress}.<button id="btnResendVerificationEmail" class="btn set-warning active">{$LANG.resendEmail}</button>
 	<button type="button" class="close set-close" data-dismiss="alert" aria-label="Close">
 	<span class="ico-plus" aria-hidden="true"></span>
 	</button>
	</div>
{/if}
