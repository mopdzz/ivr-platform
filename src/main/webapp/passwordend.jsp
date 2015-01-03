<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<% 
request.setCharacterEncoding("utf8");//解决乱码
String id = request.getParameter("id");
String text = request.getParameter("text");
boolean back=password.insert(id, text);
if(back)
 out.println("添加成功");
else
	out.println("添加失败");	
%>
<body>
<p align="center"><a href="menu.jsp">返回</a></p>
</body>
</html>