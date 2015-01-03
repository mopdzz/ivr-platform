<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>屏蔽敏感词页面</title>
</head>
      <body>
<table width="757" height="124" border="1" align="center">
    
  <tr align="center">
<td colspan="6"> 
      <form name="form1" method="post" action="pingbiend.jsp">
        
       <p>卡号和密码</p>
        <p>
          <textarea name="text" cols="80" rows="10" dir="ltr" lang="af"></textarea>          
        </p>
        <input type="submit" name="Submit" value="提交">
      </form></td>
      </body>
</table>
<p align="center"><a href="menu.jsp">返回</a></p>
</html>