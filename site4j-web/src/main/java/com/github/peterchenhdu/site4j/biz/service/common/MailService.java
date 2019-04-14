/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.common;

import com.github.peterchenhdu.site4j.biz.dto.CommentDto;
import com.github.peterchenhdu.site4j.biz.dto.LinkDto;
import com.github.peterchenhdu.site4j.biz.dto.MailDetailDto;
import com.github.peterchenhdu.site4j.enums.TemplateKeyEnum;

/**
 * 邮件发送
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface MailService {

    /**
     * 普通的发送
     *
     * @param mailDetail
     * @return
     */
    void send(MailDetailDto mailDetail);

    /**
     * 发送友情链接邮件通知
     *
     * @param link
     * @param keyEnum
     * @return
     */
    void send(LinkDto link, TemplateKeyEnum keyEnum);

    /**
     * 发送评论邮件通知
     *
     * @param comment
     * @param keyEnum
     * @param audit
     * @return
     */
    void send(CommentDto comment, TemplateKeyEnum keyEnum, boolean audit);

    /**
     * 发送到管理员的友链操作通知
     *
     * @param link
     */
    void sendToAdmin(LinkDto link);

    /**
     * 发送到管理员的评论通知
     *
     * @param comment
     */
    void sendToAdmin(CommentDto comment);
}
