<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- layer popup content -->
<div class="layerPopup" id="layer_popup" style="visibility: visible; width: 30vw">
    <div class="layerBox">

        <h2 class="title" style="text-align: center">사용자 편의성 조사 안내(11.18~22)</h2>
        <div class="cont" style="margin-bottom: 20px">
            <p style="padding: 0px 15px 15px 15px; text-align: center">
                APC 정보지원시스템 개선을 위한 사용자 편의성 조사 안내
            </p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center; flex-direction: column">
            <img src="/static/images/surveyQR.png" />
            <figcaption><a href="https://form.naver.com/response/5hfovqdkSt5a-n7lNs3kvw" target="_blank">바로가기</a></figcaption>
        </div>
        <div>
            <p style="opacity: 0.8;font-size: small; margin-bottom: 10px;text-align: left; margin-top: 10px">
                여러분의 작은 의견도 큰 변화를 만듭니다.<br>
                소중한 의견을 주셔서 감사합니다. 여러분의 피드백은 더 나은 서비스를 만드는 데 큰 도움이 됩니다.
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