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

        <div class="content">
            <c:set var="title" value="<%=RMSContext.getInstance().getRoleId()%>"/>
            <c:if test="${title=='4'||title=='6'}">
                <form action="http://192.168.0.1:8080/snc/v1/notice/addNotice" method="post" class="form-horizontal" name="添加公告" onsubmit="formLog($(this).serialize()+'&'+'beharvior='+this.name);">
                    <h2>添加公告</h2>
                    <div class="control-group">
                        <label class="control-label"><s>*</s>公告ID：</label>
                        <div class="controls">
                            <input name="id" type="text" class="input-large" placeholder="1" data-rules="{required : true}">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label"><s>*</s>标题：</label>
                        <div class="controls">
                            <input name="title" type="text" class="input-large" placeholder="zh-cn:中文#en-us:英语#ar-iq:阿拉伯" data-rules="{required : true}">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label"><s>*</s>内容：</label>
                        <div class="controls  control-row-auto">
                            <textarea name="content" id="" class="control-row4 input-large" placeholder="zh-cn:中文#en-us:英语#ar-iq:阿拉伯" data-rules="{required : true}"></textarea>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-actions offset3">
                            <button type="submit" class="button button-primary">添加</button>
                            <button type="reset" class="button">重置</button>
                        </div>
                    </div>
                </form>
                <hr>

                <form action="http://192.168.0.1:8080/snc/v1/notice/removeNotice" method="post" class="form-horizontal" name="删除公告" onsubmit="formLog($(this).serialize()+'&'+'beharvior='+this.name);">
                    <h2>删除公告</h2>
                    <div class="control-group">
                        <label class="control-label"><s>*</s>公告ID：</label>
                        <div class="controls">
                            <input name="id" type="text" class="input-large" placeholder="1" data-rules="{required : true}">
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-actions offset3">
                            <button type="submit" class="button button-primary">删除</button>
                            <button type="reset" class="button">重置</button>
                        </div>
                    </div>
                </form>
                <a href="http://192.168.0.1:8080/system/v1/systemTool/relodProperties" id="更新服务器配置表" name="更新公告服务器配置表" hidden="true">更新</a>
                <a href="http://192.168.0.1:8080/snc/v1/notice/getNoticeBoard?language=zh-cn" id="查看中文信息及状态" name="查看中文公告信息及状态" hidden="true">查看中文公告</a>
                <a href="http://192.168.0.1:8080/snc/v1/notice/getNoticeBoard?language=en-us" id="查看英语信息及状态" name="查看英语公告信息及状态" hidden="true">查看英语公告</a>
                <a href="http://192.168.0.1:8080/snc/v1/notice/getNoticeBoard?language=ar-iq" id="查看阿拉伯信息及状态" name="查看阿拉伯公告信息及状态" hidden="true">查看阿拉伯公告</a>
                <a href="http://192.168.0.1:8080/snc/v1/notice/removeNoticeBoard" id="删除所有公告信息" name="删除所有公告信息" hidden="true">删除</a></p>
            </c:if>
        </div>

        <script type="text/javascript">

            var key = "url.zd";

            init();

            function initUrl() {
                getUrl(key);
            }

            function init() {
                initUrl();
                getUrlData(key);

            }
        </script>
    </div>
</rms:role>
</body>
</html>
