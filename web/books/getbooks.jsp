
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
    <link href="books/book.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
</head>

<body>
<%
    String uid=(String) request.getAttribute("uid");
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
    <tr>
        <td>
            <a href="BookServlet?id=<%=bk1.getBid()%>" target="rightFrame"> 查看详情</a><br>
            <input class="min" name="" type="button" value="-" />
            <input class="text_box" name="" type="number" value="" placeholder="0" size="4"/>
            <input class="add" name="" type="button" value="+" />
            <input type="button" class="cart" value="加入购物车" id="<%=bk1.getBid()%>">
        </td>
        <td> <a href="BookServlet?id=<%=bk2.getBid()%>" target="rightFrame"> 查看详情</a><br>
            <input class="min" name="" type="button" value="-" />
            <input class="text_box" name="" type="number" value="" placeholder="0"/>
            <input class="add" name="" type="button" value="+" />
            <input type="button" class="cart" value="加入购物车" id="<%=bk2.getBid()%>">
        </td>

        <td> <a href="BookServlet?id=<%=bk3.getBid()%>" target="rightFrame"> 查看详情</a><br>
            <input class="min" name="" type="button" value="-" />
            <input class="text_box" name="" type="number" value="" placeholder="0"/>
            <input class="add" name="" type="button" value="+" />
            <input type="button" class="cart" value="加入购物车" id="<%=bk3.getBid()%>">
        </td>
    </tr>

        <%}%>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
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
                $("td").each(function() {
                    var t = $(this).find('input[class*=text_box]').val();
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
