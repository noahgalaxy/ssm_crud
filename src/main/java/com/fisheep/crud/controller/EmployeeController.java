package com.fisheep.crud.controller;

import com.fisheep.crud.bean.Employee;
import com.fisheep.crud.bean.Msg;
import com.fisheep.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理员工表相关的的请求
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    /**
     * 这是传统的方法
     * 查询员工数据，且是分页查询，用了mybatishelper分页查询插件，见下网址；
     * https://github.com/pagehelper/Mybatis-PageHelper/blob/master/wikis/en/HowToUse.md
     *  这里分页查询需要传个起始页进来pn
     * @return
     */
    @RequestMapping(path = "/emps")
//    Model类是将信息放到model里面，直接传给页面，页面可以接收到model
    public String getEmps(@RequestParam(name = "pn", defaultValue = "1") Integer pn, Model model){
//        查询之前需要传入参数，起始页和每页的大小
        PageHelper.startPage(pn, 20);
//        上面那行后面紧跟着的查询就会变为一个分页查询，查询方法不需要任何更改
        List<Employee> employees = employeeService.getAll();
//        然后用PageInfo包装查询结果，这个包装后的结果里面有当前页数，总页数，还剩多少页，有无上一页，有无下一页等
//        所以此时只需要将PageInfo交给页面就行了，它里面封装了上面的详细信息，也包括查询出来的数据
//        后面一个参数6的意思是表示连续显示的页数，页面可以通过pageInfo.getNavigatepageNums()拿到连续显示的页数
        PageInfo pageInfo = new PageInfo(employees, 6);
//        将pageInfo对象传给页面
        model.addAttribute("pageInfo", pageInfo);
        return "list";
    }


    /**
     * 这是使用Ajax请求，直接返回页面所需要的json数据，
     * 使用ResponseBody注解需要导入jackson包
     * @param pn
     * @return
     */
    @RequestMapping(path = "/empsajax")
    @ResponseBody //这个注解是自动的将返回的对象转为json字符串
    public Msg getEmpsWithJson(@RequestParam(name = "pn", defaultValue = "1") Integer pn){
//        查询之前需要传入参数，起始页和每页的大小
        PageHelper.startPage(pn, 20);
//        上面那行后面紧跟着的查询就会变为一个分页查询，查询方法不需要任何更改
        List<Employee> employees = employeeService.getAll();
//        然后用PageInfo包装查询结果，这个包装后的结果里面有当前页数，总页数，还剩多少页，有无上一页，有无下一页等
//        所以此时只需要将PageInfo交给页面就行了，它里面封装了上面的详细信息，也包括查询出来的数据
//        后面一个参数6的意思是表示连续显示的页数，页面可以通过pageInfo.getNavigatepageNums()拿到连续显示的页数
        PageInfo pageInfo = new PageInfo(employees, 6);
//        return pageInfo;
//        这里我们要封装我们自己的信息，不知要封装分页的信息，因此我们定义了一个包装类，Msg，将分页信息和我们自己要
//        返回给浏览器的信息包装到一起返回给浏览器
//        因为有RespinseBody注解，所以这个返回对象会自动变为json字符串返回给浏览器
        return Msg.success().add("pageInfo", pageInfo);
    }

    //    处理新增员工信息
//    这里使用restful风格
    @RequestMapping(path = "/emp",method = RequestMethod.POST)
    @ResponseBody
//    @Valid注解是表示先要用jsr303来进行校验，校验后的结果封装到BindingResult bindingResult这里面
    public Msg addEmp(@Valid Employee emp, BindingResult bindingResult){
//        employeeService.saveEmp(emp);
        if(bindingResult.hasErrors()){
            List<FieldError> errors = bindingResult.getFieldErrors();
            Map<String, Object> map = new HashMap<>();
            for (FieldError error: errors){
                System.out.println("错误字段名："+error.getField());
                System.out.println("错误信息："+error.getDefaultMessage());
                map.put(error.getField(),error.getDefaultMessage());

            }
            return Msg.fail().add("errorFailed",map);
        }else{
            System.out.println(emp);
            employeeService.saveEmp(emp);
            return Msg.success().add("saved",emp);
        }

    }

    /**
     * 检查用户名是否和数据库里面的重复了
     */
    @RequestMapping(path = "/checkuser")
    @ResponseBody
    //@RequestParam("empName")表示明确的要取得是请求中empName属性的值
    public Msg checkUser(@RequestParam("empName") String empName){
        boolean flag = employeeService.checkUser(empName);
        if (flag){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    /**
     * 检查用户名是否和数据库里面的重复了
     */
    @RequestMapping(path = "/checkemail")
    @ResponseBody
    //@RequestParam("empName")表示明确的要取得是请求中empName属性的值
    public Msg checkEmail(@RequestParam("email") String email){
        boolean flag = employeeService.checkEmail(email);
        if (flag){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    //    这个也是restful风格
    @RequestMapping(path = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpById(@PathVariable("id") Integer id){
        System.out.println("id:"+id);
        Employee employee = employeeService.getEmpById(id);
        return Msg.success().add("emp", employee);
    }

    @RequestMapping(path = "/emp/{id}", method = RequestMethod.PUT)
    @ResponseBody
//    注意这里@PathVariable("id")Integer id这一句代码可以简化，方式为将path = "/emp/{id}"改为"/emp/{empId}"
//    这样的话路径里面的参数名称和bean里面的
    public Msg modifyEmp(@PathVariable("id")Integer id,Employee emp){
        System.out.println("旧的"+emp);
        emp.setEmpId(id);
        System.out.println("新的"+emp);
        int i = employeeService.modifyEmp(emp);
        return Msg.success().add("rowsupdated",i);
    }


    @RequestMapping(path = "emp/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmpById(@PathVariable("ids") String empIds){
        System.out.println("要删除的ids:"+empIds);
        //包含了-就说明是多个id,调用批量删除
        if(empIds.contains("-")){
            List<Integer> idList = new ArrayList<>();
            String[] ids = empIds.split("-");
            for(String empId: ids){
                idList.add(Integer.parseInt(empId));
            }
            employeeService.deleteEmpByBachIds(idList);
        }else{
            Integer empId = Integer.parseInt(empIds);
            employeeService.deleteEmpById(empId);
        }
        return Msg.success();
    }
}
