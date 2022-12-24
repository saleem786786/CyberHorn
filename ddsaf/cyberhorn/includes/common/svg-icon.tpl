{if file_exists("templates/$template/assets/svg-icon/custom/$icon.tpl")}
    {include file="{$template}/assets/svg-icon/custom/$icon.tpl" onDark=$onDark}
{elseif file_exists("templates/$template/assets/svg-icon/$icon.tpl")}
    {include file="{$template}/assets/svg-icon/$icon.tpl" onDark=$onDark}
{/if}
