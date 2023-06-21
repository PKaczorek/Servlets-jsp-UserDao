<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%@ include file="/header.jsp" %>
<head>
    <link href="theme/css/sb-admin-2.min.css" rel="stylesheet">
    <title>User Form</title>
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
            <div class="sidebar-brand-text mx-3"> Admin </div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->

    </ul>

    <div id="content-wrapper" class="d-flex flex-column">


        <div id="content">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Add User</h1>
                    <a href="<c:url value="/user/list"/>"
                       class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                        <i class="fas fa-download fa-sm text-white-50"></i> User List</a>
                </div>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">User Details</h6>
                    </div>
                    <form action="${pageContext.request.contextPath}/user/add" method="POST">
                        <label for="username">Username:</label>
                        <input type="text" id="username" name="username" required><br>
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required><br>
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" required><br>
                        <input type="hidden" name="userAction" value="add">
                        <input type="submit" value="Add User">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>