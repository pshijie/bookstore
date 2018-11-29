<%@ page import="Model.book" %>
<%@page import="DAO.BookImp"%>
<%--
  Created by IntelliJ IDEA.
  User: haidai
  Date: 2018/11/28
  Time: 2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>

<html>
<head>
    <meta charset="utf-8">
    <title>无标题文档</title>;
    <style>
        #title{font-size: 40px;
            font-family: 黑体;
            text-align: center;
            color: black;}
        #price{font-size: 30px;
            font-family: 黑体;
            text-align: center;

            color: black;}
    </style>
</head>
<%  book book=(book)request.getAttribute("book");
    System.out.println(book.toString());
        %>
<body>
<p id="title"><%=book.getBname()%></p>
<table>
    <tr>
        <td>
            <div style="float: left"><img src="<%=book.getBpic()%>" ></div></td>
        <td rowspan="2">
            <%=book.getBabstract()%>
        </td></tr>
    <tr><td style="text-align: center"><p id="price" >¥<%=book.getBprice()%> </p>
        <input type="button" value="加入购物车" ></td></tr></table>

</body>
</html>

