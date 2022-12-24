<div class="section">
    <div class="section-header">
        <h2 class="section-title">{$LANG.supportticketschoosedepartment}</h2>
    </div>
    <div class="section-body">
        {if $departments}
            <div class="row row-eq-height">
                {foreach from=$departments key=num item=department}
                    <div class="col-md-4">
                        <a href="{$smarty.server.PHP_SELF}?step=2&amp;deptid={$department.id}" class="panel panel-default panel-support panel-department-box">
                            <div class="panel-body">
                                <h5 class="support-title"><i class="lm lm-envelope"></i>{$department.name}</h5>
                                {if $department.description}
                                    <p class="support-desc">{$department.description}</p>
                                {/if}
                            </div>

                            <div class="panel-footer">
                                <span class="btn btn-sm btn-primary-faded btn-block">{$LANG.navopenticket}</span>
                            </div>

                            {* -- End of integration code -- *}
                        </a>
                    </div>
                {/foreach}
            </div>
        {else}
            <div class="message message-no-data">
                <div class="message-image">
                    {include file="$template/includes/common/svg-icon.tpl" icon="ticket"}
                </div>
                <h6 class="message-title">{$LANG.nosupportdepartments}</h6>
            </div>
        {/if}
    </div>
</div>
