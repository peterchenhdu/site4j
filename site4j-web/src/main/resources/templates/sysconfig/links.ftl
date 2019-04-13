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
        <p>站长<a href="${link.url?if_exists}" target="_blank">${link.name?if_exists}</a>，您好!</p>
        <p>您于 ${link.createTime?string('yyyy-MM-dd HH:mm:ss')} 提交的友链申请已通过系统审核。以下为您提交的信息，请确认（如有误，请联系我）！</p>
        <p>
        <ul>
            <li>${link.name?if_exists}</li>
            <li>${link.url?if_exists}</li>
            <li>${link.description?if_exists}</li>
            <li>${link.email?if_exists}</li>
            <li>${link.qq?if_exists}</li>
            <li><img src="${link.favicon?if_exists}" width="100" alt="LOGO"></li>
        </ul>
        </p>
        <p>本站会不定期检查连接有效性，如果因为贵站改版、服务到期等原因导致无法正常访问的，我会暂时停掉贵站友链，待贵站可以正常访问后，本站会继续启用贵站友链。</p>
        <p>特别注意：以下情况，本站将在不做任何通知下，<strong>取消友链</strong>！</p>
        <ul>
            <li>私自取消本站友情链接</li>
            <li>更换域名且未通知本站</li>
            <li>网站内容长期不更新</li>
            <li>友链上使用诸如nofollow之类的属性</li>
        </ul>
        <p>感谢您对 <a style="text-decoration:none;" href="${config.siteUrl?if_exists}" target="_blank">${config.siteName?if_exists}</a> 的关注，如您有任何疑问，欢迎来我网站<a style="text-decoration:none;" href="${config.siteUrl}/guestbook" target="_blank">留言</a>。</p>
        <p>（注：此邮件由系统自动发出，请勿回复。）</p>
    </div>
    <div class="adL">
    </div>
</div>
</body>
</html>