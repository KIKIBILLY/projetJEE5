<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import=" javax.servlet.http.HttpSession" %>

<%
	String name = request.getParameter("val");
	if (name == null || name.trim().equals("")) {
	} else {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/locationdb", "root", "");
			PreparedStatement ps = con.prepareStatement(
					"select o.id_objet, o.categorie, o.libelle, o.description, o.pxlj, o.cl, o.adj, o.defauts, img.url_image from objet o inner join image_objet img on o.id_objet = img.id_objet inner join point_location p on p.identifiant = o.id_stock where ((o.id_objet like '%"
							+ name + "%') or (o.categorie like '%" + name + "%') or (o.libelle like '%" + name
							+ "%')) and (p.identifiant = 1) group by o.id_objet");
			ResultSet rs = ps.executeQuery();

			if (!rs.isBeforeFirst()) {
			} else {

				out.print("<div class=\"box box-primary\">");
				out.print("<div class=\"box-body\">");
				out.print("<ul class=\"products-list product-list-in-box\">");

				while (rs.next()) {

					out.print("<li class=\"item\">");
					out.print("<div class=\"product-img\">");
					out.print("<img src=\"" + rs.getString(9) + "\">");
					out.print("</div>");
					out.print("<div class=\"product-info\">");
						out.print("<a href=\"objet?id=" + rs.getString(1) +"\""
						+ " class=\"product-title\">" + rs.getString(3) + " (" + rs.getString(2)
						+ ") <span class=\"label label-warning pull-right\">" + rs.getDouble(5)
						+ " €/j </span></a>");
					out.print("<span class=\"product-description\">" + rs.getString(4) + ".</span>");
					out.print("</div>");
					out.print("</li>");

				}

				out.print("</ul>");
				out.print("</div>");
				out.print("<div class=\"box-footer text-center bg-info\">");
				out.print("<a href=\"javascript:void(0)\" class=\"uppercase\">Voir tous les objets</a>");
				out.print("</div>");
				out.print("</div>");
			} //end of else for rs.isBeforeFirst  
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	} //end of else
%>
