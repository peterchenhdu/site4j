/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.core.runner;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.github.peterchenhdu.site4j.BlogWebApplication;
import com.github.peterchenhdu.site4j.biz.entity.Resource;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysResourcesService;
import com.github.peterchenhdu.site4j.common.annotation.PublicService;
import com.github.peterchenhdu.site4j.common.constant.CommonConstants;
import com.github.peterchenhdu.site4j.enums.ResourceTypeEnum;
import com.github.peterchenhdu.site4j.common.util.DateTimeUtils;
import com.github.peterchenhdu.site4j.common.util.LogUtils;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import com.github.peterchenhdu.site4j.core.job.base.AbstractBaseCronJob;
import com.github.peterchenhdu.site4j.common.util.holder.SpringContextHolder;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.ApplicationContext;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.net.JarURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.time.LocalDateTime;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.stream.Collectors;

/**
 * 程序启动后通过ApplicationRunner处理一些事务
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/6/6 16:07
 * @since 1.0
 */
@Slf4j
@Component
public class BlogApplicationRunner implements ApplicationRunner {

    @Autowired
    private SysResourcesService sysResourcesService;

    @Transactional
    @Override
    public void run(ApplicationArguments applicationArguments) {
        //程序启动完成，执行一些初始化操作
        ApplicationContext appContext = SpringContextHolder.getApplicationContext();

        //启动所有任务
        Map<String, AbstractBaseCronJob> map = appContext.getBeansOfType(AbstractBaseCronJob.class);
        map.values().forEach(AbstractBaseCronJob::scheduleJobs);


        //获取所有controller
        List<Class<?>> controllerClazzList = getPackageClasses(BlogWebApplication.ROOT_PACKAGE_PATH).stream()
                .filter(clazz -> ObjectUtils.isNotEmpty(AnnotationUtils.findAnnotation(clazz, Controller.class))
                        && !clazz.isAnnotationPresent(PublicService.class))
                .collect(Collectors.toList());


        Wrapper<Resource> wrap = new EntityWrapper<>();
        wrap.isNotNull("url");
        List<Resource> oldDbResourceList = sysResourcesService.selectList(wrap);
        Map<String, Resource> resourceMap = oldDbResourceList.stream().collect(Collectors.toMap(Resource::getUrl, dto -> dto));
        Set<Resource> newCodeResourceList = new HashSet<>();

        int k = 0;
        for (int i = 0; i< controllerClazzList.size();i++) {

            Class<?> beanType = controllerClazzList.get(i);

            if (ObjectUtils.isEmpty(beanType)) {
                continue;
            }

            Api api = beanType.getAnnotation(Api.class);
            RequestMapping requestMapping = beanType.getAnnotation(RequestMapping.class);

            if (ObjectUtils.isEmpty(api) || ObjectUtils.isEmpty(requestMapping.value()) ||
                    !requestMapping.value()[0].startsWith("/admin")) {
                continue;
            }

            String[] tags = api.tags();
            String parentId = "";
            if (ObjectUtils.isNotEmpty(tags)) {
                Wrapper<Resource> nameWrap = new EntityWrapper<>();
                nameWrap.eq("name", tags[0]);
                nameWrap.isNull("parent_id");
                List<Resource> parentMenu = sysResourcesService.selectList(nameWrap);
                List<Resource> newCodeParentMenuList = newCodeResourceList.stream()
                        .filter(dto -> tags[0].equals(dto.getName()) && ObjectUtils.isEmpty(dto.getParentId()))
                        .collect(Collectors.toList());

                if (ObjectUtils.isNotEmpty(parentMenu)) {
                    newCodeResourceList.add(parentMenu.get(0));
                    parentId = parentMenu.get(0).getId();
                } else if (ObjectUtils.isNotEmpty(newCodeParentMenuList)) {
                    newCodeResourceList.add(newCodeParentMenuList.get(0));
                    parentId = newCodeParentMenuList.get(0).getId();
                } else {
                    parentId = UuidUtils.getUuid();
                    Resource menuResource = new Resource();
                    menuResource.setIcon("");
                    menuResource.setId(parentId);
                    menuResource.setName(tags[0]);
                    menuResource.setParentId("");
                    menuResource.setPermission(ToPinyin(tags[0]));
                    menuResource.setType(ResourceTypeEnum.MENU.getKey());
                    menuResource.setUrl("/admin/" + ToPinyin(tags[0]));
                    menuResource.setSort(++k);
                    newCodeResourceList.add(menuResource);
                }
            }


            System.out.println(api.value() + ":" + requestMapping.value()[0]);
            String[] urlArr = requestMapping.value()[0].split("/");


            Resource parentResource ;
            List<Resource> newCodeParentMenuList = oldDbResourceList.stream()
                    .filter(dto -> requestMapping.value()[0].equals(dto.getUrl())).collect(Collectors.toList());
            if(ObjectUtils.isNotEmpty(newCodeParentMenuList)){
                parentResource = newCodeParentMenuList.get(0);
            } else {
                parentResource = new Resource();
                parentResource.setIcon("");
                parentResource.setId(UuidUtils.getUuid());
                parentResource.setName(api.value());
                parentResource.setParentId(parentId);
                parentResource.setPermission(urlArr[urlArr.length - 1]);
                parentResource.setType(ResourceTypeEnum.MENU.getKey());
                parentResource.setUrl(requestMapping.value()[0]);
                parentResource.setSort(i + 1);
            }

            newCodeResourceList.add(parentResource);


            Method[] methods = beanType.getDeclaredMethods();
            for (int j = 0; j<methods.length;j++) {
                Method m = methods[j];
                ApiOperation apiOperation = m.getAnnotation(ApiOperation.class);
                if (ObjectUtils.isEmpty(apiOperation)) {
                    continue;
                }

                PostMapping postMapping = m.getAnnotation(PostMapping.class);
                GetMapping getMapping = m.getAnnotation(GetMapping.class);

                String url;
                if (ObjectUtils.isEmpty(postMapping)) {
                    url = getMapping.value()[0];
                    System.out.println(apiOperation.value() + ":" + getMapping.value()[0]);
                } else {
                    url = postMapping.value()[0];
                    System.out.println(apiOperation.value() + ":" + postMapping.value()[0]);
                }

                if (ObjectUtils.isEmpty(url)) {
                    continue;
                }

                String[] urlArr2 = url.split("/");
                Resource resource = new Resource();
                resource.setIcon("");
                resource.setName(apiOperation.value());
                resource.setParentId(parentResource.getId());
                resource.setPermission(parentResource.getPermission() + ":" + (urlArr2.length < 2 ? "" : urlArr2[1]));
                resource.setType(ResourceTypeEnum.BUTTON.getKey());
                resource.setUrl(parentResource.getUrl() + url);
                resource.setSort(j+1);
                newCodeResourceList.add(resource);
            }

        }

        Map<String, Resource> newResourceMap = newCodeResourceList.stream().collect(Collectors.toMap(Resource::getUrl, dto -> dto));

        List<Resource> addResourceList = new ArrayList<>();
        List<Resource> updateResourceList = new ArrayList<>();
        List<String> delResourceList = new ArrayList<>();

        for (Resource resourceTmp : newCodeResourceList) {
            Resource r = resourceMap.get(resourceTmp.getUrl());
            if (ObjectUtils.isEmpty(r)) {
                addResourceList.add(resourceTmp);
            } else if (!r.getName().equals(resourceTmp.getName()) ||
                    !r.getType().equals(resourceTmp.getType()) ||
                    (resourceTmp.getParentId() != null && !resourceTmp.getParentId().equals(r.getParentId())) ||
                    !r.getPermission().equals(resourceTmp.getPermission())) {
                //修改
                r.setName(resourceTmp.getName());
                r.setType(resourceTmp.getType());
                r.setPermission(resourceTmp.getPermission());
                r.setParentId(resourceTmp.getParentId());
                updateResourceList.add(r);
            } else {
                //未修改
                LogUtils.debug("{}未修改", resourceTmp.getUrl());
            }
        }

        for (Resource resourceTmp : oldDbResourceList) {
            if (ObjectUtils.isEmpty(newResourceMap.get(resourceTmp.getUrl()))) {
                //删除
                delResourceList.add(resourceTmp.getId());
            }
        }

        if (ObjectUtils.isNotEmpty(updateResourceList)) {
            sysResourcesService.updateBatchById(updateResourceList);
        }
        if (ObjectUtils.isNotEmpty(addResourceList)) {
            sysResourcesService.insertBatch(addResourceList);
        }
        if (ObjectUtils.isNotEmpty(delResourceList)) {
            sysResourcesService.deleteBatchIds(delResourceList);
        }

        log.info("博客部署完成，当前时间：" + DateTimeUtils.date2Str(LocalDateTime.now(), CommonConstants.DEFAULT_DATE_TIME_FORMAT));
    }


    /**
     * 获取包下的所有Class对象
     *
     * @param packageName packageName
     * @return List
     *//**/
    private static List<Class<?>> getPackageClasses(String packageName) {

        List<Class<?>> clazzList = new ArrayList<>();
        String packageDirName = packageName.replace('.', '/');
        Enumeration<URL> urlEnums;
        try {
            urlEnums = Thread.currentThread().getContextClassLoader().getResources(packageDirName);
            while (urlEnums.hasMoreElements()) {
                URL url = urlEnums.nextElement();
                String protocol = url.getProtocol();
                if ("file".equals(protocol)) {
                    String absolutePath = URLDecoder.decode(url.getFile(), "UTF-8");
                    getDirClass(absolutePath, packageName, clazzList);
                } else if ("jar".equals(protocol)) {
                    getJarClass(url, packageName, clazzList);
                } else {
                    throw new RuntimeException("不支持的协议");
                }
            }
        } catch (IOException e) {
            LogUtils.exception(e);
            return Collections.emptyList();
        }


        return clazzList;
    }

    /**
     * 获取目录下的所有Class对象
     *
     * @param absolutePath 包绝对路径
     * @param packageName  包名
     * @param clazzList    class对象列表
     */
    private static void getDirClass(String absolutePath, String packageName, List<Class<?>> clazzList) {
        File dir = new File(absolutePath);
        if (!dir.isDirectory()) {
            //如果不是目录，则不处理
            return;
        }

        //获取目录下的所有文件，包括目录
        //过滤
        File[] dirFiles = dir.listFiles(file -> file.isDirectory() || file.getName().endsWith(".class"));
        if (ObjectUtils.isEmpty(dirFiles)) {
            return;
        }

        for (File file : dirFiles) {
            String fileName = file.getName();
            if (file.isDirectory()) {
                getDirClass(file.getAbsolutePath(), packageName + "." + fileName, clazzList);
            } else {
                addClassToList(packageName + '.' + fileName.substring(0, fileName.length() - 6), clazzList);
            }
        }

    }

    /**
     * 获取jar下的所有Class对象
     *
     * @param url         url
     * @param packageName 包名
     * @param clazzList   class对象列表
     */
    private static void getJarClass(URL url, String packageName, List<Class<?>> clazzList) {
        String packageDirName = packageName.replace('.', '/');
        JarFile jar;

        try {
            jar = ((JarURLConnection) url.openConnection()).getJarFile();
        } catch (IOException e) {
            LogUtils.exception(e);
            return;
        }

        Enumeration<JarEntry> entries = jar.entries();
        while (entries.hasMoreElements()) {
            //获取jar里的一个实体 可以是目录 和一些jar包里的其他文件 如META-INF等文件
            JarEntry entry = entries.nextElement();
            String name = entry.getName();
            name = name.charAt(0) == '/' ? name.substring(1) : name;
            //过滤不符合要求的数据
            if (!name.startsWith(packageDirName) || !name.contains("/") || !name.endsWith(".class") || entry.isDirectory()) {
                continue;
            }

            packageName = name.substring(0, name.lastIndexOf('/')).replace('/', '.');
            String className = name.substring(packageName.length() + 1, name.length() - 6);
            addClassToList(packageName + '.' + className, clazzList);
        }

    }

    /**
     * 根据className生成Class对象添加到clazzList
     *
     * @param className className
     * @param clazzList clazzList
     */
    private static void addClassToList(String className, List<Class<?>> clazzList) {
        LogUtils.debug("scan class: {}", className);
        try {
            Class<?> clazz = Class.forName(className);
            clazzList.add(clazz);
        } catch (ClassNotFoundException | NoClassDefFoundError e) {
            LogUtils.warn("{}类未找到或未定义", className);
        }
    }

    private static String ToPinyin(String chinese) {
        StringBuilder pinyinStr = new StringBuilder();
        HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
        defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
        defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
        try {
            for (char c : chinese.toCharArray()) {
                pinyinStr.append(c > 128 ? PinyinHelper.toHanyuPinyinStringArray(c, defaultFormat)[0] : c);
            }
        } catch (BadHanyuPinyinOutputFormatCombination e) {
            LogUtils.exception(e);
        }
        return pinyinStr.toString();
    }

    public static void main(String[] args) {
        System.out.println(ToPinyin("网站管理"));


    }
}
