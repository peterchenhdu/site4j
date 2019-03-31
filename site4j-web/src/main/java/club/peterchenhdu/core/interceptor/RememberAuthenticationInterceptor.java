/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.core.interceptor;

import club.peterchenhdu.biz.dto.UserDto;
import club.peterchenhdu.biz.service.usermgt.SysUserService;
import club.peterchenhdu.common.constant.SessionConst;
import club.peterchenhdu.util.PasswordUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/7/15 15:24
 * @since 1.0
 */
@Slf4j
@Component
public class RememberAuthenticationInterceptor implements HandlerInterceptor {

    @Autowired
    private SysUserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            return true;
        }
        Session session = subject.getSession(true);
        if (session.getAttribute(SessionConst.USER_SESSION_KEY) != null) {
            return true;
        }
        if (!subject.isRemembered()) {
            log.warn("未设置“记住我”,跳转到登录页...");
            response.sendRedirect(request.getContextPath() + "/admin/passport/login");
            return false;
        }
        try {
            String userId = subject.getPrincipal().toString();
            UserDto user = new UserDto(userService.selectById(userId));
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), PasswordUtils.decrypt(user.getPassword(), user.getUsername()), true);
            subject.login(token);
            session.setAttribute(SessionConst.USER_SESSION_KEY, user);
            log.info("[{}] - 已自动登录", user.getUsername());
        } catch (Exception e) {
            log.error("自动登录失败", e);
            response.sendRedirect(request.getContextPath() + "/admin/passport/login");
            return false;
        }
        return true;
    }
}
