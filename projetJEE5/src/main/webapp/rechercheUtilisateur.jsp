<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>  

<%  
String name=request.getParameter("val");  
if(name==null||name.trim().equals("")){
}else{  
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/locationdb","root","");  
PreparedStatement ps=con.prepareStatement("select * from utilisateur where ((email like '%"+name+"%') or (nom like '%"+name+"%') or (prenom like '%"+name+"%'))");  
ResultSet rs=ps.executeQuery();  
  
if(!rs.isBeforeFirst()) {   
}else{  

out.print("<div class=\"box box-primary\">"); 
out.print("<div class=\"box-body\">"); 
out.print("<ul class=\"products-list product-list-in-box\">"); 

while(rs.next()){  
	
	
	out.print("<li class=\"item\">");
	out.print("<div class=\"product-img\">");
	out.print("<img src=\""+rs.getString(8)+"\">");
	out.print("</div>");
	out.print("<div class=\"product-info\">");
	out.print("<a href=\"\" class=\"product-title\">"+rs.getString(4)+"  "+rs.getString(5)+"</a>");
	out.print("<span class=\"product-description\">"+rs.getString(2)+".</span>");
	out.print("</div>");
	out.print("</li>");
	
    }  

out.print("</ul>"); 
out.print("</div>");
out.print("<div class=\"box-footer text-center bg-info\">");
out.print("<a href=\"javascript:void(0)\" class=\"uppercase\">Voir tous les utilisateurs</a>");
out.print("</div>");
out.print("</div>");
}//end of else for rs.isBeforeFirst  
con.close();  
}catch(Exception e){out.print(e);}  
}//end of else  
%>
