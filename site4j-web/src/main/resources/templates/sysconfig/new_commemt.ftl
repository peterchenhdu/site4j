<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新评论通知</title>
</head>
<body>
<div style="border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,'Helvetica Neue',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%">
    <div style="width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0">
        <p style="font-size:15px;word-break:break-all;padding:20px 32px;margin:0">
            新评论通知
        </p>
    </div>
    <div style="margin:0px auto;width:90%">
        <p>
            评论内容：
        </p>
        <div style="background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333"><#if comment?exists>${comment.content}<#else>**无评论内容**</#if></div>
        <p>
            <a style="text-decoration:none;" href="${config.siteUrl}${comment.sourceUrl}" target="_blank">查看完整评论</a>
        </p>
        <p>（注：此邮件由系统自动发出，请勿回复。）</p>
    </div>
    <div class="adL">
    </div>
</div>
</body>
</html>