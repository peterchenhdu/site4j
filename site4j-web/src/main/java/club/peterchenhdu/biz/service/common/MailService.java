/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.common;

import club.peterchenhdu.common.enums.TemplateKeyEnum;
import club.peterchenhdu.biz.dto.CommentDto;
import club.peterchenhdu.biz.dto.LinkDto;
import club.peterchenhdu.biz.dto.MailDetailDto;

/**
 * 邮件发送
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
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
