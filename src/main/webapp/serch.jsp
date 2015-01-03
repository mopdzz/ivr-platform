
<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>
<%
	    Connection conn =null ;
	    Statement pstmt = null;
        ResultSet rst = null;
        String phone = request.getParameter("phone");
        String sql="";
        String sql1="";
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

        String starttimes="";
        String feng="";
          String stoptimes="";
    ///     System.out.println(starttime);
    //     System.out.println(stoptime);
    //     System.out.println(times+"1111111111111111111111111111111111111111111111111");
    //     System.out.println(spnumber);
         if(phone!=null&&!"".equals(phone)){
		sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where phone='"+phone+"' and a.provinceid=b.id ";                          
        sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where a.phone='"+phone+"' and a.provinceid=b.id and a.passwordtypeid=c.id and a.state=0";  
          }
          
   
    //  System.out.println(sql);

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>查询用户信息</title>
</head>

<body>
  <p align="center"><strong>查询用户拨打信息</strong></p>

<table width="757" height="124" border="1" align="center">
  <tr> 
    <td width="98">手机号码</td>
    <td width="106">被叫号码</td>
    <td width="97">开始时间</td>
    <td width="97">结束时间</td>
    <td width="97">费用(元)</td>
    <td width="97">手机号码省份</td>
  </tr>
  <tr> 
    <%         
  if(phone!=null&&!"".equals(phone))
  {
  try{
              conn =MysqlConnect.newConnection();
            pstmt = conn.createStatement();
             rst=pstmt.executeQuery(sql);          
            while(rst.next()){
            
          
           out.println("<td>"+rst.getString(2)+"</td>");
            out.println("<td>"+rst.getString(1)+"</td>");
            out.println("<td>"+rst.getString(3)+"</td>"); 
            out.println("<td>"+rst.getString(4)+"</td>"); 
            out.println("<td>"+rst.getInt(5)+"</td>"); 
              			out.println("<td>"+rst.getString(6)+"</td>");
              			out.println("</tr>");
                    }


 %>
</table>
  <p align="center"><strong>查询获取卡密信息</strong></p>

 
 <table width="757" height="124" border="1" align="center">

    <tr> 
    <td width="98">手机号码</td>
    <td width="106">被叫号码</td>
     <td width="97">游戏类型</td>
    <td width="97">卡号</td>
    <td width="97">密码</td>
    <td width="97">发送时间</td>
    <td width="97">手机号码省份</td>
  </tr>
  <tr> 
    <%         
  if(phone!=null&&!"".equals(phone))
  {
 
            pstmt = conn.createStatement();
             rst=pstmt.executeQuery(sql1);          
            while(rst.next()){
            
          
           out.println("<td>"+phone+"</td>");
            out.println("<td>"+rst.getString(1)+"</td>");
            out.println("<td>"+rst.getString(5)+"</td>"); 
            out.println("<td>"+rst.getString(2)+"</td>"); 
            out.println("<td>"+rst.getString(3)+"</td>"); 
             out.println("<td>"+rst.getString(6)+"</td>");
             out.println("<td>"+rst.getString(4)+"</td>");
              			out.println("</tr>");
                    }
  }


 %>
  </tr>
  <%         
  						
                      conn.close();
            }
            catch (Exception e){
            e.printStackTrace();
            }
	    }
  %>
</table>
<p align="center"><a href="ivrsech.jsp">返回</a></p>
</body>
</html>