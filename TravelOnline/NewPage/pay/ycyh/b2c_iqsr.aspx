<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>单笔查询</title>
</head>
<body>
   <%
        String oTranAbbr = Request.Params.Get("OTranAbbr");
		String mercCode = Request.Params.Get("MercCode");	
		String termSsn = Request.Params.Get("TermSsn");
    
		string transName = "IQSR";
	    string Plain = "OTranAbbr=" + oTranAbbr + "|" + "MercCode=" + mercCode + "|" + "TermSsn=" + termSsn;
		string Signature = PSBCMerchant.SignatureService.sign(Plain);
		
		string postDataStr ="transName=" + transName + "&" + "Plain=" + Plain + "&" + "Signature=" +Signature;
				
	    //发送请求的数据
		System.Net.WebRequest myHttpWebRequest = System.Net.WebRequest.Create("http://103.22.255.201:8443/psbcpay/main");
		myHttpWebRequest.Method = "POST";
		UTF8Encoding encoding = new UTF8Encoding();
		byte[] byte1 = encoding.GetBytes(postDataStr);
		myHttpWebRequest.ContentType = "application/x-www-form-urlencoded";
		myHttpWebRequest.ContentLength = byte1.Length;
		System.IO.Stream newStream = myHttpWebRequest.GetRequestStream();
		newStream.Write(byte1, 0, byte1.Length);
		newStream.Close();

		//发送成功后接收返回的XML信息
		System.Net.HttpWebResponse response = (System.Net.HttpWebResponse)myHttpWebRequest.GetResponse();
		string lcHtml = string.Empty;
		Encoding enc = Encoding.GetEncoding("UTF-8");
		System.IO.Stream stream = response.GetResponseStream();
		System.IO.StreamReader streamReader = new System.IO.StreamReader(stream, enc);
		lcHtml = streamReader.ReadToEnd();
		Response.Write("返回报文：[" + lcHtml +"]");
		streamReader.Close();
		stream.Close();
		
      %>
		
    
</body>
</html>
