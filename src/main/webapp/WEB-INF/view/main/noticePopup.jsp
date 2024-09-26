<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- layer popup content -->
<div class="layerPopup" id="layer_popup" style="visibility: visible; width: 30vw">
    <div class="layerBox">
        <div style="display: flex; justify-content: center; align-items: center">
            <svg width="50px" height="50px" viewBox="0 0 16 16" class="bi bi-exclamation-square-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <rect width="100%" height="100%" fill="#ffffff"/> <!-- 배경색을 하얀색으로 설정 -->
                <path fill="#6ecc52" fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
            </svg>
        </div>
        <h2 class="title" style="text-align: center">시스템 <p style="color: #6ecc52; display: inline">점검 </p>안내</h2>
        <div class="cont" style="margin-bottom: 20px">
            <p style="padding: 0px 15px 15px 15px; border-bottom: 1px solid #d9d9d9">
                APC정보지원 시스템의 서버 점검으로<br>
            아래 기간 동안 서비스가 일시중단됨을 안내드리오니<br>
            서비스 이용에 참고하시기 바랍니다.<br><b>
                &nbsp&nbsp* 중단대상 : APC정보지원시스템(smartapc.or.kr)<br>
                &nbsp&nbsp* 작업내용 : APC정보지원 시스템 서버점검<br>
                &nbsp&nbsp* 중단일시 : 2024년 9월 27일(금), 18:00 ~ 20:00</b>
            </p>
        </div>
        <div>
            <p style="opacity: 0.8;font-size: small; margin-bottom: 10px;text-align: center; margin-top: 10px">
                이용에 불편하시더라도 양해 부탁드리며<br>
                더 나은 서비스를 제공하기 위해 노력하겠습니다.
            </p>
        </div>
          <form name="pop_form">
        <div id="check" ><input type="checkbox" name="chkbox" value="checkbox" id='chkbox' >
        <label for="chkbox" style="font-size: small">&nbsp&nbsp오늘 하루동안 보지 않기</label></div>
		<div id="close" ><a href="javascript:closePop();">닫기</a></div>    
		</form>
	</div>
</div>
<script language="Javascript">
    cookiedata = document.cookie;   
    if ( cookiedata.indexOf("maindiv=done") < 0 ){     
        document.all['layer_popup'].style.visibility = "visible";
    }
    else {
        document.all['layer_popup'].style.visibility = "hidden";
    }
</script>