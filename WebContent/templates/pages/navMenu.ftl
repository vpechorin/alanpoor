<#macro navMenu pagetree menuId="navMenu">
        <ul id="${menuId}">
            <li><a  href="${appConfig.appPath}/">Home</a></li>
            <#list pagetree.findPageNode("home").children as el>
            <li><a  href="${appConfig.appPath}/pv/${el.data.name}">${el.data.title}</a>
                <#if el.hasChildren()><@navSubMenu thisBranch=el/></#if>
            </li>
            </#list>
            <li><a  href="${appConfig.appPath}/do/index">Site map</a></li>
        </ul>
<script>
        $( "#${menuId}" ).menu();
</script>    
<div class="ui-helper-clearfix"></div>     
</#macro>
<#macro navSubMenu thisBranch>
        <ul>
        <#list thisBranch.children as el>
            <li><a  href="${appConfig.appPath}/pv/${el.data.name}">${el.data.title}</a>
                <#if el.hasChildren()><@navSubMenu thisBranch=el/></#if>
            </li>
         </#list>
        </ul>
</#macro>