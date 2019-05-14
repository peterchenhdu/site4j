<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${config.siteName}后台管理系统</title>
    <link href="/images/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/green.css" rel="stylesheet">
    <link href="/css/zhyd.core.css" rel="stylesheet">
    <link href="/css/jquery-confirm.min.css" rel="stylesheet">
</head>
<body style="background-color: #509bff">
<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-body">
            <div class="login_wrapper">
                    <section class="login_content">
                        <form action="/passport/signin" method="POST" id="login-form">
                            <h1>登录管理系统</h1>
                        <#if message?exists>
                            <div class="alert alert-danger" role="alert">
                            ${message?if_exists}
                            </div>
                        </#if>
                            <div>
                                <input type="text" class="form-control" placeholder="请输入用户名" name="username" required=""/>
                            </div>
                            <div>
                                <input type="password" class="form-control" placeholder="请输入密码" name="password" required=""/>
                            </div>
                        <#if enableVCode?exists && enableVCode>
                            <div class="form-group col-xs-6" style="padding-left: 0px;">
                                <img alt="点击获取验证码" id="img-vCode" src="/admin/getVerificationCode" style="cursor:pointer;height: 34px;width: 180px;">
                            </div>
                            <div class="form-group col-xs-6">
                                    <span><input type="text" class="form-control" placeholder="验证码" id="vCode" name="vCode"></span>
                            </div>
                        </#if>
                            <div class="form-group" style="text-align : left">
                                <label><input type="checkbox" id="rememberMe" name="rememberMe" style="width: 12px; height: 12px;margin-right: 5px;"> 记住我</label>
                            </div>
                            <div>
                                <button type="button" class="btn btn-success btn-login" style="width: 100%;">登录</button>
                            </div>
                            <div class="login-loading hide">
                                <i class="fa fa-spinner fa-pulse"></i>正在登录中...
                            </div>

                            <div class="clearfix"></div>

                            <div class="separator">
                                <div class="clearfix"></div>
                                <div>
                                    <h1><i class="fa fa-coffee"></i> ${config.siteName}后台管理系统</h1>
                                    <p>Copyright © 2018-2025 SITE4J. All Rights Reserved.
                                    </p>
                                </div>
                            </div>
                        </form>
                    </section>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/jquery.min.js" type="text/javascript"></script>
<script src="/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/js/jquery-confirm.min.js" type="text/javascript"></script>
<script src="/js/site4j.tool.js"></script>
<script>
    $(".btn-login").click(function () {
        $(".login-loading").removeClass("hide");
        $.ajax({
            type: "POST",
            url: "/admin/passport/signin",
            data: $("#login-form").serialize(),
            dataType: "json",
            success: function (json) {
                $(".login-loading").addClass("hide");
                if (json.status === 200) {
                    window.location.href = "/admin";
                } else {
                    $.alert.error(json.message);
                    $("#img-vCode").attr("src", '/admin/getVerificationCode?time=' + new Date().getTime());
                }
            }
        });
    });
    $("#img-vCode").click(function () {
        $(this).attr("src", '/admin/getVerificationCode?time=' + new Date().getTime());
    });
    document.onkeydown = function (event) {
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if (e && e.keyCode === 13) {
            $(".btn-login").click();
        }
    };
</script>
</body>
</html>
