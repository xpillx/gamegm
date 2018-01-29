<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../../../taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>服务器工具</title>
    <script type="text/javascript" src="${ctx}res/js/MD5.js"></script>
    <script type="text/javascript" src="../../js/SelectRoleWin.js"></script>
    <script type="text/javascript" src="../../js/manager.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}res/bui/css/mail.css"/>
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

        <div id="stylized" class="myform">
            <form action="http://192.168.0.1:8080/snc/v1/systemTool/sendMail" method="post" id="发送邮件" onsubmit="formLog($(this).serialize()+'&'+'beharvior='+this.id);">
                <legend>guowei邮件</legend>
                <span class="pas">
                     <label>邮件类型:</label>
                    <input type="radio" style="transform: scale(1,1);" name="type" value="SYSTEM" checked="checked"/>系统邮件
                    <input type="radio" style="transform: scale(1,1);" name="type" value="PERSION"/>个人邮件</span>

                <span class="pas">
                  <label>按钮名称:</label>
                  <input type="text" name="buttonText" id="buttonText" placeholder="领取" required/></span>

                <span class="pas">
                  <label>标题:</label>
                  <input type="text" name="subject" id="subject" placeholder="月卡奖励" required/></span>

                <span class="pas">
                  <label>内容:</label>
                  <input type="text" name="message" id="message" placeholder="月卡奖励200皇冠" required/></span>

                <span class="pas">
                  <label>接收:</label>
                  <input type="text" name="uid" id="uid" placeholder="000000000" required/></span>

                <span class="pas">
                  <label>奖励内容:</label>
                  <input type="text" name="reward" id="reward" value="gem_200"/></span>

                <span class="pas">
                  <label>链接url:</label>
                  <input type="text" name="url" id="url" value="-1" required/></span>

                <span class="pas">
                  <label>倒计时:</label>
                  <input type="text" name="durationTime" id="durationTime" value="-1" required/></span>

                <span class="pas">
                  <label>Icon:</label>
                  <input type="text" name="sprite" id="sprite" value="envelope" required/> </span>

                <span class="pas">
                  <label>背包(礼包):</label>
                  <input type="radio" style="transform: scale(1,1);" name="backPack" value="0" checked="checked"/>否
                  <input type="radio" style="transform: scale(1,1);" name="backPack" value="1"/>是</span>

                <span class="pas">
                  <label>资源溢出:</label>
                  <input type="radio" style="transform: scale(1,1);" name="cardType" value="NORMAL" checked="checked"/>普通邮件
                  <input type="radio" style="transform: scale(1,1);" name="cardType" value="CASH"/>计费邮件</span>

                <span class="pas">
                  <label>推送内容:</label>
                  <input type="text" name="push" id="push" value=""/></span>

                <input class="sub" type="submit" value="发送"/>

                <p>按钮名称：领取 </p>
                <p>标题:邮件标题 </p>
                <p>内容:邮件内容</p>
                <p>接收:all or uid or uid,uid,uid (uid发个人邮件，部分人，all所有人)</p>
                <p>奖励内容:gem_200,food_10000,gold_1000,oil_1000 奖励建筑：entity:starter_house-1-build-100-0,entity:estate-1-build-2000-0 组合使用（;）可不填</p>
                <p>链接url:-1 (默认填-1，也可填写url,客户端点击会访问此url)</p>
                <p>倒计时: (默认填-1，也可填写此邮件持续展示时间，例：60 ,60s后自动删除 )</p>
                <p>Icon:envelope (默认envelope,可以填写相应图片名称，客户端展示相应图片)</p>
                <p>背包(礼包)：（否:邮件展示，是：奖励放进背包）</p>
                <p>邮件类型类型: （个人邮件，系统邮件）</p>
                <p>类型: （普通邮件不允许溢出，计费邮件允许溢出）</p>
                <p>推送内容: (不填，无推送)</p>

            </form>
        </div>
    </div>

    <script type="text/javascript">
        var key = "url.zhzl";

        init();

        function initUrl() {
            getUrl(key);
        }

        function init() {
            initUrl();
            getUrlData(key);

        }
    </script>
</rms:role>
</body>
</html>
