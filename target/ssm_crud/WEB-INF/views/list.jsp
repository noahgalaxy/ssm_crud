<%--
  Created by IntelliJ IDEA.
  User: Fisheep
  Date: 2020/4/8
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<html>

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
                <button  class="btn btn-success">新增</button>
                <button type="button" class="btn btn-danger">删除</button>
            </div>
        </div>
<%--    表格--%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
<%--                    tr控制一行--%>
                        <tr >
 <%--                        th控制一行里面的格子--%>
                            <th>id</th>
                            <th>empName</th>
                            <th>gender</th>
                            <th>email</th>
                            <th>deptName</th>
                            <th>操作</th>
                        </tr>
<%--                        用foreach拿出来查出来的列表，列表每一个元素放在emp里面--%>
                        <c:forEach items="${pageInfo.list}" var="emp">
                            <tr>
                                <th>${emp.empId}</th>
                                <th>${emp.empName}</th>
                                <th>${emp.gender == "M"?"男":"女"}</th>
                                <th>${emp.email}</th>
                                <th>${emp.department.deptName}</th>
                                <th>
                                    <button type="button" class="btn btn-success btn-sm" >
                                            <%--  这个是图标span，class表示具体的图表样式--%>
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                        修改
                                    </button>
                                    <button type="button" class="btn btn-danger btn-sm">
                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                        删除
                                    </button>
                                </th>
                            </tr>
                        </c:forEach>

                </table>
            </div>
        </div>
<%--    分页条--%>
        <div class="row">
<%--            分页信息--%>
            <div class="col-md-6">
                第 ${pageInfo.pageNum} 页,共 ${pageInfo.pages} 页,总 ${pageInfo.total} 条记录
            </div>
<%--    分页条--%>
            <div class="col-md-6 col-md-offset-8">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
<%--                        如果当前页不是首页才显示“首页标签”--%>
                        <c:if test="${pageInfo.pageNum != pageInfo.firstPage}">
                            <li><a href="/ssm_crud/emps?pn=1">首页</a></li>
                        </c:if>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="/ssm_crud/emps?pn=${pageInfo.pageNum - 1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="navigatepageNums">
                            <c:if test="${navigatepageNums == pageInfo.pageNum}">
                                <li class="active"><a href="#">${navigatepageNums}</a></li>
                            </c:if>
                            <c:if test="${navigatepageNums != pageInfo.pageNum}">
                                <li><a href="/ssm_crud/emps?pn=${navigatepageNums}">${navigatepageNums}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="/ssm_crud/emps?pn=${pageInfo.pageNum + 1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum != pageInfo.lastPage}">
                            <li><a href="/ssm_crud/emps?pn=${pageInfo.pages}">末页</a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>

        </div>
    </div>
</body>
</html>
