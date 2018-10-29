using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelOnline.NewPage.erp;
using TravelOnline.TravelMisWebService;
using TravelOnline.Utility;

namespace TravelOnline.PayMent
{
    public partial class Return_YCCB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //强制刷新页面，不允许从缓存中读取
            Response.Buffer = true;
            Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
            Response.Expires = 0;
            Response.CacheControl = "no-cache";
            Response.AppendHeader("Pragma", "No-Cache");
            string ErpId = "", ShipId = "";
            string orderNum = "";
            string merOrderNum = "";//订单号
            string tranSerialNo = "";              //流水号
            string merOrderAmt = "";            //获取总金额
            string tranResult = "";
            string Plain = Request.Form["Plain"];
            string Signature = Request.Form["Signature"];
            //string Plain = "TranAbbr=IPER|AcqSsn=129041501|MercDtTm=20180819104025|TermSsn=1534646426345396|RespCode=00000000|TermCode=|MercCode=1100529310001000003|TranAmt=207.00|SettDate=20180211|";
            SaveLogUtils.SaveInfoToLog("Plain: " + Plain, "YCYHInfoLog.txt");
            SaveLogUtils.SaveInfoToLog("Signature: " + Signature, "YCYHInfoLog.txt");
            if (PSBCMerchant.SignatureService.verify(Plain, Signature))
            {
                string[] res = Plain.Split('|');
                foreach (string str in res)
                {
                    if (orderNum == "" || merOrderNum == "" || tranSerialNo == "" || merOrderAmt == "" || tranResult == "")
                    {
                        if (str.Contains("TermSsn"))
                        {
                            orderNum = str.Split('=')[1];
                            merOrderNum = orderNum.Substring(10);
                        }
                        if (str.Contains("AcqSsn"))
                        {
                            tranSerialNo = str.Split('=')[1];
                        }
                        if (str.Contains("TranAmt"))
                        {
                            merOrderAmt = str.Split('=')[1];
                        }
                        if (str.Contains("RespCode"))
                        {
                            tranResult = str.Split('=')[1];
                        }
                    }
                    else
                    {
                        break;
                    }

                }
                DataSet DS = new DataSet();
                DS.Clear();
                string SqlQueryText = string.Format("select * from OL_Order where AutoID='{0}'", merOrderNum);
                DS = MyDataBaseComm.getDataSet(SqlQueryText);
                if (DS.Tables[0].Rows.Count == 0)
                {
                    SaveErrorToLog("邮储银行数据库更新错误", "out_trade_no=" + merOrderNum);
                    return;
                }
                string OrderID = DS.Tables[0].Rows[0]["OrderID"].ToString();
                ErpId = DS.Tables[0].Rows[0]["ErpID"].ToString();
                ShipId = DS.Tables[0].Rows[0]["Shipid"].ToString();

                if (tranResult.Equals("00000000"))
                {
                    SqlQueryText = string.Format("select PayPrice from OL_PayMent where PayType='YCCB' and OrderId='{0}' and TradeNo='{1}'", OrderID, tranSerialNo);

                    DS.Clear();
                    DS = MyDataBaseComm.getDataSet(SqlQueryText);
                    string dateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    if (DS.Tables[0].Rows.Count == 0)
                    {
                        List<string> Sql = new List<string>();
                        Sql.Add(string.Format("UPDATE OL_Order set PayFlag='1' where OrderId='{0}'", OrderID));

                        Sql.Add(string.Format("insert into OL_PayMent (OrderId,TradeNo,Buyer,PayPrice,PayTime,PayContent,PayType) values ('{0}','{1}','{2}','{3}','{4}','{5}','YCCB')",
                            OrderID,
                            tranSerialNo,
                            "",
                            merOrderAmt,
                            dateTime,
                            ""
                            )
                        );

                        Sql.Add(string.Format("insert into OL_OrderLog (OrderId,LogTime,LogContent) values ('{0}','{1}','在线支付成功，付款金额：{2}，邮储银行银行交易号：{3}')",
                            OrderID,
                            dateTime,
                            merOrderAmt,
                            tranSerialNo
                            )
                        );

                        string[] SqlQuery = Sql.ToArray();
                        if (MyDataBaseComm.Transaction(SqlQuery) == true)
                        {

                            if (MyConvert.ConToInt(ShipId) > 0)
                            {
                                string UpPassWord = Convert.ToString(ConfigurationManager.AppSettings["UpLoadPassWord"]);
                                TravelOnlineService rsp = new TravelOnlineService();
                                rsp.Url = Convert.ToString(ConfigurationManager.AppSettings["TravelMisWebService"]) + "/WebService/TravelOnline.asmx";
                                PayInfo Pays = new PayInfo();
                                Pays.OrderId = OrderID;
                                Pays.TradeNo = tranSerialNo;
                                Pays.PayPrice = merOrderAmt;
                                Pays.PayTime = DateTime.Now.ToString();
                                Pays.PayContent = "";

                                string Result;
                                try
                                {
                                    //Result = rsp.PayInfoSave(UpPassWord, Pays);
                                }
                                catch
                                {
                                }
                            } else
                            {
                                //Result = ErpUtil.savePayInfo("邮储银行", ErpId, merOrderAmt, tranSerialNo, tranSerialNo, "邮储银行", DateTime.Now.ToString());
                            }
                                
                            SaveErrorToLog("邮储银行支付成功", "trade_no=" + tranSerialNo);
                            string url = string.Format("/fifthstep.html?orderid={0}", OrderID);
                            Response.Redirect(url, true);
                        }
                        else
                        {
                            SaveErrorToLog("邮储银行支付数据库更新错误", "trade_no=" + tranSerialNo);
                            string url = string.Format("/fourthstep.html?error=101&orderid={0}", OrderID);
                            Response.Redirect(url, true);
                        }
                    }
                    else
                    {
                        SaveErrorToLog("邮储银行支付记录已存在", "trade_no=" + tranSerialNo);
                        string url = string.Format("/fifthstep.html?orderid={0}", OrderID);
                        Response.Redirect(url, true);
                    }
                }
                else
                {
                    SaveErrorToLog("邮储银行支付状态态错误！", "trade_status=" + tranResult);
                    SaveErrorToLog("邮储银行支付失败！", "trade_no=" + tranSerialNo);
                    string url = string.Format("/fourthstep.html?error=102&orderid={0}", merOrderNum);
                    Response.Redirect(url, true);
                }
            }else
            {
                SaveErrorToLog("邮储银行验签失败！", "邮储银行验签失败！");
                string url = string.Format("/fourthstep.html?error=102&orderid={0}", merOrderNum);
                Response.Redirect(url, true);
            }
            
        }
        
        private static void SaveErrorToLog(string inErrorlog, string inSQL)
        {
            //string path = System.IO.Directory.GetCurrentDirectory(); //Application.StartupPath.StartupPath + @"\Errorlog.txt";
            string path = AppDomain.CurrentDomain.BaseDirectory + @"\PayErrorLog.txt";

            try
            {
                StreamWriter writer = new StreamWriter(path, true, Encoding.GetEncoding("UTF-8"));
                writer.WriteLine(DateTime.Now.ToString() + ":");
                writer.WriteLine(inErrorlog);
                writer.WriteLine(inSQL);
                writer.Close();
            }
            catch (Exception exception)
            {
                string message = exception.Message;
            }
        }
    }
}