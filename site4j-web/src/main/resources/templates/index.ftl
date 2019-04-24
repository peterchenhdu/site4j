<#include "include/macros.ftl">
<@header title="${config.siteName?if_exists} | Java知识分享站点"
keywords="${config.homeKeywords?if_exists}"
description="${config.homeDesc?if_exists}"
canonical="/${url?if_exists}">
</@header>

<div class="container custome-container">

    <div class="row" style="margin-bottom: 20px;">
        <div class="col-sm-8 blog-main">

            <#if defaultIndex>

                <@zhydTag method="types">
                    <#if types?? && types?size gt 0>
                        <#list types as item>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>${item.name}</h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <ul class="list-unstyled lately lately-article">
                                            <@articleTag method="typeList" pageSize="10" typeId="${item.subIds}">
                                                <#if typeList?exists && (typeList?size > 0)>
                                                    <#list typeList as item>
                                                        <li style="line-height: 1.8;">
                                                            <span>${item.createTime}</span>
                                                            <a href="${config.siteUrl}/article/${item.id}" target="_blank">${item.title}</a>
                                                        </li>
                                                    </#list>
                                                </#if>
                                            </@articleTag>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </#list>
                    </#if>
                </@zhydTag>

            <#else >

                <#if page.list?exists && (page.list?size > 0)>
                    <#list page.list as item>
                        <div style="padding: 0px">
                            <a href="${config.siteUrl}/article/${item.id}">${item.type.name} | ${item.title}</a>
                            <span style="float:right;width: 280px;">
                                <span ><i class="fa fa-calendar-o fa-fw"></i>${item.createTime}</span>
                                <span ><i class="fa fa-eye fa-fw"></i>(${item.lookCount!(0)})</span>
                                <span style="float:right;"><i class="fa fa-comments-o fa-fw"></i>(${item.commentCount!(0)})</span>
                            </span>
                        </div>
                    </#list>
                    <@pageBar></@pageBar>
                <#else >
                    <div class="rows">
                        <div class="col-md-12 col-sm-12">
                            <div class="h3 text-center">暂无内容~~~</div>
                        </div>
                        <div class="col-md-2 col-sm-12"></div>
                    </div>
                </#if>

            </#if>

        </div>
    <#include "layout/sidebar.ftl"/>
    </div>
</div>
<@footer></@footer>
