<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ajax.aspx.cs" Inherits="WebApplication1.Ajax" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" type="text/css" href="resources/css/ext-all.css" />
    <script src="Extjs/bootstrap.js" type="text/javascript" language="javascript"></script>
    <script type="text/javascript" src="locale/ext-lang-zh_CN.js"></script>
    <script type="text/javascript" src="Extjs_Share/examples.js"></script>
    <% if (false)
       { %>
    <script type="text/javascript" src="Extjs/ext.js"></script>
    <script type="text/javascript" src="Extjs/Extjs_Intellisense.js"></script>
    <% } %>
    <script language="javascript" type="text/javascript">

        // Ajax异步提交
        Ext.onReady(function () {
            Ext.Ajax.request({
                url: 'Handler1.ashx',
                jsonData: getJson(),
                callback: function (options, success, response) {
                    var msg = ["请求是否成功：", success, "\n", "服务器的返回值：",  response.responseText];
                    alert(msg.join(''));
                }
            });

            function getJson() {
                var json = { userName: 'Nick', password: '1234' }
                return json;
            }
        });

        //  利用ajax对页面进行更新
        Ext.onReady(function () {
            //            var loader = Ext.get('test').getLoader();
            var loader = Ext.get('div').getLoader();
            var btns = Ext.select('input');
            btns.addListener('click', function (e, btn) {
                var urlTest = btn.value + '.htm';
                load(urlTest);
            });

            Ext.get("btnChange").addListener("click", load);
            function load(urlTest) {
                loader.load({
                    //autoLoad:true,
                    //url:urlTest ,
                    url: 'Handler1.ashx',
                    renderer: function (loader, response, request) {
                        var txtTime = Ext.getDom('txtTime');
                        txtTime.value = response.responseText;
                       //alert(response.responseText);
                    },
                    loadMask: "ddddddddd"
                });
            }
        });

        Ext.onReady(function () {
            //            var loader = Ext.get('test').getLoader();
            var loader = Ext.get('div').getLoader();
            Ext.get("btnAuto").addListener("click", load);
            Ext.get("btnStop").addListener("click", StopUpdate);
            function load(urlTest) {
                loader.startAutoRefresh(1000, {
                    url: 'Handler1.ashx',
                    loadMask: "loading...."
                });
            }

            // 存在问题
            function StopUpdate() {
                loader.stopAutoRefresh();
            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="test" style="width: 200px; height: 100px; border: 2px solid #ccc">
        Hello!!</div>
    <input type="button" value="page1" />
    <input type="button" value="page2" />
    <input type="button" value="ChageTiem" id="btnChange" />
    <span id="sp"></span>
    <div id="div" style="width: 200px; height: 100px; border: 2px solid #ccc">
    <input type="text" id="txtTime" />
    </div>
      <input type="button" value="Auto" id="btnAuto" />
        <input type="button" value="Stop" id="btnStop" />
    </form>
</body>
</html>
