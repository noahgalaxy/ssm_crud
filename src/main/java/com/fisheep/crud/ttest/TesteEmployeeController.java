package com.fisheep.crud.ttest;

import com.fisheep.crud.bean.Employee;
import com.github.pagehelper.PageInfo;
import com.sun.scenario.effect.impl.sw.java.JSWBlend_SRC_OUTPeer;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 使用spring的单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration //这个注解用来注入WebApplicationContext对象
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springmvc.xml"}) //这是spring测试的注解,注意要加类路径classpath
public class TesteEmployeeController {
    @Autowired
    private WebApplicationContext context;
//    虚拟一个mvc请求，获取处理结果
    MockMvc mockMvc;

    @Before
    public void initMock(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }
    @Test
    public void testPage() throws Exception {
//        模拟get方法，后面的param是模拟页面传入的参数，键值对,最后andReturn()拿到返回值
      MvcResult mvcResult =  (mockMvc.perform(MockMvcRequestBuilders.post("/emps").param("pn", "1"))).andReturn();
//      然后取出Controller通过Model对象给请求域中传回来的pageInfo对象进行验证
        HttpServletRequest request = mvcResult.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码："+pageInfo.getPageNum());
        System.out.println("总页码："+pageInfo.getPages());
        System.out.println("总记录数："+pageInfo.getTotal());
        System.out.println("显示条数：");
        for(int i: pageInfo.getNavigatepageNums()){
            System.out.print(i+"\t");
        }
        List<Employee> list = pageInfo.getList();
        for(Employee employee: list){
            System.out.println(employee);
        }
    }
}
