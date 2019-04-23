<#include "include/macros.ftl">
<@header title="${config.siteName?if_exists} | Java知识分享站点"
keywords="${config.homeKeywords?if_exists}"
description="${config.homeDesc?if_exists}"
canonical="/${url?if_exists}">
</@header>

<div class="container custome-container">

    <div class="row" style="margin-bottom: 20px;">
        <div class="col-sm-8 blog-main">
        <#--<article id="index-chart" class="fade-in" style="padding: 0;height:240px"></article>-->

            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>最近发布</h2>

                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <ul class="list-unstyled lately lately-article">
                            <#if page.list?? && page.list?size gt 0>
                                <#list page.list as item>
                                    <li style="line-height: 1.8;">
                                        <span>${item.createTime}</span>
                                        <a href="${config.siteUrl}/article/${item.id}"
                                           target="_blank">${item.title}</a>
                                    </li>
                                </#list>
                            </#if>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>最近发布</h2>

                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <ul class="list-unstyled lately lately-article">
                        <#if page.list?? && page.list?size gt 0>
                            <#list page.list as item>
                                <li style="line-height: 1.8;">
                                    <span>${item.createTime}</span>
                                    <a href="${config.siteUrl}/article/${item.id}"
                                       target="_blank">${item.title}</a>
                                </li>
                            </#list>
                        </#if>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>最近发布</h2>

                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <ul class="list-unstyled lately lately-article">
                        <#if page.list?? && page.list?size gt 0>
                            <#list page.list as item>
                                <li style="line-height: 1.8;">
                                    <span>${item.createTime}</span>
                                    <a href="${config.siteUrl}/article/${item.id}"
                                       target="_blank">${item.title}</a>
                                </li>
                            </#list>
                        </#if>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    <#include "layout/sidebar.ftl"/>
    </div>
</div>
<script type="text/javascript" src="${config.staticWebSite}/js/echarts-all.js"></script>
<#--<script type="text/javascript">-->
    <#--var myChart = echarts.init(document.getElementById('index-chart'));-->
    <#--var option = {-->
        <#--tooltip: {-->
            <#--show: true-->
        <#--},-->
        <#--legend: {-->
            <#--data: ['销量']-->
        <#--},-->
        <#--xAxis: [-->
            <#--{-->
                <#--type: 'category',-->
                <#--data: ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"]-->
            <#--}-->
        <#--],-->
        <#--yAxis: [-->
            <#--{-->
                <#--type: 'value'-->
            <#--}-->
        <#--],-->
        <#--series: [-->
            <#--{-->
                <#--"name": "销量",-->
                <#--"type": "bar",-->
                <#--"data": [5, 20, 40, 10, 10, 20]-->
            <#--}-->
        <#--]-->
    <#--};-->
    <#--myChart.setOption(option);-->

<#--</script>-->

<@footer></@footer>
