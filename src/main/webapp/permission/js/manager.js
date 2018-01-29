//form添加log
function formLog(formData) {
    $.ajax({
        cache: true,
        type: "POST",
        url: ctx + "log.jsp",
        // data: $('#form1').serialize(),// 你的formid
        data: formData,
        async: false,
        error: function (request) {
        },
        success: function (data) {
        }
    });
}

//a添加log
function aLog(message) {
    $.ajax({
        cache: true,
        type: "POST",
        url: ctx + "log.jsp",
        data: {"message": message},
        async: false,
        error: function (request) {
        },
        success: function (data) {
        }
    });
}

//请求url
function getUrl(key) {
    $.ajax({
        cache: true,
        type: "POST",
        url: ctx + "urlManager.jsp",
        data: {"urlKey": key},
        async: false,
        error: function (request) {
        },
        success: function (data) {
            console.log("url:" + data);
            var aObj = document.getElementsByTagName("a");
            console.log("aObj.length:" + aObj.length);
            if (aObj.length > 0) {
                for (var i = 0; i < aObj.length; i++) {
                    aObj[i].href = aObj[i].href.replace(aObj[i].protocol + "//" + aObj[i].host, data);
                    console.log("aObj[i].action:" + aObj[i].href);
                }
            }
            var fObj = document.getElementsByTagName("form");
            console.log("fObj.length:" + fObj.length);
            if (fObj.length > 0) {
                for (var i = 0; i < fObj.length; i++) {
                    fObj[i].action = fObj[i].action.replace(/[A-Za-z.:]+\/\/[A-Za-z0-9.:]+/i, data);
                    console.log("fObj[i].action:" + fObj[i].action);
                }
            }
            var title = document.getElementById("urlTitle");
            title.innerHTML = key + "：" + data;
        }
    });
}

//创建表格数据及链接拼接
function getUrlData(server) {
    var aObj = document.getElementsByTagName("a");
    var data = new Array(aObj.length);
    if (aObj.length > 0) {
        for (var i = 0; i < aObj.length; i++) {
            console.log("aObj[i].href:" + aObj[i].href);
            data[i] = {a: aObj[i].id, b: aObj[i].name, c: "<a href=\"" + aObj[i].href + "\" id=\"" + server + aObj[i].id + "\" onclick='aLog(this.id)'>" + aObj[i].innerHTML + "</a>"};
        }
        initGrid(data);
    }
}


var store;
var grid;

//初始化数据
function initGrid(info) {
    BUI.use(['bui/grid', 'bui/data'], function (Grid, Data) {
        var Store = Data.Store,
            columns = [
                {title: '操作', dataIndex: 'a', width: '25%'},
                {title: '说明', dataIndex: 'b', width: '55%'},
                {title: '链接', dataIndex: 'c', width: '20%'}
            ],

            data = info;

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