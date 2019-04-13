${config.siteUrl}
${config.siteUrl}/guestbook
${config.siteUrl}/updateLog
${config.siteUrl}/recommended
<#list articleList as item>
${config.siteUrl}/article/${item.id}
</#list>
<#list articleTypeList as item>
${config.siteUrl}/type/${item.id}
</#list>
<#list articleTagsList as item>
${config.siteUrl}/tag/${item.id}
</#list>