<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../frame/inc/headerMeta.jsp" %>
	<%@ include file="../frame/inc/headerScript.jsp" %>
</head>
<body>
    <div class="apc-wrap">
        <div class="apc-login-wrap">
            <div class="apc-login-box">
                <h3>
                    <sbux-label id="idxLabel_norm" name="label_norm" uitype="normal" text="Login"></sbux-label></span>
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
                        <sbux-button id="btnSubmit" name="btnSubmit" uitype="submit"
                            text="로그인"
                            onclick="fn_beforeSubmit"
                        ></sbux-button>
                    </div>
                </form>
            </div>
        </div>

    </div>
    
<!-- inline scripts related to this page -->
<script type="text/javascript">
    //로그인 버튼 클릭
    function fn_beforeSubmit() {
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
    }
    
    //사용자아이디 쿠키 설정
    function fn_setCookie() {
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
    });
    
</script>
<!-- //inline scripts related to this page -->

</body>
</html>