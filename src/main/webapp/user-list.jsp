<%--
  Created by IntelliJ IDEA.
  User: patryk
  Date: 01.06.2023
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%@ include file="/header.jsp" %>
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value="/user/list"/>">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3"> Admin </div>
        </a>
        <!-- Divider -->
        <hr class="sidebar-divider my-0">
    </ul>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
</div>
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">UsersCRUD</h1>
                    <a href="<c:url value="/user-form.jsp"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                        <i class="fas fa-download fa-sm text-white-50"></i> Add User</a>
                </div>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h3 class="m-0 font-weight-bold text-primary">User List</h3>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table">

                <div class="card shadow mb-4">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach items="${users}" var="user">

                        <tr>
                        <td>${user.getId()}</td>
                        <td>${user.getUserName()}</td>
                        <td>${user.getEmail()}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/user/show?id=${user.getId()}">View</a>
                            <a href="${pageContext.request.contextPath}/user/edit?id=${user.getId()}">Edit</a>
                            <a href="${pageContext.request.contextPath}/user/delete?id=${user.getId()}">Delete</a>
                        </td>
                    </tr>
                    </c:forEach>

            </table>
        </div>
    </div>
</div>
</div>
        </div>
        </div>
        </div>

</body>
<%@ include file="/footer.jsp" %>
</html>