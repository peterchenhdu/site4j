/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.web.admin.controller;

import club.peterchenhdu.biz.dto.UserPwdDto;
import club.peterchenhdu.biz.service.usermgt.SysUserService;
import club.peterchenhdu.common.annotation.BusinessLog;
import club.peterchenhdu.common.annotation.PublicService;
import club.peterchenhdu.common.base.Response;
import club.peterchenhdu.common.util.ObjectUtils;
import club.peterchenhdu.config.property.AppProperties;
import club.peterchenhdu.util.ResultUtils;
import club.peterchenhdu.util.SessionUtil;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 登录相关
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/24 14:37
 * @since 1.0
 */
@Slf4j
@Api(value="登录管理")
@PublicService
@Controller
@RequestMapping(value = "/admin/passport")
public class PassportController {

    @Autowired
    private AppProperties config;
    @Autowired
    private SysUserService userService;

    @BusinessLog("进入登录页面")
    @GetMapping("/login")
    public ModelAndView login(Model model) {
        model.addAttribute("enableVCode", config.getEnableVCode());
        return ResultUtils.view("/admin/login");
    }

    /**
     * 登录
     *
     * @param username username
     * @param password password
     * @return
     */
    @PostMapping("/signin")
    @ResponseBody
    public Response submitLogin(String username, String password, boolean rememberMe, String vCode) {
        if (config.getEnableVCode()) {
            if (StringUtils.isEmpty(vCode) || !vCode.equalsIgnoreCase(SessionUtil.getVCode())) {
                return ResultUtils.error("验证码错误！");
            }
            SessionUtil.removeVCode();
        }


        UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);

        //获取当前的Subject
        Subject currentUser = SecurityUtils.getSubject();
        try {
            // 在调用了login方法后,SecurityManager会收到AuthenticationToken,并将其发送给已配置的Realm执行必须的认证检查
            // 每个Realm都能在必要时对提交的AuthenticationTokens作出反应
            // 所以这一步在调用login(token)方法时,它会走到xxRealm.doGetAuthenticationInfo()方法中,具体验证方式详见此方法
            currentUser.login(token);
            return ResultUtils.success("登录成功！");
        } catch (Exception e) {
            log.error("登录失败，用户名[{}]", username, e);
            token.clear();
            return ResultUtils.error(e.getMessage());
        }
    }

    /**
     * 修改密码
     *
     * @return
     */
    @PostMapping("/updatePwd")
    @ResponseBody
    public Response updatePwd(@Validated UserPwdDto userPwd, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors() && ObjectUtils.isNotEmpty(bindingResult.getFieldError())) {
            return ResultUtils.error(bindingResult.getFieldError().getDefaultMessage());
        }
        boolean result = userService.updatePwd(userPwd);
        SessionUtil.removeAllSession();
        return ResultUtils.success(result ? "密码已修改成功，请重新登录" : "密码修改失败");
    }

    /**
     * 使用权限管理工具进行用户的退出，跳出登录，给出提示信息
     *
     * @param redirectAttributes
     * @return
     */
    @GetMapping("/logout")
    public ModelAndView logout(RedirectAttributes redirectAttributes) {
        // http://www.oschina.net/question/99751_91561
        // 此处有坑： 退出登录，其实不用实现任何东西，只需要保留这个接口即可，也不可能通过下方的代码进行退出
        // SecurityUtils.getSubject().logout();
        // 因为退出操作是由Shiro控制的
        redirectAttributes.addFlashAttribute("message", "您已安全退出");
        return ResultUtils.redirect("admin/index");
    }
}
