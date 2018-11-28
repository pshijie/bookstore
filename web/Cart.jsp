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
    <title>Title</title>

</head>
<body>
<%
    List<book> bookList= (List<book>) request.getSession().getAttribute("blist");
    for (book b:bookList) {
        out.print(b.getBid()+"  ");
        out.print(b.getBname()+"   ");
        out.print(b.getBprice());
        out.print("<br>");

    }


%>
</body>
</html>
