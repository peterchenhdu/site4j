/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.core.shiro.credentials;

import com.github.peterchenhdu.site4j.util.PasswordUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;

/**
 * Shiro-密码凭证匹配器（验证密码有效性）
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class CredentialsMatcher extends SimpleCredentialsMatcher {

    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
        //获得用户输入的密码:(可以采用加盐(salt)的方式去检验)
        String inPassword = new String(usernamePasswordToken.getPassword());
        //获得数据库中的密码
        String dbPassword = (String) info.getCredentials();
        try {
            dbPassword = PasswordUtils.decrypt(dbPassword, usernamePasswordToken.getUsername());
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        //进行密码的比对
        return this.equals(inPassword, dbPassword);
    }
}
