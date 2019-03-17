var isAlphabet = function(arg){
    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    return containsCharsOnly(arg,chars);
};
var isUpperCase = function(arg){
    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return containsCharsOnly(arg,chars);
};
var isLowerCase = function(arg){
    var chars = "abcdefghijklmnopqrstuvwxyz";
    return containsCharsOnly(arg,chars);
};
var isNumber = function(arg){
    var chars = "0123456789";
    return containsCharsOnly(arg,chars);
};
var isChrNumber = function(arg){
    var chars = "+-0123456789";
    return containsCharsOnly(arg,chars);
};
var isAlphaNum = function(arg){
    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    return containsCharsOnly(arg,chars);
};
var isNumDash = function(arg){
    var chars = "-0123456789";
    return containsCharsOnly(arg,chars);
};
var isNumComma = function(arg){
    var chars = ",0123456789";
    return containsCharsOnly(arg,chars);
};
var isNumPeriod = function(arg){
    var chars = ".0123456789";
    return containsCharsOnly(arg,chars);
};
var getNumberOnly = function(obj){
    var val = new String(obj);
    var regex = /[^0-9]/g;
    return val.replace(regex,'');
};
var removeComma = function(arg){
    return arg.replace(/,/gi,"");
};

var isValidFormat = function(arg,format){
    if(arg.search(format) != -1){
        return true;
    }
    return false;
};
var isValidEmail = function(arg){
    var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
    return isValidFormat(arg,format);
};
var validateEmail = function(email){
    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return re.test(email);
};
var isValidPhone = function(arg){
    var format = /^(\d+)-(\d+)-(\d+)$/;
    return isValidFormat(arg,format);
};
var hasCheckedRadio = function(input){
    var inx = 0;
    var inputLen = input.length;
    if(inputLen > 1){
        for(;inx < inputLen;inx++){
            if(input[inx].checked){
                return true;
            }
        }
    }else{
        if(input.checked){
            return true;
        }
    }
    return false;
};

var callAjax = function(methodType,asyncType,urlPath,dataReceiveType,sendContentType,sendData,errorFunc,successFunc){
    try{
        $.ajax({
            type : methodType,
            url : urlPath,
            async : asyncType,
            timeout : "5000", // 150000
            cache : false,
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType : dataReceiveType,
            data : (sendData != "") ? ((sendContentType == "json" || sendContentType == "application/json") ? JSON.parse(sendData) : sendData) : "",
            error : errorFunc,
            success : successFunc
        });
    }catch(e){
        alert("에러코드 : " + e.code + "\r\n 에러내용 : " + e.message);
    }
};