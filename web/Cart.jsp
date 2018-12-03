<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: WangChaoJun
  Date: 2018/11/28
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="Model.book" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Title</title>
</head>
<body>
<%
    List<book> bookList= (List<book>) request.getSession().getAttribute("blist");
    for (book b:bookList) {
        %>
<div class="row">
    <div class="col-xs-3">
        <img src="<%= b.getBpic()%>">
    </div>
    <div class="col-xs-3">
        <span><%=b.getBname()%>></span>
    </div>
    <div class="col-xs-3">
        <span><%=b.getBprice()%></span>
    </div>
    <div class="col-xs-3">
        <button type="button" id="<%=b.getBid()%>" class="btn btn-primary submitbtn">提交订单</button>
    </div>
</div>
<%


    }
%>



<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    $(".submitbtn").click(function () {
        $.ajax({
            type: "POST",
            url: "/AddOrderServlet",
            data: {"Bid":$(this).attr("id")},
            success: function(data){
               // alert(data)
                if(data=="1"){
                    alert("下单成功");
                    window.location.href="/Order.jsp";
                }else {
                    alert("下单失败");
                }
            }
        });
    });
</script>
</body>
</html>
