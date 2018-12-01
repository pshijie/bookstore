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
        <input class="min" name="" type="button" value="-" />
        <input class="text_box" name="" type="number" value="" placeholder="0"/>
        <input class="add" name="" type="button" value="+" />
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

    $(function() {
        $(".add").click(function() {
            var t = $(this).parent().find('input[class*=text_box]');
            if(t.val()==""||undefined||null){
                t.val(0);
            }
            t.val(parseInt(t.val()) + 1)
            setTotal();
        })
        $(".min").click(function() {
            var t = $(this).parent().find('input[class*=text_box]');
            if(t.val()==""||undefined||null){
                t.val(0);
            }
            t.val(parseInt(t.val()) - 1)
            if(0 > parseInt(t.val())) {
                t.val(0);
            }
            setTotal();
        })
        $(".text_box").keyup(function(){
            var t = $(this).parent().find('input[class*=text_box]');
            if(parseInt(t.val())==""||undefined||null || isNaN(t.val())) {
                t.val(0);
            }
            setTotal();
        })
        function setTotal() {
            $("#mytr").each(function() {
                var t = $(this).children('td').find('input[class*=text_box]').val();
                if(parseInt(t)==""||undefined||null || isNaN(t) || isNaN(parseInt(t))){
                    t=0;
                }
            });
        }
        setTotal();
    })

</script>

</body>
</html>

