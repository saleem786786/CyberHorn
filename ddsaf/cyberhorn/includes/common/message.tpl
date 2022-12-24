<div class="message {if $type}message-{$type}{/if}{if $customClass} {$customClass}{/if}">
        <div class="message-body">
            {if $img}
                <div class="message-image">
                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/icons/{$img}.svg" alt="no data">
                </div>
            {else}
                <div class="message-icon">
                    {if $type == "success"}
                        <i class="fa fa-check"></i>
                    {elseif $type == "danger"}
                        <i class="fa fa-times"></i>
                    {else}
                        <i class="fa fa-info-text"></i>
                    {/if}
                </div>
            {/if}
            {if $type == "no-data"}
                <h6 class="message-title">{$msg}</h6>
            {else}
                <h3 class="message-title">{$msg}</h3>
            {/if}
            {if $desc}
                <p class="message-desc">{$desc}</p>
            {/if}
        </div>
    </div>
