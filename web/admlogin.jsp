
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>欢迎来到管理员登录界面</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="js/jquery.js"></script>
    <script src="js/cloud.js" type="text/javascript"></script>

    <script language="javascript">
        $(function(){
            $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            $(window).resize(function(){
                $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            })
        });
    </script>

</head>

<body style="background-color:#df7611; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>


<div class="logintop">
    <span>管理员登录界面</span>
</div>

<div class="loginbody">

    <span style="width:100%; height:71px; margin-top:120px; text-align:center;"></span>
    <%
        //进行登录
        Object obj = request.getAttribute("flag");
        if (obj!=null){
    %>
    <div style="text-align: center">
        <span style="font-size: 15px; color:white;font-weight: bold">管理员名或密码错误</span>
    </div>
    <%
        }
    %>

    <div class="loginbox admloginbox3">
        <form action="AdminServlet" method="post">
            <input type="hidden" name="oper" value="admlog">
            <ul>
                <li><input name="admid" type="text" placeholder = "管理员名" class="loginuser" /></li>
                <li><input name="admpwd" type="password" placeholder = "密码" class="loginpwd" /></li>
                <li class="yzm">
                    <span><input name="" type="text" value="验证码" onclick="JavaScript:this.value=''"/></span><cite>X3D5S</cite>
                </li>
                <li>
                    <input name="" type="submit" class="loginbtn" value="登录"  />
                </li>
            </ul>
        </form>

    </div>

</div>



<div class="loginbm"></div>


</body>

</html>