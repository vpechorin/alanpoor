<#macro orbit timer_speed=10000 pause_on_start=true>
<#if pagenodeImages??>
<ul id="slidesContainer" data-orbit data-options="timer_speed:${timer_speed?c}; bullets: <#if (pagenodeImages?size > 1)>true<#else>false</#if>;">
    <#list pagenodeImages as img>
    <li><a class="swipebox" href="${appConfig.fileStorageUrl}${img.getAbsolutePath()}"><img src="${appConfig.fileStorageUrl}${img.getAbsolutePath()}" width=656 height=437></a></li>
    </#list>
</ul>
<script>
$(document).load(function() {
    $(document).foundation();
    $(".swipebox").swipebox({hideBarsDelay : 0});
    <#if pause_on_start>
    $("ul.orbit-slides-container").each(function() {
        $(this).siblings('.orbit-timer').click(); //Clicks pause
    });
    </#if>
    <#if (pagenodeImages?size < 2)>
    $("ul.orbit-slides-container").each(function() {
        $(this).siblings("a.orbit-prev, a.orbit-next").hide(); //Hides controls on load
    });
    $(".orbit-slide-number").hide();
    $(".orbit-progress").hide();
    </#if>
});
</script>    
</#if>
</#macro>