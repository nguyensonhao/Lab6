

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //input incorrect username or password
    if (session.getAttribute("username") == null && session.getAttribute("message") != null) {
%>
<%@include file = "Login.jsp" %>
<script>
    document.getElementById("send-error").innerHTML = "Username or password incorrect!! ";
    document.getElementById("send-error").style.display = "block";
</script>
<%} //when logout
else if (session.getAttribute("username") == null && session.getAttribute("message") == null ) {
%>
<%@include file = "Login.jsp" %>

<%} //when username of administrator login 
else if (session.getAttribute("username") != null && session.getAttribute("role").equals("1") ) {
%>
<%@include file = "dashboard.jsp" %>

<%} //when username of subscriber login 
else if (session.getAttribute("username") != null && session.getAttribute("role").equals("2") ) {
%>
<%@include file = "user-page.jsp" %>
<% } %>

