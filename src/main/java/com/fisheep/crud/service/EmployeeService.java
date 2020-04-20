package com.fisheep.crud.service;

import com.fisheep.crud.bean.Employee;
import com.fisheep.crud.bean.EmployeeExample;
import com.fisheep.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    @Qualifier(value = "employeeMapper")
    private EmployeeMapper employeeMapper;

    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    public void saveEmp(Employee emp) {
        employeeMapper.insertSelective(emp);
    }

    /**
     * 如果count==0，说明数据库里面没有信息，名字正确
     * @param empName
     * @return
     */
    public boolean checkUser(String empName) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(employeeExample);
        return count == 0;
    }

    public boolean checkEmail(String email) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmailEqualTo(email);
        long count = employeeMapper.countByExample(employeeExample);
        return count == 0;
    }

    public Employee getEmpById(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKeyWithDept(id);
        return employee;
    }

    public int modifyEmp(Employee emp) {
        int i = employeeMapper.updateByPrimaryKeySelective(emp);
        return i;
    }

    public void deleteEmpById(Integer empId) {
        employeeMapper.deleteByPrimaryKey(empId);
    }

    public void deleteEmpByBachIds(List<Integer> idList) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpIdIn(idList);
        employeeMapper.deleteByExample(employeeExample);
    }
}
