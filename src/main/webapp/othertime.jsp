<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>
<%
	    Connection conn =null ;
	    Statement pstmt = null;
        ResultSet rst = null;
        String starttime = request.getParameter("starttime");
        String endtime = request.getParameter("stoptime");
        String sql="";
        String feiyong="";
        String sheng="";
        String spnumber="";
         String qudaospnumber="";
          String qudao="";
		java.text.DecimalFormat df1 = new java.text.DecimalFormat("##0.00");
		   double dialcount=0.0000;
       double usercount=0.0000;
       double income=0.0000;
	     double calltime=0.0000;
		 	     java.text.NumberFormat nf =  java.text.NumberFormat.getInstance();
         	nf.setMaximumFractionDigits(2);
        String theName = (String) session.getAttribute("thename");
        String thePassword = (String) session.getAttribute("thePassword");
        String starttimes="";
          String stoptimes="";
          String sql1="select passwordtypename from ivr_nine_passwordtype where state=1";
          sql=" select b.passwordtypename,COUNT(*) from ivr_nine_password a,ivr_nine_passwordtype b where a.state=1 and a.passwordtypeid=b.id group by passwordtypeid";
	Hashtable tab=new Hashtable();
	ArrayList list=new ArrayList();
	conn =MysqlConnect.newConnection();
	pstmt = conn.createStatement();
	rst=pstmt.executeQuery(sql1);
	
	while(rst.next()){
		list.add(rst.getString(1));
	}
	rst=pstmt.executeQuery(sql);
	
	while(rst.next()){
		tab.put(rst.getString(1),String.valueOf(rst.getInt(2)));
	}

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title> 查询业务销售量</title>
</head>

<body>
<blockquote>
  <p align="center"><strong>查询卡的剩余量</strong></p>
</blockquote>
<table width="757" height="124" border="1" align="center">
<%

  for(int i=0;i<list.size();i++)
  {
	  out.println("<td width=\"98\">"+list.get(i)+"</td>");
  }

%>
  <tr> 
    <%         
 /// if(phone!=null&&!"".equals(phone))
 // {
  try{
  	    for(int i=0;i<list.size();i++)
  	    {
  	    	if(tab.containsKey(list.get(i)))
  	    	{
  	    		out.println("<td>"+tab.get(list.get(i))+"</td>");
  	    	}else
  	    	{
  	    		out.println("<td>0</td>");
  	    	}
  	    }
            }
            catch (Exception e){
            e.printStackTrace();
            }
  %>
  </tr> 
</table>
<p align="center"><a href="menu.jsp">返回</a></p>
</body>
</html>
