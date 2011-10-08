<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Combox.aspx.cs" Inherits="WebApplication1.Combox" %>

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
        // 创建数据模型
        Ext.onReady(function () {
            Ext.regModel("BookInfo", { fields: [{ name: 'bookName'}] });

            var bookStore = Ext.create('Ext.data.Store', {
                model: 'BookInfo',
                proxy: {
                    type: 'ajax',
                    url: 'Store.ashx',
                    reader: new Ext.data.ArrayReader({ model: 'BookInfo' })
                }
            });

            var form = new Ext.form.Panel({
                title: 'Store',
                height: 120,
                width: 270,
                frame: true,
                renderTo: 'form1',
                defaults: {
                    labelSeparator: ':',
                    labelWidth: 50,
                    width: 150,
                    labelAlign: 'left'
                },
                items: [{
                      xtype:'combo',
                    fieldLabel: '书籍',
                    listConfig:{
                        laodingText:'正在加载书籍信息......',
                        emptyText:'未找到匹配的值',
                        maxHeight:60
                    },
                allQuery:'allbook',
                minChars:3,
                queryDelay:100,
                queryParam:'searchbook',
                triggerAction:'all',
                store:bookStore,
                displayField:'bookName',
                valueField:'bookName',
                queryMode:'remote'
                 }]
            });
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
