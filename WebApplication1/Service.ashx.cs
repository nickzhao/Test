using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    /// <summary>
    /// Summary description for Service
    /// </summary>
    public class Service : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string strUserName = context.Request.QueryString["userName"];
            string strPassWord = context.Request.QueryString["password"];

            string strReurnMessage = "{success:true,data:'数据接收成功！'}";
            context.Response.Write(strReurnMessage);
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