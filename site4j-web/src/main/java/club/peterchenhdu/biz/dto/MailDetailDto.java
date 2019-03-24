/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.dto;

import lombok.Data;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Data
public class MailDetailDto {

    /**
     * 邮件标题
     */
    private String subject;
    /**
     * 收件人地址
     */
    private String toMailAddress;
    /**
     * 收件人姓名
     */
    private String toUsername;
    /**
     * 抄送人
     */
    private String[] cc;
    /**
     * 邮件内容
     */
    private String content;
    /**
     * 附件列表
     */
    private List<String> filePaths;
    private boolean html = true;

    public MailDetailDto(String title, String toMailAddress, String toUsername, String content) {
        this.subject = title;
        this.toMailAddress = toMailAddress;
        this.toUsername = toUsername;
        this.content = content;
        this.filePaths = null;
    }

    public boolean isExitFile() {
        return getFilePaths() != null && getFilePaths().size() > 0;
    }

    public String[] getFilePathArr() {
        if (!CollectionUtils.isEmpty(getFilePaths())) {
            return filePaths.toArray(new String[filePaths.size()]);
        }
        return null;
    }

    public String[] getCc() {
        return cc;
    }

    public MailDetailDto setCc(String[] cc) {
        this.cc = cc;
        return this;
    }

    public MailDetailDto setCc(String cc) {
        if (!StringUtils.isEmpty(cc)) {
            this.cc = new String[]{cc};
        }
        return this;
    }

    public MailDetailDto setCc(List<String> cc) {
        if (!CollectionUtils.isEmpty(cc)) {
            this.cc = cc.toArray(new String[cc.size()]);
        }
        return this;
    }
}
