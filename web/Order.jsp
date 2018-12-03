<%--
  Created by IntelliJ IDEA.
  User: WangChaoJun
  Date: 2018/11/28
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.* " import ="Model.orders" import="DAO.OrderImp" import="DAO.BookImp" import="Model.book"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Title</title>
    <style>
        div{
            align: center ;
            valign: center;
        }
    </style>
</head>
<body>
<%
    String Uid=(String)request.getSession().getAttribute("uid");
    OrderImp orderImp=new OrderImp();
    BookImp bookImp=new BookImp();
    List<orders> ordersList=orderImp.queryMyOders(Uid);
    for(orders o:ordersList)
    {%>
<div class="row">
    <div class="col-xs-3">
        <img src="<%= (bookImp.queryBookbyid(o.getBid())).getBpic()%>" width="30%" height="20%" >
    </div>
    <div class="col-xs-3">
        <span><%=(bookImp.queryBookbyid(o.getBid())).getBname()%></span>
    </div>
    <div class="col-xs-3">
        <span><%=(bookImp.queryBookbyid(o.getBid())).getBprice()%></span>
    </div>
    <div class="col-xs-3">
        <span>订单号<%=o.getOid()%></span>
    </div>
</div>
<%
    }
%>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
</body>
</html>
