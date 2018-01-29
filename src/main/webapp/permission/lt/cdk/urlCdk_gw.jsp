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

        <div class="content">
            <div class="con_left">
                <form method="post" action="http://192.168.0.1:8080/snc/v1/systemTool/createCdkey" class="form-horizontal" id="生成兑换码" onsubmit="formLog($(this).serialize()+'&'+'beharvior='+this.id);">
                    <h2>guowei兑换码生成</h2>
                    <div class="control-group">
                        <label class="control-label"><s>*</s>批次:</label>
                        <div class="controls">
                            <input type="text" name="type" class="input-large" placeholder="1" data-rules="{required:true,number:true}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label"><s>*</s>内容:</label>
                        <div class="controls">
                            <input type="text" name="content" class="input-large" placeholder="GEMS_1000000" data-rules="{required:true,regexp:/^GEMS_[0-9]+$/}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label"><s>*</s>数量:</label>
                        <div class="controls">
                            <input type="text" name="number" class="input-large" placeholder="10" data-rules="{required:true,number:true}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label"><s>*</s>长度:</label>
                        <div class="controls">
                            <input type="text" name="length" class="input-large" placeholder="4" data-rules="{required:true,number:true}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label"><s>*</s>可用次数:</label>
                        <div class="controls">
                            <input type="text" name="count" class="input-large" placeholder="1" data-rules="{required:true,number:true}"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-actions offset3">
                            <button type="submit" class="button button-primary">生成</button>
                            <button type="reset" class="button">重置</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="con_left">
                <form method="post" action="http://192.168.0.1:8080/snc/v1" class="form-horizontal">
                    <h2>说明：</h2>
                    <div class="control-group">
                        <label class="labels">批次：4（第几次生成兑换码）</label>
                        <div class="controls">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="labels">内容:GEMS_1000000</label>
                        <div class="controls">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="labels">数量:1</label>
                        <div class="controls">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="labels">长度:8 （兑换码长度）</label>
                        <div class="controls">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="labels">可用次数:100 （可以使用次数）</label>
                        <div class="controls">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <script type="text/javascript">

            var key = "url.gw";

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
