package com.howonenew.admin.controller;

import com.howonenew.admin.service.FileService;
import com.howonenew.common.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


@Slf4j
@RestController
@RequestMapping("/file")
public class FileController {

    @Autowired
    private FileService fileService;

    /**
     * 文件上传接口
     * @param file
     * @return
     */
    @PostMapping("/upload")
    public Response upload(@RequestPart("file") MultipartFile file){
        String imgFileStr = fileService.upload(file);
        if (imgFileStr== null || imgFileStr.isEmpty()) {
            return Response.fail("图片上传失败");
        }
        return Response.success(imgFileStr);
    }

    /**
     * 测试返回拼装，根据公司自己封装的统一返回去写
     * @param str
     * @return
     */
//    private Map<String,Object> buildResult(String str){
//        Map<String, Object> result = new HashMap<>();
//        //判断字符串用lang3下的StringUtils去判断，这块我就不引入新的依赖了
//        if(str== null || "".equals(str)){
//            result.put("code",10000);
//            result.put("msg","图片上传失败");
//            result.put("data",null);
//        }else{
//            result.put("code",200);
//            result.put("msg","图片上传成功");
//            result.put("data",str);
//        }
//        return result;
//    }

}
