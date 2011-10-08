using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    /// <summary>
    /// Summary description for Store
    /// </summary>
    public class Store : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string strName = context.Request.QueryString["searchbook"];
            string jav = "['java编程思想'],['java极限编程'],['java入门'],['javascript程序设计']";
            context.Response.Write("["+jav+"]");
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