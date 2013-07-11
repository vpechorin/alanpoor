<#macro projectsItem nodeName="somepage">
<#assign this = pageTree.findPageNode(nodeName)>
<#if this??>
<div class="projectsItem">
    <#if this.data.mainImage??>
        <#assign img = this.data.mainImage>
        <div>
            <a href="${appConfig.appPath}/pv/${this.data.name}" class="th" title="${this.data.title?html}">
               <img src="${appConfig.fileStorageUrl}${img.thumb.getAbsolutePath()}" alt="${this.data.title?html}">
            </a>
        </div>
    </#if>
    <span class="projectsH2">
        <a href="${appConfig.appPath}/pv/${this.data.name}">${this.data.title}</a>
    </span>
</div>
<#else>
    Error: no such page "${nodeName}"     
</#if>     
</#macro>     