package com.cdtu.simpleexamine;

import com.cdtu.simpleexamine.mapper.PermissionMapper;
import com.cdtu.simpleexamine.pojo.dbo.Permission;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SimpleExamineApplicationTests {

    @Autowired
    private PermissionMapper permissionMapper;

    @Test
    public void contextLoads() {
        List<Permission> permissions = permissionMapper.selectListByAdminId("18a7560ad0124394bbdddfccea485c1e");
        System.out.println(permissions);
    }

}
