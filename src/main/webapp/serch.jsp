
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
<title>��ѯ�û���Ϣ</title>
</head>

<body>
  <p align="center"><strong>��ѯ�û�������Ϣ</strong></p>

<table width="757" height="124" border="1" align="center">
  <tr> 
    <td width="98">�ֻ�����</td>
    <td width="106">���к���</td>
    <td width="97">��ʼʱ��</td>
    <td width="97">����ʱ��</td>
    <td width="97">����(Ԫ)</td>
    <td width="97">�ֻ�����ʡ��</td>
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
  <p align="center"><strong>��ѯ��ȡ������Ϣ</strong></p>

 
 <table width="757" height="124" border="1" align="center">

    <tr> 
    <td width="98">�ֻ�����</td>
    <td width="106">���к���</td>
     <td width="97">��Ϸ����</td>
    <td width="97">����</td>
    <td width="97">����</td>
    <td width="97">����ʱ��</td>
    <td width="97">�ֻ�����ʡ��</td>
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
<p align="center"><a href="ivrsech.jsp">����</a></p>
</body>
</html>