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

namespace TravelOnline.WeChat.Util
{
    public class VolunteerUtils
    {
        public static string MobileValidate(string phoneNumber)
        {
            string result = "{\"error\":0}";
            JSONObject ObJson = new JSONObject();
            ObJson.Add("userPhone", phoneNumber);
            byte[] byteArray = Encoding.UTF8.GetBytes(json.SerializeObject(ObJson).ToString());
            string Url = Convert.ToString(ConfigurationManager.AppSettings["ZyzUrl"]) + "userProve/userProvePhone";
            HttpWebRequest objWebRequest = (HttpWebRequest)WebRequest.Create(Url);
            objWebRequest.Method = "POST";
            objWebRequest.ContentType = "application/json";
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
            if (s["messageCode"].ToString().Equals("10000"))
            {
                int star = MyConvert.ConToInt(s["result"]["star"].ToString());
                result = "{\"success\":" + star + "}";
            }
            return result;
        }

        public static bool insertPurchaseRecord(string phoneNumber, string receiveTime, string purchaseQuantity, string receiveMoney)
        {
            bool result = false;
            JSONObject ObJson = new JSONObject();
            ObJson.Add("userPhone", phoneNumber);
            ObJson.Add("receiveTime", receiveTime);
            ObJson.Add("receiveNumber", purchaseQuantity);
            ObJson.Add("receiveMoney", receiveMoney);
            ObJson.Add("welfareUnit", "22");
            ObJson.Add("welfareType", "12001");
            
            string postData = json.SerializeObject(ObJson);
            byte[] byteArray = Encoding.UTF8.GetBytes(postData);
            string Url = Convert.ToString(ConfigurationManager.AppSettings["ZyzUrl"]) + "resultFeedback/getResult";
            HttpWebRequest objWebRequest = (HttpWebRequest)WebRequest.Create(Url);
            objWebRequest.Method = "POST";
            objWebRequest.ContentType = "application/json";
            objWebRequest.ContentLength = byteArray.Length;
            Stream newStream = objWebRequest.GetRequestStream();
            // Send the data. 
            newStream.Write(byteArray, 0, byteArray.Length); //写入参数 
            newStream.Close();
            HttpWebResponse response = (HttpWebResponse)objWebRequest.GetResponse();
            StreamReader sr = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
            string textResponse = sr.ReadToEnd(); // 返回的数据
            JObject s = (JObject)JsonConvert.DeserializeObject(textResponse);
            if (s["messageCode"].ToString().Equals("10000"))
            {
                result = true;
            }
            return result;
        }

        public static void SaveTswErrorToLog(string v, string msg)
        {
            string path = AppDomain.CurrentDomain.BaseDirectory + @"\ZyzResendLog.txt";

            try
            {
                StreamWriter writer = new StreamWriter(path, true, Encoding.GetEncoding("UTF-8"));
                writer.WriteLine(DateTime.Now.ToString() + ":");
                writer.WriteLine(v);
                writer.WriteLine(msg);
                writer.Close();
            }
            catch (Exception exception)
            {
                string message = exception.Message;
            }
        }
    }
}