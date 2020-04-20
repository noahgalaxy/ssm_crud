<%--
  Created by IntelliJ IDEA.
  User: Fisheep
  Date: 2020/4/8
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<html>


<%--这里是使用Ajax请求的页面--%>
<head>
    <%@ page language="java" isELIgnored="false" contentType="text/html;charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%--    <%--%>
    <%--        pageContext.setAttribute("APP_PATH", request.getContextPath());--%>
    <%--    %>--%>
    <script type="text/javascript" src="/ssm_crud/static/js/jquery-1.12.4.min.js"></script>
    <%--引入bootstrap--%>
    <link href="/ssm_crud/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="/ssm_crud/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <title>员工列表</title>
</head>
<body>

<!-- Modal 模态框，员工修改模态框-->
<div class="modal fade" id="empModifyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="empModifyModalLabel">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="emp_modify_form">
                    <div class="form-group" id = "empName_modify_class">
                        <%-- for是指定为了哪个输入框的，填他的id--%>
                        <label for="emp_add_name" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id = "emp_modify_name">姓名示例</p>
                            <%-- 注意表单里面所有的需要传给后端的都需要加name属性，且name的属性值需要和bean里面的一致才能自动封装为bean对象--%>
<%--                            <input type="text" name="empName" class="form-control" id="emp_modify_name" placeholder="empName">--%>
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <%--                                这种靠点选的需要指定一个value属性值传给后端--%>
                                <input type="radio" name="gender" id="modify_gender1" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="modify_gender2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group" id="email_modify_class">
                        <%--                        for是指定为了哪个输入框的，填他的id--%>
                        <label for="emp_add_name" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="emp_modify_email" placeholder="asdfa@fisheep.com">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4" id="modify_depts_div">
<%--                            这里面用来添加options--%>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_modify_save_btn">提交</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal 模态框，员工添加模态框-->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="emp_add_form">
                    <div class="form-group" id = "empName_add_class">
<%--                        for是指定为了哪个输入框的，填他的id--%>
                        <label for="emp_add_name" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
<%--                       注意表单里面所有的需要传给后端的都需要加name属性，且name的属性值需要和bean里面的一致才能自动封装为bean对象--%>
                            <input type="text" name="empName" class="form-control" id="emp_add_name" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
<%--                                这种靠点选的需要指定一个value属性值传给后端--%>
                                <input type="radio" name="gender" id="gender1" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group" id="email_addd_class">
                        <%--                        for是指定为了哪个输入框的，填他的id--%>
                        <label for="emp_add_name" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="emp_add_email" placeholder="asdfa@fisheep.com">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4" id="depts_div">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <%--        标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM_CRUD</h1>
        </div>
    </div>
    <%--    按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button  class="btn btn-success" id="emp_add_modal_btn">新增</button>
            <button type="button" class="btn btn-danger", id="emps_delete_all_btn">删除</button>
        </div>
    </div>
    <%--    表格--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr >
                    <th>
                        <input type="checkbox" class="check-all">
                    </th>
                    <th>id</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <%--    分页条--%>
    <div class="row">
        <%--            分页信息--%>
        <div class="col-md-6" id="page_info_aera">
        </div>
        <%--    分页条--%>
        <div class="col-md-6 col-md-offset-8">
            <nav aria-label="Page navigation" id="navigation_bar">
                <ul class="pagination">
                </ul>
            </nav>
        </div>

    </div>
</div>
<script type="text/javascript">
    var currentPage;
    var totalRecords;
    // 这个函数带了$的是第一次进入这个html页面等html加载完成就立马调用这个函数
    $(function () {
       to_page(1)
        // 给邮件文本框绑定change事件
        modal_email_bind("#emp_add_email");
        modal_email_bind("#emp_modify_email");
    });
    function to_page(pn) {
        //进入每一页首先将该页的checked属性设置为false，即没有全选状态
        $(".check-all").prop("checked", false);
        $.ajax({
            url:"/ssm_crud/empsajax",
            data:"pn="+pn,
            type:"GET",
            // 这个success是如果请求成功了要调用什么方法对拿到的json字符串做处理
            success:function (result) {
                // console.log(result);
                // 这里调用下面的函数
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);

            }
        });
    }
    function build_emps_table(result) {
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        // 这里使用jquery提供的each方法对emps进行遍历，function是对每一个遍历做什么操作，
        // function里面的每一个item就是取出来的emps列表里面的一条数据
        $.each(emps, function (index, item) {
            // alert(item.empName);
            // 遍历出来的每一个员工的数据
            var singleEmpCheckTd = $("<td><input type='checkbox' class='check-single'></td>"); //每一个员工前面的checkbox
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender == 'M'?"男":"女");
            var emailTd = $("<td></td>").append(item.email);
            var departmentTd = $("<td></td>").append(item.department.deptName);
            /**
            <button type="button" class="btn btn-success btn-sm" >
                <%--  这个是图标span，class表示具体的图表样式--%>
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
            修改
            </button>
             */
            var modifyBtn = $("<button></button>").addClass("btn btn-success btn-sm emp-modify")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑").attr("empid",item.empId);
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm emp-single-delete")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除").attr("empid",item.empId);
            var btnTd = $("<td></td>").append(modifyBtn).append(" ").append(deleteBtn);
            $("<tr> </tr>").append(singleEmpCheckTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(departmentTd)
                .append(btnTd)
                // 这里是一个id选择器，将这个构建好的表格添加到id为emps_table的标签下的tbody标签中
                .appendTo("#emps_table tbody");
        })
    }
    function build_page_info(result) {
        totalRecords = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
        $("#page_info_aera").empty();
        $("#page_info_aera").append("第 "+result.extend.pageInfo.pageNum+" 页,共 "
            + result.extend.pageInfo.pages+" 页,总 "
            + result.extend.pageInfo.total+"  条记录");
    }
    function build_page_nav(result) {
        $("#navigation_bar").empty();

<%--        <c:if test="${navigatepageNums == pageInfo.pageNum}">--%>
<%--    <li class="active"><a href="#">${navigatepageNums}</a></li>--%>
<%--        </c:if>--%>
<%--        <c:if test="${navigatepageNums != pageInfo.pageNum}">--%>
<%--        <li><a href="/ssm_crud/emps?pn=${navigatepageNums}">${navigatepageNums}</a></li>--%>
<%--        </c:if>--%>
        var currentPageNum = result.extend.pageInfo.pageNum;
        var navigetionUl = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        firstPageLi.click(function (){to_page(1);});
        var endPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        endPageLi.click(function (){to_page(result.extend.pageInfo.pages);});
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        prePageLi.click(function (){to_page(result.extend.pageInfo.pageNum - 1);});
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        nextPageLi.click(function (){to_page(result.extend.pageInfo.pageNum + 1);});
        if(result.extend.pageInfo.hasPreviousPage){
            navigetionUl.append(firstPageLi).append(prePageLi);
        }

        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var navigateLi;
            if (item == currentPageNum){
                navigateLi = $("<li></li>").addClass("active").append($("<a></a>").append(item));
            }else{
                navigateLi = $("<li></li>").append($("<a></a>").append(item));
            }
            navigateLi.click(function () {
                to_page(item);
            });
            navigetionUl.append(navigateLi);
        });
        if(result.extend.pageInfo.hasNextPage){
            navigetionUl.append(nextPageLi).append(endPageLi);
        }
        $("#navigation_bar").append(navigetionUl);
    }
    // 校验姓名的时候不能只用正则表达式校验，还需要再数据库中查询是否重复,给姓名输入框绑定一个change事件，
    // 输入框中一发生变化就发送ajax请求查询
    $("#emp_add_name").change(function () {
        var flag = true;
        var empName = this.value;
        var empNameReg = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if(!empNameReg.test(empName)){
            show_validate_info("#emp_add_name",false, "用户名为6-16为英文和数字组合或者2-5位中文");
            // 再给这个#emp_add_name这个id所在元素添加属性表示校验失败，后面点击提交按钮的时候需要查看这个属性
            $("#emp_save_btn").attr("empNameCheck","failed");
            flag = false;
        }
        if(flag){
            $.ajax({
                url:"/ssm_crud/checkuser",
                type:"GET",
                data: "empName="+empName,
                success:function (result) {
                    if(result.code == 100){
                        show_validate_info("#emp_add_name",true, "用户名可用");
                        $("#emp_save_btn").attr("empNameCheck","passed");
                    }else{
                        show_validate_info("#emp_add_name",false, "用户名不可用");
                        $("#emp_save_btn").attr("empNameCheck","failed");
                    }
                }
            })
        }
    });

    function modal_email_bind(element){
        var modal_save_btn;
        if (element == "#emp_add_email"){
            console.log("111:", element == "#emp_add_email");
            modal_save_btn = "#emp_save_btn";
        }else if(element == "#emp_modify_email"){
            console.log("222:", element == "#emp_modify_email");
            modal_save_btn = "#emp_modify_save_btn";
        }
        console.log("modal_email_bind:",element)
        $(element).change(function () {
            var flag = true;
            console.log(flag);
            var email = $(element).val();
            console.log("email:",email);
            var emailReg = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
            if(!emailReg.test(email)){
                show_validate_info(element,false, "邮箱格式不正确");
                $(modal_save_btn).attr("emailCheck","failed");
                flag = false;
            }
            if(flag){
                $.ajax({
                    url:"/ssm_crud/checkemail",
                    type:"GET",
                    data: "email="+email,
                    success:function (result) {
                        if(result.code == 100){
                            show_validate_info(element,true, "邮箱可用");
                            $(modal_save_btn).attr("emailCheck","passed");
                        }else{
                            show_validate_info(element,false, "邮箱重复");
                            $(modal_save_btn).attr("emailCheck","failed");
                        }
                    }
                })
            }
        });
    }


    function show_validate_info(id, success, msg) {
        // $(id).next().remove();
        $(id).parent().removeClass("has-success");
        $(id).parent().removeClass("has-error");
        if(!success){
            $(id).next("span").text(msg);
            $(id).parent().addClass("has-error");
            flag = false;
        }else{
            $(id).parent().addClass("has-success");
            $(id).next("span").text(msg);
        }
    }
    // // 校验表单数据
    // function validate_add_form(){
    //     // 获取文本框的值
    //     var flag=true;
    //     var empName = $("#emp_add_name").val();
    //     var email = $("#emp_add_email").val();
    //     // var empNameReg = "/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]+$)/";
    //     var empNameReg = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
    //     var emailReg = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
    //     if(!emailReg.test(email)){
    //         show_validate_info("#emp_add_email",emailReg.test(email), "邮箱格式不正确")
    //         flag = false;
    //     }else{
    //         show_validate_info("#emp_add_email",emailReg.test(email), "");
    //     }
    //     if(!empNameReg.test(empName)){
    //         show_validate_info("#emp_add_name",empNameReg.test(empName), "用户名为6-16为英文和数字组合或者2-5位中文");
    //         flag = false;
    //     }else{
    //         show_validate_info("#emp_add_name",empNameReg.test(empName), "");
    //     }
    //     return flag;
    // }
    // 给模态框的保存按钮绑定事件
    $("#emp_save_btn").click(function () {
        if(!(($("#emp_save_btn").attr("emailCheck") == "passed") &&($("#emp_save_btn").attr("empNameCheck") == "passed"))){
            return false;
        }
        $.ajax({
            url: "/ssm_crud/emp",
            type: "POST",
            data: $("#emp_add_form").serialize(),
            success: function (result) {
                if(result.code == 100){
                    // 1.保存成功之后需要关闭静态框
                    alert("保存成功");
                    $('#empAddModal').modal('hide');
                    // 2.然后跳转到最后一页显示保存成功的信息
                    // 因为这个result里面没有对数据库查询，所以没有记录，页面数这些参数
                    // 所以这里只需要跳转一个很大的数，如果这个数大于最大页数，那么mybatis分页插件会
                    // 自动查询最后一页的数据，可以取99999，为了保险，可以定义一个全局变量保存之前打开页面用ajax查询到的记录总数
                    // 因为记录总数总比页数多
                    to_page(totalRecords);
                }else{
                    alert("保存失败");
                    // console.log(result);
                    if(undefined != result.extend.errorFailed.email){
                        show_validate_info("#emp_add_email",false, result.extend.errorFailed.email)
                    }
                    if(undefined != result.extend.errorFailed.empName){
                        show_validate_info("#emp_add_name",false, result.extend.errorFailed.empName);
                    }
                }

            },
            error: function () {
                alert("failed");
            }
        });
    });
    // 给新增按钮绑定点击事件，即打开模态框
    $("#emp_add_modal_btn").click(function () {
        // 打开模态框的时候应该清空表单
        $("#empAddModal form")[0].reset();
        $("#empAddModal form").find("*").removeClass("has-success has-error");
        $("#empAddModal form").find(".help-block").text("");

        $("#empAddModal").modal({
            backdrop:'static'
        });
        getAllDepts("#depts_div");
        // setTimeout("$('#empAddModal').modal('hide')",5000);
    });

    // <div class="col-sm-4" id="depts_div">
    //     <select class="form-control" name="dId">
    //     <option>1</option>
    //     </select>
    //     </div>
    function getAllDepts(element){
        // 同理发送前需要清空一下，不然下拉框会有很多重复
        $(element).empty();
        $.ajax({
            url:"/ssm_crud/getAllDepts",
            type: "GET",
            success:function (result) {
                // console.log(result);
                var deptSelect = $("<select></select>").addClass("form-control").attr("name","dId")
                $.each(result.extend.depts, function (index, dept) {
                    // 这里设置的value属性是代表要提交的值
                    var deptOption = $("<option></option>").append(dept.deptName).attr("value",dept.deptId);
                    deptSelect.append(deptOption);
                });
                deptSelect.appendTo(element);
            }
        })
    }

    // 为员工信息修改按钮绑定点击事件，但是由于这个按钮是在ajax拿到信息之后生成的，所以不能用click来绑定，
    // 只能用live来绑定，但是live这个函数已经被废弃了，替代方法是on方法；
    var mpdifyEmpId;
    $(document).on("click",".emp-modify",function () {
        // 点击打开模态框的时候应该清空模态框表单
        $("#empModifyModal form")[0].reset();
        $("#empModifyModal form").find("*").removeClass("has-success has-error");
        $("#empModifyModal form").find(".help-block").text("");
        // alert($(this).text());
        // $("#emp_modify_name").val();
        $("#empModifyModal").modal({
            backdrop:'static'
        });
        // 向数据库查询所有部门，并把结果放在这个id的元素的下拉框中
        getAllDepts("#modify_depts_div");
        var empId = $(this).attr("empid");
        mpdifyEmpId = empId;
        // 然后构建ajax请求跟据id查询员工数据
        $.ajax({
            url:"/ssm_crud/emp/"+empId,
            type:"GET",
            success:function (result) {
                // alert(result.extend.emp);
                if (result.code == 100){
                    // 拿到查询到的信息，将信息回显到对应框中
                    console.log(result.extend.emp);
                    $("#emp_modify_name").text(result.extend.emp.empName);
                    $("#emp_modify_form input[name='gender']").val([result.extend.emp.gender]);
                    $("#emp_modify_email").val(result.extend.emp.email);
                    $("#modify_depts_div select").val(result.extend.emp.dId);
                }
            },
            error:function () {
                alert("请求失败");
            }
        })
    });
    // // 校验表单数据
    // function validate_add_form(){
    //     // 获取文本框的值
    //     var flag=true;
    //     var empName = $("#emp_add_name").val();
    //     var email = $("#emp_add_email").val();
    //     // var empNameReg = "/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]+$)/";
    //     var empNameReg = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
    //     var emailReg = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
    //     if(!emailReg.test(email)){
    //         show_validate_info("#emp_add_email",emailReg.test(email), "邮箱格式不正确")
    //         flag = false;
    //     }else{
    //         show_validate_info("#emp_add_email",emailReg.test(email), "");
    //     }
    //     if(!empNameReg.test(empName)){
    //         show_validate_info("#emp_add_name",empNameReg.test(empName), "用户名为6-16为英文和数字组合或者2-5位中文");
    //         flag = false;
    //     }else{
    //         show_validate_info("#emp_add_name",empNameReg.test(empName), "");
    //     }
    //     return flag;
    // }
    // 给模态框的保存按钮绑定事件
    $("#emp_modify_save_btn").click(function () {
        if (!($("#emp_modify_save_btn").attr("emailCheck") == "passed")) {
            return false;
        }
        console.log("mpdifyEmpId",mpdifyEmpId);
        $.ajax({
            url: "/ssm_crud/emp/"+mpdifyEmpId,
            type: "PUT",
            data: $("#emp_modify_form").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    // 1.保存成功之后需要关闭静态框
                    // setTimeout(alert("修改成功"),1000);
                    $('#empModifyModal').modal('hide');
                    to_page(currentPage);
                } else {
                    alert("修改失败");
                }
            },
            error: function () {
                alert("修改失败");
            }
        });
    });
    $(document).on("click",".emp-single-delete",function () {
        var empName = $(this).parents("tr").find("td:eq(1)").text();
        var empId = $(this).attr("empid");
        // 删除按钮绑定事件
        if(confirm("确认删除用户[ "+empName+" ]吗?")){
            $.ajax({
                url:"/ssm_crud/emp/"+empId,
                type:"DELETE",
                success:function (result) {
                    if (result.code == 100){
                        // alert("删除成功");
                        to_page(currentPage);
                    }else{
                        alert("系统错误：删除失败，请重试！")
                    }
                },
                error:function () {
                    alert("前端错误：删除失败，请重试！")
                }
            });
        }
    });

    //给选择checkbox绑定点击事件
    $(".check-all").click(function () {
        // $(".check-single").prop("checked", true);
        //点击总的checkbox之后，让每个员工的checkbox状态和总的checkbox一样
        //注意这里为什么要用prop而不用attr来取属性，因为attr适用于自己添加的属性，如class，id这些等，
        //      而prop适用于自己本来就有的属性如checked，selected，enables这样的；
        $(".check-single").prop("checked", $(this).prop("checked"));
    })
    $(document).on("click",".check-single", function () {
        // if($(".check-single:checked").length == $(".check-single").length){
        //     $(".check-all").prop("checked", true);
        // }else{
        //     $(".check-all").prop("checked",false);
        // }这一段代码可以精简为下面的
        var flag = $(".check-single:checked").length == $(".check-single").length;
        $(".check-all").prop("checked", flag);
    })
    $("#emps_delete_all_btn").click(function () {
        if ($(".check-single:checked").length == 0){
            alert("请选中要删除的对象!");
            return false;
        }
        var empsName = '';
        var empsId = '';
        console.log($(".check-single:checked").parents("tr").find("td:eq(2)").length);
        // var empsName = $(".check-single:checked").nextAll().find("td:eq(2)");
        $.each($(".check-single:checked"),function (index, item) {
            empsName += $(this).parents("tr").find("td:eq(2)").text()+ "，";
            empsId += $(this).parents("tr").find("td:eq(1)").text()+ "-";
        });
        empsName = empsName.substring(0, empsName.length -1);
        empsId = empsId.substring(0, empsId.length -1);
        confirm("确认删除 【"+empsName+"】 吗?");
        $.ajax({
            url:"/ssm_crud/emp/"+empsId,
            type:"DELETE",
            success:function (result) {
                if (result.code == 100){
                    to_page(currentPage);
                    alert("删除成功！");
                }else{
                    alert("系统异常删除失败，请重试！")
                }
            },
            error:function () {
                alert("前端异常删除失败，请重试！")
            }
        });
    })

</script>
</body>
</html>
