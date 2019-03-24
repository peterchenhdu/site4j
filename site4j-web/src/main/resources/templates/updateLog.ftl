<#include "include/macros.ftl">
<@header title="网站更新记录 | 一个程序员的个人博客"
keywords=""
description="网站更新维护日志"
canonical="/updateLog">
</@header>

<div class="container custome-container">
    <nav class="breadcrumb">
        <a class="crumbs"  href="${config.siteUrl}" data-toggle="tooltip" data-placement="bottom"><i
                class="fa fa-home"></i>首页</a>
        <i class="fa fa-angle-right"></i>网站更新记录
    </nav>
    <div class="row">
        <div class="col-sm-8">
        <#if list?exists && (list?size > 0)>
            <article class="fade-in update-logs">
                <ul class="list-unstyled">
                    <#list list as item>
                        <li>
                            更新版本：${item.version}
                            <div>更新内容：${item.description}</div>
                            <span>${item.recordeTime?string('yyyy/MM/dd')}</span>
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
