using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

namespace TravelOnline.Utility
{
    public class SaveLogUtils
    {
        public static void SaveInfoToLog(string infos, string fileName)
        {
            string path = AppDomain.CurrentDomain.BaseDirectory + @"\" + fileName;

            try
            {
                StreamWriter writer = new StreamWriter(path, true, Encoding.GetEncoding("UTF-8"));
                writer.WriteLine(DateTime.Now.ToString() + ":" + infos);
                writer.WriteLine();
                writer.Close();
            }
            catch (Exception exception)
            {
                string message = exception.Message;
            }
        }
    }
}