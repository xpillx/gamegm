<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="taglib.jsp" %>
<%@page import="permission.logs.FileLog" %>
<%@page import="permission.propertier.PropertiesManager" %>

<%
    //记录所有表单提交数据及账号
    String urlKey = request.getParameter("urlKey");
    String url = PropertiesManager.getInstance().properties.getProperty(urlKey);
    FileLog.infoGm("服务器:" + urlKey + ",url:" + url);
    response.getWriter().write(url);
%>