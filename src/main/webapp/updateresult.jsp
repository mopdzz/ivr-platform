<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<% 
request.setCharacterEncoding("utf8");//解决乱码
Connection conn =null ;
Statement pstmt = null;
ResultSet rst = null;
String id = request.getParameter("id");
String phone = request.getParameter("phone");
String starttime = request.getParameter("starttime");
String sql=null;
String sql1="";
String sql2="";
if(id!=null&&!"".equals(id)){
	try
	{
sql=" INSERT into ivr_changecard (num,passwordtypeid,datatime) values('"+phone+"','"+id+"','"+starttime+"'); "; 
sql1="select id from ivr_changecard where passwordtypeid='"+id+"' and date_format(datatime,'%Y-%m-%d') ='"+starttime+"' ";
sql2="delete from ivr_changecard where id=";
conn =MysqlConnect.newConnection();
pstmt = conn.createStatement();
 rst=pstmt.executeQuery(sql1);
 ArrayList alist=new ArrayList();
  while(rst.next()){
	  alist.add(rst.getString(1));
	  
  }
  for(int i=0;i<alist.size();i++)
  {
	  pstmt.execute(sql2+alist.get(i));
  }

  pstmt = conn.createStatement();
 pstmt.execute(sql); 
 out.println("添加成功");
	}catch(Exception e)
	{
		 out.println("添加失败");
		// out.println(e.getMessage());
		e.printStackTrace();
	}
 }

%>
<body>
<p align="center"><a href="menu.jsp">返回</a></p>
</body>
</html>