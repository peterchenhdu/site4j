<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>友情链接操作通知</title>
</head>
<body>
<div style="border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,'Helvetica Neue',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%">
    <div style="width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0">
        <p style="font-size:15px;word-break:break-all;padding:20px 32px;margin:0">
            友情链接操作通知
        </p>
    </div>
    <div style="margin:0px auto;width:90%">
        <p>有新的友情链接加入，信息如下</p>
        <p>
        <ul>
            <li>${link.name?if_exists}</li>
            <li>${link.url?if_exists}</li>
            <li>${link.description?if_exists}</li>
        <#if link.favicon?exists><li><img src="${link.favicon?if_exists}" width="100" alt="LOGO"></li></#if>
        </ul>
        </p>
        <p><a style="text-decoration:none;" href="http://admin.zhyd.me" target="_blank">去后台继续审核</a>。</p>
        <p>（注：此邮件由系统自动发出，请勿回复。）</p>
    </div>
    <div class="adL">
    </div>
</div>
</body>
</html>