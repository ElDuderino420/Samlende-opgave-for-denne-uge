
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    String input = request.getParameter("peeps");    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Exerise", "root", "password");
    Statement customers = con.createStatement();
    Statement employees = con.createStatement();
    ResultSet rs = customers.executeQuery("select * from customers,zipcodes where customers.zip = zipcodes.zip;");
    ResultSet sr = employees.executeQuery("select * from employees,zipcodes where employees.zip = zipcodes.zip;");
    if (input.equals("Customers")) {
         %><table  width="50%" border="1">
            <thead>
                        <tr>
                            <th colspan="6">Customers</th>
                        </tr>
            </thead>
            <tbody>
                        
                        <tr>
                            <td>Customer number</td>
                            <td>Customer name</td>
                            <td>Street</td>
                            <td>Zipcode</td>
                            <td>Digits</td>
                            <td>City</td>
                        </tr><%
                        
        while (rs.next()) {
            %><tr><%
            %><td><%= rs.getInt(1) %></td><%
            %><td><%= rs.getString(2)%></td><%
            %><td><%=rs.getString(3)%></td><%
            %><td><%=rs.getInt(4)%></td><%
            %><td><%=rs.getString(5)%></td><%
            %><td><%=rs.getString(7) %></td><%
            %></tr><%
            }
        %></tbody><%
        %></table><%
    }
    else if (input.equals("Employees")) {
        %><table  width="50%" border="1">
            <thead>
                        <tr>
                            <th colspan="5">Employees</th>
                        </tr>
            </thead>
            <tbody>
                        
                        <tr>
                            <td>Employee number</td>
                            <td>Employee name</td>
                            <td>Zipcode</td>
                            <td>Hire Date</td>
                            <td>City</td>
                        </tr><%
                        
        while (sr.next()) {
            %><tr><%
            %><td><%= sr.getInt(1) %></td><%
            %><td><%= sr.getString(2)%></td><%
            %><td><%=sr.getInt(3)%></td><%
            %><td><%=sr.getDate(4)%></td><%
            %><td><%=sr.getString(6) %></td><%
            %></tr><%
            }
        %></tbody><%
        %></table><%   
    
    }
    else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
