<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormSubmit.aspx.cs" Inherits="WebApplication1.FormSubmit" %>

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
        Ext.onReady(function () {
            Ext.QuickTips.init();
            var form = new Ext.form.Panel({
                title: '表单学习',
                height: 120,
                width: 200,
                frame: true,
                renderTo: 'form1',
                defaultType: 'textfield',
                defaults: {
                    labelSeparator: ':',
                    labelWidth: 50,
                    width: 150,
                    allowBlank: false,
                    blankText: '不允许为空!',
                    labelAlign: 'left',
                    msgTarget: 'qtip'
                },
                items: [{
                    //  xtype:'textfield',
                    fieldLabel: '用户名',
                    name: 'userName',
                    selectOnFocus: true,
                    regex: /^\d$/,
                    regexText: "请输入正确格式！"
                },
                {
                    //xtype: 'textfield',
                    name: 'password',
                    fieldLabel: '年龄',
                    inputType: 'password'
                }
                ],
                buttons: [{
                    text: '登陆',
                    //                    handler: function () {
                    //                        form.form.setValues({ usertName: 'user@com', password: '123456' })
                    //                    }
                    handler: SumitServer
                }]
            });

            function SumitServer() {
                var params = form.getForm().getValues();
                form.getForm().load({
                    clientValidation:true,
                    params: params,
                    url: 'Handler1.ashx',
                    method: 'POST',
                    waitMsg: '正在处理您的请求,请稍候...',
                    success: function (form, action) {
                        Ext.MessageBox.alert('Success', action.result.data.name);
                    },
                    failure: function (form, action) {
                        Ext.MessageBox.alert('Failure', action.result.errorMessage);
                    }
                })
            }
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    </div>
    </form>
</body>
</html>
