<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../../../taglib.jsp" %>
<%@page import="permission.common.RMSContext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>服务器工具</title>
    <script type="text/javascript" src="${ctx}res/js/MD5.js"></script>
    <script type="text/javascript" src="../../js/SelectRoleWin.js"></script>
    <script type="text/javascript" src="../../js/manager.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}res/bui/css/lt.css"/>
</head>
<body>
<rms:role operateCode="html_search">
    <div class="container">
        <div class="row">
            <div class="control-group span8">
                <label id="urlTitle" class="control-label"></label>
            </div>
        </div>
        <hr>

        <div class="search-grid-container">
            <div id="grid"></div>
        </div>
        <hr>

        <div>
            <c:set var="title" value="<%=RMSContext.getInstance().getRoleId()%>"/>
            <c:if test="${title=='4'|| title=='5'|| title=='6'}">
                <a href="http://192.168.0.1:8080/snc/v1/testTool/testServerStatus" id="服务器状态" name="查看服务器状态" hidden="true">查看</a>
                <a href="http://192.168.0.1:8080/static/dgwm/log/client/" id="玩家日志" name="查看玩家日志" hidden="true">查看</a>
                <a href="http://192.168.0.1:8080/snc/v1/systemTool/getCdkey" id="查看cdk信息" name="查看所有cdkey信息，便于生成cdk" hidden="true">查看</a>
            </c:if>
        </div>
    </div>

    <div id="content" class="hide">
        <form id="J_Form" class="form-horizontal">
            <div class="row">
                <div class="control-group span8">
                    <label class="control-label"><s>*</s>用户名</label>
                    <div class="controls">
                        <input name="username" data-rules="{required:true,minlength:3,maxlength:16}"
                               class="input-normal control-text" type="text"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="control-group span8">
                    <label class="control-label"><s>*</s>密码</label>
                    <div class="controls">
                        <input name="password"
                               data-rules="{required:true,minlength:5,maxlength:20}"
                               class="input-normal control-text" type="password"/>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script type="text/javascript">

        $(function () {
//                            {a: '服务器状态', b: '查看服务器状态', c: '<a href="http://empirewartw.hiwechats.com/snc/v1/testTool/testServerStatus" target="_blank">查看</a>'},
//                            {a: '玩家日志', b: '查看玩家日志', c: '<a href="http://empirewartw.hiwechats.com/static/dgwm/log/client/" target="_blank">查看</a>'},
//                            {a: '查看cdk信息', b: '查看所有cdkey信息，便于生成cdk', c: '<a href="http://empirewartw.hiwechats.com/snc/v1/systemTool/getCdkey" target="_blank">查看</a>'},


            var key = "url.tw";

            init();

            function initUrl() {
                getUrl(key);
            }

            function init() {
                initUrl();
                getUrlData(key);

            }
        });

    </script>
</rms:role>
</body>
</html>
