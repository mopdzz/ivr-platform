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
          String sql1="";
          sql=" select a.passwordtypeid,b.passwordtypename,COUNT(*),a.callednumber from ivr_nine_password a,ivr_nine_passwordtype b  "
        			+" where a.passwordtypeid=b.id and (a.passwordtypeid=2  or a.passwordtypeid=4  or a.passwordtypeid=5 or a.passwordtypeid=6 or a.passwordtypeid=7 or a.passwordtypeid=8 or a.passwordtypeid=9)  " 
        			+" and a.state=0 and a.inserttime > '"+starttime+"'  and a.inserttime<'"+endtime+"' "
        			+" GROUP BY a.passwordtypeid,b.passwordtypename ,a.callednumber  order by date_format(a.inserttime,'%Y-%m-%d')";

			sql1=" select callednumber,sum(fee)/100 as c  from ivr_nine_usertj  "+
					" where  endtime > '"+starttime+"'  and endtime<'"+endtime+"' GROUP BY callednumber order by c desc";
					
		//	out.println(sql);
		//	out.println(sql1);		
	Hashtable tab=new Hashtable();
	Hashtable tabtj=new Hashtable();
	ArrayList list=new ArrayList();
	list.add("骏网卡");
	list.add("久游卡");
	list.add("盛大卡");
	list.add("完美卡");
	//ArrayList listendtime=new ArrayList();
	ArrayList listtime=new ArrayList();
	conn =MysqlConnect.newConnection();
	pstmt = conn.createStatement();
	
	rst=pstmt.executeQuery(sql1);
	
	while(rst.next()){
		tabtj.put(rst.getString(1),String.valueOf(rst.getInt(2)));
		if(!listtime.contains(rst.getString(1)))
		{
			listtime.add(rst.getString(1));
		}
	}
	rst=pstmt.executeQuery(sql);
	
	while(rst.next()){
		tab.put(rst.getString(4)+","+rst.getString(2), rst.getString(3));
		if(!listtime.contains(rst.getString(4)))
		{
			listtime.add(rst.getString(4));
		}
		
		

		//if(!list.contains(rst.getString(2)))
		//{
		//	list.add(rst.getString(2));
		///}
	}

  //  out.println(sql);
 // Collections.sort(listtime);

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title> 查询业务销售量</title>
</head>

<body>
<blockquote>
  <p align="center"><strong>查询长号码业务销售量</strong></p>
</blockquote>
<table width="757" height="124" border="1" align="center">
    <td width="98">长号码</td>
	  <td width="98"><%=list.get(0)%></td>
    <td width="98"><%=list.get(1)%></td>
    <td width="98"><%=list.get(2)%></td>
    <td width="98"><%=list.get(3)%></td>
    <td width="124">总数</td>
    <td width="124">信息费</td>
  <tr> 
    <%         
 /// if(phone!=null&&!"".equals(phone))
 // {
  try{
  
	int allnum1=0; 
	int allnum2=0; 
		int allnum3=0; 
	int allnum4=0; 
	int allnum5=0; 
	int allnum6=0;
	int allnum7=0;
	int allnum8=0;
	int allnum=0; 
	   int c=0;
	   int d=0;
            for(int i=0;i<listtime.size();i++){
            c=0;
                  out.println("<td><a href=\"provincecalled.jsp?called="+listtime.get(i)+"&starttime="+starttime+"&endtime="+endtime+"\">"+listtime.get(i)+"</td>");
                  int b=0;
               
                  for(int y=0;y<list.size();y++)
                  {
                	  int a=0;
                	  String tt=listtime.get(i)+","+list.get(y);
                	  if(tab.containsKey(tt))
                	  {
	                	  String str=tab.get(tt).toString();
	                	 //  out.println(str);
	                	  if(str==null||"".equals(str))
	                	  {
	                		  a=0;
	                	  }else
	                	  {
	                		  a=Integer.parseInt(str);
	                	  }
                	  }
                	  if(y==0)
                	  {
                		  allnum1=allnum1+a;
                	  }
                	  if(y==1)
                	  {
                		  allnum2=allnum2+a;
                	  }
                	  if(y==2)
                	  {
                		  allnum3=allnum3+a;
                	  }
                	  if(y==3)
                	  {
                		  allnum4=allnum4+a;
                	  }
                	  if(y==4)
                	  {
                	  allnum5=allnum5+a;
                	  }                	  
                	  if(y==5)
                	  {
                	  allnum6=allnum6+a;
                	  }
                	  if(y==6)
                	  {
                	  allnum7=allnum7+a;
                	  }
                	  if(y==7)
                	  {
                	  allnum8=allnum8+a;
                	  }
                	  out.println("<td>"+a+"</td>");
                	  b=b+a;
                	  allnum=a+allnum;
                  }
                  out.println("<td>"+b+"</td>");
                  if(tabtj.containsKey(listtime.get(i)))
                  {
                	  c=Integer.parseInt(tabtj.get(listtime.get(i)).toString());
                	  d=d+c;
                  }
                  
                  out.println("<td>"+c+"</td>");
            
             
                      
                  
            
              			
              			%>
  </tr>
  <%
                    }
            %>
              </tr>
            <%
            out.println("<td>合计</td>");
            out.println("<td>"+allnum1+"</td>");
            out.println("<td>"+allnum2+"</td>");
            out.println("<td>"+allnum3+"</td>");
            out.println("<td>"+allnum4+"</td>");
            out.println("<td>"+allnum+"</td>");
            out.println("<td>"+d+"</td>");
            }
            catch (Exception e){
            e.printStackTrace();
            }
	//    System.out.print(sql);
	//    }
  %>
</table>
<p align="center"><a href="calledtime.jsp">返回</a></p>
</body>
</html>
