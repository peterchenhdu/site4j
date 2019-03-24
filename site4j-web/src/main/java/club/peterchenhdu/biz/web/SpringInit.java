/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.biz.web;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
 
 @Component
public class SpringInit implements ServletContextListener {
     
 
    private static WebApplicationContext springContext;
     
    public SpringInit() {
        super();
    }
     
    public void contextInitialized(ServletContextEvent event) {
        springContext = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
    }
     
 
    public void contextDestroyed(ServletContextEvent event) {
    }
     
    public static ApplicationContext getApplicationContext() {
        return springContext;
    }
 
     
}