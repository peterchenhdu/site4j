<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>评论审核结果通知</title>
</head>
<body>
<div style="border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,'Helvetica Neue',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%">
    <div style="width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0">
        <p style="font-size:15px;word-break:break-all;padding:20px 32px;margin:0">
            评论审核结果通知
        </p>
    </div>
    <div style="margin:0px auto;width:90%">
        <p>${comment.nickname?if_exists}，您好!</p>
        <p>
            您于 ${comment.createTime?string('yyyy-MM-dd HH:mm:ss')} 在文章《${config.siteUrl?if_exists}${comment.sourceUrl?if_exists}》 上发表的<span class="il">评论</span>：
        </p>
        <div style="background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333">${comment.content}</div>
    <#if comment.status == 'APPROVED'>
        <p>已通过管理员审核并显示。</p>
        <p>
            您可以点击 <a style="text-decoration:none;" href="${config.siteUrl}${comment.sourceUrl}" target="_blank">链接</a>查看回复的完整內容。
        </p>
    <#elseif comment.status == 'REJECT'>
        <p>审核失败！失败原因：</p>
        <p style="background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333">${comment.remark}</p>
    <#elseif comment.status == 'DELETED'>
        <p>已被管理员删除！删除原因：</p>
        <p style="background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333">${comment.remark}</p>
    <#else>
        <p>管理员正在审核中！审核通过后将给您及时发送通知！</p>
    </#if>
        <p>感谢您对 <a style="text-decoration:none;" href="${config.siteUrl}" target="_blank">${config.siteName}</a> 的关注，如您有任何疑问，欢迎来我网站<a style="text-decoration:none;" href="${config.siteUrl}/guestbook" target="_blank">留言</a>。</p>
        <p>（注：此邮件由系统自动发出，请勿回复。）</p>
    </div>
    <div class="adL">
    </div>
</div>
</body>
</html>