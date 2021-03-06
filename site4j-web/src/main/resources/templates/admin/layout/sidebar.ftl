<!-- sidebar menu -->
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
    <div class="menu_section">
        <ul class="nav side-menu">
        <@shiro.user>
            <li><a href="/admin"><i class="fa fa-home"></i>首页</a></li>
        </@shiro.user>
        <@site4jTag method="menus" userId="${user.id}">
            <#if menus?? && menus?size gt 0>
                <#list menus as item>
                    <#if item.nodes?? && item.nodes?size gt 0>
                        <li>
                            <a><i class="${item.icon?if_exists}"></i> ${item.name?if_exists}<span
                                    class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu" <#if item.expand> style="display: block;"</#if>>
                                <#list item.nodes as node>
                                    <#if node.permission?if_exists>
                                        <@shiro.hasPermission name="${node.permission?if_exists}">
                                            <li>
                                                <a href="${node.url?if_exists}" ${(item.external?exists && item.external)?string('target="_blank"','')}><i
                                                        class="${node.icon?if_exists}"></i>${node.name?if_exists}</a>
                                            </li>
                                        </@shiro.hasPermission>
                                    <#else>
                                        <li>
                                            <a href="${node.url?if_exists}" ${(item.external?exists && item.external)?string('target="_blank"','')}><i
                                                    class="${node.icon?if_exists}"></i>${node.name?if_exists}</a></li>
                                    </#if>
                                </#list>
                            </ul>
                        </li>
                    <#else>
                        <li>
                            <a href="${item.url?if_exists}" ${(item.external?exists && item.external)?string('target="_blank"','')}><i
                                    class="${item.icon?if_exists}"></i>${item.name?if_exists}</a></li>
                    </#if>
                </#list>
            </#if>
        </@site4jTag>
        </ul>
    </div>
</div>
