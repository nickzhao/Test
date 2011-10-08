<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grid.aspx.cs" Inherits="WebApplication1.Grid" %>

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
    //测
        Ext.onReady(function () {
            var datas = [[100, '张三', 24, new Date(1986, 10, 27), false, false], [101, '李四', 26, new Date(1986, 10, 29), true, true], [102, '王五', 28, new Date(1986, 10, 30), false, false]];
            Ext.create('Ext.grid.RowNumberer', { text: '行号', width: 35 });
           var grid = Ext.create("Ext.grid.Panel", {
                title: "测试",
                renderTo: Ext.getBody(),
                width: 600,
                height: 300,
                frame: true,
                // 设定单元格的选择模式
                selType: 'cellmodel', // rowmodel（默认），checkboxmodel
                //I don't Know
                tbar:[{
                        text:'取得所选单元格',
                        handler:function(){
                            var cel = grid.getSelectionModel().getCurrentPosition().row;
                            alert(Ext.JSON.encode(cel));
                        }
                }],

                viewConfig: {
                    forceFit: true,
                    stripeRows: true // 表格中显示斑马线
                },
                store: {
                    fields: ['id', 'name', 'age', 'birth', 'ces', 'color'],
                    proxy: {
                        type: 'memory',
                        data: datas,
                        reader: 'array'
                    },
                    autoLoad: true
                },
                columns: [
                { header: "id", widht: 5, dataIndex: 'id', sortable: true },
                { header: "姓名", widht: 20, dataIndex: 'name', sortable: true },
                { header: "年龄", widht: 10, dataIndex: 'age', sortable: true },

                // 日期格式化
                {header: "生日", widht: 30, dataIndex: 'birth', sortable: true, xtype: "datecolumn", format: 'Y年m月d日' },

                // boolean
                {header: "在职", widht: 2, dataIndex: 'ces', sortable: true, xtype: "booleancolumn", trueText: 'Y', falseText: 'N' },

                // 模板列的应用
                {
                header: "描述", width: 40,
                xtype: 'templatecolumn',
                tpl: '{name}<tpl if ="ces==false">YES</tpl>'
            },

            // 自定义函数用法(红色为旷职，绿色为正常状态)
                {
                header: "状态", width: 40,
                dataIndex: 'color', sortable: false, renderer: fomateState
            },
            // 显示图片
                {
                header: 'Action',
                width: 70,
                xtype: 'actioncolumn',
                //altText: 'Hello!',
                items: [{
                    icon: 'donate.gif',
                    handler: function (grid, rowIndex, colIndex) {
                        var rec = grid.getStore().getAt(rowIndex);
                        alert('Edit:' + rec.get('name'));
                    }
                }]
            }
                ]
        });

        // 自定义函数格式化输出信息
        function fomateState(value, metadata) {
            if (value) {
                metadata.tbAttr ='alt=在职';
                metadata.style = "background-color:#00CC00;";
            }
            else {
                metadata.style = "background-color:#FF0000;";
            }
            //alert(value);
            return value;
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
