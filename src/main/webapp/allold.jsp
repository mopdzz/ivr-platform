<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>
<%
	Connection conn = null;
	Statement pstmt = null;
	ResultSet rst = null;
	String starttime = request.getParameter("starttime");
	String endtime = request.getParameter("stoptime");
	String sql = "";
	String feiyong = "";
	String sheng = "";
	String spnumber = "";
	String qudaospnumber = "";
	String qudao = "";
	java.text.DecimalFormat df1 = new java.text.DecimalFormat("##0.00");
	double dialcount = 0.0000;
	double usercount = 0.0000;
	double income = 0.0000;
	double calltime = 0.0000;
	java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
	nf.setMaximumFractionDigits(2);
	String theName = (String) session.getAttribute("thename");
	String thePassword = (String) session.getAttribute("thePassword");
	String starttimes = "";
	String stoptimes = "";
	String sql1 = "";
	sql = " select a.passwordtypeid,b.passwordtypename,COUNT(*),date_format(a.inserttime,'%Y-%m-%d'),callednumber from ivr_nine_password a,ivr_nine_passwordtype b  "
			+ " where a.passwordtypeid=b.id and (a.passwordtypeid=2 or a.passwordtypeid=3 or a.passwordtypeid=4 or a.passwordtypeid=6 or a.passwordtypeid=7 or a.passwordtypeid=8  or a.passwordtypeid=9 or a.passwordtypeid=5 or a.passwordtypeid=10)  "
			+ " and a.state=0 and a.inserttime > '"
			+ starttime
			+ "'  and a.inserttime<'"
			+ endtime
			+ "' "
			+ " GROUP BY a.passwordtypeid,b.passwordtypename ,date_format(a.inserttime,'%Y-%m-%d'),a.callednumber  order by date_format(a.inserttime,'%Y-%m-%d')";

	sql1 = " select date_format(endtime,'%Y-%m-%d'),callednumber,sum(fee)/100   from ivr_nine_usertj  "
			+ " where  endtime > '"
			+ starttime
			+ "'  and endtime<'"
			+ endtime
			+ "' GROUP BY date_format(endtime,'%Y-%m-%d'),callednumber order by date_format(endtime,'%Y-%m-%d')  ";
	Hashtable tab = new Hashtable();
	Hashtable tabtj = new Hashtable();
	ArrayList list = new ArrayList();
	list.add("骏网卡");
	list.add("九五71骏网卡");
	list.add("九五71久游卡");

	ArrayList list1 = new ArrayList();
	list1.add("12590803030");
	list1.add("12590807170");
	//ArrayList listendtime=new ArrayList();
	ArrayList listtime = new ArrayList();
	conn = MysqlConnect.newConnection();
	pstmt = conn.createStatement();
	rst = pstmt.executeQuery(sql);

	while (rst.next()) {
		String strgetstring = rst.getString(2);
	 if (strgetstring.equals("久游卡")&& "12590899788".equals(rst.getString(5))) {
			strgetstring = "灵通88久游卡";
		} else if (strgetstring.equals("极光卡")&& "12590899788".equals(rst.getString(5))) {
			strgetstring = "灵通88极光卡";
		} else if (strgetstring.equals("金山卡")&& "12590899788".equals(rst.getString(5))) {
			strgetstring = "灵通88金山卡";
		} else if (strgetstring.equals("9788盛大卡")&& ("12590899788".equals(rst.getString(5))||"125908997".equals(rst.getString(5)))) {
			strgetstring = "灵通88-9788盛大卡";
		}else if (strgetstring.equals("久游卡")&& ("12590899789".equals(rst.getString(5))||"125908997".equals(rst.getString(5)))) {
			strgetstring = "灵通久游卡";
		} else if (strgetstring.equals("骏网卡")&& (rst.getString(5).equals("12590807170")||"125908071".equals(rst.getString(5)))) {
			strgetstring = "九五71骏网卡";
		} else if (strgetstring.equals("久游卡")&& (rst.getString(5).equals("12590807170")||"125908071".equals(rst.getString(5)))) {
			strgetstring = "九五71久游卡";
		} else if (strgetstring.equals("极光卡")&& (rst.getString(5).equals("12590807170")||"125908071".equals(rst.getString(5)))) {
			strgetstring = "九五71极光卡";
		}else if (strgetstring.equals("骏网卡")&& (rst.getString(5).equals("1259089965")||"125908996".equals(rst.getString(5)))) {
			strgetstring = "灵通96骏网卡";
		}else if (strgetstring.equals("盛大卡")&& (rst.getString(5).equals("1259089965")||"125908996".equals(rst.getString(5)))) {
			strgetstring = "灵通96盛大卡";
		}else if (strgetstring.equals("骏网卡")&& (rst.getString(5).equals("1259089968"))) {
			strgetstring = "灵通968骏网卡";
		}else if (strgetstring.equals("盛大卡")&& (rst.getString(5).equals("1259089968"))) {
			strgetstring = "灵通968盛大卡";
		}
		String newtabstr=rst.getString(4) + "," + strgetstring;
		if (tab.containsKey(newtabstr)) {
			int kk=Integer.parseInt(tab.get(newtabstr).toString());
			tab.remove(newtabstr);
			tab.put(newtabstr, rst.getInt(3)+kk);
		}else
		{
			tab.put(newtabstr, rst.getString(3));
		}
		if (!listtime.contains(rst.getString(4))) {
			listtime.add(rst.getString(4));
		}
		//if(!list.contains(rst.getString(2)))
		//{
		//	list.add(rst.getString(2));
		///}
	}
	rst = pstmt.executeQuery(sql1);

	while (rst.next()) {
		String callernum= rst.getString(2);
		if("125908071".equals(callernum))
		{
			callernum="12590807170";
		}else
			if("125908030".equals(callernum))
			{
				callernum="12590803030";
			}
		String newtabstr=rst.getString(1) + "," + callernum;
		if (tabtj.containsKey(newtabstr)) {
			int kk=Integer.parseInt(tabtj.get(newtabstr).toString());
			tabtj.remove(newtabstr);
			tabtj.put(newtabstr, rst.getInt(3)+kk);
		}else
		{
			tabtj.put(newtabstr, rst.getInt(3));
		}
		if (!listtime.contains(rst.getString(1))) {
			listtime.add(rst.getString(1));
		}
	}
	//  out.println(sql);
	Collections.sort(listtime);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title> 查询业务销售量</title>
</head>

<body>
<blockquote>
  <p align="center"><strong>查询业务销售量</strong></p>
</blockquote>
<table width="1400" height="124" border="1" align="center">
    <td width="125">日期</td>
	<td width="98"><%=list.get(0)%></td>
    <td width="106"><%=list.get(1)%></td>
        	<td width="98"><%=list.get(2)%></td>
    <td width="124">总数</td>
    <td width="124">骏网信息费</td>
    <td width="124">骏网平均值</td>
    <td width="124">九五71信息费</td>
    <td width="124">九五71平均值</td>
    <td width="124">总信息费</td>
  <tr> 
    <%
     	/// if(phone!=null&&!"".equals(phone))
     	// {
     	try {

     		int allnum1 = 0;
     		int allnum2 = 0;
     		int allnum3 = 0;
     		int allnum4 = 0;
     		int allnum5 = 0;
     		int allnum6 = 0;
     		int allnum7 = 0;
     		int allnum8 = 0;
     		int allnum9 = 0;
     		int allnum10 = 0;
     		int allnum11 = 0;
     		int allnum12 = 0;
     		int allnum13 = 0;
     		int allnum14 = 0;
     		int allnum15 = 0;
     		int allnum16 = 0;
     		int allnum17 = 0;
     		int allnum18 = 0;
     		int allnum19 = 0;
     		int allnum = 0;
     		int all1 = 0;
     		int all2 = 0;
     		int all3 = 0;
     		int all4 = 0;
     		int all5 = 0;
     		int all6 = 0;
     		int all7 = 0;
     		int jiu = 0;
     		int jun = 0;
     		int ling = 0;
     		int jiunew = 0;
     		int lingtongnew = 0;
     		int lingtong96 = 0;
     		int lingtong968 = 0;
     		int c = 0;
     		int d = 0;
     		for (int i = 0; i < listtime.size(); i++) {
     			jiu = 0;
     			ling = 0;
     			jiunew = 0;
     			lingtongnew=0;
     			lingtong96 = 0;
     			lingtong968 = 0;
     			c = 0;
     			
     			out.println("<td><a href=\"menu1.jsp?time="
     					+ listtime.get(i) + "&starttime=" + starttime
     					+ "&endtime=" + endtime + "\">" + listtime.get(i)
     					+ "</td>");
     			int b = 0;

     			for (int y = 0; y < list.size(); y++) {
     				int a = 0;
     				String tt = listtime.get(i) + "," + list.get(y);
     				if (tab.containsKey(tt)) {
     					String str = tab.get(tt).toString();
     					//  out.println(str);
     					if (str == null || "".equals(str)) {
     						a = 0;
     					} else {
     						a = Integer.parseInt(str);
     					}
     				}
     				if (y == 0) {
     					allnum1 = allnum1 + a;
     					jiu = a + jiu;
     				}
     				if (y == 1) {
     					allnum2 = allnum2 + a;
     					jun = a + jun;
     				}
     				if (y == 2) {
     					allnum3 = allnum3 + a;
     					jun = a+jun;
     				}
     				
     				out.println("<td>" + a + "</td>");
     				b = b + a;
     				allnum = a + allnum;
     			}
     			out.println("<td>" + b + "</td>");

     			//    if(tabtj.containsKey(listtime.get(i)))
     			//  {
     			int all = 0;
     			for (int t = 0; t < list1.size(); t++) {
     				int tja = 0;
     				String mm = listtime.get(i) + "," + list1.get(t);
     				if (tabtj.containsKey(mm)) {
     					String str = tabtj.get(mm).toString();
     					//  out.println(str);
     					if (str == null || "".equals(str)) {
     						tja = 0;
     					} else {
     						tja = Integer.parseInt(str);
     					}
     				}
     				double pingjun = 0.00;
     				if (t == 0) {
     					all1 = all1 + tja;
     					if (jiu == 0) {
     						pingjun = 0;
     					} else {
     						pingjun = (double) tja / (double) (jiu);
     					}
     				}
     				if (t == 1) {
     					all2 = all2 + tja;
     					if (jun == 0) {
     						pingjun = 0;
     					} else {
     						pingjun = (double) tja / (double) (jun);
     					}
     				}
     				
     				out.println("<td>" + tja + "</td>");

     				out.println("<td>" + df1.format(pingjun) + "</td>");
     				all = all + tja;
     				d = d + tja;
     			}
     			out.println("<td>" + all + "</td>");
     			//     }
     %>
  </tr>
  <%
  	}
  %>
              </tr>
            <%
            	out.println("<td>合计</td>");
            		out.println("<td>" + allnum1 + "</td>");
            		out.println("<td>" + allnum2 + "</td>");
            		out.println("<td>" + allnum3 + "</td>");
            		out.println("<td>" + allnum + "</td>");
            		out.println("<td>" + all1 + "</td>");
            		out.println("<td>" + "</td>");
            		out.println("<td>" + all2 + "</td>");
            		out.println("<td>" + "</td>");
            		out.println("<td>" + d + "</td>");
            		conn.close();
            	} catch (Exception e) {
            		e.printStackTrace();
            	}
            %>
</table>
<p align="center"><a href="allment.jsp">返回</a></p>
</body>
</html>