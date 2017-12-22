using Belinda.Jasp;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using TravelOnline.EncryptCode;
using TravelOnline.GetCombineKeys;
using TravelOnline.LoginUsers;

namespace TravelOnline.WeChat.Util
{
    public class Tuanshiwei
    {
        public static void test()
        {
            JSONObject ObJson = new JSONObject();
            ObJson.Add("LineId", "25061");
            ObJson.Add("mobile", "18301979257");
            ObJson.Add("activityId", "01278231185e44bcbe20a4ea4c6513f7");
            string result1= Uri.EscapeDataString(AESEncryptUtil.EncodeAES(json.SerializeObject(ObJson)).ToString());
            ObJson.Clear();
            ObJson.Add("Mobile", "18301979257");
            string result2 = Uri.EscapeDataString(AESEncryptUtil.EncodeAES(json.SerializeObject(ObJson)).ToString());
        }
        public static object getEncryptDes(string source)
        {
            JSONObject ObJson = new JSONObject();
            string encryStr = AESEncryptUtil.EncodeAES(source);
            ObJson.Add("success", "ok");
            ObJson.Add("encryStr", encryStr);
            return json.SerializeObject(ObJson);
        }

        public static JObject getDecodeAES(string source)
        {
            JObject result = (JObject)JsonConvert.DeserializeObject(AESEncryptUtil.DecodeAES(source));
            return result;
        }

        public static bool RegUser(string regphone, string regname)
        {
            if (!CheckPhone (regphone))
            {
                String AutoId = Convert.ToString(CombineKeys.NewComb());
                LoginUser.RegistUser RUser = new LoginUser.RegistUser { Id = AutoId, UserName = regname, Mobile = regphone, LoginPassWord = SecurityCode.Md5_Encrypt("111111", 32) };

                if (LoginUser.LoginUser_Sql(RUser, "WeChatRegist") != true)
                {
                    return false;
                }
            }
            return CheckPhone(regphone);
        }

        public static bool CheckPhone(string regphone)
        {
            bool result = false;
            LoginUser.RegistUser RUser = new LoginUser.RegistUser();
            string SqlQueryText;
            SqlQueryText = string.Format("(UserEmail='{0}' or Mobile='{0}')", MyDataBaseComm.StripSQLInjection(regphone));

            RUser = LoginUser.LoginUseDetail(SqlQueryText);
            if (RUser != null)
            {
                HttpContext.Current.Session["Online_UserId"] = RUser.Id;
                HttpContext.Current.Session["Online_UserName"] = RUser.UserName;
                HttpContext.Current.Session["Online_UserDept"] = RUser.Deptid;
                HttpContext.Current.Session["Online_UserCompany"] = RUser.Companyid;
                HttpContext.Current.Session["Online_RebateFlag"] = RUser.RebateFlag;
                HttpContext.Current.Session["Online_YJDept"] = RUser.YJDeptName;
                HttpContext.Current.Session["Online_WeChatEmail"] = RUser.UserEmail;
                HttpContext.Current.Session["Online_WeChatPhone"] = RUser.Mobile;
                SqlQueryText = string.Format("UPDATE OL_LoginUser set LoginCount=LoginCount+1,LastLoginTime='{1}' where id='{0}'", RUser.Id, DateTime.Now.ToString());
                MyDataBaseComm.ExcuteSql(SqlQueryText);
                result = true;
            }
            return result;
        }

        public static bool MobileValidate(string phoneNumber)
        {
            bool result = false;
            JSONObject ObJson = new JSONObject();
            ObJson.Add("phoneNumber", phoneNumber);
            string encryStr = AESEncryptUtil.EncodeAES(json.SerializeObject(ObJson));

            string postData = "dataJson=" + encryStr;
            byte[] byteArray = Encoding.UTF8.GetBytes(postData);
            string Url = Convert.ToString(ConfigurationManager.AppSettings["TswUrlCheckPhone"]) + "user/scytsMobileValidate";
            HttpWebRequest objWebRequest = (HttpWebRequest)WebRequest.Create(Url);
            objWebRequest.Method = "POST";
            objWebRequest.ContentType = "application/x-www-form-urlencoded";
            objWebRequest.ContentLength = byteArray.Length;
            Stream newStream = objWebRequest.GetRequestStream();
            // Send the data. 
            newStream.Write(byteArray, 0, byteArray.Length); //写入参数 
            newStream.Close();
            HttpWebResponse response = (HttpWebResponse)objWebRequest.GetResponse();
            StreamReader sr = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
            string textResponse = sr.ReadToEnd(); // 返回的数据
            string text = textResponse.TrimStart(new char[] { '\"' }).TrimEnd(new char[] { '\"' }).Replace("\\", "");

            JObject s = (JObject)JsonConvert.DeserializeObject(text);
            if (s["status"].ToString().Equals("1"))
            {
                result = true;
            }
            return result;
        }
        public static bool insertPurchaseRecord(string phoneNumber, string LineId, string payStatus, string purchaseQuantity)
        {
            bool result = false;
            JSONObject ObJson = new JSONObject();
            ObJson.Add("phoneNumber", phoneNumber);
            string activityId =  Convert.ToString(HttpContext.Current.Session["Activity_" + LineId]);
            if (string.Empty == activityId)
            {
                activityId = ConfigurationManager.AppSettings["Tswactivityid"].ToString();
            }
            ObJson.Add("activityId", activityId);
            ObJson.Add("payStatus", payStatus);
            ObJson.Add("purchaseQuantity", purchaseQuantity);
            string encryStr = AESEncryptUtil.EncodeAES(json.SerializeObject(ObJson));
            string postData = "dataJson="+ encryStr;
            byte[] byteArray = Encoding.UTF8.GetBytes(postData);
            string Url = Convert.ToString(ConfigurationManager.AppSettings["TswUrl"]) + "activity/insertPurchaseRecord";
            HttpWebRequest objWebRequest = (HttpWebRequest)WebRequest.Create(Url);
            objWebRequest.Method = "POST";
            objWebRequest.ContentType = "application/x-www-form-urlencoded";
            objWebRequest.ContentLength = byteArray.Length;
            Stream newStream = objWebRequest.GetRequestStream();
            // Send the data. 
            newStream.Write(byteArray, 0, byteArray.Length); //写入参数 
            newStream.Close();
            HttpWebResponse response = (HttpWebResponse)objWebRequest.GetResponse();
            StreamReader sr = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
            string textResponse = sr.ReadToEnd(); // 返回的数据
            JObject s = (JObject)JsonConvert.DeserializeObject(textResponse);
            if (s["status"].ToString().Equals("1"))
            {
                result = true;
            }
            return result;
        }


        public static void SaveTswErrorToLog(string inErrorlog, string inSQL)
        {
            string path = AppDomain.CurrentDomain.BaseDirectory + @"\TswErrorLog.txt";

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

        public static void SaveTswResendToLog(string inErrorlog, string inSQL)
        {
            string path = AppDomain.CurrentDomain.BaseDirectory + @"\TswResendLog.txt";

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