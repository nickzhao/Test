<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
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
        Ext.onReady(
        function () {
            //            alert('test');
            //            Ext.MessageBox.alert('test','test');
            //alert('test');
            Ext.MessageBox.confirm('hello', 'Hello Word!', function (button) {
                if (button == 'yes') {
                    Ext.MessageBox.alert('Yes', 'yes');
                }
                else {
                    Ext.MessageBox.alert('No', 'no');
                }
            }
                        , buttons = { yes: '确定', no: '取消' });

            // alert('test');
        }
        );

        ///////////////////////////////////////////////
        // joson 形式配置对话框的现实信息
        var personInfor = {
            title: '提示',
            msg: '自定义?',
            buttons: Ext.Msg.YESNO,
            fn: callback,
            // 窗口的形态：模态 or 非模态
            modal: true,
            icon: Ext.Msg.ERROR,
            progress: true,
            progressText: 'loading...'
        }

        function callback(id) {
            alert(id)
        }

        Ext.onReady(

         function () {

             // 重命名按钮名称
             //             Ext.MessageBox.msgButtons[1].setText("确定");
             //             Ext.MessageBox.msgButtons[2].setText("取消");
             Ext.MessageBox.show(personInfor);
         }
        );

        ///////////////////////////////////////////////
        Ext.onReady(
        function () {
            var msgBox = Ext.MessageBox.show(
            {
                title: '滚动条Example',
                msg: '动态更新进度条',
                modal: true,
                width: 300,
                progress: true
            }
            )

            var count = 0;
            var percentage = 0;
            var progressText = '';

            var task = {
                run: function () {
                    count++;
                    percentage = count / 100;
                    progressText = 'loading....：' + percentage * 100 + "%";

                    msgBox.updateProgress(percentage, progressText, 'Time:' + Ext.util.Format.date(new Date(), 'Y-m-d g:i:s A'));
                    if (count > 100) {
                        Ext.TaskManager.stop(task);
                        msgBox.hide();
                    }
                }, interval: 1000
            }
            Ext.TaskManager.start(task);
        }
        );

        /////////////////////////////////////////////////

//        Ext.onReady(
//        function () {
//            Ext.MessageBox.wait('loading', '提示', { text: '文件上传中...', duration: 10000, fn: function () { Ext.MessageBox.alert('Title','更新完毕！') } });

//            //  Ext.MessageBox.alert('Title', '上传成功!');
//          
//        }
//        )

        ////////////////////////////////////////////

        Ext.onReady(
        function () {

            var p = new Ext.ProgressBar(
            {
                width: 300,
                renderTo: 'div1'
            });

            // 自动模式滚动条
            p.wait(
            {
                scope: this,
                text: 'waiting',
                fn: function () { alert('更新完毕！'); document.getElementById('div1').style.display = 'none'; },
                duration: 10000,
                interval: 1000,
                increment: 10
            });

            var count = 0;
            var percentage = 0;
            var progressText = '';

            // 手动模式滚动条
            Ext.TaskManager.start({
                run: function () {
                    count++;
                    percentage = count / 100;
                    progressText = 'loading....：' + percentage * 100 + "%";

                    p.updateProgress(percentage, progressText, 'Time:' + Ext.util.Format.date(new Date(), 'Y-m-d g:i:s A'));
                    if (count > 100) {
                        //   document.getElementById("div1").style.display = 'none';
                        p.hide();
                    }
                },
                interval: 1000,
                repeat: 6
            })
        }
        );
    </script>
    <h2>
        Welcome to ASP.NET!
    </h2>
    <div id="div1">
    </div>
    <p>
        To learn more about ASP.NET visit <a href="http://www.asp.net" title="ASP.NET Website">
            www.asp.net</a>.
    </p>
    <p>
        You can also find <a href="http://go.microsoft.com/fwlink/?LinkID=152368&amp;clcid=0x409"
            title="MSDN ASP.NET Docs">documentation on ASP.NET at MSDN</a>.
    </p>
</asp:Content>
