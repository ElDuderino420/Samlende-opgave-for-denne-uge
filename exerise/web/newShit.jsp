<%-- 
    Document   : newShit
    Created on : 25-Sep-2015, 15:08:19
    Author     : butwhole
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    ResultSet rs = null;
    ResultSet zip = null;
    ResultSet ids = null;
    PreparedStatement statement = null;
    PreparedStatement pszip = null;
    PreparedStatement psids = null;
    Connection connection = null;
    String input = request.getParameter("peeps");    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Exerise", "root", "b292335668076");
    String query1 = "insert into customers values(?,'?','?',?,'?');";
    String query2 = "select * from zipcodes";
    String query3 = "select cno from customers";
    statement = connection.prepareStatement(query1);
    pszip = connection.prepareStatement(query2);
    psids = connection.prepareStatement(query3);
    zip = pszip.executeQuery();
    ids = psids.executeQuery();
    %>
    
            <<body>
        <form method="post">
            <center>
                <table  width="50%" cellpadding="3">
                    <thead>
                        <tr>
                            <th colspan="2">Input new customer data</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <tr>
                            <td>name</td>
                            <td><input type="text" name="name" value="" /></td>
                        </tr>
                        
                        <tr>
                            <td>Street</td>
                            <td><input type="text" name="street" value="" /></td>
                        </tr>
                        
                        <tr>
                            <td>Zip code</td>
                            <td>
                                <select>
                                    <%while(zip.next()){%>
                                    <option name="zip" value=<%=zip.getInt(1)%>><%=zip.getInt(1)%>, <%=zip.getString(2)%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        
                        <tr>
                            <td></td>
                            <td><input type="Phone number" name="phone" value="" /></td>
                        </tr>
                        
                        <tr>
                            <td><input type="submit" value="Login" /></td>
                            <td><input type="reset" value="Reset" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">Yet Not Registered!! <br><a href="reg.jsp">Register Here</a></td>
                        </tr>
                    </tbody>
                </table>
            </center>
        </form>
    </body>
    
    
    <%
    
    
    
    statement.executeUpdate();
    
    %>
