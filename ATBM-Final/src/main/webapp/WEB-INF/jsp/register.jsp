<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<mvc:resources mapping="/resources/**" location="/resources/static/" />

<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/fav.png">
    <!-- Author Meta -->
    <meta name="author" content="CodePixar">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Meta Keyword -->
    <meta name="keywords" content="">
    <!-- meta character set -->
    <meta charset="UTF-8">
    <!-- Site Title -->
    <title>Karma Shop</title>

    <!--
        CSS
        ============================================= -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/main.css">
</head>

<%@ include file="_header.jsp" %>
<body>

<!--================Login Box Area =================-->
<section class="login_box_area section_gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login_box_img">
                    <img class="img-fluid" src="img/login.jpg" alt="">
                    <div class="hover">
                        <h4>New to our website?</h4>
                        <p>There are advances being made in science and technology everyday, and a good example of this is the</p>
                        <a class="primary-btn" href="/login">Login</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="login_form_inner">
                    <h3>Log in to enter</h3>
                    <%--@elvariable id="registerForm" type="java"--%>
                    <form:form class="row login_form" action="/register" method="post" modelAttribute="registerForm" novalidate="novalidate">
                        <div class="col-md-12 form-group">
                            <form:input type="text" class="form-control" id="fullname" path="fullName"  placeholder="Full name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Full name'" />
                        </div>
                        <div class="col-md-12 form-group">
                            <form:input type="text" class="form-control" id="username" path="userName"  placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'"/>
                        </div>
                        <div class="col-md-12 form-group">
                            <form:input type="password" class="form-control" id="password" path="passWord"  placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'"/>
                        </div>
                        <div class="col-md-12 form-group">
                            <input type="password" class="form-control" id="comfirmpassword"  placeholder="Confirm Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Confirm Password'"/>
                        </div>

                        <div class="col-md-12 form-group">
                            <form:input type="date" class="form-control" id="birthday" path="birthday"  placeholder="Birth day" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Birth day'"/>
                        </div>

                        <div class="col-md-12 form-group">
                            <button type="submit" value="submit" class="primary-btn">Register</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Login Box Area =================-->

<script src="js/vendor/jquery-2.2.4.min.js"></script>
<script src="js/vendor/bootstrap.min.js"></script>
<script>
    function register(){

    }

</script>


</body>

<%@ include file="_footer.jsp" %>

</html>