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
            <article class="fade-in" style="height: auto">
                <div class="rows">
                    <div class="col-md-10 col-sm-12">
                        <div class="h3 text-center">暂无内容~~~</div>
                    </div>
                    <div class="col-md-2 col-sm-12">

                    </div>
                </div>

            </article>
        </#if>
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
