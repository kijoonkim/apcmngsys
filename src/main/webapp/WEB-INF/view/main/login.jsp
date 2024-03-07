<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>로그인</title>
	<%@ include file="../frame/inc/headerMeta.jsp" %>
	<%@ include file="../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">

<%
	String needsCustomLogin = request.getParameter("needsCustomLogin");
	if (!"IneedCustomLogin".equals(needsCustomLogin)) {
		String protocol = request.isSecure() ? "https" : "http";
		String loginUrl = (String)request.getAttribute("loginUrl");

		if (loginUrl != null && !"".equals(loginUrl)) {
			response.sendRedirect(protocol + "://" + loginUrl);
		}
	}
%>

    <div class="apc-wrap">
        <div class="apc-login-wrap">
            <div class="apc-login-box">
                <h3>
                    <sbux-label id="idxLabel_norm" name="label_norm" uitype="normal" text="Login"></sbux-label>
                </h3>
                <form id="frm" name="frm" method="post" action="/actionLogin.do">
                    <div class="apc-id-wrap">

                        <sbux-input id="id" name="id" uitype="text"
                            required
                            style="width:100%"
                            placeholder="아이디"
                        ></sbux-input>
                    </div>
                    <div class="apc-pw-wrap">
                        <sbux-input id="password" name="password" uitype="password"
                            required
                            style="width:100%"
                            placeholder="비밀번호"
                        ></sbux-input>
                    </div>
                    <div class="apc-chk-wrap">
                        <sbux-checkbox id="chkSaveIdYn" name="chkSaveIdYn" uitype="normal"
                            text="아이디저장"
                            true-value="Y"
                            false-value="N"
                        ></sbux-checkbox>
                    </div>
                    <div class="apc-login-wrap">
                        <sbux-button id="btnSubmit" name="btnSubmit" uitype="normal"
                            text="로그인"
                            onclick="fn_beforeSubmit"
                        ></sbux-button>
                        <!-- submit -->
                    </div>
                </form>
            </div>
        </div>

    </div>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    //로그인 버튼 클릭
    const fn_beforeSubmit = async function() {
        var userId = SBUxMethod.get("id");
        var password = SBUxMethod.get("password");
        if (!userId) {
            alert("아이디를 입력하세요.");
            return;
        }
        if (!password) {
            alert("비밀번호를 입력하세요.");
            return;
        }

        //사용자아이디 쿠키 설정
        fn_setCookie();

        fn_checkLogin();


        return false;
    }

    /**
     * @name fn_checkLogin
     * @description set post header programId
     * @function
     */
    const fn_checkLogin = async function() {

        const id = SBUxMethod.get("id");
        const password = SBUxMethod.get("password");

        const header = {
                //"Content-Type": "application/x-www-form-urlencoded",
                "sysPrgrmId": "login"
            }

        //let loginformData = new FormData(document.getElementById("frm"));
        let loginformData = new FormData();
        loginformData.append("id", id);
        loginformData.append("password", password);

        const response = await fetch(
                "/co/sys/loginCheck", {
                    method: "POST",
                    headers: header,
                    cache: "no-cache",
                    body: new URLSearchParams({ // 일반 객체를 fordata형식으로 변환해주는 클래스
                    	id: id,
                    	password: password
                    })
                }
            );

   		const data = await response.json();

        /*
    	const postJsonPromise = gfn_postJSON("/co/sys/loginCheck", {
    			userId: id,
    			password: password
    		});
        const data = await postJsonPromise;
		*/
        if (!_.isEqual("S", data.resultStatus)) {
        	gfn_comAlert(data.resultCode, data.resultMessage);
        	return;
    	} else {

    		const loginCode = data.loginCode;
    		const loginMessage = data.loginMessage;

    		if (!gfn_isEmpty(loginMessage)) {
    			alert(loginMessage);
    			return;
    		}

    		switch(loginCode) {
    		case "USER_UNRECEIVED":	// 승인대기 id
    			alert("APC생산관리 승인대기상태입니다.");
    			break;
    		case "USER_LOCKED":		// 잠김계정
    			alert("계정이 잠김처리되었습니다.관리자에게 문의하세요.");
    			break;
    		case "USER_DORMANCY":	// 휴면계정
    			alert("휴면상태의 계정입니다.");
    			break;
    		case "USER_UNUSED":		// 미사용등록 계정
    			alert("미사용등록된 계정입니다.");
    			break;
    		case "LOGIN_FAILED":	// 로그인실패
    			alert("로그인 정보가 올바르지 않습니다.");
    			break;
    		case "USER_IPLMT":	// 허용되지 않는 아이피
    			alert("해당 계정은 관리자 계정이므로 허용된 장소에서만 이용이 가능합니다.");
    			break;
    		case "USER_DUPLICATE":	// 중복계정

   				let isConfirmed = confirm("동일ID의 기존 접속정보가 존재합니다. 접속종료 시키겠습니까?");
       			if (isConfirmed) {
       				// id 접속 강제종료
       				fn_forceLogin();
       			}

    			break;

    		case "LOGIN_SUCCESS":	// 로그인성공
    			window.location.href = "/actionMain.do";
    			break;
    		}
    	}
    }

    // 기존 접속 종료처리
    const fn_forceLogin = async function() {
    	const id = SBUxMethod.get("id");
        const password = SBUxMethod.get("password");

        const header = {
                //"Content-Type": "application/x-www-form-urlencoded",
                "sysPrgrmId": "login"
            }

        //let loginformData = new FormData(document.getElementById("frm"));
        let loginformData = new FormData();
        loginformData.append("id", id);
        loginformData.append("password", password);

        const response = await fetch(
                "/co/sys/forceLogin", {
                    method: "POST",
                    headers: header,
                    cache: "no-cache",
                    body: new URLSearchParams({ // 일반 객체를 fordata형식으로 변환해주는 클래스
                    	id: id,
                    	password: password
                    })
                }
            );

   		const data = await response.json();

        /*
    	const postJsonPromise = gfn_postJSON("/co/sys/loginCheck", {
    			userId: id,
    			password: password
    		});
        const data = await postJsonPromise;
		*/
        if (!_.isEqual("S", data.resultStatus)) {
        	gfn_comAlert(data.resultCode, data.resultMessage);
        	return;
    	} else {

    		const loginCode = data.loginCode;
    		const loginMessage = data.loginMessage;

    		if (!gfn_isEmpty(loginMessage)) {
    			alert(loginMessage);
    			return;
    		}

    		switch(loginCode) {
    		case "USER_UNRECEIVED":	// 승인대기 id
    			alert("APC생산관리 승인대기상태입니다.");
    			break;
    		case "USER_LOCKED":		// 잠김계정
    			alert("계정이 잠김처리되었습니다.관리자에게 문의하세요.");
    			break;
    		case "USER_DORMANCY":	// 휴면계정
    			alert("휴면상태의 계정입니다.");
    			break;
    		case "USER_UNUSED":		// 미사용등록 계정
    			alert("미사용등록된 계정입니다.");
    			break;
    		case "LOGIN_FAILED":	// 로그인실패
    			alert("로그인 정보가 올바르지 않습니다.");
    			break;
    		case "USER_IPLMT":	// 허용되지 않는 아이피
    			alert("해당 계정은 관리자 계정이므로 허용된 장소에서만 이용이 가능합니다.");
    			break;
    		case "USER_DUPLICATE":	// 중복계정
    			alert("동일ID의 기존 접속정보가 존재합니다.");
    			break;

    		case "LOGIN_SUCCESS":	// 로그인성공
    			window.location.href = "/actionMain.do";
    			break;
    		}
    	}
    }



    //사용자아이디 쿠키 설정
    const fn_setCookie = function() {
    	// 사용자아이디
    	let userId = SBUxMethod.get("id");
    	let saveIdYn = SBUxMethod.get("chkSaveIdYn").chkSaveIdYn;

        if (saveIdYn === "Y") {
            //cookie 에 사용자아이디, 아이디체크 여부(Y) 저장
            // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
            //let expireDate = new Date();
            //expireDate.setTime(expireDate.getTime() + 1000 * 3600 * 24 * 30);	// 30일
            gfn_setCookie("savedUserId", userId, {"max-age": 3600 * 24 * 30});	// 30일
	    }
        else {
            //cookie 에 사용자아이디, 아이디체크 여부 만료(expires: -1) 처리
        	gfn_setCookie("savedUserId", userId, {"max-age": -1});
	    }
    }

    function fn_setUserId() {
    	let savedUserId = gfn_getCookie("savedUserId");
    	if (savedUserId) {
    		SBUxMethod.set("id", savedUserId);
    		SBUxMethod.set("chkSaveIdYn", "Y");
    	}
    }



    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
        // setting saved userId
        fn_setUserId();

    	<c:if test="${loginMessage != null}">
			alert('${loginMessage}');
		</c:if>

	    const frm = document.getElementById("frm");
	    frm.addEventListener("keyup", function (event) {
	      	if (event.keyCode === 13) {
	        	event.preventDefault();
	        	fn_beforeSubmit();
			}
	    });
    });

</script>
<!-- //inline scripts related to this page -->

</body>
</html>