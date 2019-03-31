/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.core.shiro.realm;

import club.peterchenhdu.biz.dto.ResourcesDto;
import club.peterchenhdu.biz.dto.RoleDto;
import club.peterchenhdu.biz.dto.UserDto;
import club.peterchenhdu.biz.service.privilegemgt.SysResourcesService;
import club.peterchenhdu.biz.service.privilegemgt.SysRoleService;
import club.peterchenhdu.biz.service.usermgt.SysUserService;
import club.peterchenhdu.common.constant.CommonConst;
import club.peterchenhdu.common.enums.UserStatusEnum;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Shiro-密码输入错误的状态下重试次数的匹配管理
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/24 14:37
 * @since 1.0
 */
public class ShiroRealm extends AuthorizingRealm {

    @Resource
    private SysUserService userService;
    @Resource
    private SysResourcesService resourcesService;
    @Resource
    private SysRoleService roleService;

    /**
     * 提供账户信息返回认证信息（用户的角色信息集合）
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //获取用户的输入的账号.
        String username = (String) token.getPrincipal();
        UserDto user = userService.getByUserName(username);
        if (user == null) {
            throw new UnknownAccountException("账号不存在！");
        }
        if (user.getStatus() != null && UserStatusEnum.DISABLE.getKey().equals(user.getStatus())) {
            throw new LockedAccountException("帐号已被锁定，禁止登录！");
        }

        // principal参数使用用户Id，方便动态刷新用户权限
        return new SimpleAuthenticationInfo(
                user.getId(),
                user.getPassword(),
                ByteSource.Util.bytes(username),
                getName()
        );
    }

    /**
     * 权限认证，为当前登录的Subject授予角色和权限（角色的权限信息集合）
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        // 权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

        String userId =  SecurityUtils.getSubject().getPrincipal().toString();




        List<ResourcesDto> resourcesList;
        UserDto user = new UserDto(userService.selectById(userId));

        // 赋予角色
        RoleDto role = roleService.getByPrimaryKey(user.getRoleId());
        info.addRole(role.getName());


        // 赋予权限
        // ROOT用户默认拥有所有权限
        if (CommonConst.ROOT_ROLE_ID.equals(user.getRoleId())) {
            resourcesList = resourcesService.listAll();
        } else {
            resourcesList = resourcesService.listByUserId(userId);
        }

        if (!CollectionUtils.isEmpty(resourcesList)) {
            Set<String> permissionSet = new HashSet<>();
            for (ResourcesDto resources : resourcesList) {
                String permission;
                if (!StringUtils.isEmpty(permission = resources.getPermission())) {
                    permissionSet.addAll(Arrays.asList(permission.trim().split(",")));
                }
            }
            info.setStringPermissions(permissionSet);
        }
        return info;
    }

}
