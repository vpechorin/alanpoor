<@security.authorize access="isAuthenticated()">
<@security.authentication property="principal.user.name" var="principalName" scope="page" />

<div id="admMenu">
<ul class="side-nav">
    <li>Edit site</li>
    <li><a href="${appConfig.appPath}/profile/edit">Profile</a></li>
    <@security.authorize ifAnyGranted="ROLE_ADMIN,ROLE_EDITOR">
    <#if opts.pageedit??><li><a href="${opts.pageedit}">Edit this page</a></li></#if>
    <li><a href="${appConfig.appPath}/page/tree">Index</a></li>
    </@security.authorize>
    <@security.authorize ifAnyGranted="ROLE_ADMIN">
    <li><a href="${appConfig.appPath}/user/control">User accounts</a></li>
    </@security.authorize>
    <li><a href="${appConfig.appPath}/do/signoff">Sign Out</a></li>
</ul>
</div>
</@security.authorize>
