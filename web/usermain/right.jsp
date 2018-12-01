
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DAO.BookImp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.awt.print.Book" %>
<%@ page import="Model.book" %>
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
        System.out.println(bk1.getBname());
        System.out.println(bk1.getBpic());
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
    <tr><td><input type="button"  value="查看详情"><input type="button" class="cart" value="加入购物车" id="<%=bk1.getBid()%>"></td>
        <td><input type="button" value="查看详情"><input type="button" class="cart" value="加入购物车" id="<%=bk2.getBid()%>"></td>
        <td><input type="button" value="查看详情"><input type="button" class="cart" value="加入购物车" id="<%=bk3.getBid()%>"></td></tr>
</table>
<%}%>
<script>
   $(".cart") .click( function () {
       $.ajax({
           type: "GET",
           url: "/AddbookServlet",
           data: {"Bid":$(this).attr("id")},
           success: function(data){
              if(data=="1"){
                  alert("添加成功");
              }else {
                  alert("添加失败");
              }
           }
       });
   });
</script>
</body>
</html>
