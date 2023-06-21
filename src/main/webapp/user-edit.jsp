<%--
  Created by IntelliJ IDEA.
  User: patryk
  Date: 02.06.2023
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%@ include file="/header.jsp" %>
<head>
    <link href="theme/css/sb-admin-2.min.css" rel="stylesheet">
    <title>Edit User</title>
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value="/user/list"/>">
        <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3"> Admin</div>
        </a>
        <!-- Divider -->
        <hr class="sidebar-divider my-0">

    </ul>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <div class="container-fluid">
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Edit User</h1>
                    <a href="<c:url value="/user/list"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                        <i class="fas fa-download fa-sm text-white-50"></i> Back to user list </a>
                </div>

                <form action="${pageContext.request.contextPath}/user/update" method="post">
                    <input type="hidden" name="id" value="${user.id}"/>
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="${user.userName}" required/><br>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${user.email}" required/><br>
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required/><br>
                    <input type="submit" value="Save">
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="/footer.jsp" %>
</html>
