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
Hashtable hashtable=pingbi.getpingbi(id, text);
ArrayList pingbilist=(ArrayList)hashtable.get("pingbi");
ArrayList weilist=(ArrayList)hashtable.get("wei");
%>
<body>
<table width="400" height="20" border="1" align="center">
    <td width="200">屏蔽卡号密码</td>
	

  <tr> 
  <% 
  for(int i=0;i<pingbilist.size();i++)
  {
		  out.println("<td width=\"98\">"+pingbilist.get(i)+"</td>"); 
		  out.println("</tr>"); 
  }
  out.println("<td width=\"200\">未屏蔽卡号密码</td>"); 

  out.println("</tr>"); 
  for(int i=0;i<weilist.size();i++)
  {

		  out.println("<td width=\"98\">"+weilist.get(i)+"</td>"); 

	  out.println("</tr>"); 
  }
  %>
 
  </table>
<p align="center"><a href="pingbistart.jsp">返回</a></p>
</body>
</html>