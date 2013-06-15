<#macro sideNavMenu pagetree currentPageId=0 pageedit="">
    <#if pagetree??>
        <ul class="side-nav">
            <li <#if (pageName == "home")> class="active"</#if>><a  href="${appConfig.appPath}/">Home</a></li>
            <#list pagetree.findPageNode("home").children as el>
            <li <#if (el.data.id == currentPageId)> class="active"</#if>><a  href="${appConfig.appPath}/pv/${el.data.name}">${el.data.title}</a></li>
            </#list>
            <li><a  href="${appConfig.appPath}/do/index">Site map</a></li>
            <@security.authorize access="isAuthenticated()">
            <@security.authentication property="principal.user.name" var="principalName" scope="page" />
            <li class="divider"></li>
            <@security.authorize ifAnyGranted="ROLE_ADMIN,ROLE_EDITOR">
            <#if pageedit?has_content><li><a href="${pageedit}">Edit this page</a></li></#if>
            <li><a href="${appConfig.appPath}/page/tree">Index</a></li>
            </@security.authorize>
            <@security.authorize ifAnyGranted="ROLE_ADMIN">
            <li><a href="${appConfig.appPath}/user/control">User accounts</a></li>
            </@security.authorize>
            <li><a href="${appConfig.appPath}/profile/edit">Profile</a></li>
            <li><a href="${appConfig.appPath}/do/signoff">Sign Out</a></li>
            </@security.authorize>
        </ul>
    </#if>
</#macro>