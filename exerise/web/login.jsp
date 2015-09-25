
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demologin", "root", "b292335668076");
    Statement teacher = con.createStatement();
    Statement student = con.createStatement();
    ResultSet studentEntry;
    ResultSet teacherEntry;
    teacherEntry = teacher.executeQuery("SELECT * FROM teachers WHERE uname='" + userid + "' AND pass='" + pwd + "'");
    studentEntry = student.executeQuery("SELECT * FROM students WHERE uname='" + userid + "' AND pass='" + pwd + "'");
    if (teacherEntry.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("teacherLogin.jsp");
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
