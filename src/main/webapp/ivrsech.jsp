
<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>添加查询手机号码</title>
</head>

<body>
<blockquote>
  <p align="center"><strong>添加查询手机号码</strong></p>
</blockquote>
<table width="757" height="124" border="1" align="center">
    
  <tr align="center">
<td colspan="6"> 
      <form name="form1" method="post" action="serch.jsp">
        <p>请输入需要查询的手机号码 </p>
        <p>
          <input type="text" name="phone">
          <input type="submit" name="Submit" value="提交">
        </p>
      </form></td>
  <% 

	
  %>
</table>
<p align="center"><a href="menu.jsp">返回</a></p>
</body>
</html>