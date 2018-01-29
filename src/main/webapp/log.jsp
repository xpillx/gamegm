<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="taglib.jsp" %>
<%@page import="com.alibaba.fastjson.JSON" %>
<%@page import="org.durcframework.core.UserContext" %>
<%--<%@ page import="java.util.Enumeration" %>--%>
<%@ page import="permission.logs.FileLog" %>
<%@ page import="java.util.Map" %>

<%
    //记录所有表单提交数据及账号
    Map<String, String[]> map = request.getParameterMap();
    FileLog.infoGm(request.getRemoteHost() + ",name:" + UserContext.getInstance().getUser().getUsername() + ",data:" + JSON.toJSONString(map));
%>