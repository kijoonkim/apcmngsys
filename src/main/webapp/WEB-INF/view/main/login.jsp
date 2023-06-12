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
	
    <title>로그인</title>
    
    <style>
        /*해당 레이아웃 템플릿 페이지를 표현하기위한 임의의 스타일 CSS 입니다. 
        실작업시, 해당 프로젝트의 CSS 네이밍에 맞추어 재작업이 필요합니다.*/  
        .sbt-A-wrap {min-width:1024px; margin:0 auto; border:1px solid #333;}
        .sbt-A-wrap .main {display:table;  width:100%; height:764px;}
        .sbt-A-wrap .left {display:table-cell; vertical-align: top; width:200px; }
        .sbt-A-wrap .left .sbt-all-left {height: 100%;}
        .sbt-A-wrap .content {display:table-cell;}
        .sbux-sidemeu {position: relative; z-index: 1;}
        .footer {
            display: flex; align-items: center; justify-content: center; font-size: 16px;
            background:rgb(42, 48, 65); height:150px; padding:10px; box-sizing: border-box;  color:#dddddd;
        }
    </style>
</head>
<body>
    <div>
        <h3>
            <sbux-label id="idxLabel_norm" name="label_norm" uitype="normal" text="Login" style="font-size:20px;"></sbux-label></span>
        </h3>
        <form id="frm" name="frm" method="post" action="./main.html">
            <div>
                <sbux-input id="userId" name="userId" uitype="text"
                    required
                    style="width:200px"
                    placeholder="아이디"
                ></sbux-input>
            </div>
            <div>
                <sbux-input id="password" name="password" uitype="password"
                    required
                    style="width:200px"
                    placeholder="비밀번호"
                ></sbux-input>
            </div>
            <div>
                <sbux-checkbox id="saveUserIdYn" name="saveUserIdYn" uitype="normal"
                    text="아이디저장"
                    true-value="Y"
                    false-value="N"
                ></sbux-checkbox>
            </div>
            <div>
                <sbux-button id="btn_submit" name="btn_submit" uitype="submit"
                    text="로그인"
                    onclick="fn_beforeSubmit"
                ></sbux-button>
            </div>
        </form>
    </div>
    
<!-- inline scripts related to this page -->
<script type="text/javascript">
    //로그인 버튼 클릭
    function fn_beforeSubmit() {
        var userId = SBUxMethod.get("userId");
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
        var saveUserIdYn = SBUxMethod.get("saveUserIdYn");
        if (saveUserIdYn === "Y") {
            //cookie 에 사용자아이디, 아이디체크 여부(Y) 저장
            //사용자아이디 : SBUxMethod.get("userId")
	    }
        else {
            //cookie 에 사용자아이디, 아이디체크 여부 만료(expires: -1) 처리
	    }
    }
</script>
<!-- //inline scripts related to this page -->

</body>
</html>