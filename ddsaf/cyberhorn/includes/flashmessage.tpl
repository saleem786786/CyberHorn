{if $message = get_flash_message()}
    <div class="alert alert-sm alert-{if $message.type == "error"}danger{elseif $message.type == 'success'}success{elseif $message.type == 'warning'}warning{else}info{/if}{if isset($align)} text-{$align}{/if} m-t-3x">
        {$message.text}
    </div>
{/if}
