/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.core.shiro;

import com.github.peterchenhdu.site4j.biz.dto.UserDto;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysResourcesService;
import com.github.peterchenhdu.site4j.biz.service.usermgt.SysUserService;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.core.shiro.realm.ShiroRealm;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.mgt.RealmSecurityManager;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Shiro-权限相关的业务处理
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Slf4j
@Service
public class ShiroService {

    @Autowired
    private SysResourcesService resourcesService;
    @Autowired
    private SysUserService userService;
//    @Autowired
//    private ShiroFilterFactoryBean shirFilter;

    /**
     * 初始化权限
     */
    public Map<String, String> loadFilterChainDefinitions() {
        /*
            配置访问权限
            - anon:所有url都都可以匿名访问
            - authc: 需要认证才能进行访问（此处指所有非匿名的路径都需要登陆才能访问）
            - user:配置记住我或认证通过可以访问
         */
        final Map<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
        // 配置退出过滤器,其中的具体的退出代码Shiro已经替我们实现了
        filterChainDefinitionMap.put("/admin/passport/logout", "logout");
        filterChainDefinitionMap.put("/admin/passport/login", "anon");
        filterChainDefinitionMap.put("/admin/passport/signin", "anon");
        filterChainDefinitionMap.put("/admin/getVerificationCode", "anon");

        // 加载数据库中配置的资源权限列表
        resourcesService.listUrlAndPermission().stream()
                .filter(dto -> ObjectUtils.isNotEmpty(dto.getUrl()) && ObjectUtils.isNotEmpty(dto.getPermission()))
                .forEach(dto -> filterChainDefinitionMap.put(dto.getUrl(), "perms[" + dto.getPermission() + "]"));

        filterChainDefinitionMap.put("/admin/**", "user");
        return filterChainDefinitionMap;
    }



    /**
     * 重新加载用户权限
     *
     * @param user user
     */
    private void reloadAuthorizingByUserId(UserDto user) {
        RealmSecurityManager rsm = (RealmSecurityManager) SecurityUtils.getSecurityManager();
        ShiroRealm shiroRealm = (ShiroRealm) rsm.getRealms().iterator().next();
        Subject subject = SecurityUtils.getSubject();
        String realmName = subject.getPrincipals().getRealmNames().iterator().next();
        SimplePrincipalCollection principals = new SimplePrincipalCollection(user.getId(), realmName);
        subject.runAs(principals);
        shiroRealm.getAuthorizationCache().remove(subject.getPrincipals());
        subject.releaseRunAs();

        log.info("用户[{}]的权限更新成功！！", user.getUsername());

    }

    /**
     * 重新加载所有拥有roleId角色的用户的权限
     *
     * @param roleId roleId
     */
    public void reloadAuthorizingByRoleId(String roleId) {
        List<UserDto> userList = userService.listByRoleId(roleId);
        if (CollectionUtils.isEmpty(userList)) {
            return;
        }
        for (UserDto user : userList) {
            reloadAuthorizingByUserId(user);
        }
    }

}
