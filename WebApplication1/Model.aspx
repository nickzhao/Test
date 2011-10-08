<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Model.aspx.cs" Inherits="WebApplication1.Model" %>

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
            var userData = { "total": 2000,
                "users": [
                { "id": 123,
                    "name": "Nick",
                    "orders": [
                   {
                       "id": 50,
                       "total": 100
                   }
                   ]
                }
                ]
            }

            // 定义Model User
            Ext.regModel("User", {
                fields: ["id", "name"],
                hasMany: 'Order' // 定义User与Order为一对多的关系
            });

            // 定义Model Order
            Ext.regModel("Order", {
                fields: ["id", "total"],
                hasMany: 'User' // 定义Order与User为多对一的关系
            });

            // 定义memory代理
            var memoryProxy = new Ext.data.proxy.Memory({
                model: 'User',
                reader: {
                    type: 'json',
                    root: 'users'
                },
                data: userData
            });

            memoryProxy.read(new Ext.data.Operation(), callBack)

            function callBack(result) {
                var count = result.resultSet.total;
                var user =  result.resultSet.records[0];

                alert(count);
                alert(user.get('name'));
            }
        });

        //        Ext.onReady(function () {
        //            Ext.regModel('User', {
        //                fidlds: [
        //                { name: 'userID', type: 'string' },
        //                { name: 'userName', type: 'string' }
        //                ],
        //                hasMany: { model: 'BookInfo', name: 'getBooks', autoLoad: false },
        //                proxy: {
        //                    type: 'ajax',
        //                    url: 'Handler1.ashx'
        //                }
        //            });

        //            Ext.regModel('BookInfo', {
        //                fidlds: [
        //                { name: 'userID', type: 'string' },
        //                { name: 'title', type: 'string' }
        //                ],
        //                proxy: {
        //                    type: 'ajax',
        //                    url: 'Handler1.ashx',
        //                    reader:
        //                    {
        //                        type: 'json',
        //                        root: 'BookInfo'
        //                    }
        //                }
        //            });

        //            var user = Ext.ModelManager.getModel('User');

        //            user.load(1, {
        //                success: function (rec) {
        //                    var books = rec.getBooks();

        //                    books.load({
        //                        callback: function (records, operation, success) {
        //                            var msg = [];
        //                            for (var i = 0; i < records.length; i++) {
        //                                var rec = records[i];
        //                                msg.push(rec.get('title'));
        //                            }
        //                            alert(msg.join('\n'));
        //                        }
        //                    });
        //                }
        //            });
        //        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    </div>
    </form>
</body>
</html>
