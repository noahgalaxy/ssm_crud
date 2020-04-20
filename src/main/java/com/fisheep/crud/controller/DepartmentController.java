package com.fisheep.crud.controller;


import com.fisheep.crud.bean.Department;
import com.fisheep.crud.bean.Msg;
import com.fisheep.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

//    查询所有部门
    @RequestMapping(path = "/getAllDepts")
    @ResponseBody
    public Msg getAllDepts(){
        List<Department> depts = departmentService.getAllDepts();
//        System.out.println(depts);
        return Msg.success().add("depts", depts);
    }



}
