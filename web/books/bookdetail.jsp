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
<table id="detail">
    <tr>
        <td>
            <div style="float: left"><img src="<%=book.getBpic()%>" ></div></td>
        <td rowspan="2">
            <%=book.getBabstract()%>
        </td></tr>
    <tr id="mytr">
        <td style="text-align: center"><p id="price" >¥<%=book.getBprice()%> </p>
       <button id="jian" onclick="jian()">-</button>
        <input id="text_box" name="" type="number" value="" placeholder="0"/>
            <button id="add" onclick="add()">+</button>
        <input type="button" class="cart" value="加入购物车" id="<%=book.getBid()%>">
    </td></tr></table>
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

    function add()
    {
        var num=document.getElementById('text_box');
        var a=num.value;
        a++;
        num.value=a;

    }
    function jian()
    {
        var num=document.getElementById('text_box');
        var b=num.value;
        if(1 >= b)
        {
            alert('对不起，库存件数不能为0');
        }
        else
        {
            b--;
            num.value=b;
        }
    }

</script>

</body>
</html>

