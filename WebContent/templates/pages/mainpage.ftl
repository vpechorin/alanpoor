<#macro page title="" css=[] js=[] other=[] opts...>
<#import "/spring.ftl" as spring/>
<#import "/lib/cmslib.ftl" as cmslib/>
<#include "/pages/sideNavMenu.ftl"/>
<#include "/pages/pagenav.ftl"/>
<#include "/lib/dropdownSubmenu.ftl"/>
<#include "/lib/gallery.ftl"/>
<#include "/lib/orbit.ftl"/>
<#include "/lib/subpageIndex.ftl"/>
<#include "/lib/breadcrumbs.ftl"/>
<#include "/lib/pagegrid.ftl"/>
<#include "/lib/hpagegrid.ftl"/>
<#include "/lib/projects.ftl"/>
<#include "/lib/projectsItem.ftl"/>
<#include "/lib/ogMeta.ftl"/>
<#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />
<!DOCTYPE html>
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
<#if txt??><#else><#if homePage??><#assign txt=homePage></#if></#if>
<#if pageName??><#else><#assign pageName="genericpage"></#if>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <meta name="generator" content="${appConfig["application.name"]} ${appConfig["application.build"]}" />
    <title>${title}</title>
    <link rel="shortcut icon" href="${appConfig.appPath}/img/favicon.ico" type="image/x-icon">    
    <#if opts.canonical??><link rel="canonical" href="${opts.canonical}"></#if>
    <#if opts.metaDescription??><meta name="description" content="${opts.metaDescription?html}"></#if>
    <#if opts.metaKeywords??><meta name="keywords" content="${opts.metaKeywords?html}"></#if>
    <#if opts.ogproperties??><@ogMeta ogproperties=opts.ogproperties /></#if>
 
    <link href="${appConfig.appPath}/resources/libs/foundation/css/normalize.css" rel="stylesheet">
    <link href="${appConfig.appPath}/resources/libs/foundation/css/foundation.css" rel="stylesheet">
    <link href="${appConfig.appPath}/resources/libs/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${appConfig.appPath}/resources/libs/swipebox/swipebox.css">
    <link rel="stylesheet" type="text/css" href="${appConfig.appPath}/resources/css/main.css">
    <#if appConfig.lessCompiler == "on">
    <link rel="stylesheet/less" type="text/css" href="${appConfig.appPath}/less/local.less">
    <#else>
    <link rel="stylesheet" type="text/css" href="${appConfig.appPath}/css/local.css">
    </#if>
        
    <#list css as file>   		
    	<style type="text/css" media="all">@import ${path}${file};</style>
    </#list>
    <script src="${appConfig.appPath}/resources/libs/jquery/jquery-1.11.0.min.js"></script>
    <script src="${appConfig.appPath}/resources/libs/foundation/js/vendor/custom.modernizr.js"></script>
    <script src="${appConfig.appPath}/resources/libs/foundation/js/foundation.min.js"></script>
    <script src="${appConfig.appPath}/resources/libs/swipebox/jquery.swipebox.min.js"></script>

    
    <#if appConfig.lessCompiler == "on">
    <script type="text/javascript">
        less = {
            env: "development", // or "production"
            async: false,       // load imports async
            fileAsync: false,   // load imports async when in a page under
                                // a file protocol
            poll: 1000,         // when in watch mode, time in ms between polls
            functions: {},      // user functions, keyed by name
            dumpLineNumbers: "comments", // or "mediaQuery" or "all"
            relativeUrls: false,// whether to adjust url's to be relative
                                // if false, url's are already relative to the
                                // entry less file
            rootpath: ":/unknown/"// a path to add on to the start of every url resource
        };
    </script>
    <script src="${appConfig.appPath}/resources/libs/less/less-1.3.3.min.js"></script>
    </#if>
    <script type="text/javascript">
    	$(document).ready(function() {
    		var h = $("#mainContainer").innerHeight();
    		if (h < 952) h = 952;
    		$("#mainContent").height(h);
    		$("#navCol").height(h);
		});
	</script>
    <@cmslib.insertPageElement thePage=txt peKey="html-header"/>
</head>

<body>
    <@cmslib.insertPageElement thePage=txt peKey="html-body-start"/>
    <div class="row" id=mainContainer>
        <div class="small-3 large-3 columns" id=navCol>
            <#if pageName == "home">
                <div class="logoContainerHome">
                    <@cmslib.insertPageElement thePage=txt peKey="logoContentHome"/>
                </div>
            <#else>
                <div class="logoContainer">
                    <@cmslib.insertPageElement thePage=txt peKey="logoContent"/>
                </div>
            </#if>
             
             <#if pageName == "home">
             <@cmslib.insertPageElement thePage=txt peKey="social-container"/>
             </#if>
             <#assign currentPageId=0><#if txt??><#assign currentPageId = txt.id></#if>
             <#assign pageEd=""><#if opts.pageedit??><#assign pageEd=opts.pageedit></#if>
             <@sideNavMenu pagetree=pageTree currentPageId = currentPageId pageedit=pageEd/>

        </div>
        <div class="small-9 large-9 columns" id=mainContent>
            <#nested>
        </div>
    </div>
    
    <div class="row"  id=footerContainer>
        <div class="small-12 large-12 columns">
            <div class="row"  id="footerContent">
                <div class="small-3 large-3 columns" id="footerContentLeft">
                        <@security.authorize access="isAnonymous()"><a href="${appConfig.appPath}/do/signon"><i class="icon-key"></i>  Login</a></@security.authorize>
                        <@security.authorize access="isAuthenticated()">
                        <@security.authentication property="principal.user.name" var="principalName" scope="page" />
                        <i>${principalName}</i>
                        </@security.authorize>
                </div>
                <div class="small-6 large-6 columns" id="footerContentCenter"><@cmslib.insertPageElement thePage=txt peKey="footer"/></div>
                <div class="small-3 large-3 columns" id="footerContentRight"><span title="${appConfig["application.build"]}" class="poweredBy"><a href="https://github.com/vpechorin/kontempl">Powered by Kontempl</a></span></div>
            </div>
        </div>
    </div>

</body>
</html>
</#macro>


