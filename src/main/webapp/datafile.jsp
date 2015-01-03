
<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.lang.*,database.*"%>
<%
	    Connection conn =null ;
	    Statement pstmt = null;
        ResultSet rst = null;
        String starttime = request.getParameter("starttime");
        String endtime = request.getParameter("endtime");
        String time = request.getParameter("time");
        String type = request.getParameter("type");
        String sql="";
        String sql1="";
         if(time!=null&&!"".equals(time)&&type!=null&&!"".equals(type)){
         
         if("1".equals(type)){
         		sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and callednumber='12590511722' and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and (a.passwordtypeid=2 or a.passwordtypeid=3) and SUBSTR(callednumber,1,9)='125905117' and a.state=0 order by a.inserttime ";  
         }
         else	if("3".equals(type)){//12590803030,125908030
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and (callednumber='12590803030' or callednumber='125908030' ) and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and (a.passwordtypeid=4) and SUBSTR(callednumber,1,9)='125908030' and a.state=0 order by a.inserttime ";  
         }
         else if("4".equals(type)){
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and (callednumber='125908997' or callednumber='12590899789') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and (a.passwordtypeid=6 or a.passwordtypeid=2 or a.passwordtypeid=7 or a.passwordtypeid=8) and (callednumber='125908997' or callednumber='12590899789') and a.state=0 order by a.inserttime ";  
         }
         else if("5".equals(type)){//12590807170
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590807170' ) and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and (a.passwordtypeid=6 or a.passwordtypeid=2 or a.passwordtypeid=4) and SUBSTR(callednumber,1,9)='125908071' and a.state=0 order by a.inserttime ";  
         }
         else if("6".equals(type)){
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590899788' ) and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and (a.passwordtypeid=6 or a.passwordtypeid=2 or a.passwordtypeid=4  or a.passwordtypeid=9 or a.passwordtypeid=10) and (callednumber='12590899788' or callednumber='125908997')  and a.state=0 order by a.inserttime ";  
         }
         else if("7".equals(type)){
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='1259089965' or callednumber='125908996') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and (a.passwordtypeid=4 or  a.passwordtypeid=5 ) and ( callednumber='1259089965' or callednumber='125908996') and a.state=0 order by a.inserttime ";  
         }
         else if("8".equals(type)){
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='1259089968') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and (a.passwordtypeid=4  or a.passwordtypeid=5 ) and ( callednumber='1259089968') and a.state=0 order by a.inserttime ";  
         }
         else if("9".equals(type)){//心情1259051123
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='1259051123') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='1259051123') and a.state=0 order by a.inserttime ";  
         } 
         else if("10".equals(type)){//心情12590511622
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590511622') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590511622') and a.state=0 order by a.inserttime ";  
         }
         else if("11".equals(type)){//心情12590511255
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590511255') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590511255') and a.state=0 order by a.inserttime ";  
         }                          
         else if("12".equals(type)){//宽畅12590730692
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590730692') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590730692') and a.state=0 order by a.inserttime ";  
         }                     
         else if("13".equals(type)){//宽畅12590730693
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590730693') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590730693') and a.state=0 order by a.inserttime ";  
         }  
         else if("14".equals(type)){//宽畅12590730694
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590730694') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590730694') and a.state=0 order by a.inserttime ";  
         } 
         else if("15".equals(type)){//宽畅12590730695
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590730695') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590730695') and a.state=0 order by a.inserttime ";  
         }     
         else if("16".equals(type)){//通联1259087589
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='1259087589') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='1259087589') and a.state=0 order by a.inserttime ";  
         }                     
         else if("17".equals(type)){//通联125908758502
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='125908758502') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='125908758502') and a.state=0 order by a.inserttime ";  
         }  
         else if("18".equals(type)){//通联125908758582
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='125908758582') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='125908758582') and a.state=0 order by a.inserttime ";  
         } 
         else if("19".equals(type)){//通联125908758585
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='125908758585') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='125908758585') and a.state=0 order by a.inserttime ";  
         }     
         else if("20".equals(type)){//tom125905790116
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='125905790116') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='125905790116') and a.state=0 order by a.inserttime ";  
         }                     
         else if("21".equals(type)){//tom125905790117
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='125905790117') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='125905790117') and a.state=0 order by a.inserttime ";  
         }  
         else if("22".equals(type)){//tom125905790121
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='125905790121') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='125905790121') and a.state=0 order by a.inserttime ";  
         } 
         else if("23".equals(type)){//tom125905790122
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='125905790122') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='125905790122') and a.state=0 order by a.inserttime ";  
         }     
         else if("24".equals(type)){//国政通12590658601
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590658601') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590658601') and a.state=0 order by a.inserttime ";  
         }                     
         else if("25".equals(type)){//国政通12590658602
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590658602') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590658602') and a.state=0 order by a.inserttime ";  
         }  
         else if("26".equals(type)){//国政通12590658603
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590658603') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590658603') and a.state=0 order by a.inserttime ";  
         } 
         else if("27".equals(type)){//国政通12590658604
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590658604') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590658604') and a.state=0 order by a.inserttime ";  
         }  
         else if("28".equals(type)){//通联1259087584
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='1259087584') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='1259087584') and a.state=0 order by a.inserttime ";  
         }                     
         else if("29".equals(type)){//通联125908758503
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='125908758503') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='125908758503') and a.state=0 order by a.inserttime ";  
         }  
         else if("30".equals(type)){//通联125908758666
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='125908758666') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='125908758666') and a.state=0 order by a.inserttime ";  
         } 
         else if("31".equals(type)){//通联125908758999
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='125908758999') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='125908758999') and a.state=0 order by a.inserttime ";  
         }   	
         else if("32".equals(type)){//鸿联12590803003
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590803003') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590803003') and a.state=0 order by a.inserttime ";  
         }   
         else if("33".equals(type)){//鸿联12590803004
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590803004') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590803004') and a.state=0 order by a.inserttime ";  
         }   
         else if("34".equals(type)){///鸿联12590803005
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590803005') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590803005') and a.state=0 order by a.inserttime ";  
         }   
         else if("35".equals(type)){//宽畅12590730691
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590730691') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590730691') and a.state=0 order by a.inserttime ";  
         }   
         else if("36".equals(type)){//宽畅12590730696
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590730696') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590730696') and a.state=0 order by a.inserttime ";  
         }   
         else if("37".equals(type)){//宽畅12590730697
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590730697') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590730697') and a.state=0 order by a.inserttime ";  
         }   
         else if("38".equals(type)){//宽畅12590730698
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590730698') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590730698') and a.state=0 order by a.inserttime ";  
         }   
         else if("39".equals(type)){//宽畅12590730699
          	sql=" select a.callednumber,a.phone,a.starttime,a.endtime,a.fee/100,b.province from ivr_nine_usertj a ,ivr_province b where date_format(a.endtime,'%Y-%m-%d')='"+time+"' and ( callednumber='12590730699') and a.provinceid=b.id order by a.starttime";                          
            sql1="select a.callednumber,a.cardnum,a.password,b.province,c.passwordtypename,a.inserttime,a.phone from ivr_nine_password a,ivr_province b ,ivr_nine_passwordtype c "+
        		" where date_format(a.inserttime,'%Y-%m-%d')='"+time+"' and a.provinceid=b.id and a.passwordtypeid=c.id and  ( callednumber='12590730699') and a.state=0 order by a.inserttime ";  
         } 
      }
      String backurl="menu1.jsp?starttime="+starttime+"&endtime="+endtime+"&time="+time;

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
  if(time!=null&&!"".equals(time))
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
  if(time!=null&&!"".equals(time))
  {
 
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
  						
                      conn.close();
                    pstmt=null;
                    rst=null;          
            }
            catch (Exception e){
            e.printStackTrace();
            }
       finally {
	      pstmt = null;
	      conn = null;
	      rst=null;
	      
	    }
	    }
    
  %>
</table>
<%
out.print("<p align=\"center\"><a href=\""+backurl+"\">返回</a></p>");

%>
</body>
</html>