<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="WebApplication1.Event" %>

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
            function EventOne() {
                //Ext.MessageBox.alert('Title', '您好。。。');
                alert('Hello!');
                return false;
            }

            function EventTwo() {
                //Ext.MessageBox.alert('Title', 'Hello。。。');
                alert('你好!');
                return false;
            }

            //Ext.get("btnEvent").setText("事件测试");
            Ext.get("btnEvent").addListener('click', EventOne);
            Ext.get("btnEvent").on('click', EventTwo);

            Person = Ext.extend(Ext.util.Observable, {
                constructor: function (name) {
                    this.name = name;
                    this.sayNum = 0;
                    this.say = function () {
                        if (this.sayNum < 2) {
                            this.sayNum += 1;
                            alert(name);
                        }
                        else {
                            this.sayNum = 0;
                            this.fireEvent("onSay", this);
                        }
                    }
                    this.addEvents({ "onSay": true });
                }
            });

            var per = new Person("tom");
            per.addListener("onSay", function handler() { alert("执行自定义事件...") });
            Person.superclass.constructor.call("tom");
            //Ext.get('btnTest').on("click", per.say());

        });
              
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button runat="server" ID="btnEvent" Text="事件测试" />
        <input type="button" value="Say" id='btnTest'/>
    </div>
    </form>
</body>
</html>
