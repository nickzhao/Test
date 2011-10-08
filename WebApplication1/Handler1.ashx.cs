using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization.Json;
using System.Web.Script.Serialization;
using System.IO;
using System.Text;

namespace WebApplication1
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

           // JavaScriptSerializer 
            //  DataContractJsonSerializer a = new DataContractJsonSerializer(json.GetType(),json);

            string strReturnValue = "books";

            //context.Response.Write(System.DateTime.Now.ToString());

            #region Ajax动态改变页面的值
            //context.Response.Write(System.DateTime.Now.ToString());
            #endregion

            #region .net 接收&&解析JSON数据并以JSON的格式返回到CLient

            StreamReader streamReader = new StreamReader(context.Request.InputStream);
            String json = streamReader.ReadToEnd();

            StringBuilder sb = new StringBuilder();
            JavaScriptSerializer item = new JavaScriptSerializer();
            Dictionary<string, string> ditem = item.Deserialize(json, typeof(Dictionary<string, string>)) as Dictionary<string, string>;
            ditem["userName"] = "Hugh";
            item.Serialize(ditem, sb);
            context.Response.Write(sb.ToString());

            #endregion

            #region 暂时无用
            // string strUserName = context.Request.Form["userName"];
            //string strPassWord = context.Request.Form["password"];

            //string strReurnMessage = string.Empty;

            //if (strUserName != string.Empty)
            //{
            //    strReurnMessage = @"{success:true,data:{name:'您接收的值为：" + strUserName + "'}}";
            //}
            //else
            //{
            //    strReurnMessage = @"{success:true,errorMessage:'Sorroy 接收的值为NULL'}";
            //}
            //context.Response.Write(strReurnMessage);
#endregion
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}