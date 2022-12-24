<div class="alert {if $type eq "error"}alert-danger{elseif $type != "success"}alert-{$type}{else}info{/if}{if $textcenter} text-center{/if}{if $hide} hidden{/if}{if $additionalClasses} {$additionalClasses}{/if}"{if $idname} id="{$idname}"{/if} {if $type == "success"}style="background-color: #c1ffbf;"{/if}>
{if $errorshtml}
    <strong>{$LANG.clientareaerrors}</strong>
    <ul>
        {$errorshtml}
    </ul>
{else}
    {if $title}
        <h2>{$title}</h2>
    {/if}
    {$msg}
{/if}
</div>
