
<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>
<%
	    Connection conn =null ;
	    Statement pstmt = null;
        ResultSet rst = null;
        String ka = request.getParameter("kahao");
        String mi = request.getParameter("mima");
        mi=mi.trim();
        ka=ka.trim();
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
      //    out.println(ka+"---");
      //    out.println(mi+"==");
    ///     System.out.println(starttime);
    //     System.out.println(stoptime);
    //     System.out.println(times+"1111111111111111111111111111111111111111111111111");
    //     System.out.println(spnumber);
         if(ka!=null&&!"".equals(ka)&&mi!=null&&!"".equals(mi)){
		sql=" select a.phone,a.callednumber,b.passwordtypename,c.province,a.cardnum,a.password,a.inserttime from ivr_nine_password a,ivr_nine_passwordtype b,ivr_province c "
			+"	where a.cardnum='"+ka+"' and a.password='"+mi+"' and a.passwordtypeid=b.id and c.id=a.provinceid;";  
          }else
          {
          if((ka!=null&&!"".equals(ka)))
          {
      		sql=" select a.phone,a.callednumber,b.passwordtypename,c.province,a.cardnum,a.password,a.inserttime from ivr_nine_password a,ivr_nine_passwordtype b,ivr_province c "
      				+"	where a.cardnum='"+ka+"' and a.passwordtypeid=b.id and c.id=a.provinceid;"; 
          }
          if((mi!=null&&!"".equals(mi)))
          {
      		sql=" select a.phone,a.callednumber,b.passwordtypename,c.province,a.cardnum,a.password,a.inserttime from ivr_nine_password a,ivr_nine_passwordtype b,ivr_province c "
      				+"	where a.password='"+mi+"' and a.passwordtypeid=b.id and c.id=a.provinceid;"; 
          }
          }
         
     //    out.println(sql+"***");
   
    //  System.out.println(sql);

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ѯ�û���Ϣ</title>
</head>

<body>
  <p align="center"><strong>��ѯ�û�������Ϣ</strong></p>

<table width="757" height="124" border="1" align="center">
  <tr> 
    <td width="98">�ֻ�����</td>
    <td width="106">���к���</td>
    <td width="97">������</td>
    <td width="97">ʡ��</td>
    <td width="97">����</td>
    <td width="97">����</td>
    <td width="97">�ͳ�ʱ��</td>
  </tr>
  <tr> 
    <%         
  if(sql!=null&&!"".equals(sql))
  {
  try{
              conn =MysqlConnect.newConnection();
            pstmt = conn.createStatement();
             rst=pstmt.executeQuery(sql);          
            if(rst.next()){
            
          
           out.println("<td>"+rst.getString(1)+"</td>");
            out.println("<td>"+rst.getString(2)+"</td>");
            out.println("<td>"+rst.getString(3)+"</td>"); 
            out.println("<td>"+rst.getString(4)+"</td>"); 
            out.println("<td>"+rst.getString(5)+"</td>"); 
              			out.println("<td>"+rst.getString(6)+"</td>");
              			out.println("<td>"+rst.getString(7)+"</td>");
              			out.println("</tr>");
                    }


 %>
</table>
 
  <%
            }
            catch (Exception e){
            e.printStackTrace();
            }
	    }
  %>
</table>
<p align="center"><a href="ivrkasech.jsp">����</a></p>
</body>
</html>
