<#-- 公共顶部 -->
<#macro header>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${config.siteName}后台管理系统</title>
    <link href="/images/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/jquery-confirm.min.css" rel="stylesheet">
    <link href="/css/jquery.fancybox.min.css" rel="stylesheet">
    <link href="/css/toastr.min.css" rel="stylesheet">
    <link href="/css/green.css" rel="stylesheet">
    <link href="/css/bootstrap-table.min.css" rel="stylesheet">
    <link href="/css/daterangepicker.min.css" rel="stylesheet">
    <link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="/css/metroStyle.min.css" rel="stylesheet">
    <link href="/css/zhyd.core.css" rel="stylesheet">
    <link href="/css/simplemde.min.css" rel="stylesheet">
    <link href="/css/github-markdown.min.css" rel="stylesheet">
    <link href="/css/github.min.css" rel="stylesheet">
    <#nested>
</head>
<body class="nav-md">
<div class="container body">
<div class="main_container">
    <div class="col-md-3 left_col">
        <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
                <a href="/" class="site_title"><i class="fa fa-coffee"></i> <span>${config.siteName}</span></a>
            </div>
            <div class="clearfix"></div>
            <@shiro.user>
                <div class="profile clearfix">

                    <div class="profile_info">
                        <span id="hello_msg">&nbsp;</span>
                        <h2>尊敬的管理员</h2>
                    </div>
                </div>
            </@shiro.user>
            <br/>
            <#include "/admin/layout/sidebar.ftl"/>
        </div>
    </div>
    <#include "/admin/layout/setting.ftl"/>
<div class="right_col" role="main">
</#macro>

<#-- 公共底部 -->
<#macro footer>
    <#include "/admin/layout/footer.ftl"/>

    <#nested>

</body>
</html>
</#macro>

<#macro permissionHideBtn permission id><@shiro.hasPermission name="${permission}"><a class="btn btn-xs btn-primary btn-hide" data-id="${id}"><span class="glyphicon glyphicon-eye-close"></span></a></@shiro.hasPermission></#macro>
<#macro permissionShowBtn permission id><@shiro.hasPermission name="${permission}"><a class="btn btn-xs btn-primary btn-show" data-id="${id}"><span class="glyphicon glyphicon-eye-open"></span></a></@shiro.hasPermission></#macro>
<#macro permissionDelBtn permission id><@shiro.hasPermission name="${permission}"><a class="btn btn-xs btn-danger btn-remove" data-id="${id}"><span class="glyphicon glyphicon-remove"></span></a></@shiro.hasPermission></#macro>
<#macro permissionUpdateBtn permission id><@shiro.hasPermission name="${permission}"><a class="btn btn-xs btn-primary btn-update" data-id="${id}"><span class="glyphicon glyphicon-pencil"></span></a></@shiro.hasPermission></#macro>
<#macro permissionSortBtn permission id><@shiro.hasPermission name="${permission}"><a class="btn btn-xs btn-primary btn-sort" data-id="${id}"><span class="glyphicon glyphicon-sort"></span></a></@shiro.hasPermission></#macro>