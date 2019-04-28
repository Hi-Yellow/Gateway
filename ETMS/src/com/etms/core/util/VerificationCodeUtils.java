package com.etms.core.util;

import java.util.HashMap;
import java.util.Map;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import net.sf.json.JSONObject;

public class VerificationCodeUtils {
	
	/**
	 * 给手机发送验证码，并返回验证码+状态码，发生异常返回null
	 * @param userName
	 * @return
	 */
	public static String sendCode(String userName) {
		String host = "http://dingxin.market.alicloudapi.com";
	    String path = "/dx/sendSms";
	    String method = "POST";
	    String appcode = "d631281e5fe9473698d0de8e46a8b987";
	    Map<String, String> headers = new HashMap<String, String>();
	    //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
	    headers.put("Authorization", "APPCODE " + appcode);
	    Map<String, String> querys = new HashMap<String, String>();
	    querys.put("mobile", userName);	    
	    String code = String.valueOf(Math.round(Math.random() * 8999 +1000));
	    querys.put("param", "code:"+code);
	    querys.put("tpl_id", "TP18072410");
	    Map<String, String> bodys = new HashMap<String, String>();


	    try {
	    	/**
	    	* 重要提示如下:
	    	* HttpUtils请从
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
	    	* 下载
	    	*
	    	* 相应的依赖请参照
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
	    	*/
	    	HttpResponse response = HttpUtils.doPost(host, path, method, headers, querys, bodys);
	    	System.out.println(response.toString());	    	
	    	//获取response的body
	    	String body = EntityUtils.toString(response.getEntity());
	    	System.out.println(body);
	    	JSONObject jsonObject = JSONObject.fromObject(body);
	    	System.out.println(jsonObject.getString("return_code"));
	    	return code+jsonObject.getString("return_code");
	    } catch (Exception e) {
	    	e.printStackTrace();
	    	return null;
	    }
	    
	}
}
