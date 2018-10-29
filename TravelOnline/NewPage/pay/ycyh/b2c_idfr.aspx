<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>对账下载</title>
</head>
<body onload="form1.submit()">
   <%
        String mercCode = Request.Params.Get("MercCode");
		String oSttDate = Request.Params.Get("OSttDate");
		String setFType = Request.Params.Get("SetFType");
		
		string transName = "IDFR";
	    string Plain = "MercCode=" + mercCode + "|" + "OSttDate=" + oSttDate +"|"+ "SetFType=" + setFType;
		string Signature = PSBCMerchant.SignatureService.sign(Plain);
		
		string URL= "http://103.22.255.201:8443/psbcpay/main";
      %>
    
    <form name="form1" method="post" action ="<%Response.Write(URL);%>">
		<input type = "hidden" name = "transName" value = "<%Response.Write(transName);%>"/>
		<input type = "hidden" name = "Plain" value = "<%Response.Write(Plain);%>"/>
		<input type = "hidden" name = "Signature" value = "<%Response.Write(Signature);%>"/>
    </form>
		
    
</body>
</html>
