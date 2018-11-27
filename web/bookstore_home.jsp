
<%@ page import="Model.user,java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网上书店首页</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="js/jquery.js"></script>


</head>
<body style="background:url(/images/topbg.gif) repeat-x;">

<div class="topleft">
    <a href="#" target="_parent"></a>
</div>


<div class="topright">
    <ul>
        <li><a href="login.jsp">登录</a></li>
        <li><span><img src="images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    </ul>


</div>

</body>
</html>
