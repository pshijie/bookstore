<%@ page import="Model.user" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $(".click").click(function(){
                $(".tip").fadeIn(200);
            });

            $(".tiptop a").click(function(){
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function(){
                $(".tip").fadeOut(100);
            });

            $(".cancel").click(function(){
                $(".tip").fadeOut(100);
            });

        });
    </script>


</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">管理信息</a></li>
        <li><a href="#">查看用户信息</a></li>
    </ul>
</div>

<div class="rightinfo">

<table class="tablelist">
    <thead>
    <tr>
        <th>用户ID</th>
        <th>密码</th>
        <th>地址</th>
        <th>电话</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<user> lu = (ArrayList<user>) request.getAttribute("lu");
        for (user u:lu)
        {
    %>
    <tr>
        <td> <%=u.getName()%></td>
        <td> <%=u.getPassword()%></td>
        <td> <%=u.getAddress()%></td>
        <td> <%=u.getPhonenumber()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</div>
</body>
</html>
