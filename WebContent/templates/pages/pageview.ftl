<#include "/pages/mainpage.ftl"/>
<#import "/spring.ftl" as spring />
<#import "/lib/cmslib.ftl" as cmslib/>
<#assign canonical = "http://${appConfig.domainname}${appConfig.appPath}/pv/${txt.name}">
<#assign pageTitle=txt.title!"">
<#if txt.name == "home">
<#assign pageTitle=cmslib.getPageElementContent(txt, "sitename")>
<#assign canonical = "http://${appConfig.domainname}${appConfig.appPath}">
<#else>
<#assign pageTitle=pageTitle?xhtml + " - " + cmslib.getPageElementContent(txt, "sitename")>
</#if>
<#assign metaDesc=txt.getTextDescription(300)!"">
<#assign metaKeyw=txt.tags!"">
<@page
    title = pageTitle
    metaDescription = metaDesc?xhtml
    metaKeywords = metaKeyw?xhtml
    selectedPage = txt
    canonical = canonical
    pageedit = appConfig.appPath + "/page/" + txt.id?c + "/edit"
    ogproperties = ogproperties
>
<@breadcrumbs />

<#if (txt.hideTitle == false) && !(isError??)><#if txt??><#if txt.title??><div class=pageTitle><h2>${txt.title}</h2></div></#if></#if></#if>

<#if txt.body?has_content><#assign pageBody=txt.body?interpret><@pageBody /></#if>

</@page>