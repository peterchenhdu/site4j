/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class UserPwdDto {
    @NotNull(message = "用户ID不可为空")
    private String id;
    @NotNull(message = "原密码不可为空")
    private String password;
    @NotNull(message = "新密码不可为空")
    @Length(max = 20, min = 6, message = "新密码长度建议保持在6~20个字符以内")
    private String newPassword;
    @NotNull(message = "新密码不可为空")
    @Length(max = 20, min = 6, message = "新密码长度建议保持在6~20个字符以内")
    private String newPasswordRepeat;
}
