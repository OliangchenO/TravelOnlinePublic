using Belinda.Jasp;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelOnline.NewPage.erp;
using TravelOnline.TravelMisWebService;
using TravelOnline.Utility;

namespace TravelOnline.WeChat
{
    public partial class order_ticket : System.Web.UI.Page
    {
        public string LineId, Orderphone, Ordername, LineName, LinePrice, PriceInfo, planid, begindate, activityId;
        public Guid ucode;
        protected void Page_Load(object sender, EventArgs e)
        {
            ucode = System.Guid.NewGuid();
            Response.Cookies.Add(new HttpCookie("CheckCode", ""));
            LineId = Request.QueryString["LineId"];
            Session["Order_LineId"] = LineId;
            if (Convert.ToString(Session["Online_UserId"]).Length > 0)
            {
                JSONObject ObJson = new JSONObject();
                StringBuilder Strings = new StringBuilder();
                List<string> lstPriceType = new List<string>();
                string sql = string.Format("select * from OL_Line where MisLineid='{0}'", LineId);
                DataSet DS = new DataSet();
                DS.Clear();
                DS = MyDataBaseComm.getDataSet(sql);
                if (DS.Tables[0].Rows.Count > 0)
                {
                    LineName = DS.Tables[0].Rows[0]["LineName"].ToString();
                    LinePrice = DS.Tables[0].Rows[0]["Price"].ToString();
                    //string UpPassWord = Convert.ToString(ConfigurationManager.AppSettings["UpLoadPassWord"]);
                    //TravelOnlineService rsp = new TravelOnlineService();
                    //rsp.Url = Convert.ToString(ConfigurationManager.AppSettings["TravelMisWebService"]) + "/WebService/TravelOnline.asmx";
                    //PlanPrices GetPlan = new PlanPrices();
                    //string date = string.Format("{0:yyyy-MM}", DateTime.Now);

                    //planid = ConfigurationManager.AppSettings[date + "_" + LineId + "_planid"];
                    //begindate = ConfigurationManager.AppSettings[date + "_" + LineId + "_begindate"];
                    //try
                    //{
                    //    GetPlan = rsp.GetPlanPrices(UpPassWord, LineId, planid, "0");
                    //}
                    //catch
                    //{

                    //}

                    PlanPrices GetPlan = new PlanPrices();
                    string date = string.Format("{0:yyyy-MM}", DateTime.Now);
                    planid = ConfigurationManager.AppSettings[date + "_" + LineId + "_planid"];
                    try
                    {
                        GetPlan = ErpUtil.getPriceInfo(planid);
                    }
                    catch
                    {
                        Strings.Append("<div class=\"sub_view info\" id=\"first_view\">");
                        Strings.Append("订单不存在，不能继续预订！");
                        Strings.Append("</div>");
                        Response.Write(Strings.ToString());
                    }
                    
                    try
                    {
                        string DefaultOption = string.Format("value=0 max=999 min=0");
                        string DefaultChildOption = string.Format("value=0 max=999 min=0");
                        string AdultOption = string.Format("value=1 max=999 min=0");
                        string ChildOption = string.Format("value=0 max=999 min=0");
                        //price_01 基本费用， price_02 必选费用， price_03 可选费用
                        if (GetPlan.PlanStaPrice != null)
                        {
                            Strings.Append("<div class=\"recommend_detail\">");
                            Strings.Append("<div class=\"recommend_txt price_01\">");
                            Strings.Append("<h3>基本费用</h3>");
                            Strings.Append("");

                            for (int j = 0; j < GetPlan.PlanStaPrice.Length; j++)
                            {
                                lstPriceType.Add(GetPlan.PlanStaPrice[j].PriceType);
                            }

                            for (int i = 0; i < GetPlan.PlanStaPrice.Length; i++)
                            {
                                //Strings.Append("<div class=\"row sellprice\">");//row 开始
                                Strings.Append(string.Format("<div class=\"row sellprice\" id=\"S{0}\">", GetPlan.PlanStaPrice[i].PriceId));

                                Strings.Append("<div class=\"col-xs-7\">");
                                Strings.Append(string.Format("<div><span class=\"pricename\">{0}</span><span class=\"sprice\"><i class=\"fa fa-cny\"></i> {1}</span></div>", GetPlan.PlanStaPrice[i].PriceType, MyConvert.ConToDec(GetPlan.PlanStaPrice[i].Price)));
                                Strings.Append(string.Format("<div class=\"pricememo\">{0}</div>", GetPlan.PlanStaPrice[i].PriceName));
                                Strings.Append("</div>");

                                Strings.Append("<div class=\"col-xs-5\">");
                                Strings.Append("<div style=\"width:100px\">");
                                Strings.Append(string.Format("<input tps=SellPrice tagid=\"{0}\" price=\"{1}\" type=\"text\" style=\"display: block;\" class=\"form-control touch\" ", GetPlan.PlanStaPrice[i].PriceId, MyConvert.ConToDec(GetPlan.PlanStaPrice[i].Price)));
                                if (!lstPriceType.Contains("儿童价"))
                                {
                                    if (!lstPriceType.Contains("儿童价") && i > 0)
                                    {
                                        Strings.Append(DefaultOption);
                                    }
                                    else
                                    {
                                        AdultOption = string.Format("value=1 max=999 min=0");
                                        Strings.Append(AdultOption);
                                        AdultOption = DefaultOption;
                                    }
                                }
                                else
                                {
                                    switch (GetPlan.PlanStaPrice[i].PriceType)
                                    {
                                        case "成人价":
                                            Strings.Append(AdultOption);
                                            AdultOption = DefaultOption;
                                            break;
                                        case "儿童价":
                                            Strings.Append(ChildOption);
                                            ChildOption = DefaultChildOption;
                                            break;
                                        default:
                                            Strings.Append(DefaultOption);
                                            break;
                                    }
                                }
                                Strings.Append(" /></div>");
                                Strings.Append("</div>");

                                Strings.Append("</div>");//row 结束
                            }
                            Strings.Append("</div></div>");
                            lstPriceType.Clear();
                        }

                        if (GetPlan.PlanExtPrice != null)
                        {
                            string ExtType = "";
                            int NeedPrice = 0, NoNeedPrice = 0;
                            for (int i = 0; i < GetPlan.PlanExtPrice.Length; i++)
                            {
                                if (GetPlan.PlanExtPrice[i].OnlineNeeds == "0")
                                {
                                    NoNeedPrice++;
                                }
                                else
                                {
                                    NeedPrice++;
                                }
                            }

                            if (NoNeedPrice > 0)
                            {
                                Strings.Append("<div class=\"recommend_detail\">");
                                Strings.Append("<div class=\"recommend_txt price_03\">");
                                Strings.Append("<h3>可选费用</h3>");
                                Strings.Append("");
                                for (int i = 0; i < GetPlan.PlanExtPrice.Length; i++)
                                {
                                    ExtType = GetPlan.PlanExtPrice[i].PriceType;
                                    if (GetPlan.PlanExtPrice[i].OnlineNeeds == "0")
                                    {
                                        //Strings.Append("<div class=\"row sellprice\">");//row 开始
                                        Strings.Append(string.Format("<div class=\"row sellprice\" id=\"P{0}\">", GetPlan.PlanExtPrice[i].PriceId));

                                        Strings.Append("<div class=\"col-xs-7\">");
                                        Strings.Append(string.Format("<div><span class=\"pricename\">{0}</span><span class=\"sprice\"><i class=\"fa fa-cny\"></i> {1}</span></div>", ExtType, GetPlan.PlanExtPrice[i].Price));
                                        Strings.Append(string.Format("<div class=\"pricememo\">{0} {1}</div>", GetPlan.PlanExtPrice[i].PriceType, GetPlan.PlanExtPrice[i].PriceName));
                                        Strings.Append("</div>");

                                        Strings.Append("<div class=\"col-xs-5\">");
                                        Strings.Append("<div style=\"width:100px\">");
                                        Strings.Append(string.Format("<input tps=ExtPrice tagid=\"{0}\" price=\"{1}\" type=\"text\" class=\"form-control\" readonly value=1 max=999 min=0 /></div>", GetPlan.PlanExtPrice[i].PriceId, GetPlan.PlanExtPrice[i].Price));
                                        Strings.Append("");
                                        Strings.Append("</div>");

                                        Strings.Append("</div>"); //row 结束
                                    }

                                }
                                Strings.Append("</div></div>");
                            }
                        }
                    }
                    catch(Exception err)
                    {
                        SaveLogUtils.SaveInfoToLog("order_ticket: " + err.Message, "test.txt");
                    }
                    
                }
                PriceInfo = Strings.ToString();
            }
        }
    }
}