$.extend(validateFunction,{
	FORM_validate:function(){
		$("#pwd").jdValidate(validatePrompt.pwd,validateFunction.pwd,true);
		$("#pwd2").jdValidate(validatePrompt.pwd2,validateFunction.pwd2,true);
		$("#mail").jdValidate(validatePrompt.mail,validateFunction.mail,true);
		$("#authcode").jdValidate(validatePrompt.authcode,validateFunction.authcode,true);
		return validateFunction.FORM_submit(["#pwd","#pwd2","#mail","#authcode"])
	}		 
});

//调用
setTimeout(function(){$("#mail").get(0).focus();},0); 
$("#pwd").bind("keyup",function(){
	validateFunction.pwdstrength();
}).jdValidate(validatePrompt.pwd,validateFunction.pwd)
$("#pwd2").jdValidate(validatePrompt.pwd2,validateFunction.pwd2);
$("#mail").jdValidate(validatePrompt.mail,validateFunction.mail);
$("#authcode").jdValidate(validatePrompt.authcode,validateFunction.authcode);
$("#viewpwd").bind("click",function(){
	if ($(this).is(":checked")==true){
		validateFunction.showPassword("text");
		//alert($(this).attr("checked"));
		$("#o-password").addClass("pwdbg");
	}else{
		validateFunction.showPassword("password");
		$("#o-password").removeClass("pwdbg");
		//alert($(this).attr("checked"));
	}
});

$("#registsubmit").click(function() {
var flag = validateFunction.FORM_validate();
    if (flag) {
        $(this).attr({ "disabled": "disabled" }).attr({ "value": "提交中,请稍等" });
        var uuid = $("#JD_Verification1").attr("src").split("&uid=")[1].split("&")[0];
        $.ajax({
            type: "POST",
            url: "RegistService.aspx?&uuid=" + uuid,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: $("#formpersonal").serialize(),
        	error: function() {
	            $("#registsubmit").attr({ "value": "注册失败，请重试" });
	            $("#registsubmit").removeAttr("disabled");
            },
            success: function(result) {
            	if (result) {
                	//alert(result);
                    var obj = eval(result);
                    if (obj.info) {
                        $("#registsubmit").removeAttr("disabled");
                        $("#registsubmit").attr({ "value": "同意以下协议，提交" });
                        alert(obj.info);
                        if (obj.info == "验证码错误") {
                        	$("#authcode").val("")
                        	setTimeout(function(){$("#authcode").get(0).focus();},0); 
                            verc();
                        }
                        if (obj.info == "邮件地址已被注册") {
                        	setTimeout(function(){$("#mail").get(0).focus();},0); 
                            verc();
                        }
                        if (obj.info == "注册失败") {
                        	$("#registsubmit").attr({ "value": "注册失败，请重试" });
                			$("#registsubmit").removeAttr("disabled");
                        }
                    }
                    if (obj.success) {
                    	var nowtourl = location.search == "" ? "?uuid=" + uuid : location.search; // + "&regsuc=per";
                        //alert("registsuccessverify.aspx" + nowtourl);
						window.location = "RegistSuccess.aspx" + nowtourl;
                    }
                }
            }
        });
    }
});

function verc(){
	$("#JD_Verification1").click();
}

$("#authcode").bind('keyup',function(event) {  
    if(event.keyCode==13){  
        $("#registsubmit").click();
    }
});
$("#registsubmitframe").click(function() {
    var flag = validateFunction.FORM_validate();
    if (flag) {
        $(this).attr({ "disabled": "disabled" }).attr({ "value": "提交中..." });
        var uuid = $("#JD_Verification1").attr("src").split("&uid=")[1].split("&")[0];
        $.ajax({
            type: "POST",
             url: "RegistService.aspx?&uuid=" + uuid,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: $("#formpersonal").serialize(),
            error: function() {
                $("#registsubmit").attr({ "value": "注册失败，请重试" });
                $("#registsubmit").removeAttr("disabled");
            },
            success: function(result) {
            	if (result) {
                	//alert(result);
                    var obj = eval(result);
                    if (obj.info) {
                        $("#registsubmit").removeAttr("disabled");
                        $("#registsubmit").attr({ "value": "同意以下协议，提交" });
                        alert(obj.info);
                        if (obj.info == "验证码错误") {
                        	$("#authcode").val("")
                        	setTimeout(function(){$("#authcode").get(0).focus();},0); 
                            verc();
                        }
                        if (obj.info == "邮件地址已被注册") {
                        	setTimeout(function(){$("#mail").get(0).focus();},0); 
                            verc();
                        }
                        if (obj.info == "注册失败") {
                        	$("#registsubmit").attr({ "value": "注册失败，请重试" });
                			$("#registsubmit").removeAttr("disabled");
                        }
                    }
                    if (obj.success) {
                    	var nowtourl = location.search == "" ? "?uuid=" + uuid : location.search; // + "&regsuc=per";
                        //alert("registsuccessverify.aspx" + nowtourl);
						window.location = "RegistSuccess.aspx" + nowtourl;
                    }
                }
            }
        });
    }
});
