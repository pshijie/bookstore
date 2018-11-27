
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
    <style type="text/css">
        .btn{width:137px;height:35px; font-size:14px;font-weight:bold;background-color:#f0580c; cursor:pointer;}
    </style>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#fm").submit(function () {
                if ($("#newPwd").val()=="") {
                    alert("新密码不能为空!");
                    return false;
                }else if ($("#cfPwd").val()=="") {
                    alert("确认密码不能为空!");
                    return false;
                }else if ($("#newPwd").val()!=$("#cfPwd").val() ){
                    alert("输入密码不一致!");
                    return false;
                }else{
                    return true;
                }

            })
        })
    </script>
</head>

<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">个人信息</a></li>
        <li><a href="#">修改密码</a></li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>修改密码</span></div>
    <form action="UserServlet" method="post" id="fm" target="_top">
        <ul class="forminfo">
            <input type="hidden" name="oper" value="pwd"/>
            <li><label>用户名</label><input name="uid" id="uid" type="text" class="dfinput" /><i></i></li>
            <li><label>新密码</label><input name="newPwd" id="newPwd" type="password" class="dfinput" /><i></i></li>
            <li><label>确认密码</label><input id="cfPwd" type="password" class="dfinput" /><i></i></li>
            <li><label>&nbsp;</label><input type="submit" value="确认保存" style="width: 100px "/></li>
        </ul>
    </form>

</div>


</body>

</html>