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
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(function(){
            //顶部导航切换
            $(".nav li a").click(function(){
                $(".nav li a.selected").removeClass("selected")
                $(this).addClass("selected");
            })
        //退出功能
        $("#out").click(function(){
            var flag=window.confirm("你真的要退出吗?");
            if(flag){
                window.top.location.href="UserServlet?oper=out";
            }
        })
        })
    </script>


</head>

<body style="background:url(/images/topbg.gif) repeat-x;">

<div class="topleft">
    <a href="#" target="_parent"></a>
</div>


<div class="topright">
    <ul>
        <li><span><img src="images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>

        <li><a href="javascript:;" id="out">退出</a></li>
    </ul>

    <div class="user">
        <span><%=(session.getAttribute("uid"))%></span>
    </div>

</div>

</body>
</html>

