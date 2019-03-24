<#include "include/macros.ftl">
<@header title="站长推荐 | ${config.siteName}"
keywords="站长推荐"
description="站长推荐"
canonical="/recommended">
</@header>

<div class="container custome-container">
    <nav class="breadcrumb">
        <a class="crumbs"  href="${config.siteUrl}" data-toggle="tooltip" data-placement="bottom"><i
                class="fa fa-home"></i>首页</a>
        <i class="fa fa-angle-right"></i>站长推荐
    </nav>
    <div class="row">
        <div class="col-sm-8">
        <#if list?exists && (list?size > 0)>
            <article class="fade-in recommended-articles">
                <ul class="list-unstyled">
                    <#list list as item>
                        <li>
                            <i class="fa fa-thumbs-o-up"></i><a href="${config.siteUrl}/article/${item.id}"
                                                                rel="bookmark" data-toggle="tooltip"
                                                                data-placement="bottom">${item.title}</a>
                            <span class="info">${item.createTime?string('yyyy/MM/dd')}</span>
                        </li>
                    </#list>
                </ul>
            </article>
        <#else >
            <article class="fade-in">
                <div class="h3 text-center">亲，啥也没找到啊~~
                </div>

            </article>
        </#if>
        </div>
    <#include "layout/sidebar.ftl"/>
    </div>
</div>

<@footer></@footer>

