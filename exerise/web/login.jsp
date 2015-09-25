
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    String input = request.getParameter("peeps");    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Exerise", "root", "pass123");
    Statement customers = con.createStatement();
    Statement employees = con.createStatement();
    ResultSet customersEntry = customers.executeQuery("SELECT * FROM customers");
    ResultSet employeesEntry = employees.executeQuery("SELECT * FROM employees");
    if (input.equals("customers")) {
        
    }
    if (studentEntry.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
