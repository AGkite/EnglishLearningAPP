package com.howonenew.admin.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {
    /**
     * 阿里云OSS文件上传
     * @param multipartFile
     * @return {@link String}
     */
    String upload(MultipartFile multipartFile);
}
