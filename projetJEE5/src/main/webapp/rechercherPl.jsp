<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>  

<%  
String name=request.getParameter("val");  
if(name==null||name.trim().equals("")){
}else{  
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/locationdb","root","");  
PreparedStatement ps=con.prepareStatement("select * from point_location where (libelle like '%"+name+"%')");  
ResultSet rs=ps.executeQuery();  
  
if(!rs.isBeforeFirst()) {   
}else{  

out.print("<div class=\"box box-primary\">"); 
out.print("<div class=\"box-body\">"); 

while(rs.next()){  
	
	
	out.print("<div class=\"product-info\">");
	out.print("<a href=\"\" class=\"product-title\">("+rs.getString(1)+")"+rs.getString(2)+"</a>");
	out.print("</div>");
	out.print("<br>");
    }  

out.print("</div>");
out.print("<div class=\"box-footer text-center bg-info\">");
out.print("<a href=\"javascript:void(0)\" class=\"uppercase\">Voir tous les points</a>");
out.print("</div>");
out.print("</div>");
}//end of else for rs.isBeforeFirst  
con.close();  
}catch(Exception e){out.print(e);}  
}//end of else  
%>
