package com.fisheep.crud.test;

import org.springframework.test.context.ContextConfiguration;

/**
 * 1.导入spring test模块
 * 2.使用ContextConfiguration注解自动根据额spring的配置文件创建出IOC容器
 */
@ContextConfiguration(locations = {"applicationContext.xml"}) //这是spring测试的注解
public class TestMapper {
    public void testMapper(){

    }
}
