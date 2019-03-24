/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.core.runner;

import club.peterchenhdu.biz.entity.Resource;
import club.peterchenhdu.biz.service.privilegemgt.SysResourcesService;
import club.peterchenhdu.biz.web.SpringInit;
import club.peterchenhdu.common.annotation.PublicService;
import club.peterchenhdu.common.enums.ResourceTypeEnum;
import club.peterchenhdu.common.util.DateUtils;
import club.peterchenhdu.common.util.ObjectUtils;
import club.peterchenhdu.common.util.UuidUtils;
import club.peterchenhdu.core.job.base.AbstractBaseCronJob;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
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
import java.io.FileFilter;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.net.JarURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.stream.Collectors;

/**
 * 程序启动后通过ApplicationRunner处理一些事务
 *
 * @author chenpi
 * @version 1.0
 *
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

        ApplicationContext context =SpringInit.getApplicationContext();
        Map<String, AbstractBaseCronJob> map =  context.getBeansOfType(AbstractBaseCronJob.class);
        map.values().forEach(AbstractBaseCronJob::scheduleJobs);


        List<Class<?>> controllerClazzList = getClasses("club.peterchenhdu", Controller.class);


        Wrapper<Resource> wrap = new EntityWrapper<>();
        wrap.isNotNull("url");
        List<Resource> resourceList = sysResourcesService.selectList(wrap);
        Map<String , Resource> resourceMap = resourceList.stream().collect(Collectors.toMap(Resource::getUrl, dto-> dto));
        List<Resource> newResourceList = new ArrayList<>();

        for (Class<?> beanType : controllerClazzList) {

            if(ObjectUtils.isEmpty(beanType)) {
                continue;
            }

            Api api = beanType.getAnnotation(Api.class);
            RequestMapping requestMapping = beanType.getAnnotation(RequestMapping.class);
            if(ObjectUtils.isEmpty(api)) {
                continue;
            }

            if(ObjectUtils.isEmpty(requestMapping.value()) || !requestMapping.value()[0].startsWith("/admin")) {
continue;
            }

            System.out.println(api.value() + ":" + requestMapping.value()[0]);
            String[] urlArr = requestMapping.value()[0].split("/");

            Resource parentResource = new Resource();
            parentResource.setIcon("");
            parentResource.setId(UuidUtils.getUuid());
            parentResource.setName(api.value());
            parentResource.setParentId("");
            parentResource.setPermission(urlArr[urlArr.length-1]);
            parentResource.setType(ResourceTypeEnum.MENU.getKey());
            parentResource.setUrl(requestMapping.value()[0]);
            newResourceList.add(parentResource);



            Method[] methods = beanType.getDeclaredMethods();
            for(Method m:methods) {
                ApiOperation apiOperation = m.getAnnotation(ApiOperation.class);
                if(ObjectUtils.isEmpty(apiOperation)) {
                    continue;
                }

                PostMapping postMapping = m.getAnnotation(PostMapping.class);
                GetMapping getMapping = m.getAnnotation(GetMapping.class);

                String url;
                if(ObjectUtils.isEmpty(postMapping)) {
                    url = getMapping.value()[0];
                    System.out.println(apiOperation.value()+":"+getMapping.value()[0]);
                } else {
                    url =postMapping.value()[0];
                    System.out.println(apiOperation.value()+":"+postMapping.value()[0]);
                }

                if(ObjectUtils.isEmpty(url)) {
                    continue;
                }

                String[] urlArr2 = url.split("/");
                Resource resource = new Resource();
                resource.setIcon("");
                resource.setName(apiOperation.value());
                resource.setParentId(parentResource.getId());
                resource.setPermission(parentResource.getPermission()+":"+(urlArr2.length<2?"":urlArr2[1]));
                resource.setType(ResourceTypeEnum.BUTTON.getKey());
                resource.setUrl(parentResource.getUrl()+url);
                newResourceList.add(resource);
            }

        }

        Map<String , Resource> newResourceMap = newResourceList.stream().collect(Collectors.toMap(Resource::getUrl, dto->
                dto));


        List<Resource> addResourceList = new ArrayList<>();
        List<Resource> updateResourceList = new ArrayList<>();
        List<String> delResourceList = new ArrayList<>();

        for (Resource resourceTmp : newResourceList) {
            Resource r = resourceMap.get(resourceTmp.getUrl());
            if (ObjectUtils.isEmpty(r)) {
                addResourceList.add(resourceTmp);
            } else if(!r.getName().equals(resourceTmp.getName()) ||
                    !r.getType().equals(resourceTmp.getType()) ||
                    !r.getPermission().equals(resourceTmp.getPermission()) ) {
                //修改
                r.setName(resourceTmp.getName());
                r.setType(resourceTmp.getType());
                r.setPermission(resourceTmp.getPermission());
                updateResourceList.add(r);
            } else {
                //未修改
            }
        }

        for(Resource resourceTmp : resourceList) {
            if (ObjectUtils.isEmpty(newResourceMap.get(resourceTmp.getUrl()))) {
                delResourceList.add(resourceTmp.getId());
            }
        }


        if(ObjectUtils.isNotEmpty(updateResourceList))
        sysResourcesService.updateBatchById(updateResourceList);
        if(ObjectUtils.isNotEmpty(addResourceList))
        sysResourcesService.insertBatch(addResourceList);
        if(ObjectUtils.isNotEmpty(delResourceList))
        sysResourcesService.deleteBatchIds(delResourceList);


        log.info("博客部署完成，当前时间：" + DateUtils.date2Str(LocalDateTime.now(), DateUtils.YYYY_MM_DD_HH_MM_SS));
    }


    public static List<Class<?>> getClasses(String packageName, Class<? extends Annotation> annotationType){

        //第一个class类的集合
        List<Class<?>> classes = new ArrayList<>();
        //是否循环迭代
        boolean recursive = true;
        //获取包的名字 并进行替换
        String packageDirName = packageName.replace('.', '/');
        //定义一个枚举的集合 并进行循环来处理这个目录下的things
        Enumeration<URL> dirs;
        try {
            dirs = Thread.currentThread().getContextClassLoader().getResources(packageDirName);
            //循环迭代下去
            while (dirs.hasMoreElements()){
                //获取下一个元素
                URL url = dirs.nextElement();
                //得到协议的名称
                String protocol = url.getProtocol();
                //如果是以文件的形式保存在服务器上
                if ("file".equals(protocol)) {
                    //获取包的物理路径
                    String filePath = URLDecoder.decode(url.getFile(), "UTF-8");
                    //以文件的方式扫描整个包下的文件 并添加到集合中
                    findAndAddClassesInPackageByFile(packageName, filePath, recursive, classes);
                } else if ("jar".equals(protocol)){
                    //如果是jar包文件
                    //定义一个JarFile
                    JarFile jar;
                    try {
                        //获取jar
                        jar = ((JarURLConnection) url.openConnection()).getJarFile();
                        //从此jar包 得到一个枚举类
                        Enumeration<JarEntry> entries = jar.entries();
                        //同样的进行循环迭代
                        while (entries.hasMoreElements()) {
                            //获取jar里的一个实体 可以是目录 和一些jar包里的其他文件 如META-INF等文件
                            JarEntry entry = entries.nextElement();
                            String name = entry.getName();
                            //如果是以/开头的
                            if (name.charAt(0) == '/') {
                                //获取后面的字符串
                                name = name.substring(1);
                            }
                            //如果前半部分和定义的包名相同
                            if (name.startsWith(packageDirName)) {
                                int idx = name.lastIndexOf('/');
                                //如果以"/"结尾 是一个包
                                if (idx != -1) {
                                    //获取包名 把"/"替换成"."
                                    packageName = name.substring(0, idx).replace('/', '.');
                                }
                                //如果可以迭代下去 并且是一个包
                                if ((idx != -1) || recursive){
                                    //如果是一个.class文件 而且不是目录
                                    if (name.endsWith(".class") && !entry.isDirectory()) {
                                        //去掉后面的".class" 获取真正的类名
                                        String className = name.substring(packageName.length() + 1, name.length() - 6);
                                        try {
                                            //添加到classes
                                            classes.add(Class.forName(packageName + '.' + className));
                                        } catch (ClassNotFoundException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                }
                            }
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return classes.stream().filter(clazz-> ObjectUtils.isNotEmpty(AnnotationUtils.findAnnotation(clazz,
                annotationType) )&& !clazz.isAnnotationPresent(PublicService.class))
                .collect(Collectors.toList());
    }

    /**
     * 以文件的形式来获取包下的所有Class
     * @param packageName
     * @param packagePath
     * @param recursive
     * @param classes
     */
    public static void findAndAddClassesInPackageByFile(String packageName, String packagePath, final boolean recursive, List<Class<?>> classes){
        //获取此包的目录 建立一个File
        File dir = new File(packagePath);
        //如果不存在或者 也不是目录就直接返回
        if (!dir.exists() || !dir.isDirectory()) {
            return;
        }
        //如果存在 就获取包下的所有文件 包括目录
        File[] dirfiles = dir.listFiles(new FileFilter() {
            //自定义过滤规则 如果可以循环(包含子目录) 或则是以.class结尾的文件(编译好的java类文件)
            public boolean accept(File file) {
                return (recursive && file.isDirectory()) || (file.getName().endsWith(".class"));
            }
        });
        //循环所有文件
        for (File file : dirfiles) {
            //如果是目录 则继续扫描
            if (file.isDirectory()) {
                findAndAddClassesInPackageByFile(packageName + "." + file.getName(),
                        file.getAbsolutePath(),
                        recursive,
                        classes);
            }
            else {
                //如果是java类文件 去掉后面的.class 只留下类名
                String className = file.getName().substring(0, file.getName().length() - 6);
                try {
                    //添加到集合中去
                    classes.add(Class.forName(packageName + '.' + className));
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
