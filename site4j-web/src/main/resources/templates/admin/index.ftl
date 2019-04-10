<#include "admin/include/macros.ftl">
<@header>
<style>
    .about ul {
        -webkit-padding-start: 40px !important;
    }
</style>
</@header>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>欢迎光临
                    <small>${config.siteName}后台管理系统</small>
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">

                <div class="row">
                <@shiro.hasPermission name="article">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>最近发布</h2>
                                <@shiro.hasPermission name="article:publish">
                                    <a href="/article/publishMd" class="btn btn-success btn-xs pull-right"><i
                                            class="fa fa-pencil"></i> 发布文章</a>
                                </@shiro.hasPermission>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <ul class="list-unstyled lately lately-article">
                                    <@articleTag method="recentArticles">
                                        <#if recentArticles?? && recentArticles?size gt 0>
                                            <#list recentArticles as item>
                                                <li style="line-height: 1.8;">
                                                    <span>${item.createTime}</span>
                                                    <a href="${config.siteUrl}/article/${item.id}"
                                                       target="_blank">${item.title}</a>
                                                </li>
                                            </#list>
                                        </#if>
                                    </@articleTag>
                                </ul>
                            </div>
                        </div>
                    </div>
                </@shiro.hasPermission>
                <@shiro.hasPermission name="comment">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>近期评论</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <ul class="list-unstyled lately lately-comment">
                                    <@zhydTag method="recentComments">
                                        <#if recentComments?? && recentComments?size gt 0>
                                            <#list recentComments as item>
                                                <li style="line-height: 1.8;border-bottom: 1px solid #e8e9e8;margin-bottom: 10px;">
                                                    <strong>${item.nickname}：</strong>
                                                    <a href="${config.siteUrl}${item.sourceUrl}"
                                                       target="_blank">${item.briefContent?if_exists}</a>
                                                    <p><span>${item.createTime}</span></p>
                                                </li>
                                            </#list>
                                        <#else>
                                            <li style="line-height: 1.8;"><span>暂无评论</span></li>
                                        </#if>
                                    </@zhydTag>
                                </ul>
                            </div>
                        </div>
                    </div>
                </@shiro.hasPermission>
                </div>

            </div>
        </div>
    </div>
</div>
</div>
<@footer></@footer>