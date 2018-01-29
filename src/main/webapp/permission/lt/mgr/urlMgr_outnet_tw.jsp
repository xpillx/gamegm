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
            <c:if test="${title=='6'}">
                <a href="http://192.168.0.1:8080/snc/v1/systemTool/relodProperties" id="更新配置表" name="更新服务器配置表" hidden="true">更新</a>
                <a href="http://192.168.0.1:8080/snc/v1/clientTool/getParams" id="获取配置信息" name="获取服务器配置信息" hidden="true">查看</a>
            </c:if>
            <c:if test="${title=='4'||title=='6'}">
                <a href="http://192.168.0.1:8080/snc/v1/testTool/reloadConf?type=charge" id="更新计费表" name="更新服务器计费配置表" hidden="true">更新</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/reloadConf?type=activity" id="更新活动表" name="更新服务器活动配置表" hidden="true">更新</a>
            </c:if>
            <c:if test="${title=='6'}">
                <a href="http://192.168.0.1:8080/snc/v1/testTool/reloadConf?type=mail" id="更新邮件表" name="更新服务器邮件配置表" hidden="true">更新</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/reloadConf?type=dailyRefresh" id="更新每日刷新礼包表" name="更新服务器每日刷新礼包配置表" hidden="true">更新</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/reloadConf?type=name" id="更新机器人名称表" name="更新服务器机器人名称表" hidden="true">更新</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/reloadConf?type=league" id="更新联赛表" name="更新服务器联赛配置表" hidden="true">更新</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/reloadConf?type=leagueReset" id="更新联赛奖牌数重置表" name="更新服务器联赛奖牌数重置表" hidden="true">更新</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/reloadConf?type=text" id="更新文字配置表" name="更新文字配置表" hidden="true">更新</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/reloadConf?type=heroExp" id="更新英雄经验值表" name="更新英雄经验值表" hidden="true">更新</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/reloadConf?type=zhcn" id="更新zhcn表" name="更新zhcn表" hidden="true">更新</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/reloadConf?type=tag" id="更新Tag表" name="更新Tag表" hidden="true">更新</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/copyPlayerFile" id="根据copyuid.txt 复制玩家数据至playerfileCopy" name="根据copyuid.txt 复制玩家数据至playerfileCopy" hidden="true">复制</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/clearMatchingBot" id="根据clearBotUid.txt 删除部分机器人" name="根据clearBotUid.txt 删除部分机器人" hidden="true">删除</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/clearMatchesBot" id="删除全部机器人" name="删除全部机器人" hidden="true">删除</a>
            </c:if>
            <c:if test="${title=='4'||title=='6'}">
                <a href="http://192.168.0.1:8080/snc/v1/testTool/getSysMailKeys" id="查看系统邮件" name="查看系统邮件" hidden="true">查看</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/fileToZip" id="打包购买数据" name="打包购买数据" hidden="true">打包</a>
                <a href="http://192.168.0.1:8080/static/dgwm/log/server/log/charge_count/" id="查看打包数据" name="查看打包数据" hidden="true">查看</a>
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
            var key = "url.outnet_tw";

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
