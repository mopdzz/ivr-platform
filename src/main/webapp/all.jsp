<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*" %>
<%
    Connection conn = null;
    Statement pstmt = null;
    ResultSet rst = null;
    String starttime = request.getParameter("starttime");
    String endtime = request.getParameter("stoptime");
    String sql = "";
    String feiyong = "";
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
            + " where a.passwordtypeid=b.id and (a.passwordtypeid=1 or a.passwordtypeid=2 or a.passwordtypeid=4 or a.passwordtypeid=5 or a.passwordtypeid=6 or a.passwordtypeid=7 or a.passwordtypeid=8  or a.passwordtypeid=9 or a.passwordtypeid=5 or a.passwordtypeid=10 or a.passwordtypeid=11)  "
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
    System.out.println(sql);
    System.out.println(sql1);

    Hashtable tab = new Hashtable();
    Hashtable tabtj = new Hashtable();
    ArrayList list = new ArrayList();
    list.add("鸿联测试卡");
    list.add("鸿联骏网卡");
    list.add("鸿联久游卡");
    list.add("鸿联盛大卡");
    list.add("鸿联完美卡");
    list.add("鸿联空中卡");

    list.add("心情测试卡");
    list.add("心情久游卡");
    list.add("心情骏网卡");
    list.add("心情盛大卡");
    list.add("心情完美卡");

    list.add("宽畅测试卡");
    list.add("宽畅久游卡");
    list.add("宽畅骏网卡");
    list.add("宽畅盛大卡");
    list.add("宽畅完美卡");
    list.add("宽畅盛大3");
    list.add("宽畅盛大9");
    list.add("宽畅骏网3");
    list.add("宽畅骏网9");
    list.add("宽畅空中卡");

    list.add("通联测试卡");
    list.add("通联久游卡");
    list.add("通联骏网卡");
    list.add("通联盛大卡");
    list.add("通联完美卡");
    list.add("通联盛大3");
    list.add("通联盛大9");
    list.add("通联骏网3");
    list.add("通联骏网9");

    list.add("tom测试卡");
    list.add("tom久游卡");
    list.add("tom骏网卡");
    list.add("tom盛大卡");
    list.add("tom完美卡");

    list.add("国政通测试卡");
    list.add("国政通久游卡");
    list.add("国政通骏网卡");
    list.add("国政通盛大卡");
    list.add("国政通完美卡");
    list.add("国政通空中卡");

    ArrayList list1 = new ArrayList();
    //鸿联号码
    list1.add("12590803030");
    list1.add("12590807170");
    list1.add("12590803003");
    list1.add("12590803004");
    list1.add("12590803005");
    //心情号码
    list1.add("12590511622");
    list1.add("1259051123");
    list1.add("125905112");
    list1.add("125905116");
    //宽畅号码
    list1.add("12590730692");
    list1.add("12590730693");
    list1.add("12590730694");
    list1.add("12590730695");
    list1.add("12590730691");
    list1.add("12590730696");
    list1.add("12590730697");
    list1.add("12590730698");
    list1.add("12590730699");
    //通联号码
    list1.add("1259087589");
    list1.add("125908758502");
    list1.add("125908758582");
    list1.add("125908758585");
    list1.add("1259087584");
    list1.add("125908758503");
    list1.add("125908758666");
    list1.add("125908758888");
    //tom号码
    list1.add("125905790116");
    list1.add("125905790117");
    list1.add("125905790121");
    list1.add("125905790122");
    //国政通号码
    list1.add("12590658601");
    list1.add("12590658602");
    list1.add("12590658603");
    list1.add("12590658604");

    //ArrayList listendtime=new ArrayList();
    ArrayList listtime = new ArrayList();
    conn = MysqlConnect.newConnection();
    pstmt = conn.createStatement();
    rst = pstmt.executeQuery(sql);

    while (rst.next()) {
        String strgetstring = rst.getString(2);//卡名字
        if (strgetstring.equals("测试卡") && (rst.getString(5).equals("1259051153") || "1259051123".equals(rst.getString(5)) || "12590511622".equals(rst.getString(5)))) {
            strgetstring = "心情测试卡";
        } else if (strgetstring.equals("完美卡") && "1259051153".equals(rst.getString(5))) {
            strgetstring = "心情完美卡";
        } else if (strgetstring.equals("完美卡") && "1259051123".equals(rst.getString(5))) {
            strgetstring = "心情完美卡";
        } else if (strgetstring.equals("骏网卡") && "1259051123".equals(rst.getString(5))) {
            strgetstring = "心情骏网卡";
        } else if (strgetstring.equals("盛大卡") && "1259051123".equals(rst.getString(5))) {
            strgetstring = "心情盛大卡";
        } else if (strgetstring.equals("完美卡") && "12590511622".equals(rst.getString(5))) {
            strgetstring = "心情完美卡";
        } else if (strgetstring.equals("盛大卡") && "12590511622".equals(rst.getString(5))) {
            strgetstring = "心情盛大卡";
        } else if (strgetstring.equals("久游卡") && "1259051123".equals(rst.getString(5))) {
            strgetstring = "心情久游卡";
        } else if (strgetstring.equals("盛大卡") && "1259051123".equals(rst.getString(5))) {
            strgetstring = "心情盛大卡";

        } else if (strgetstring.equals("测试卡") && (rst.getString(5).equals("12590803030") || "125908030".equals(rst.getString(5)) || "12590807170".equals(rst.getString(5)) || "125908071".equals(rst.getString(5)))) {
            strgetstring = "鸿联测试卡";
        } else if (strgetstring.equals("骏网卡") && (rst.getString(5).equals("12590803030") || "125908030".equals(rst.getString(5)))) {
            strgetstring = "鸿联骏网卡";
        } else if (strgetstring.equals("久游卡") && (rst.getString(5).equals("12590807170") || "125908071".equals(rst.getString(5)))) {
            strgetstring = "鸿联久游卡";
        } else if (strgetstring.equals("盛大卡") && "12590803003".equals(rst.getString(5))) {
            strgetstring = "鸿联盛大卡";
        } else if (strgetstring.equals("完美卡") && "12590803004".equals(rst.getString(5))) {
            strgetstring = "鸿联完美卡";
        } else if (strgetstring.equals("空中卡") && "12590803005".equals(rst.getString(5))) {
            strgetstring = "鸿联空中卡";
        } else if (strgetstring.equals("测试卡") && (rst.getString(5).equals("12590730692") || "12590730693".equals(rst.getString(5)))) {
            strgetstring = "宽畅测试卡";
        } else if (strgetstring.equals("骏网卡") && (rst.getString(5).equals("12590730692") || "12590730693".equals(rst.getString(5)) || "12590730694".equals(rst.getString(5)) || "12590730695".equals(rst.getString(5)))) {
            strgetstring = "宽畅骏网卡";
        } else if (strgetstring.equals("完美卡") && (rst.getString(5).equals("12590730692") || "12590730693".equals(rst.getString(5)) || "12590730694".equals(rst.getString(5)) || "12590730695".equals(rst.getString(5)))) {
            strgetstring = "宽畅完美卡";
        } else if (strgetstring.equals("盛大卡") && (rst.getString(5).equals("12590730692") || "12590730693".equals(rst.getString(5)) || "12590730694".equals(rst.getString(5)) || "12590730695".equals(rst.getString(5)))) {
            strgetstring = "宽畅盛大卡";
        } else if (strgetstring.equals("久游卡") && (rst.getString(5).equals("12590730692") || "12590730693".equals(rst.getString(5)) || "12590730694".equals(rst.getString(5)) || "12590730695".equals(rst.getString(5)))) {
            strgetstring = "宽畅久游卡";
        } else if (strgetstring.equals("盛大卡") && "12590730691".equals(rst.getString(5))) {
            strgetstring = "宽畅空中卡";
        } else if (strgetstring.equals("完美卡") && "12590730696".equals(rst.getString(5))) {
            strgetstring = "宽畅骏网3";
        } else if (strgetstring.equals("空中卡") && "12590730697".equals(rst.getString(5))) {
            strgetstring = "宽畅骏网9";
        } else if (strgetstring.equals("完美卡") && "12590730698".equals(rst.getString(5))) {
            strgetstring = "宽畅盛大3";
        } else if (strgetstring.equals("空中卡") && "12590730699".equals(rst.getString(5))) {
            strgetstring = "宽畅盛大9";
        } else if (strgetstring.equals("测试卡") && (rst.getString(5).equals("1259087589") || "1259087584".equals(rst.getString(5)))) {
            strgetstring = "通联测试卡";
        } else if (strgetstring.equals("骏网卡") && (rst.getString(5).equals("1259087589") || "1259087584".equals(rst.getString(5)) || "125908758503".equals(rst.getString(5)) || "125908758666".equals(rst.getString(5)) || "125908758999".equals(rst.getString(5)) || "125908758502".equals(rst.getString(5)) || "125908758582".equals(rst.getString(5)) || "125908758585".equals(rst.getString(5)))) {
            strgetstring = "通联骏网卡";
        } else if (strgetstring.equals("完美卡") && (rst.getString(5).equals("1259087589") || "1259087584".equals(rst.getString(5)) || "125908758503".equals(rst.getString(5)) || "125908758666".equals(rst.getString(5)) || "125908758999".equals(rst.getString(5)) || "125908758502".equals(rst.getString(5)) || "125908758582".equals(rst.getString(5)) || "125908758585".equals(rst.getString(5)))) {
            strgetstring = "通联完美卡";
        } else if (strgetstring.equals("盛大卡") && (rst.getString(5).equals("1259087589") || "1259087584".equals(rst.getString(5)) || "125908758503".equals(rst.getString(5)) || "125908758666".equals(rst.getString(5)) || "125908758999".equals(rst.getString(5)) || "125908758502".equals(rst.getString(5)) || "125908758582".equals(rst.getString(5)) || "125908758585".equals(rst.getString(5)))) {
            strgetstring = "通联盛大卡";
        } else if (strgetstring.equals("久游卡") && (rst.getString(5).equals("1259087589") || "1259087584".equals(rst.getString(5)) || "125908758503".equals(rst.getString(5)) || "125908758666".equals(rst.getString(5)) || "125908758999".equals(rst.getString(5)) || "125908758502".equals(rst.getString(5)) || "125908758582".equals(rst.getString(5)) || "125908758585".equals(rst.getString(5)))) {
            strgetstring = "通联久游卡";
        } else if (strgetstring.equals("盛大3") && (rst.getString(5).equals("1259087589") || "1259087584".equals(rst.getString(5)) || "125908758503".equals(rst.getString(5)) || "125908758666".equals(rst.getString(5)) || "125908758999".equals(rst.getString(5)) || "125908758502".equals(rst.getString(5)) || "125908758582".equals(rst.getString(5)) || "125908758585".equals(rst.getString(5)))) {
            strgetstring = "通联盛大3";
        } else if (strgetstring.equals("盛大9") && (rst.getString(5).equals("1259087589") || "1259087584".equals(rst.getString(5)) || "125908758503".equals(rst.getString(5)) || "125908758666".equals(rst.getString(5)) || "125908758999".equals(rst.getString(5)) || "125908758502".equals(rst.getString(5)) || "125908758582".equals(rst.getString(5)) || "125908758585".equals(rst.getString(5)))) {
            strgetstring = "通联盛大9";
        } else if (strgetstring.equals("骏网3") && (rst.getString(5).equals("1259087589") || "1259087584".equals(rst.getString(5)) || "125908758503".equals(rst.getString(5)) || "125908758666".equals(rst.getString(5)) || "125908758999".equals(rst.getString(5)) || "125908758502".equals(rst.getString(5)) || "125908758582".equals(rst.getString(5)) || "125908758585".equals(rst.getString(5)))) {
            strgetstring = "通联骏网3";
        } else if (strgetstring.equals("骏网9") && (rst.getString(5).equals("1259087589") || "1259087584".equals(rst.getString(5)) || "125908758503".equals(rst.getString(5)) || "125908758666".equals(rst.getString(5)) || "125908758999".equals(rst.getString(5)) || "125908758502".equals(rst.getString(5)) || "125908758582".equals(rst.getString(5)) || "125908758585".equals(rst.getString(5)))) {
            strgetstring = "通联骏网9";
        } else if (strgetstring.equals("测试卡") && (rst.getString(5).equals("125905790116") || "125905790117".equals(rst.getString(5)))) {
            strgetstring = "tom测试卡";
        } else if (strgetstring.equals("骏网卡") && (rst.getString(5).equals("125905790116") || "125905790117".equals(rst.getString(5)) || "125905790121".equals(rst.getString(5)) || "125905790122".equals(rst.getString(5)))) {
            strgetstring = "tom骏网卡";
        } else if (strgetstring.equals("完美卡") && (rst.getString(5).equals("125905790116") || "125905790117".equals(rst.getString(5)) || "125905790121".equals(rst.getString(5)) || "125905790122".equals(rst.getString(5)))) {
            strgetstring = "tom完美卡";
        } else if (strgetstring.equals("盛大卡") && (rst.getString(5).equals("125905790116") || "125905790117".equals(rst.getString(5)) || "125905790121".equals(rst.getString(5)) || "125905790122".equals(rst.getString(5)))) {
            strgetstring = "tom盛大卡";
        } else if (strgetstring.equals("久游卡") && (rst.getString(5).equals("125905790116") || "125905790117".equals(rst.getString(5)) || "125905790121".equals(rst.getString(5)) || "125905790122".equals(rst.getString(5)))) {
            strgetstring = "tom久游卡";

        } else if (strgetstring.equals("测试卡") && (rst.getString(5).equals("12590658601") || "12590658602".equals(rst.getString(5)) || "12590658603".equals(rst.getString(5)) || "12590658604".equals(rst.getString(5)))) {
            strgetstring = "国政通测试卡";
        } else if (strgetstring.equals("骏网卡") && (rst.getString(5).equals("12590658601") || "12590658602".equals(rst.getString(5)) || "12590658603".equals(rst.getString(5)) || "12590658604".equals(rst.getString(5)))) {
            strgetstring = "国政通骏网卡";
        } else if (strgetstring.equals("完美卡") && (rst.getString(5).equals("12590658601") || "12590658602".equals(rst.getString(5)) || "12590658603".equals(rst.getString(5)) || "12590658604".equals(rst.getString(5)))) {
            strgetstring = "国政通完美卡";
        } else if (strgetstring.equals("盛大卡") && (rst.getString(5).equals("12590658601") || "12590658602".equals(rst.getString(5)) || "12590658603".equals(rst.getString(5)) || "12590658604".equals(rst.getString(5)))) {
            strgetstring = "国政通盛大卡";
        } else if (strgetstring.equals("久游卡") && (rst.getString(5).equals("12590658601") || "12590658602".equals(rst.getString(5)) || "12590658603".equals(rst.getString(5)) || "12590658604".equals(rst.getString(5)))) {
            strgetstring = "国政通久游卡";
        } else if (strgetstring.equals("空中卡") && (rst.getString(5).equals("12590658601") || "12590658602".equals(rst.getString(5)) || "12590658603".equals(rst.getString(5)) || "12590658604".equals(rst.getString(5)))) {
            strgetstring = "国政通空中卡";
        }
        String newtabstr = rst.getString(4) + "," + strgetstring;//YYYY-MM-DD,卡名字（鸿联骏网卡）
        if (tab.containsKey(newtabstr)) {
            int kk = Integer.parseInt(tab.get(newtabstr).toString());
            tab.remove(newtabstr);
            tab.put(newtabstr, rst.getInt(3) + kk);
            //System.out.println("10="+newtabstr);
        } else {
            tab.put(newtabstr, rst.getString(3));//YYYY-MM-DD,卡名字，总次数
            //System.out.println("11="+newtabstr);
        }
        if (!listtime.contains(rst.getString(4))) {
            listtime.add(rst.getString(4)); //YYYY-MM-DD
        }
        //if(!list.contains(rst.getString(2)))
        //{
        //	list.add(rst.getString(2));
        ///}
    }
    rst = pstmt.executeQuery(sql1);

    while (rst.next()) {
        String callernum = rst.getString(2);
        if ("1259051153".equals(callernum) || "1259051123".equals(callernum) || "125905112".equals(callernum) || "125905116".equals(callernum))//把"1259051153"号码转换为"12590511622"号码
        {
            callernum = "12590511622";
        } else if ("125908030".equals(callernum)) {
            callernum = "12590803030";
        } else if ("125908997".equals(callernum)) {
            callernum = "12590899789";
        } else if ("125908071".equals(callernum)) {
            callernum = "12590807170";
        } else if ("125908996".equals(callernum)) {
            callernum = "1259089965";
        }
        String newtabstr = rst.getString(1) + "," + callernum;
        //System.out.println("aa"+newtabstr);
        if (tabtj.containsKey(newtabstr)) {
            int kk = Integer.parseInt(tabtj.get(newtabstr).toString());
            tabtj.remove(newtabstr);
            tabtj.put(newtabstr, rst.getInt(3) + kk);
        } else {
            tabtj.put(newtabstr, rst.getInt(3));
            System.out.println(newtabstr + "," + rst.getInt(3));

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
<td width="106"><%=list.get(0)%>
</td>
<td width="106"><%=list.get(1)%>
</td>
<td width="106"><%=list.get(2)%>
</td>
<td width="106"><%=list.get(3)%>
</td>
<td width="106"><%=list.get(4)%>
</td>
<td width="106"><%=list.get(5)%>
</td>
<td width="106"><%=list.get(6)%>
</td>
<td width="106"><%=list.get(7)%>
</td>
<td width="106"><%=list.get(8)%>
</td>
<td width="106"><%=list.get(9)%>
</td>
<td width="106"><%=list.get(10)%>
</td>
<td width="106"><%=list.get(11)%>
</td>
<td width="106"><%=list.get(12)%>
</td>
<td width="106"><%=list.get(13)%>
</td>
<td width="106"><%=list.get(14)%>
</td>
<td width="106"><%=list.get(15)%>
</td>
<td width="106"><%=list.get(16)%>
</td>
<td width="106"><%=list.get(17)%>
</td>
<td width="106"><%=list.get(18)%>
</td>
<td width="106"><%=list.get(19)%>
</td>
<td width="106"><%=list.get(20)%>
</td>
<td width="106"><%=list.get(21)%>
</td>
<td width="106"><%=list.get(22)%>
</td>
<td width="106"><%=list.get(23)%>
</td>
<td width="106"><%=list.get(24)%>
</td>
<td width="106"><%=list.get(25)%>
</td>
<td width="106"><%=list.get(26)%>
</td>
<td width="106"><%=list.get(27)%>
</td>
<td width="106"><%=list.get(28)%>
</td>
<td width="106"><%=list.get(29)%>
</td>
<td width="106"><%=list.get(30)%>
</td>
<td width="106"><%=list.get(31)%>
</td>
<td width="106"><%=list.get(32)%>
</td>
<td width="106"><%=list.get(33)%>
</td>
<td width="106"><%=list.get(34)%>
</td>
<td width="106"><%=list.get(35)%>
</td>
<td width="106"><%=list.get(36)%>
</td>
<td width="106"><%=list.get(37)%>
</td>
<td width="106"><%=list.get(38)%>
</td>
<td width="106"><%=list.get(39)%>
</td>
<td width="106"><%=list.get(40)%>
</td>
<td width="124">总数</td>
<td width="124">鸿联信息费</td>
<td width="124">鸿联平均值</td>
<td width="124">心情信息费</td>
<td width="124">心情平均值</td>
<td width="124">宽畅信息费</td>
<td width="124">宽畅平均值</td>
<td width="124">通联信息费</td>
<td width="124">通联平均值</td>
<td width="124">tom信息费</td>
<td width="124">tom平均值</td>
<td width="124">国政通信息费</td>
<td width="124">国政通平均值</td>
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
        int allnum20 = 0;
        int allnum21 = 0;
        int allnum22 = 0;
        int allnum23 = 0;
        int allnum24 = 0;
        int allnum25 = 0;
        int allnum26 = 0;
        int allnum27 = 0;
        int allnum28 = 0;
        int allnum29 = 0;
        int allnum30 = 0;
        int allnum31 = 0;
        int allnum32 = 0;
        int allnum33 = 0;
        int allnum34 = 0;
        int allnum35 = 0;
        int allnum36 = 0;
        int allnum37 = 0;
        int allnum38 = 0;
        int allnum39 = 0;
        int allnum40 = 0;
        int allnum41 = 0;
        int allnum = 0;
        int all_hl = 0;
        int all_xinqing = 0;
        int all_shenzhou = 0;
        int all_xinxifei = 0;
        int all_tonglian = 0;
        int all_tom = 0;
        int all_guozhengtong = 0;

        int hl_ceshi = 0;
        int hl_junwang = 0;
        int hl_jiuyou = 0;
        int hl_shengda = 0;
        int hl_wanmei = 0;
        int hl_kongzhong = 0;
        int xinqing_ceshi = 0;
        int xinqing_jiuyou = 0;
        int xinqing_junwang = 0;
        int xinqing_shengda = 0;
        int xinqing_wanmei = 0;
        int shenzhou_ceshi = 0;
        int shenzhou_jiuyou = 0;
        int shenzhou_junwang = 0;
        int shenzhou_shengda = 0;
        int shenzhou_wanmei = 0;
        int shenzhou_kongzhong = 0;
        int shenzhou_junwang3 = 0;
        int shenzhou_junwang9 = 0;
        int shenzhou_shengda3 = 0;
        int shenzhou_shengda9 = 0;
        int tonglian_ceshi = 0;
        int tonglian_jiuyou = 0;
        int tonglian_junwang = 0;
        int tonglian_shengda = 0;
        int tonglian_wanmei = 0;
        int tonglian_shengda3 = 0;
        int tonglian_shengda9 = 0;
        int tonglian_junwang3 = 0;
        int tonglian_junwang9 = 0;
        int tom_ceshi = 0;
        int tom_jiuyou = 0;
        int tom_junwang = 0;
        int tom_shengda = 0;
        int tom_wanmei = 0;
        int guozhengtong_ceshi = 0;
        int guozhengtong_jiuyou = 0;
        int guozhengtong_junwang = 0;
        int guozhengtong_shengda = 0;
        int guozhengtong_wanmei = 0;
        int guozhengtong_kongzhong = 0;

        int alltime_hl = 0;
        double alltime_hl_pingjun = 0;
        int alltime_xinqing = 0;
        double alltime_xinqing_pingjun = 0;
        int alltime_shenzhou = 0;
        double alltime_shenzhou_pingjun = 0;
        int alltime_tonglian = 0;
        double alltime_tonglian_pingjun = 0;
        int alltime_tom = 0;
        double alltime_tom_pingjun = 0;
        int alltime_guozhengtong = 0;
        double alltime_guozhengtong_pingjun = 0;
        int alltime_xinxifei = 0;

        for (int i = 0; i < listtime.size(); i++) {//循环处理每一天业务
            System.out.println(listtime.get(i));
            hl_ceshi = 0;
            hl_junwang = 0;
            hl_jiuyou = 0;
            hl_shengda = 0;
            hl_wanmei = 0;
            hl_kongzhong = 0;
            xinqing_ceshi = 0;
            xinqing_jiuyou = 0;
            xinqing_junwang = 0;
            xinqing_shengda = 0;
            xinqing_wanmei = 0;
            shenzhou_ceshi = 0;
            shenzhou_jiuyou = 0;
            shenzhou_junwang = 0;
            shenzhou_shengda = 0;
            shenzhou_wanmei = 0;
            shenzhou_kongzhong = 0;
            shenzhou_junwang3 = 0;
            shenzhou_junwang9 = 0;
            shenzhou_shengda3 = 0;
            shenzhou_shengda9 = 0;
            tonglian_ceshi = 0;
            tonglian_jiuyou = 0;
            tonglian_junwang = 0;
            tonglian_shengda = 0;
            tonglian_wanmei = 0;
            tonglian_shengda3 = 0;
            tonglian_shengda9 = 0;
            tonglian_junwang3 = 0;
            tonglian_junwang9 = 0;
            tom_ceshi = 0;
            tom_jiuyou = 0;
            tom_junwang = 0;
            tom_shengda = 0;
            tom_wanmei = 0;
            guozhengtong_ceshi = 0;
            guozhengtong_jiuyou = 0;
            guozhengtong_junwang = 0;
            guozhengtong_shengda = 0;
            guozhengtong_wanmei = 0;
            guozhengtong_kongzhong = 0;
            all_hl = 0;     //HL总数(每天)
            all_xinqing = 0;//心情总数(每天)
            all_shenzhou = 0;//宽畅总数(每天)
            all_tonglian = 0;//通联总数(每天)
            all_tom = 0;//tom总数(每天)
            all_guozhengtong = 0;//国政通总数(每天)
            all_xinxifei = 0;//总信息费(每天)


            out.println("<td><a href=\"menu1.jsp?time="
                    + listtime.get(i) + "&starttime=" + starttime
                    + "&endtime=" + endtime + "\">" + listtime.get(i)
                    + "</td>");//显示时间段： yyyy-mm-dd
            int b = 0;

            for (int y = 0; y < list.size(); y++) {//循环处理每个业务
                int a = 0;
                String tt = listtime.get(i) + "," + list.get(y);//YYYY-MM-DD，卡名字

                if (tab.containsKey(tt)) {
                    String str = tab.get(tt).toString();
                    //  out.println(str);
                    System.out.println("业务：" + tt);
                    System.out.println("总次数：" + str);//总次数
                    if (str == null || "".equals(str)) {
                        a = 0;
                    } else {
                        a = Integer.parseInt(str);//拨打次数
                    }
                }

                if (y == 0) {//鸿联测试卡
                    allnum1 = allnum1 + a;//每个业务在所选时间段的合计次数
                    hl_ceshi = a + hl_ceshi;
                }
                if (y == 1) {//鸿联骏网卡
                    allnum2 = allnum2 + a;//每个业务在所选时间段的合计次数
                    hl_junwang = a + hl_junwang;
                }
                if (y == 2) {//鸿联久游卡
                    allnum3 = allnum3 + a;//每个业务在所选时间段的合计次数
                    hl_jiuyou = a + hl_jiuyou;
                }
                if (y == 3) {//鸿联盛大卡
                    allnum4 = allnum4 + a;//每个业务在所选时间段的合计次数
                    hl_shengda = a + hl_shengda;
                }
                if (y == 4) {//鸿联完美卡
                    allnum5 = allnum5 + a;//每个业务在所选时间段的合计次数
                    hl_wanmei = a + hl_wanmei;
                }
                if (y == 5) {//鸿联空中卡
                    allnum6 = allnum6 + a;//每个业务在所选时间段的合计次数
                    hl_kongzhong = a + hl_kongzhong;
                }

                if (y == 6) {// 心情测试卡
                    allnum7 = allnum7 + a;
                    xinqing_ceshi = a + xinqing_ceshi;
                }
                if (y == 7) {// 心情久游卡
                    allnum8 = allnum8 + a;
                    xinqing_jiuyou = a + xinqing_jiuyou;
                }
                if (y == 8) {//心情骏网卡
                    allnum9 = allnum9 + a;
                    xinqing_junwang = a + xinqing_junwang;

                }
                if (y == 9) {//心情盛大卡
                    allnum10 = allnum10 + a;
                    xinqing_shengda = a + xinqing_shengda;

                }
                if (y == 10) {//心情完美卡
                    allnum11 = allnum11 + a;
                    xinqing_wanmei = a + xinqing_wanmei;
                }

                if (y == 11) {//宽畅测试卡
                    allnum12 = allnum12 + a;
                    shenzhou_ceshi = a + shenzhou_ceshi;
                }

                if (y == 12) {//宽畅久游卡
                    allnum13 = allnum13 + a;
                    shenzhou_jiuyou = a + shenzhou_jiuyou;
                }
                if (y == 13) {//宽畅骏网卡
                    allnum14 = allnum14 + a;
                    shenzhou_junwang = a + shenzhou_junwang;

                }
                if (y == 14) {//宽畅盛大卡
                    allnum15 = allnum15 + a;
                    shenzhou_shengda = a + shenzhou_shengda;

                }
                if (y == 15) {//宽畅完美卡
                    allnum16 = allnum16 + a;
                    shenzhou_wanmei = a + shenzhou_wanmei;
                }
                if (y == 16) {//宽畅空中卡
                    allnum17 = allnum17 + a;
                    shenzhou_kongzhong = a + shenzhou_kongzhong;
                }
                if (y == 17) {//宽畅骏网3
                    allnum18 = allnum18 + a;
                    shenzhou_junwang3 = a + shenzhou_junwang3;
                }
                if (y == 18) {//宽畅骏网9
                    allnum19 = allnum19 + a;
                    shenzhou_junwang9 = a + shenzhou_junwang9;
                }
                if (y == 19) {//宽畅盛大3
                    allnum20 = allnum20 + a;
                    shenzhou_shengda3 = a + shenzhou_shengda3;
                }
                if (y == 20) {//宽畅盛大9
                    allnum21 = allnum21 + a;
                    shenzhou_shengda9 = a + shenzhou_shengda9;
                }
                if (y == 21) {//通联测试卡
                    allnum22 = allnum22 + a;
                    tonglian_ceshi = a + tonglian_ceshi;
                }
                if (y == 22) {//通联久游卡
                    allnum23 = allnum23 + a;
                    tonglian_jiuyou = a + tonglian_jiuyou;
                }
                if (y == 23) {//通联骏网卡
                    allnum24 = allnum24 + a;
                    tonglian_junwang = a + tonglian_junwang;
                }
                if (y == 24) {//通联盛大卡
                    allnum25 = allnum25 + a;
                    tonglian_shengda = a + tonglian_shengda;
                }
                if (y == 25) {//通联完美卡
                    allnum26 = allnum26 + a;
                    tonglian_wanmei = a + tonglian_wanmei;
                }
                if (y == 26) {//通联盛大3
                    allnum27 = allnum27 + a;
                    tonglian_shengda3 = a + tonglian_shengda3;
                }
                if (y == 27) {//通联盛大9
                    allnum28 = allnum28 + a;
                    tonglian_shengda9 = a + tonglian_shengda9;
                }
                if (y == 28) {//通联骏网3
                    allnum29 = allnum29 + a;
                    tonglian_junwang3 = a + tonglian_junwang3;
                }
                if (y == 29) {//通联骏网9
                    allnum30 = allnum30 + a;
                    tonglian_junwang9 = a + tonglian_junwang9;
                }
                if (y == 30) {//tom测试卡
                    allnum31 = allnum31 + a;
                    tom_ceshi = a + tom_ceshi;
                }

                if (y == 31) {//tom久游卡
                    allnum32 = allnum32 + a;
                    tom_jiuyou = a + tom_jiuyou;
                }
                if (y == 32) {//tom骏网卡
                    allnum33 = allnum33 + a;
                    tom_junwang = a + tom_junwang;
                }
                if (y == 33) {//tom盛大卡
                    allnum34 = allnum34 + a;
                    tom_shengda = a + tom_shengda;
                }
                if (y == 34) {//tom完美卡
                    allnum35 = allnum35 + a;
                    tom_wanmei = a + tom_wanmei;
                }
                if (y == 35) {//guozhengtong测试卡
                    allnum36 = allnum36 + a;
                    guozhengtong_ceshi = a + guozhengtong_ceshi;
                }

                if (y == 36) {//guozhengtong久游卡
                    allnum37 = allnum37 + a;
                    guozhengtong_jiuyou = a + guozhengtong_jiuyou;
                }
                if (y == 37) {//guozhengtong骏网卡
                    allnum38 = allnum38 + a;
                    guozhengtong_junwang = a + guozhengtong_junwang;
                }
                if (y == 38) {//guozhengtong盛大卡
                    allnum39 = allnum39 + a;
                    guozhengtong_shengda = a + guozhengtong_shengda;
                }
                if (y == 39) {//guozhengtong完美卡
                    allnum40 = allnum40 + a;
                    guozhengtong_wanmei = a + guozhengtong_wanmei;
                }
                if (y == 40) {//guozhengtong空中卡
                    allnum41 = allnum41 + a;
                    guozhengtong_kongzhong = a + guozhengtong_kongzhong;
                }
                out.println("<td>" + a + "</td>");//显示每个业务单天拨打总次数
                b = b + a;
                allnum = a + allnum;// 总数
            }

            out.println("<td>" + b + "</td>");//总数

            for (int t = 0; t < list1.size(); t++) {//业务号码集合
                int tja = 0;
                String mm = listtime.get(i) + "," + list1.get(t);
                System.out.println(mm);

                if (tabtj.containsKey(mm)) {
                    String str = tabtj.get(mm).toString();
                    //  out.println(str);
                    if (str == null || "".equals(str)) {
                        tja = 0;
                    } else {
                        tja = Integer.parseInt(str);
                        System.out.println("tja=" + tja);//信息费
                    }
                }

                double pingjun = 0.00;
                //鸿联
                if (t == 0 || t == 1 || t == 2 || t == 3 || t == 4) {//12590803030,12590807170
                    all_hl = all_hl + tja;//合计信息费
                    if (hl_ceshi + hl_jiuyou + hl_junwang + hl_shengda + hl_wanmei + hl_kongzhong == 0) {
                        pingjun = 0;
                    } else {
                        pingjun = (double) all_hl / (double) (hl_ceshi + hl_jiuyou + hl_junwang + hl_shengda + hl_wanmei + hl_kongzhong);//平均值
                    }
                }
                //心情
                if (t == 5 || t == 6 || t == 7 || t == 8) {//12590511622,12590511255,1259073336
                    all_xinqing = all_xinqing + tja;
                    if (xinqing_ceshi + xinqing_shengda + xinqing_wanmei + xinqing_jiuyou + xinqing_junwang == 0) {
                        pingjun = 0;
                    } else {
                        pingjun = (double) all_xinqing / (double) (xinqing_ceshi + xinqing_shengda + xinqing_wanmei + xinqing_jiuyou + xinqing_junwang);
                    }
                }
                //宽畅
                if (t == 9 || t == 10 || t == 11 || t == 12 || t == 13 || t == 14 || t == 15 || t == 16 || t == 17) {//宽畅
                    all_shenzhou = all_shenzhou + tja;
                    if (shenzhou_ceshi + shenzhou_shengda + shenzhou_wanmei + shenzhou_jiuyou + shenzhou_junwang + shenzhou_kongzhong + shenzhou_junwang3 + shenzhou_junwang9 + shenzhou_shengda3 + shenzhou_shengda9 == 0) {
                        pingjun = 0;
                    } else {
                        pingjun = (double) all_shenzhou / (double) (shenzhou_ceshi + shenzhou_shengda + shenzhou_wanmei + shenzhou_jiuyou + shenzhou_junwang + shenzhou_kongzhong + shenzhou_junwang3 + shenzhou_junwang9 + shenzhou_shengda3 + shenzhou_shengda9);
                    }
                }
                //通联
                if (t == 18 || t == 19 || t == 20 || t == 21 || t == 22 || t == 23 || t == 24 || t == 25) {//通联
                    all_tonglian = all_tonglian + tja;
                    if (tonglian_ceshi + tonglian_shengda + tonglian_wanmei + tonglian_jiuyou + tonglian_junwang + tonglian_shengda3 + tonglian_shengda9 + tonglian_junwang3 + tonglian_junwang9 == 0) {
                        pingjun = 0;
                    } else {
                        pingjun = (double) all_tonglian / (double) (tonglian_ceshi + tonglian_shengda + tonglian_wanmei + tonglian_jiuyou + tonglian_junwang + tonglian_shengda3 + tonglian_shengda9 + tonglian_junwang3 + tonglian_junwang9);
                    }
                }
                //tom
                if (t == 26 || t == 27 || t == 28 || t == 29) {//tom
                    all_tom = all_tom + tja;
                    if (tom_ceshi + tom_shengda + tom_wanmei + tom_jiuyou + tom_junwang == 0) {
                        pingjun = 0;
                    } else {
                        pingjun = (double) all_tom / (double) (tom_ceshi + tom_shengda + tom_wanmei + tom_jiuyou + tom_junwang);
                    }
                }
                //guozhengtong
                //if (t == 28 || t == 29 || t == 30 || t == 31) {国政通
                if (t == 30 || t == 31 || t == 32 || t == 33) {//国政通
                    all_guozhengtong = all_guozhengtong + tja;
                    if (guozhengtong_ceshi + guozhengtong_shengda + guozhengtong_wanmei + guozhengtong_jiuyou + guozhengtong_junwang + guozhengtong_kongzhong == 0) {
                        pingjun = 0;
                    } else {
                        pingjun = (double) all_guozhengtong / (double) (guozhengtong_ceshi + guozhengtong_shengda + guozhengtong_wanmei + guozhengtong_jiuyou + guozhengtong_junwang + guozhengtong_kongzhong);
                    }
                }

                if (t == 4) {//鸿联
                    out.println("<td>" + all_hl + "</td>");//信息费
                    out.println("<td>" + df1.format(pingjun) + "</td>");//平均值
                    all_xinxifei = all_xinxifei + all_hl;
                    //System.out.println("t="+t+",,,"+all_xinxifei);
                    alltime_hl = alltime_hl + all_hl;
                    alltime_hl_pingjun = alltime_hl_pingjun + pingjun;
                    alltime_xinxifei = alltime_xinxifei + all_hl;
                    //System.out.println("t="+t+",,,"+alltime_xinxifei);
                }
                if (t == 8) {//心情
                    out.println("<td>" + all_xinqing + "</td>");//信息费
                    out.println("<td>" + df1.format(pingjun) + "</td>");//平均值
                    all_xinxifei = all_xinxifei + all_xinqing;
                    //System.out.println("t="+t+",,,"+all_xinxifei);
                    alltime_xinqing = alltime_xinqing + all_xinqing;
                    alltime_xinqing_pingjun = alltime_xinqing_pingjun + pingjun;
                    alltime_xinxifei = alltime_xinxifei + all_xinqing;
                    //System.out.println("t="+t+",,,"+alltime_xinxifei);
                }
                if (t == 17) {//宽畅
                    System.out.println("all_shenzhou=" + all_shenzhou);
                    out.println("<td>" + all_shenzhou + "</td>");//信息费
                    out.println("<td>" + df1.format(pingjun) + "</td>");//平均值
                    all_xinxifei = all_xinxifei + all_shenzhou;
                    //System.out.println("t="+t+",,,"+all_xinxifei);
                    alltime_shenzhou = alltime_shenzhou + all_shenzhou;
                    alltime_shenzhou_pingjun = alltime_shenzhou_pingjun + pingjun;
                    alltime_xinxifei = alltime_xinxifei + all_shenzhou;
                    //System.out.println("t="+t+",,,"+alltime_xinxifei);
                }
                if (t == 25) {//通联
                    System.out.println("all_tonglian=" + all_tonglian);
                    out.println("<td>" + all_tonglian + "</td>");//信息费
                    out.println("<td>" + df1.format(pingjun) + "</td>");//平均值
                    all_xinxifei = all_xinxifei + all_tonglian;
                    //System.out.println("t="+t+",,,"+all_xinxifei);
                    alltime_tonglian = alltime_tonglian + all_tonglian;
                    alltime_tonglian_pingjun = alltime_tonglian_pingjun + pingjun;
                    alltime_xinxifei = alltime_xinxifei + all_tonglian;
                    //System.out.println("t="+t+",,,"+alltime_xinxifei);
                }
                if (t == 29) {//tom
                    System.out.println("all_tom=" + all_tom);
                    out.println("<td>" + all_tom + "</td>");//信息费
                    out.println("<td>" + df1.format(pingjun) + "</td>");//平均值
                    all_xinxifei = all_xinxifei + all_tom;
                    //System.out.println("t="+t+",,,"+all_xinxifei);
                    alltime_tom = alltime_tom + all_tom;
                    alltime_tom_pingjun = alltime_tom_pingjun + pingjun;
                    alltime_xinxifei = alltime_xinxifei + all_tom;
                    //System.out.println("t="+t+",,,"+alltime_xinxifei);
                }
                if (t == 33) {//国政通
                    System.out.println("all_guozhengtong=" + all_guozhengtong);
                    out.println("<td>" + all_guozhengtong + "</td>");//信息费
                    out.println("<td>" + df1.format(pingjun) + "</td>");//平均值
                    all_xinxifei = all_xinxifei + all_guozhengtong;
                    //System.out.println("t="+t+",,,"+all_xinxifei);
                    alltime_guozhengtong = alltime_guozhengtong + all_guozhengtong;
                    alltime_guozhengtong_pingjun = alltime_guozhengtong_pingjun + pingjun;
                    alltime_xinxifei = alltime_xinxifei + all_guozhengtong;
                    //System.out.println("t="+t+",,,"+alltime_xinxifei);
                }
            }

            //总信息费（每天）
            out.println("<td>" + all_xinxifei + "</td>");
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
        out.println("<td>" + allnum4 + "</td>");
        out.println("<td>" + allnum5 + "</td>");
        out.println("<td>" + allnum6 + "</td>");
        out.println("<td>" + allnum7 + "</td>");
        out.println("<td>" + allnum8 + "</td>");
        out.println("<td>" + allnum9 + "</td>");
        out.println("<td>" + allnum10 + "</td>");
        out.println("<td>" + allnum11 + "</td>");
        out.println("<td>" + allnum12 + "</td>");
        out.println("<td>" + allnum13 + "</td>");
        out.println("<td>" + allnum14 + "</td>");
        out.println("<td>" + allnum15 + "</td>");
        out.println("<td>" + allnum16 + "</td>");
        out.println("<td>" + allnum17 + "</td>");
        out.println("<td>" + allnum18 + "</td>");
        out.println("<td>" + allnum19 + "</td>");
        out.println("<td>" + allnum20 + "</td>");
        out.println("<td>" + allnum21 + "</td>");
        out.println("<td>" + allnum22 + "</td>");
        out.println("<td>" + allnum23 + "</td>");
        out.println("<td>" + allnum24 + "</td>");
        out.println("<td>" + allnum25 + "</td>");
        out.println("<td>" + allnum26 + "</td>");
        out.println("<td>" + allnum27 + "</td>");
        out.println("<td>" + allnum28 + "</td>");
        out.println("<td>" + allnum29 + "</td>");
        out.println("<td>" + allnum30 + "</td>");
        out.println("<td>" + allnum31 + "</td>");
        out.println("<td>" + allnum32 + "</td>");
        out.println("<td>" + allnum33 + "</td>");
        out.println("<td>" + allnum34 + "</td>");
        out.println("<td>" + allnum35 + "</td>");
        out.println("<td>" + allnum36 + "</td>");
        out.println("<td>" + allnum37 + "</td>");
        out.println("<td>" + allnum38 + "</td>");
        out.println("<td>" + allnum39 + "</td>");
        out.println("<td>" + allnum40 + "</td>");
        out.println("<td>" + allnum41 + "</td>");
        out.println("<td>" + allnum + "</td>");
        out.println("<td>" + alltime_hl + "</td>");
        out.println("<td>" + df1.format(alltime_hl_pingjun / listtime.size()) + "</td>");
        out.println("<td>" + alltime_xinqing + "</td>");
        out.println("<td>" + df1.format(alltime_xinqing_pingjun / listtime.size()) + "</td>");
        out.println("<td>" + alltime_shenzhou + "</td>");
        out.println("<td>" + df1.format(alltime_shenzhou_pingjun / listtime.size()) + "</td>");
        out.println("<td>" + alltime_tonglian + "</td>");
        out.println("<td>" + df1.format(alltime_tonglian_pingjun / listtime.size()) + "</td>");
        out.println("<td>" + alltime_tom + "</td>");
        out.println("<td>" + df1.format(alltime_tom_pingjun / listtime.size()) + "</td>");
        out.println("<td>" + alltime_guozhengtong + "</td>");
        out.println("<td>" + df1.format(alltime_guozhengtong_pingjun / listtime.size()) + "</td>");
        out.println("<td>" + alltime_xinxifei + "</td>");//总信息费
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</table>
<p align="center"><a href="allment.jsp">返回</a></p>
</body>
</html>
