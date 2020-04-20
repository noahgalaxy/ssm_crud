package com.fisheep.crud.ttest;


import com.fisheep.crud.bean.Department;
import com.fisheep.crud.bean.Employee;
import com.fisheep.crud.dao.DepartmentMapper;
import com.fisheep.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * 1.导入spring test模块
 * 2.使用RunWoth注解指定使用spring的单元测试来运行juint
 * 2.使用ContextConfiguration注解自动根据额spring的配置文件创建出IOC容器
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"}) //这是spring测试的注解,注意要加类路径classpath
public class TestMapper {
    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    @Qualifier("batchSqlSessionTemplate")
    SqlSession batchSqlSession;
    @Test
    public void testCRUD(){
        String[] genders = {"M","F"};


//        System.out.println(departmentMapper);
//        departmentMapper.insertSelective(new Department(null, "开发部"));
//        departmentMapper.insertSelective(new Department(null, "测试部"));
//        employeeMapper.insertSelective(new Employee(null, "Jerry", "M", "Jerry@fisheep.com",1));

        // 批量插入
        EmployeeMapper mapper = batchSqlSession.getMapper(EmployeeMapper.class);
        for (int i=0; i<1000; i++) {
            String uuid = UUID.randomUUID().toString().substring(0, 5) + i;
            String email = uuid+"@fisheep.com";
            int dId = (int) (Math.random()*2+1);
            String gender = genders[(int)(Math.random()*2)];
            mapper.insertSelective(new Employee(null, uuid, gender, email,dId));
        }
        System.out.println("批量完成");


    }
}
