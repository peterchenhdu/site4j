<nav id="mainmenu" class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="menu-box">

        <div class="navbar-header">
            <span class="pull-right nav-search toggle-search" data-toggle="modal" data-target=".nav-search-box"><i class="fa fa-search"></i></span>
            <a type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <div class="navbar-brand logo" >
                <h1 style="font-size: 20px;font-weight: 700;margin-top: 5px;" class="auto-shake">
                    <img src="${config.staticWebSite}/img/logo.png" height="40px"/>
                    <a href="${config.siteUrl}" style="color: #637AFF">${config.siteName}</a>
                </h1>
                <p class="site-description navbar-collapse collapse">${config.siteDesc}</p>
            </div>
        </div>

        <div id="navbar" class="navbar-collapse collapse">


            <ul class="nav navbar-nav ">
                <li>
                    <a href="/" class="menu_a"><i class="fa fa-home"></i>首页</a>
                </li>
            <@zhydTag method="types">
                <#if types?? && types?size gt 0>
                    <#list types as item>
                        <#if item.nodes?exists && item.nodes?size gt 0>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle menu_a" data-toggle="dropdown" aria-expanded="false">
                                    <i class="${item.icon?if_exists}"></i>${item.name?if_exists} <span
                                        class="caret"></span>
                                </a>
                                <ul class="dropdown-menu" role="menu">
                                    <#list item.nodes as node>
                                        <li><a href="/type/${node.id}" >${node.name?if_exists}</a></li>
                                    </#list>
                                </ul>
                            </li>
                        <#else>
                            <li><a href="/type/${item.id}" class="menu_a"><i
                                    class="${item.icon?if_exists}"></i>${item.name?if_exists}</a></li>
                        </#if>
                    </#list>
                </#if>
            </@zhydTag>


            </ul>
        </div>
    </div>
</nav>