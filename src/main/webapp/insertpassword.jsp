<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>输入卡号页面</title>
</head>
<% 
Connection conn =null ;
Statement pstmt = null;
ResultSet rst = null;
String sql=null;
String id="";
ArrayList idlist=new ArrayList();
ArrayList namelist=new ArrayList();
	try
	{
		conn =MysqlConnect.newConnection();
		pstmt = conn.createStatement();

 		String sql1="select id,passwordtypename from ivr_nine_passwordtype where state=1";
 		 rst=pstmt.executeQuery(sql1);          
 	     while(rst.next()){
 	    	idlist.add(rst.getString(1));
 	    	namelist.add(rst.getString(2));
 	     }
	}catch(Exception e)
	{
		e.printStackTrace();
	}
 
%>
      <body>
<table width="757" height="124" border="1" align="center">
    
  <tr align="center">
<td colspan="6"> 
      <form name="form1" method="post" action="passwordend.jsp">
		<select name="id" id="zhou" action="">
     <option value="" selected>-----请选择-----</option>
     <%
     for(int i=0;i<idlist.size();i++)
     {
    	out.println("<option value=\""+idlist.get(i)+"\">"+namelist.get(i)+"</option>");
    	
     }
     %>
            </select>
        
       <p>卡号和密码</p>
        <p>
          <textarea name="text" cols="25" rows="10" dir="ltr" lang="af"></textarea>          
        </p>
        <input type="submit" name="Submit" value="提交">
      </form></td>
      </body>
</table>
<p align="center"><a href="menu.jsp">返回</a></p>
</html>