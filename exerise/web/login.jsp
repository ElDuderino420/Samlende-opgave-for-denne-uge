
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    String input = request.getParameter("peeps");    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Exerise", "admin", "admin");
    Statement customers = con.createStatement();
    Statement employees = con.createStatement();
    ResultSet rs = customers.executeQuery("select * from customers,zipcodes where customers.zip = zipcodes.zip;");
    ResultSet sr = employees.executeQuery("select * from employees,zipcodes where employees.zip = zipcodes.zip;");
    if (input.equals("customers")) {
        <table
        while (rs.next()) {
                out.println(
                        rs.getInt(1) + "\t"
                        + rs.getString(2) + "\t"
                        + rs.getString(3) + "\t"
                        + rs.getInt(4) + "\t"
                        + rs.getString(5) + "\t"
                        + rs.getString(7));
                %><br><%
            }
    
    
    }
    if (input.equals("employees")) {
        while (sr.next()) {
                out.println(
                        sr.getInt(1) + "\t"
                        + sr.getString(2) + "\t"
                        + sr.getInt(3) + "\t"
                        + sr.getDate(4) + "\t"
                        + sr.getString(6));
                %><br><%
            }
    
    
    }
    else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
