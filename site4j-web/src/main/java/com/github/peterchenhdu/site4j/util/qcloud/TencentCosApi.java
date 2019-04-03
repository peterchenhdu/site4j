/*
 * Copyright (c) 2011-2025 PiChen
 */

/**
 *
 */
package com.github.peterchenhdu.site4j.util.qcloud;

import com.github.peterchenhdu.site4j.biz.dto.ConfigDto;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysConfigService;
import com.github.peterchenhdu.site4j.enums.ImageType;
import com.github.peterchenhdu.site4j.common.util.DateTimeUtils;
import com.github.peterchenhdu.site4j.util.FileUtil;
import com.github.peterchenhdu.site4j.common.util.SpringContextHolder;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.ObjectMetadata;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.region.Region;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;

/**
 *
 */
@Slf4j
public class TencentCosApi {
    private static final Object LOCK = new Object();
    private ConfigDto config;
    private String key;
    private COSClient cosClient;

    private TencentCosApi() {
        SysConfigService configService = SpringContextHolder.getBean(SysConfigService.class);
        this.config = configService.get();

        COSCredentials cred = new BasicCOSCredentials(config.getQiniuAccessKey(),
                config.getQiniuSecretKey());
        // 2 设置bucket的区域, COS地域的简称请参照
        // https://cloud.tencent.com/document/product/436/6224
        ClientConfig clientConfig = new ClientConfig(new Region("ap-chengdu"));//"ap-chengdu"
        // 3 生成cos客户端
        cosClient = new COSClient(cred, clientConfig);
    }


    public static TencentCosApi getInstance() {
        synchronized (LOCK) {
            return new TencentCosApi();
        }
    }


    public TencentCosApi withFileName(String key, String path) {
        String suffix = FileUtil.getSuffix(key);
        // 不用时间戳命名文件，改为具体的直观的日期命名文件
        String fileName = DateTimeUtils.date2Str(LocalDateTime.now(), DateTimeUtils.YYYY_MM_DD_HH_MM_SS_SSS);
        this.key = path + (fileName + suffix);
        return this;
    }


    public String upload(InputStream fileByte, long size, String key, ImageType type) throws IOException {
        String bucketName = config.getQiniuBucketName();
        this.key = type.getPath() + (DateTimeUtils.date2Str(LocalDateTime.now(), DateTimeUtils.YYYY_MM_DD_HH_MM_SS_SSS) + FileUtil.getSuffix(key));

        // 简单文件上传, 最大支持 5 GB, 适用于小文件上传, 建议 20 M 以下的文件使用该接口
        // 大文件上传请参照 API 文档高级 API 上传
        // 指定要上传到 COS 上的路径

        ObjectMetadata meta = new ObjectMetadata();
        meta.setContentLength(size);

        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, this.key, fileByte, meta);
        cosClient.putObject(putObjectRequest);
        cosClient.shutdown();

        return this.key;
    }


    public boolean delete(String fileName) {
        try {
            cosClient.deleteObject(config.getQiniuBucketName(), fileName);
            return true;
        } catch (Exception e) {
            log.error(e.toString(), e);
        }
        return false;
    }


}
