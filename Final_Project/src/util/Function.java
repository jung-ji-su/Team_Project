package util;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import action.ActionForward;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import user.UserVO;

public class Function {
	
	final int e_Key = 33; 
	
	public String getLoginState(UserVO uvo) {
		if(uvo!=null) {
			return "로그아웃";
		}
		return "로그인";
	}
	
	//문자발송
	public String sendSMS(String user_phonenum) {
		String api_key = "NCSVFLBUNRTXRKHU";
	    String api_secret = "MFOQ1ETROUMBUXDUPKONBFE7CIETLFTY";
	    Message coolsms = new Message(api_key, api_secret);
	    String num = sendSMS_random();
	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", user_phonenum);
	    params.put("from", "01091818218");
	    params.put("type", "SMS");
	    params.put("text", "[SCULFUNK] 인증번호는 "+num+"입니다. 정확하게 입력해주세요");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    
	    return num;
	}
	
	// 랜덤 4자리 인증번호생성
	private String sendSMS_random() {
		Random random = new Random();
		String num = "";
		for (int i = 0; i < 4; i++) {
			num += random.nextInt(10);
		}
		
		return num;
	}
	
	//랜덤 임시비밀번호발송
	public void sendSMS_pw(String user_phonenum,String randomPw) {
		String api_key = "NCSVFLBUNRTXRKHU";
	    String api_secret = "MFOQ1ETROUMBUXDUPKONBFE7CIETLFTY";
	    Message coolsms = new Message(api_key, api_secret);
	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", user_phonenum);
	    params.put("from", "01091818218");
	    params.put("type", "SMS");
	    params.put("text", "[SCULFUNK] 임시 비밀번호는 "+randomPw+"입니다. 정확하게 입력해주세요");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	}
	
	//랜덤 비밀번호생성
	public String randomPW() {
		String pw="";
		Random random = new Random();
		for (int i = 0; i <4; i++) {
			pw += (char)(random.nextInt(26)+97);
		}
		for (int i = 0; i <4; i++) {
			pw += random.nextInt(10);
		}
		
		
		pw += "!";
		
		
		return pw;
	}
	
	//암호화
	public String encryption(String pw) {
		String e_pw="";
		
		for (int i = 0; i < pw.length(); i++) {
			e_pw += (char)(pw.charAt(i)+e_Key);
		}
		
		
		return e_pw;
	}
	
	//복호화
	public String decryption(String pw) {
		String d_pw ="";
		
		for (int i = 0; i < pw.length(); i++) {
			d_pw += (char)(pw.charAt(i)-e_Key);
		}
		
		return d_pw;
	}
	
	public static ActionForward alert(HttpServletRequest request,ActionForward forward,String url,String msg){
		request.setAttribute("url",request.getContextPath() + url );
		request.setAttribute("msg",msg);
		forward.setRedirect(false);
		forward.setPath(request.getContextPath() + "/controller/alertCtr.jsp");
		
		return forward;
	}
	
}
