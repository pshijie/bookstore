

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="themes/icon.css">
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
</head>
<body>

<div style="margin:20px 0;"></div>
<div class="easyui-panel" title="用户注册" style="width:600px;padding:10px 60px 20px 60px" >
    <form action="UserServlet" method="post">
        <input type="hidden" name="oper" value="reg">
        <table cellpadding="5" >
            <tr>
                <td>用户名:</td>
                <td><input name="uid" class="easyui-validatebox textbox" placeholder="昵称" data-options="required:true" missingMessage="用户名必填"></td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input name="pwd" class="easyui-validatebox textbox" placeholder="不少于4位" data-options="required:true" missingMessage="密码必填"></td>
            </tr>

            <tr>
                <td>地址:</td>
                <td><input name="address" class="easyui-validatebox textbox" placeholder="地址名" data-options="required:true" missingMessage="地址栏必填" ></td>
            </tr>
            <tr>
                <td>电话:</td>
                <td><input name="phone" class="easyui-validatebox textbox" placeholder="电话号码" data-options="required:true" missingMessage="电话必填"></td>
            </tr>

            <tr>
                <td COLSPAN="2" align="center"><input align="center" type="submit" value="注册"></td>
            </tr>
        </table>
    </form>
</div>
<style scoped="scoped">
    .textbox{
        height:20px;
        margin:0;
        padding:0 2px;
        box-sizing:content-box;
    }
</style>

</body>
</html>