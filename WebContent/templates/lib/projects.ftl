<#macro projects gridColumns=2 withChildren=false>
<#assign branch=pageTree.findPageNode(txt.id)>
<#if branch.hasChildren()>
<#assign rowIdx=1>
<div class="projectsBlock">
<#list branch.children?chunk(gridColumns) as row>
<ul class="small-block-grid-${gridColumns} large-block-grid-${gridColumns}"><!-- row ${rowIdx} start -->
    <#list row as department>
    <li>
        <span class="projectsH1">
            <#if department.data.placeholder>
                <i class="icon-folder-open"></i> ${department.data.title}
            <#else>
                <a href="${appConfig.appPath}/pv/${department.data.name}"><i class="icon-folder-open"></i> ${department.data.title}</a>
            </#if>
        </span>
        <#if department.hasChildren()>
        <ul class="rootProjectsLevel">
            <#list department.children as grp>
            <li class="grpLI"><span class="projectsH2">
                <#if grp.data.placeholder>
                    ${grp.data.title}
                <#else>
                    <a href="${appConfig.appPath}/pv/${grp.data.name}">${grp.data.title}</a>
                </#if>
                </span>
                <#if withChildren>
                    <#if grp.hasChildren()>
                        <ul>
                        <#list grp.children as project>
                            <li><a href="${appConfig.appPath}/pv/${project.data.name}">${project.data.title}</a></li>
                        </#list>
                        </ul>
                    </#if>
                </#if>
            </li>
            </#list>
        </ul>
        </#if>
    </li>
    </#list>
</ul><!-- row ${rowIdx} end -->   

<#assign rowIdx = rowIdx + 1>
</#list>
</div><!-- grid end -->
</#if>
</#macro>