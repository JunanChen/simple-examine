package com.cdtu.simpleexamine.web.controller;

import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

/**
 * @author junan
 * @version V1.0
 * @className UploadController
 * @disc  上传接口
 * @date 2019/10/24 13:07
 */
@RestController
@RequestMapping("/upload")
public class UploadController {

    private static String BASE_PATH;

    @Value("${system.staff.avatar.location}")
    private String STAFF_AVATAR_LOCATION;

    @Value("${system.admin.avatar.location}")
    private String ADMIN_AVATAR_LOCATION;


    /**
     * 上传员工头像
     * @param file
     * @return
     */
    @PostMapping("/staff/avatar")
    public SystemBaseDto uploadStaffAvatar(@RequestParam("file") MultipartFile file) {
        if(BASE_PATH == null || STAFF_AVATAR_LOCATION == null)
            checkPath(STAFF_AVATAR_LOCATION);
        String path = write(STAFF_AVATAR_LOCATION, file, "jpg");
        if(path != null) {
            return SystemBaseDto.getOK(path, null);
        } else {
            return SystemBaseDto.getFAIL("头像上传失败！");
        }
    }

    /**
     * 上传管理员头像
     * @param file
     * @return
     */
    @PostMapping("/admin/avatar")
    public SystemBaseDto uploadAdminAvatar(@RequestParam("file") MultipartFile file) {
        if(BASE_PATH == null || ADMIN_AVATAR_LOCATION == null)
            checkPath(ADMIN_AVATAR_LOCATION);
        String path = write(ADMIN_AVATAR_LOCATION, file, "jpg");
        if(path != null) {
            return SystemBaseDto.getOK(path, null);
        } else {
            return SystemBaseDto.getFAIL("头像上传失败！");
        }
    }

    /**
     * 将图片写入硬盘
     * @param location
     * @param file
     * @param suffix
     * @return
     */
    private String write(String location, MultipartFile file, String suffix) {
        String fileName = location + "/" + UUIDUtil.get32UUID() + "." + suffix;
        try {
            BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream(BASE_PATH + "/" + fileName));
            BufferedInputStream inputStream = new BufferedInputStream(file.getInputStream());
            byte[] bytes = new byte[1024 * 1];
            int len = 0;
            while ((len = inputStream.read(bytes, 0, bytes.length)) != -1) {
                outputStream.write(bytes, 0, len);
            }
            inputStream.close();
            outputStream.close();
            return fileName;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 检查路径和文件夹是否存在
     */
    private void checkPath(String path) {
        try {
            BASE_PATH = ResourceUtils.getURL("classpath:").getPath();
            File file = new File(BASE_PATH + path);
            if(!file.exists() || !file.isDirectory()) {
                file.mkdirs();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
}