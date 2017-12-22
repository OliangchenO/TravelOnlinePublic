using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelOnline.Management
{
    public partial class CreatePrefer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //校验线路编号是否正确
            string SqlQueryText = "";
            string code = "";
            List<string> sqls = new List<string>();

            for (int i = 0; i < 10000; i++)
            {
                code = MyConvert.CreateCode(8);
                SqlQueryText = string.Format("insert into dbo.OL_CreatePrefer (code,flag,preferAmount,lineId) values ('{0}','{1}','{2}',{3})",
                    code,
                    "0",
                    "99",
                    "25126"
                );
                sqls.Add(SqlQueryText);
            }
            string[] SqlQuery = sqls.ToArray();
            if (MyDataBaseComm.ExcuteSql(SqlQuery) == true)
            {
                Response.Write("({\"success\":\"OK\"})");
            }
            else
            {
                Response.Write("({\"error\":\"信息保存失败\"})");
            }
        }
    }
}