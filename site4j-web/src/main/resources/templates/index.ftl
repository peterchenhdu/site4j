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

                <@site4jTag method="types">
                    <#if types?? && types?size gt 0>
                        <#list types as item>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>${item.name}</h2>
                                        <a href="/type/${item.subIds}" ><span>更多+</span></a>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <ul class="list-unstyled lately lately-article">
                                            <@articleTag method="typeList" pageSize="10" typeId="${item.subIds}">
                                                <#if typeList?exists && (typeList?size > 0)>
                                                    <#list typeList as item>
                                                        <li style="line-height: 1.8;">
                                                            <em>${item_index + 1}</em>
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
                </@site4jTag>

            <#else >

                <#if page.list?exists && (page.list?size > 0)>
                    <#list page.list as item>
                    <article class="fade-in">
                        <figure class="thumbnail">
                            <a href="${config.siteUrl}/article/${item.id}">
                                <#if item.coverImage?exists && (item.coverImage?length > 7)>
                                    <img width="150" height="150" data-original="${item.coverImage}" class="img-responsive lazy-img" alt="${item.title?if_exists}">
                                <#else>
                                    <img width="150" height="150" data-original="${config.staticWebSite}/img/user/11.jpg" class="img-responsive lazy-img" alt="${item.title?if_exists}">
                                </#if>
                            </a>
                            <span class="cat"><a href="${config.siteUrl}/type/${item.typeId}">${item.bizType.name}</a></span>
                        </figure>
                        <header class="entry-header">
                            <h2 class="entry-title">
                                <a href="${config.siteUrl}/article/${item.id}">${item.title}</a>
                            </h2>
                        </header>
                        <div class="entry-content">
                            <div class="archive-content">
                                ${item.description?if_exists}
                            </div>
                            <span class="title-l"></span>
                            <span class="entry-meta">
                                <span class="date"><i class="fa fa-clock-o fa-fw"></i>${item.createTime?string("yyyy-MM-dd HH:mm:ss")}</span>
                                <span class="views"><i class="fa fa-eye fa-fw"></i>浏览(${item.lookCount!(0)})</span>
                                <span class="comment">
                                    <a href="${config.siteUrl}/article/${item.id}#comment-box" rel="external nofollow">
                                        <i class="fa fa-comments-o fa-fw"></i>评论(${item.commentCount!(0)})
                                    </a>
                                </span>
                            </span>
                            <div class="clear"></div>
                            <span class="entry-more">
                                <a href="${config.siteUrl}/article/${item.id}">阅读全文</a>
                            </span>
                        </div>
                    </article>
                    </#list>
                    <@pageBar></@pageBar>
                <#else >
                <article class="fade-in" style="height: auto">
                    <div class="rows">
                        <div class="col-md-10 col-sm-12">
                            <div class="h3 text-center">暂无内容~~</div>
                        </div>
                    </div>
                </article>
                </#if>

            </#if>

        </div>
    <#include "layout/sidebar.ftl"/>
    </div>
</div>
<@footer></@footer>
