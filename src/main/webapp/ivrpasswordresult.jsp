<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>
<%

        request.setCharacterEncoding("utf-8");//解决乱码
	    Connection conn =null ;
	    Statement pstmt = null;
        ResultSet rst = null;
        String time = request.getParameter("starttime");
        String type = request.getParameter("type");
        String gametype = request.getParameter("gametype");
        String protype = request.getParameter("pro");
        String sql1="";
        String strpro="";
     //    System.out.println(protype);
     //    System.out.println(type);
     //    System.out.println(gametype);
    //     System.out.println(spnumber);
         if(time!=null&&!"".equals(time)&&type!=null&&!"".equals(type)&&gametype!=null&&!"".equals(gametype)&&protype!=null&&!"".equals(protype)){
         if(!"0".equals(protype))
         {
            strpro=" and a.provinceid="+protype;
         
       }else
       	{
       		strpro="";
       	}
      // 	System.out.println(strpro);
         if("1".equals(type))
         {
         
	        sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and (a.passwordtypeid="+gametype+") and SUBSTR(callednumber,1,9)='125905117' and a.state=0 "+strpro+" order by a.inserttime ";  
          }else
          	if("2".equals(type))
          	{
        sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and (a.passwordtypeid="+gametype+") and SUBSTR(callednumber,1,9)='125908030' and a.state=0 "+strpro+" order by a.inserttime ";  
  
          	} else if("3".equals(type))
          	{
        sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and (a.passwordtypeid="+gametype+") and (callednumber='125908997' or callednumber='12590899789') and a.state=0 "+strpro+" order by a.inserttime ";  
  
          	}else if("4".equals(type))
          	{
        sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and (a.passwordtypeid="+gametype+") and SUBSTR(callednumber,1,9)='125908071' and a.state=0 "+strpro+" order by a.inserttime ";  
  
          	}else if("5".equals(type))
          	{
        sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and (a.passwordtypeid="+gametype+") and (callednumber='12590899788') and a.state=0 "+strpro+" order by a.inserttime ";  
  
          	}
          	
          }
          String backurl="ivrpassword.jsp";
   //  System.out.println(sql1);
    //  System.out.println(sql);

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查询用户信息</title>
</head>

<body>

  <p align="center"><strong>查询获取卡密信息</strong></p>

 
<table width="757" height="124" border="1" align="center">

    <tr> 
    <td width="98">手机号码</td>
    <td width="106">被叫号码</td>
     <td width="97">游戏类型</td>
    <td width="97">卡号</td>
    <td width="97">密码</td>
    <td width="97">发送时间</td>
    <td width="97">省份</td>
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
            
          
           out.println("<td>"+rst.getString(7)+"</td>");
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
