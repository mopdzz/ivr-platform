<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.*,java.sql.*,java.sql.Statement,database.*"%>
<%
        Connection conn = null;
        Statement pstmt = null;
        ResultSet rst = null;
        String  names=null;
        String  passwords=null;
        List a=new ArrayList();
        List a1=new ArrayList();
         String name=request.getParameter("name");
        String  password=request.getParameter("password");
        String  getid=request.getParameter("id");
		
        int isint=0;
        
       
               
        if(name!=null){
        
        if(name.equals("")){
             
        }else{
         try{       //�����ݿ����Ӳ���ȡ���ݼ�����Ե�list
          conn =MysqlConnect.newConnection();
   
            pstmt = conn.createStatement();
            String as="SELECT * FROM ivr_user where STATE=1 and usertype=3";
            rst= pstmt.executeQuery(as);
             while(rst.next()){
                 names=rst.getString("user");
                 passwords=rst.getString("userpassword");
				 
                   if(names.equals(name)){
					  
                      if(passwords.equals(password)){
                      
                      
                       session.putValue("thename",name);
                        session.putValue("thePassword",password);
                        isint=1;
                    //    response.sendRedirect("ivr_search_input.jsp"); 
                       // return;
                            } 
                         }
                    }
                  if(isint!=1)
                     {
                     isint=2;
                      }
                    
                    rst=null;
      
        }catch(Exception w){
          //  response.sendRedirect("scuowu.jsp?id=1&name="+name); 
            w.printStackTrace();
        }
        }
        }
     //   System.out.println("#################################"+isint);
        if(isint==1)
        {
        
        response.sendRedirect("menu.jsp"); 
        return;
        }else
        {
	        if(isint==2)
	        {
	        response.sendRedirect("index.jsp?id=2"); 
	        }
        }
%>
<html>
  
  <body>
  <%
	//	out.println(getid);
		
       if(getid!=null&&"2".equals(getid))
        {
              out.println("<div align="+"\""+"center"+"\""+">"+"�û��������������������д");
         }   
      
     
%>
  
    <form name="form1" method="post" action="index.jsp">
      <p align="center">�� ��
        <input type="text" name="name">
    </p>
      <p align="center">�� ��
        <input type="password" name="password">
      </p>
      <p align="center">
        <input type="submit" name="Submit" value="�ύ">
          </p>
    </form>
    <br>
  </body>
</html>
