
<%@ page contentType="text/html; charset=gb2312"%>
<%@ page
	import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>
<%
	    Connection conn =null ;
	    Statement pstmt = null;
        ResultSet rst = null;
        String phone = request.getParameter("phone");
        String sql="";
        String sql1="";
        String sql2="";
        String sql3="";
        String sql4="";
        String sheng="δ֪";
		Hashtable hashtable=new Hashtable();
		Hashtable hashtable1=new Hashtable();
		Hashtable hashtable2=new Hashtable();
		ArrayList list=new ArrayList();
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
		sql=" select feecode,COUNT(DISTINCT(linkid))   from sms_mo where mobile='"+phone+"'GROUP By feecode";                          
        sql2=" select b.feecode,count(*) from sms_mr a ,(select DISTINCT(linkid),feecode,mobile from sms_mo where mobile='"+phone+"') b where a.linkid = b.linkid  and  a.mobile='"+phone+"' "
        	+"and b.mobile=a.mobile and a.statestr='DELIVRD'  GROUP BY b.feecode "; 
        sql1=" select b.feecode,count(*) from sms_mt a,(select DISTINCT(linkid),feecode,mobile from sms_mo where mobile='"+phone+"') b where a.linkid = b.linkid  and  b.mobile='"+phone+"' GROUP By b.feecode;";
        String hapduan="";
        if(phone!=null&&phone.length()>7)
        {
        	hapduan=phone.substring(0,7);
        } 
        sql3="select sheng from ivr_hd where hd='"+hapduan+"'" ;
        sql4="select a.content from sms_mt a,(select DISTINCT(linkid),feecode,mobile from sms_mo) b where a.linkid = b.linkid  and  b.mobile='"+phone+"';";
        try{
           conn =MysqlConnect.newConnection();
          pstmt = conn.createStatement();
          rst=pstmt.executeQuery(sql);          
          while(rst.next()){
        	  hashtable.put(rst.getString(1),rst.getString(2));
          }
         
          rst=pstmt.executeQuery(sql1);          
          while(rst.next()){
        	  hashtable1.put(rst.getString(1),rst.getString(2));
          }
          rst=pstmt.executeQuery(sql2);          
          while(rst.next()){
        	  hashtable2.put(rst.getString(1),rst.getString(2));
          }
          rst=pstmt.executeQuery(sql3);          
          while(rst.next()){
        	  sheng=rst.getString(1);
          }
          rst=pstmt.executeQuery(sql4);          
          while(rst.next()){
        	  list.add(rst.getString(1));
          }
           conn.close();
 			}
 		catch (Exception e){
 			e.printStackTrace();
 		}
         }
          
   
    //  System.out.println(sql);

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���Ų�ѯ�ֻ�����</title>
</head>

<body>
	<p align="center">
		<strong>���Ų�ѯ�ֻ�����</strong>
	</p>

	<table width="757" height="124" border="1" align="center">
		<tr>
		<tr>
			<td width="98">�ֻ�����</td>
			<td width="98">���η���</td>
			<td width="106">������</td>
			<td width="97">������</td>
			<td width="97">�Ʒ���</td>
			<td width="97">�ܷ���</td>
			<td width="97">�ֻ�����ʡ��</td>
		</tr>
		<tr>
			<%
			int shang=0;
			int xia=0;
			int ji=0;
			double feiyong=0.00;
			if(phone!=null&&!"".equals(phone)&&hashtable.size()>0)
			  {
			 
			            
			          
			           out.println("<td>"+phone+"</td>");
			            out.println("<td>1.95</td>");
			            Object str=hashtable.get("135000000000000000789");
			            if(str==null||"".equals(phone))
			            {
			            	str="0";
			            }
			            out.println("<td>"+str+"</td>");
			            shang=Integer.parseInt(str.toString())+shang;
			            str=hashtable1.get("135000000000000000789");
			            if(str==null||"".equals(phone))
			            {
			            	str="0";
			            }
			            out.println("<td>"+str+"</td>"); 
			            xia=Integer.parseInt(str.toString())+xia;
			            str=hashtable2.get("135000000000000000789");
			            if(str==null||"".equals(phone))
			            {
			            	str="0";
			            }
			            out.println("<td>"+str+"</td>"); 
			            ji=Integer.parseInt(str.toString())+ji;
			            double tempfei=Integer.parseInt(str.toString())*1.95;
			            feiyong=tempfei+feiyong;
			            out.println("<td>"+df1.format(tempfei) +"</td>"); 
			             out.println("<td>"+sheng+"</td>");
			             out.println("</tr>");
			             
			             
			             
			             
			             out.println("<td>"+phone+"</td>");
				            out.println("<td>1.00</td>");
				             str=hashtable.get("135000000000000105859");
				            if(str==null||"".equals(phone))
				            {
				            	str="0";
				            }
				            out.println("<td>"+str+"</td>");
				            shang=Integer.parseInt(str.toString())+shang;
				            str=hashtable1.get("135000000000000105859");
				            if(str==null||"".equals(phone))
				            {
				            	str="0";
				            }
				            out.println("<td>"+str+"</td>"); 
				            xia=Integer.parseInt(str.toString())+xia;
				            str=hashtable2.get("135000000000000105859");
				            if(str==null||"".equals(phone))
				            {
				            	str="0";
				            }
				            out.println("<td>"+str+"</td>"); 
				            ji=Integer.parseInt(str.toString())+ji;
				            tempfei=Integer.parseInt(str.toString())*1;
				            feiyong=tempfei+feiyong;
				            out.println("<td>"+df1.format(tempfei) +"</td>"); 
				             out.println("<td>"+sheng+"</td>");
				             out.println("</tr>");
			                   
			  }
 %>
			<tr>
			<td width="98">�ϼ�</td>
			<td width="98"></td>
					<%
			if(phone!=null&&!"".equals(phone)&&hashtable.size()>0)
			  {
	
			            out.println("<td>"+shang+"</td>"); 
	
			            out.println("<td>"+xia+"</td>"); 

			            out.println("<td>"+ji+"</td>"); 
			            out.println("<td>"+df1.format(feiyong)+"</td>"); 
			             out.println("<td>"+sheng+"</td>");
			             out.println("</tr>");
			             
			
			                   
			  }
 %>
	</table>
	<table width="757" height="80" border="1" align="center">
			<tr>
			<td width="98">��������</td>
		</tr>
		<tr>
						<%
			for(int i=0;i<list.size();i++)
			  {
				String sr=list.get(i).toString();
				if(sr!=null&&sr.contains("�õ��ĵ㿨"))
			            out.println("<td>"+sr+"</td>"); 
           			                   
			  }
 %>
			
		</tr>
		</table>
	<p align="center">
		<a href="smssech.jsp">����</a>
	</p>
</body>
</html>