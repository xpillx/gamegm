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
            <c:if test="${title=='6'}">
                <form action="http://192.168.0.1:8080/snc/v1/testTool/productAllianceBot" method="post" id="生成公会机器人" onsubmit="formLog($(this).serialize()+'&'+'beharvior='+this.id);">
                    <label>生成公会机器人 aid:</label>
                    <input type="text" name="aid" id="aid" placeholder="公会id or 不填" required/>
                    <input class="sub" type="submit" value="生成"/>
                    <label>--备注：填写公会id生成公会机器人，不填写只生成机器人</label>
                </form>

                <form action="http://192.168.0.1:8080/snc/v1/testTool/productLtBot" method="post" id="生成运营需要帐号" onsubmit="formLog($(this).serialize()+'&'+'beharvior='+this.id);">
                    <label>生成运营需要帐号 </label>
                    uid: <input type="text" name="userId" id="userId" value="" required/>
                    mail:<input type="text" name="mail" id="mail" size="30" value="" required/>
                    mailPassWord: <input type="text" name="mailPassWord" id="mailPassWord" size="30" value="" required/>
                    <input class="sub" type="submit" value="生成"/></form>

                <form action="http://192.168.0.1:8080/snc/v1/systemTool/delDeviceByUid" method="post" id="解除玩家绑定" onsubmit="formLog($(this).serialize()+'&'+'beharvior='+this.id);">
                    <label>解除玩家绑定 uid:</label>
                    <input type="text" name="uid" id="uid" value="" required/>
                    <input class="sub" type="submit" value="解除"/></form>

                <form action="http://192.168.0.1:8080/snc/v1/systemTool/setPttkFalse" method="post" id="设置玩家攻击状态" onsubmit="formLog($(this).serialize()+'&'+'beharvior='+this.id);">
                    <label>设置玩家攻击状态 uid:</label>
                    <input type="text" name="user_id" id="user_id" placeholder="all or uid" required/>
                    <input class="sub" type="submit" value="设置"/>
                    <label>--备注：解锁特殊情况下玩家未自动解除被进攻状态</label>
                </form>

                <form action="http://192.168.0.1:8080/snc/v1/testTool/delSysMailKeys" method="post" id="删除系统邮件" onsubmit="formLog($(this).serialize()+'&'+'beharvior='+this.id);">
                    <label>删除系统邮件 mailId:</label>
                    <input type="text" name="mailId" id="mailId" size="30" value="" required/>
                    <input class="sub" type="submit" value="删除"/></form>

                <form action="http://192.168.0.1:8080/info/HttpInfo" method="post" id="修改玩家奖牌数" target="_blank" onsubmit="formLog($(this).serialize()+'&'+'beharvior='+this.id);">
                    <label>修改玩家奖牌数 玩家uid:</label>
                    <input type="hidden" name="logic" value="GmModifyRoleData"/>
                    <input type="hidden" name="playerServerId" value="PlayerUid"/>
                    <input type="hidden" name="playerProject" value="rating"/>
                    <input type="hidden" name="type" value="0"/>
                    <input type="text" name="playerUid" value="" required/>
                    <label>奖牌数:</label> <input type="text" name="playerParameterInput" value="" required/>
                    <input class="sub" type="submit" value="设置"/></form>
            </c:if>
            <c:if test="${title=='4'|| title=='5'|| title=='6'}">
                <form action="http://192.168.0.1:8080/info/HttpInfo" method="post" id="强制攻击" target="_blank" onsubmit="formLog($(this).serialize()+'&'+'beharvior='+this.id);">
                    <label>强制攻击 进攻方:</label>
                    <input type="hidden" name="logic" value="GmModifyRoleData"/>
                    <input type="hidden" name="playerServerId" value="Level"/>
                    <input type="hidden" name="playerProject" value="enforcement"/>
                    <input type="hidden" name="type" value="0"/>
                    <input type="text" name="playerUid" placeholder="进攻方uid" required/>
                    <label>防守方:</label> <input type="text" name="playerParameterInput" placeholder="防守方uid" required/>
                    <input class="sub" type="submit" value="设置"/>
                    <label>--备注：防守方必须不在线且未处于被进攻状态</label>
                </form>
                <form action="http://192.168.0.1:8080/snc/v1/testTool/resetActivityData" method="post" id="重置玩家活动数据" onsubmit="formLog($(this).serialize()+'&'+'beharvior='+this.id);">
                    <label>重置玩家活动数据 uid:</label>
                    <input type="text" name="uid" size="30" value="" required/>
                    <input class="sub" type="submit" value="重置"/></form>
                </form>
            </c:if>

            <c:if test="${title=='4'|| title=='6'}">
                <form action="http://192.168.0.1:8080/snc/v1/testTool/resetActivityData" method="post" enctype="multipart/form-data" id="上传xml至服务器" onsubmit="formLog($(this).serialize()+'&'+'beharvior='+this.id);">
                    <div align="left">
                        <legend>上传conf_charge.xml至服务器</legend>
                        <div>
                            <div align='left'>上传文件:</div>
                            <div align='left'>
                                <input type="file" name="file1" class="text" size="50" required>
                            </div>
                        </div>
                        <div class='line'>
                            <div align='left'>上传者:</div>
                            <div align='left'>
                                <input type="radio" style="transform: scale(1,1);" name="name" value="郭威" checked="checked"/>郭威
                            </div>
                        </div>
                        <div>
                            <div align='left'>上传文件说明:</div>
                            <div align='left'><input type="text" name="description1" class="text" size="200" required></div>
                        </div>
                        <div>
                            <div align='left'></div>
                            <div align='left'><br/>
                                <input type="submit" value="上传文件" class="button">
                            </div>
                        </div>
                        <div align='left' class="leftDiv">备注：上传成功后，进行更新计费表操作，即可生效</div>
                    </div>
                </form>
            </c:if>
            <c:if test="${title=='4'|| title=='5'|| title=='6'}">
                <a href="http://192.168.0.1:8080/snc/v1/testTool/testServerStatus" id="服务器状态" name="查看服务器状态" hidden="true">查看</a>
                <a href="http://192.168.0.1:8080/static/dgwm/log/client/" id="玩家日志" name="查看玩家日志" hidden="true">查看</a>
                <a href="http://192.168.0.1:8080/snc/v1/systemTool/getCdkey" id="查看cdk信息" name="查看所有cdkey信息，便于生成cdk" hidden="true">查看</a>
            </c:if>
            <c:if test="${title=='6'}">
                <a href="http://192.168.0.1:8080/snc/v1/systemTool/relodProperties" id="更新配置表" name="更新服务器配置表" hidden="true">更新</a>
                <a href="http://192.168.0.1:8080/snc/v1/clientTool/getParams" id="获取配置信息" name="获取服务器配置信息" hidden="true">查看</a>
                <a href="http://192.168.0.1:8080/download?filename=conf_charge.xml" id="下载conf_charge表" name="下载服务器conf_charge表" hidden="true">下载</a>
            </c:if>
            <c:if test="${title=='4'|| title=='5'|| title=='6'}">
                <a href="http://192.168.0.1:8080/download?filename=version" id="下载服务器2.0.0表" name="下载服务器2.0.0表" hidden="true">下载</a>
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
                <a href="http://192.168.0.1:8080/snc/v1/testTool/reloadConf?type=robotRate" id="更新机器人收获rate表" name="更新机器人收获rate表" hidden="true">更新</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/reloadConf?type=robotUpgrade" id="更新机器人自动升级表" name="更新机器人自动升级表" hidden="true">更新</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/copyPlayerFile" id="根据copyuid.txt 复制玩家数据至playerfileCopy" name="根据copyuid.txt 复制玩家数据至playerfileCopy" hidden="true">复制</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/clearMatchingBot" id="根据clearBotUid.txt 删除部分机器人" name="根据clearBotUid.txt 删除部分机器人" hidden="true">删除</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/clearMatchesBot" id="删除全部机器人" name="删除全部机器人" hidden="true">删除</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/getRoboteResource" id="收取机器人资源" name="测试机器人自动收取功能" hidden="true">收取</a>
                <a href="http://192.168.0.1:8080/snc/v1/testTool/upgradeRoboteData" id="机器人升级" name="测试机器人升级" hidden="true">升级</a>
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
            ////访问数据库
//            var getRoleIdUrl = ctx + 'getRoleId.do';
//            var roleId;

//            function getRoleId(id) {
//                var url = getRoleIdUrl;
//                var data = {
//                    userId: id
//                }
//
//                action.post(url, data, function (e) {
//                    action.execResult(e, function () {
//                        roleId = e.message;
//                        initGrid();
//                    });
//                });
//            }

            var key = "url.test";

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
