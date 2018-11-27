<%@ page import="DAO.BookImp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.awt.print.Book" %>
<%@ page import="Model.book" %><%--
  Created by IntelliJ IDEA.
  User: haidai
  Date: 2018/11/27
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="bookcss.css" rel="stylesheet"/>
</head>
<body>
<%
    BookImp bookImp=new BookImp();
    List<book> blist=bookImp.queryAllBooks();
    int i=0;
    while(i<12)
    { book bk1=blist.get(i++);
      book bk2=blist.get(i++);
      book bk3=blist.get(i++);
%>
<table>
    <td><img src="<%=bk1.getBpic()%>" ></td>
    <td><img src="<%=bk2.getBpic()%>" ></td>
    <td><img src="<%=bk3.getBpic()%>"></td>

    <tr>
        <td><%=bk1.getBname()%></td>
        <td><%=bk2.getBname()%></td>
        <td><%=bk3.getBname()%></td>
    </tr>
    <tr>
        <td><%=bk1.getBprice()%></td>
        <td><%=bk2.getBprice()%></td>
        <td><%=bk3.getBprice()%></td>
    </tr>
    <tr><td><input type="button" value="查看详情"><input type="button" value="加入购物车"></td>
        <td><input type="button" value="查看详情"><input type="button" value="加入购物车"></td>
        <td><input type="button" value="查看详情"><input type="button" value="加入购物车"></td></tr>
</table>
<%}%>
</body>
</html>
