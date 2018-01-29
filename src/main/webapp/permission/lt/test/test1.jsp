<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../../../taglib.jsp" %>
<%@page import="permission.common.RMSContext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>服务器工具</title>
    <script type="text/javascript" src="${ctx}res/js/MD5.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}res/bui/css/lt.css"/>
    <script type="text/javascript" src="../../js/manager.js"></script>
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
            </c:if>

            <c:if test="${title=='5'}">
            <form action="http://192.168.0.1:8080/snc/v1/testTool/productLtBot" method="post" id="生成运营需要帐号" onsubmit="formLog($(this).serialize()+'&'+'beharvior='+this.id);">
                <label>生成运营需要帐号 </label>
                uid: <input type="text" name="userId" id="userId" value="" required/>
                mail:<input type="text" name="mail" id="mail" size="30" value="" required/>
                mailPassWord: <input type="text" name="mailPassWord" id="mailPassWord" size="30" value="" required/>
                <input class="sub" type="submit" value="生成"/></form>
            </c:if>
            <form action="http://192.168.0.1:8080/snc/v1/systemTool/delDeviceByUid" method="post" id="解除玩家绑定" onsubmit="formLog($(this).serialize()+'&'+'beharvior='+this.id);">
                <label>解除玩家绑定 uid:</label>
                <input type="text" name="uid" id="uid" value="" required/>
                <input class="sub" type="submit" value="解除"/></form>

            <c:if test="${title eq '6'}">
                <a href="http://10.80.2.105:8080/snc/v1/testTool/testServerStatus" id="id1" name="name1" hidden="true">查看</a>
            </c:if>
            <c:if test="${title=='5'}">
            <a href="http://10.80.2.105:8080/static/dgwm/log/client/" id="id2" name="name2" hidden="true">查看1</a>
            </c:if>
            <a href="http://10.80.2.105:8080/snc/v1/systemTool/getCdkey" id="id3" name="name3" hidden="true">查看2</a>
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

        var TYPE = {
            UPDATEPRO: 1
            , UPDATEPRO1: 2
        }


        $(function () {
                var store;
                var grid;


                function getData() {
                    var aObj = document.getElementsByTagName("a");
                    var data = new Array(aObj.length);
                    for (var i = 0; i < aObj.length; i++) {
                        console.log("aObj[i].href:" + aObj[i].href);
                        data[i] = {a: aObj[i].id, b: aObj[i].name, c: "<a href=\"" + aObj[i].href + "\">" + aObj[i].innerHTML + "</a>"};
                        console.log("id:" + aObj[i].id + ",name:" + aObj[i].name + ",aObj[i]:" + typeof(aObj[i]));
                    }
                    initGrid(data);
                }

                function initUrl() {
                    var key = "url.gw";
                    getUrl(key);
                }

                function init() {
                    initUrl();
                    getData();
                }


                function initGrid(datas) {
                    console.log(datas);
                    BUI.use(['bui/grid', 'bui/data'], function (Grid, Data) {
                        var Store = Data.Store,
                            columns = [
                                {title: '名称', dataIndex: 'a', width: '25%'},
                                {title: '说明', dataIndex: 'b', width: '45%'},
                                {title: '链接', dataIndex: 'c', width: '30%'},
                            ],
                            data = datas;
                        store = new Store({
                            data: data
                        }),
                            grid = new Grid.Grid({
                                render: '#grid',
                                width: '100%',//如果表格使用百分比，这个属性一定要设置
                                columns: columns,
                                idField: 'a',
                                store: store
                            });

                        grid.render();
                    });
                }

                init();
            }
        );

    </script>
</rms:role>
</body>
</html>
