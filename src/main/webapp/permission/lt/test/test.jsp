<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../../../taglib.jsp" %>
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
            <form name="form" method="post" action="http://10.80.2.105:8080/snc/v1/testTool/productAllianceBot" target="_blank">
                <label>生成公会机器人 aid:</label>
                <input type="text" name="aid" id="aid" placeholder="公会id or 不填" required/>
                <input class="sub" type="submit" value="生成"/>
                <label>--备注：填写公会id生成公会机器人，不填写只生成机器人</label>
            </form>

            <form name="form" method="post" action="http://10.80.2.105:8080/snc/v1/testTool/productLtBot" target="_blank">
                <label>生成运营需要帐号 </label>
                uid: <input type="text" name="userId" id="userId" value="" required/>
                mail:<input type="text" name="mail" id="mail" size="30" value="" required/>
                mailPassWord: <input type="text" name="mailPassWord" id="mailPassWord" size="30" value="" required/>
                <input class="sub" type="submit" value="生成"/></form>

            <form name="form" method="post" action="http://10.80.2.105:8080/snc/v1/systemTool/delDeviceByUid" target="_blank">
                <label>解除玩家绑定 uid:</label>
                <input type="text" name="uid" id="uid" value="" required/>
                <input class="sub" type="submit" value="解除"/></form>

            <form name="form" method="post" action="http://10.80.2.105:8080/snc/v1/systemTool/setPttkFalse" target="_blank">
                <label>设置玩家攻击状态 uid:</label>
                <input type="text" name="user_id" id="user_id" placeholder="all or uid" required/>
                <input class="sub" type="submit" value="设置"/>
                <label>--备注：解锁特殊情况下玩家未自动解除被进攻状态</label>
            </form>

            <form name="form" method="post" action="http://10.80.2.105:8080/info/HttpInfo" target="_blank">
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

            <form name="form" method="post" action="http://10.80.2.105:8080/snc/v1/testTool/delSysMailKeys" target="_blank">
                <label>删除系统邮件 mailId:</label>
                <input type="text" name="mailId" id="mailId" size="30" value="" required/>
                <input class="sub" type="submit" value="删除"/></form>

            <form id="form" name="form" method="post" action="http://10.80.2.105:8080/info/HttpInfo?logic=GmModifyRoleData&playerUid=417814385&playerServerId=PlayerUid&playerProject=rating&playerParameterInput=201" target="_blank">
                <label>修改玩家奖牌数 玩家uid:</label>
                <input type="hidden" name="logic" value="GmModifyRoleData"/>
                <input type="hidden" name="playerServerId" value="PlayerUid"/>
                <input type="hidden" name="playerProject" value="rating"/>
                <input type="hidden" name="type" value="0"/>
                <input type="text" name="playerUid" value="" required/>
                <label>奖牌数:</label> <input type="text" name="playerParameterInput" value="" required/>
                <input class="sub" type="submit" value="设置"/></form>

            <form action="http://10.80.2.105:8080/download" method="post" enctype="multipart/form-data" target="_blank">
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
            var urlHttp = 'http://10.80.2.105:8080/info/HttpInfo?logic=getFtueRate&category=all&starttime=2017-12-27%2000:08:50&endtime=2017-12-27%2023:08:50';
            var jsons;

            function getRoleId() {
                var url = urlHttp;

                $.getJSON(url, function (data) {
                    var datass = data.data.玩家新手教学通过率.size;
                    initGrid(datass);
                });

            }


            function initUrl() {
                var key = "url.gw";
                getUrl(key);
            }

            function init() {
                initUrl();
                getRoleId();
            }


            function initGrid(datas) {
                console.log(datas);
                BUI.use(['bui/grid', 'bui/data'], function (Grid, Data) {
                    var Store = Data.Store,
                        columns = [
                            {title: '教学点步骤', dataIndex: 'ftuestep', width: '55%'},
                            {title: '完成人数', dataIndex: 'comcount', width: '45%'},
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
        });

    </script>
</rms:role>
</body>
</html>
