<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>
<%

        request.setCharacterEncoding("utf-8");//解决乱码
	    Connection conn =null ;
	    Statement pstmt = null;
        ResultSet rst = null;
        String time = request.getParameter("starttime");
        String type = request.getParameter("type");
    //    String gametype = request.getParameter("gametype");
        String sql1="";
   //      System.out.println(time);
   //      System.out.println(type);
   //      System.out.println(gametype);
    //     System.out.println(spnumber);
         if(time!=null&&!"".equals(time)&&type!=null&&!"".equals(type)){
         time=time.substring(0, 7);
      //   System.out.println(time);
         if("1".equals(type))
         {
         
	        sql1="select phone ,SUM(fee)/100 from ivr_nine_usertj where date_format(starttime,'%Y-%m')='"+time+"' and SUBSTR(callednumber,1,9)='125905117'  and state=1  GROUP BY phone order by SUM(fee)/100 desc ;  ";  
          }else
          	if("2".equals(type))
          	{ 
 							 sql1="select phone ,SUM(fee)/100 from ivr_nine_usertj where date_format(starttime,'%Y-%m')='"+time+"' and SUBSTR(callednumber,1,9)='125908030'  and state=1  GROUP BY phone order by SUM(fee)/100 desc ;  ";  

          	} else if("3".equals(type))
          	{
 						  sql1="select phone ,SUM(fee)/100 from ivr_nine_usertj where date_format(starttime,'%Y-%m')='"+time+"' and  (callednumber='125908997' or callednumber='12590899789')  and state=1  GROUP BY phone order by SUM(fee)/100 desc ;  ";  

          	} else if("4".equals(type))
          	{
 						  sql1="select phone ,SUM(fee)/100 from ivr_nine_usertj where date_format(starttime,'%Y-%m')='"+time+"' and SUBSTR(callednumber,1,9)='125908071'  and state=1  GROUP BY phone order by SUM(fee)/100 desc ;  ";  

          	}else if("5".equals(type))
          	{
 						  sql1="select phone ,SUM(fee)/100 from ivr_nine_usertj where date_format(starttime,'%Y-%m')='"+time+"' and callednumber='12590899788'  and state=1  GROUP BY phone order by SUM(fee)/100 desc ;  ";  

          	}
          	
          }
          String backurl="phone.jsp";
    // System.out.println(sql1);
    //  System.out.println(sql);

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>单手机号码月信息费排序</title>
</head>

<body>

  <p align="center"><strong>单手机号码月信息费排序</strong></p>

 
<table width="200" height="124" border="1" align="center">

    <tr> 
    <td width="98">手机号码</td>
    <td width="106">总费用</td>
  </tr>
  <tr> 
    <%  
    try{       
  if(time!=null&&!"".equals(time))
  {
 conn =MysqlConnect.newConnection();
            pstmt = conn.createStatement();
             rst=pstmt.executeQuery(sql1);          
            while(rst.next()){
            
          
           out.println("<td>"+rst.getString(1)+"</td>");
            out.println("<td>"+rst.getInt(2)+"</td>");
              			out.println("</tr>");
                    }
  }


 %>
  </tr>
  <%         
            }
            catch (Exception e){
            e.printStackTrace();
            }
  %>
</table>
<%
out.print("<p align=\"center\"><a href=\""+backurl+"\">返回</a></p>");

%>
</body>
</html>
