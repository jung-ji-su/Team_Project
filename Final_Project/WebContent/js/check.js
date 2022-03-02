/**
 * 
 */
let frm = document.frm;

let name = document.getElementById("name");
let id = document.getElementById("id");
let pw1 = document.getElementById("pw1");
let pw2 = document.getElementById("pw2");
let email = document.getElementById("email");
let phone2 = document.getElementById("phone2");
let phone3 = document.getElementById("phone3");

let msg_name = document.getElementById("msg_name");
let msg_id = document.getElementById("msg_id");
let msg_pw1 = document.getElementById("msg_pw1");
let msg_pw2 = document.getElementById("msg_pw2");
let msg_email = document.getElementById("msg_email");

let smskey;

let name_b = false;
let id_b = false;
let pw1_b = false;
let pw2_b = false;
let email_b = false;
let phone_b = false;


let r_pw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
let r_email = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
let r_name =  /^[가-힣]{2,10}$/;
let r_id = /^[A-za-z0-9]{4,12}$/;
let r_phone = /[0-9]{3,4}$/;
function checkName(){
	if(!r_name.test(name.value)){
		msg_name.innerHTML ="이름을 확인해주세요(한글,2-10자)";
		name_b = false;
	} else {
		msg_name.innerHTML ="";
		name_b = true;
	}
}

function checkId(){
	let xhr = new XMLHttpRequest();
	xhr.open("GET","controller/idcheckCtr.jsp?user_id="+id.value,true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.readyState ==XMLHttpRequest.DONE && xhr.status ==200){
			if(xhr.responseText.trim()=="ok"){
				msg_id.innerHTML = "사용가능한 아이디입니다.";
				msg_id.style.color = "green";
				id_b =true;
			} else{
				msg_id.innerHTML = "사용 할 수 없는 아이디입니다.";
				msg_id.style.color = "red";
				id_b =false;
			}
			
			if(!r_id.test(id.value)){
				msg_id.innerHTML ="(영문,숫자 4-12자 ,특수문자 사용불가)";
				msg_id.style.color = "red";
				id_b =false;
			} 
		}
	}
}

function checkPw(){
	if(!r_pw.test(pw1.value)){
		msg_pw1.innerHTML = "영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자)";
		pw1_b =false;
	} else {
		msg_pw1.innerHTML = "";
		pw1_b =true;
	}
}

function checkPwIsSame(){
	if(pw2.value!=pw1.value){
		msg_pw2.innerHTML = "비밀번호 불일치";
		msg_pw2.style.color = "red";
		pw2_b = false;
	} else {
		msg_pw2.innerHTML = "비밀번호가 일치합니다.";
		msg_pw2.style.color = "green";
		pw2_b = true;
	}
	
}

function checkEmail(){
	
	let xhr = new XMLHttpRequest();
	xhr.open("GET","controller/emailcheckCtr.jsp?user_email="+email.value,true);
	xhr.send();
	xhr.onreadystatechange = function(){
		
			if(xhr.readyState ==XMLHttpRequest.DONE && xhr.status ==200){
				if(xhr.responseText.trim()=="ok"){
					msg_email.innerHTML = "사용가능한 이메일입니다.";
					msg_email.style.color = "green";
					email_b =true;
				} else{
					msg_email.innerHTML = "중복된  이메일입니다.";
					msg_email.style.color = "red";
					emailb =false;
				}
				
				if(!r_email.test(email.value)){
					msg_email.innerHTML = "이메일형식을 확인해주세요";
					msg_email.style.color = "red";
					email_b = false;
				}
			}
		}
	
}


function checkPhone(){
	let user_phonenum = frm.user_phonenum1.value+phone2.value+phone3.value;
	
	if(!r_phone.test(phone2.value)||!r_phone.test(phone3.value)){
		alert('휴대폰번호 형식을 확인해주세요');
		phone_b = false;
	} else{
		phone_b = true;
		let xhr = new XMLHttpRequest();
		xhr.open("GET","controller/sendSMSCtr.jsp?user_phonenum="+user_phonenum,true);
		xhr.send();
		alert('문자가 발송되었습니다. 인증번호를 입력해주세요');
		xhr.onreadystatechange = function(){
			smskey = xhr.responseText.trim();
		}
	}
}

function sendit(){
	if(name_b&&id_b&&pw1_b&&pw2_b&&email_b&&phone_b){
		if(frm.smskey.value==smskey){
			alert('회원가입이 정상적으로 완료되었습니다.');
			frm.submit();
		} else {
			alert("인증번호가 일치하지 않습니다.");
			return false;
		}
	} else{
		alert('입력한 정보를 확인해주세요');
	}
}

