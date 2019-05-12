/*
 * Copyright (c) 2011-2025 PiChen
 */

/**
 *
 */
package com.github.peterchenhdu.site4j.util.qcloud;

import com.github.peterchenhdu.site4j.biz.dto.ConfigDto;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysConfigService;
import com.github.peterchenhdu.site4j.common.exception.CommonRuntimeException;
import com.github.peterchenhdu.site4j.common.util.DateTimeUtils;
import com.github.peterchenhdu.site4j.common.util.LogUtils;
import com.github.peterchenhdu.site4j.common.util.holder.SpringContextHolder;
import com.github.peterchenhdu.site4j.enums.ImageType;
import com.github.peterchenhdu.site4j.util.FileUtil;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.ObjectMetadata;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.region.Region;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;

/**
 * 腾讯云文件处理工具类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class TencentCosUtils {
    private ConfigDto config;
    private COSClient cosClient;

    /**
     * 类级的内部类，也就是静态的成员式内部类，该内部类的实例与外部类的实例
     * 没有绑定关系，而且只有被调用到才会装载，从而实现了延迟加载
     */
    private static class SingletonHolder {
        /**
         * 静态初始化器，由JVM来保证线程安全
         */
        private static TencentCosUtils instance = new TencentCosUtils();
    }

    /**
     * 获取单例
     *
     * @return TencentCosApi
     */
    public static TencentCosUtils getInstance() {
        return SingletonHolder.instance;
    }

    /**
     * 构造方法，初始化
     */
    private TencentCosUtils() {
        SysConfigService configService = SpringContextHolder.getBean(SysConfigService.class);
        this.config = configService.get();

        COSCredentials cred = new BasicCOSCredentials(config.getTencentCosAccessKey(), config.getTencentCosSecretKey());
        // 2 设置bucket的区域, COS地域的简称请参照
        // https://cloud.tencent.com/document/product/436/6224
        ClientConfig clientConfig = new ClientConfig(new Region("ap-chengdu"));//"ap-chengdu"
        // 3 生成cos客户端
        this.cosClient = new COSClient(cred, clientConfig);
    }


    /**
     * 上传文件
     *
     * @param file 文件
     * @param type 文件类型
     * @return 图片URL
     */
    public String upload(MultipartFile file, ImageType type) {
        InputStream fileByte;
        try {
            fileByte = file.getInputStream();
        } catch (IOException e) {
            LogUtils.exception(e);
            throw new CommonRuntimeException("获取文件流失败");
        }
        long size = file.getSize();
        String fileSuffix = FileUtil.getSuffix(file.getOriginalFilename());

        String bucketName = config.getTencentCosRegionName();
        String key = type.getPath() + DateTimeUtils.date2Str(LocalDateTime.now(), DateTimeUtils.YYYY_MM_DD_HH_MM_SS_SSS) + fileSuffix;

        // 简单文件上传, 最大支持 5 GB, 适用于小文件上传, 建议 20 M 以下的文件使用该接口
        // 大文件上传请参照 API 文档高级 API 上传
        // 指定要上传到 COS 上的路径
        ObjectMetadata meta = new ObjectMetadata();
        meta.setContentLength(size);

        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, fileByte, meta);
        cosClient.putObject(putObjectRequest);
        cosClient.shutdown();
        return key;
    }


    /**
     * 删除腾讯云上的文件
     *
     * @param key 文件标识
     * @return 是否删除成功
     */
    public boolean delete(String key) {
        try {
            cosClient.deleteObject(config.getTencentCosRegionName(), key);
            return true;
        } catch (Exception e) {
            LogUtils.exception(e);
        }
        return false;
    }


}
