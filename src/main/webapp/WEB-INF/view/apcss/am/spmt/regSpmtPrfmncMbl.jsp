<%
    /**
     * @Class Name : regSpmtPrfmncMbl.jsp
     * @Description : 출하실적등록 모바일 화면
     * @author SI개발부
     * @since 2024.4.18
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.4.18   	손민성		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 출하실적등록 모바일</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <style>
        .btn-mbl {
            height: 50px;
            font-size: 24px;
        }
        .ma-bt {
            margin-bottom: 5px;
        }
        .ma-rt {
            margin-right: 10px;
        }
        .btn-text{
            font-size: 2vw;
            min-font-size: x-large;
            font-weight: bold;
        }
        .btn-style{
            background-color : white;
            border-radius: 5px;
            border: 2px solid cornflowerblue;
            height: auto;
            flex: 3 0 30%;
            padding: 5px 0px;
            cursor : initial;
        }
        .inp-style{
            border: 1px solid #bbc4d1;
            height: auto;
            font-size: 2vw;
            min-font-size: 20px;
            line-height: 1.5;
            padding: 6px 12px;
            flex: 5 0 40%;
            border-radius: 5px;
        }
        .inp-select-nf-style{
            border: 1px solid #bbc4d1;
            height: auto;
            font-size: 2vw;
            min-font-size: 20px;
            line-height: 1.5;
            padding: 6px 12px;
            border-radius: 5px;
            width: calc(40% - 10px);
        }
        .inp-select-style{
            border: 1px solid #bbc4d1;
            height: auto;
            font-size: 2vw;
            min-font-size: 20px;
            line-height: 1.5;
            padding: 6px 12px;
            border-radius: 5px;
            flex: 0 0 60%
        }
        .sp-style{
            flex: 3 0 30%;
            margin-left: 10px;
        }
        .row-style{
            display:flex;
            flex-direction:row;
            width: 70vw;
        }

        #dtl-dtp-spmtYmd svg, #dtl-dtp-spmtNo svg{
            position: absolute; /* 절대 위치 설정 */
            right: 8px; /* 버튼의 오른쪽 끝으로 이동 */
            top: 50%; /* 수직 가운데 정렬 */
            transform: translateY(-50%);
        }
        select{
            background: url(/static/resource/sbux/assets/css/default/images/sbicons-selectbox.png)  no-repeat 95% 50% #fff;
        }

        @keyframes slideDown {
            0% {
                opacity: 0;
                transform: translateY(-100%);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes slideUp {
            0% {
                opacity: 1;
                transform: translateY(0);
            }
            100% {
                opacity: 0;
                transform: translateY(-100%);
            }
        }

    </style>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 출하실적등록 모바일 -->
        </div>
        <div style="margin-left: auto;" class="box-header">
            <sbux-button id="btnDocSpmt" name="btnDocSpmt" uitype="normal"   text="송품장" class="btn btn-sm btn-primary btn-mbl" onclick="fn_docSpmt"></sbux-button>
            <sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-mbl btn-outline-danger" onclick="fn_reset"></sbux-button>
            <sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-mbl btn-outline-danger" onclick="fn_save"></sbux-button>
            <sbux-button id="btnClose" name="btnClose" uitype="normal" text="종료" class="btn btn-mbl btn-outline-danger" onclick="fn_close"></sbux-button>
        </div>
        <div class="box-body">
            <div style="display: flex;flex-direction: column;">
                <div class="ma-bt row-style">
                    <button class="ma-rt btn-style" id="dtl-dtp-spmtYmd" onclick="fn_showOption(this)" style=" position: relative;">
                        <span class="btn-text">출하일자</span>
                        <svg xmlns="http://www.w3.org/2000/svg" height="20" width="15" viewBox="0 0 448 512">
                        <path fill="#6495ed" d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/>
                        </svg>
                    </button>
                    <input class="inp-style" />
                    <div class="sp-style" ></div>
                </div>
                <div id="_dtl-dtp-spmtYmd" style="display: none;" class="row-style">
                    <div class="ma-bt row-style">
                        <button class="ma-rt btn-style"  id="dtl-inp-trsprtCst" onclick="fn_showOption(this)">
                            <span class="btn-text">운임비</span>
                        </button>
                        <input class="inp-style" />
                        <div class="sp-style" ></div>
                    </div>
                    <div class="ma-bt row-style">
                        <button class="ma-rt btn-style" id="dtl-inp-vhclno" onclick="fn_showOption(this)">
                            <span class="btn-text">차량번호</span>
                        </button>
                        <input class="inp-style" />
                        <div class="sp-style" ></div>
                    </div>
                </div>
                <div class="ma-bt row-style" style="position: relative">
                    <button class="ma-rt btn-style" style="height: auto">
                        <span class="btn-text">거래처</span>
                    </button>
                    <select class="inp-style" style="position: relative">
                        <option>asdf</option>
                        <option>asdf</option>
                        <option>asdf</option>
                        <option>asdf</option>
                    </select>
                    <div class="sp-style" style="display: flex;flex-direction: row">
                        <button class="btn-style ma-rt"><span class="btn-text">위탁</span> </button>
                        <button class="btn-style"><span class="btn-text">경매</span></button>
                    </div>
                </div>
                <div class="ma-bt row-style" style="position: relative">
                    <button id="dtl-dtp-spmtNo" class="ma-rt btn-style" style="height: auto; position: relative">
                        <span class="btn-text">출하번호</span>
                        <svg xmlns="http://www.w3.org/2000/svg" height="20" width="15" viewBox="0 0 448 512">
                            <path fill="#6495ed" d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/>
                        </svg>
                    </button>
                    <div style="flex: 0 0 40%; display: flex; flex-direction: row">
                        <select class="inp-select-style" style="position: relative;margin-right: 10px;">
                            <option>asdf</option>
                            <option>asdf</option>
                            <option>asdf</option>
                            <option>asdf</option>
                        </select>
                        <input class="inp-select-nf-style"/>
                    </div>
                    <div class="sp-style" style="display: flex;">
                        <button class="btn-style ma-rt"><span class="btn-text">5Kg</span> </button>
                        <button style="flex: 3 0 30%; border: none; background: none"></button>
                    </div>
                    <div class="sp-style" ></div>
                </div>
                <div class="ma-bt row-style" style="position: relative">
                    <button class="ma-rt btn-style" style="height: auto">
                        <span class="btn-text">품목</span>
                    </button>
                    <select class="inp-style" style="position: relative">
                        <option>asdf</option>
                        <option>asdf</option>
                        <option>asdf</option>
                        <option>asdf</option>
                    </select>
                    <div class="sp-style"></div>
                </div>
                <div class="ma-bt row-style" style="position: relative">
                    <button id="dtl-dtp-grdQntt" class="ma-rt btn-style" style="height: auto; position: relative">
                        <span class="btn-text">등급/수량</span>
                    </button>
                    <div style="flex: 0 0 40%; display: flex; flex-direction: row">
                        <select class="inp-select-style" style="position: relative;margin-right: 10px;">
                            <option>asdf</option>
                            <option>asdf</option>
                            <option>asdf</option>
                            <option>asdf</option>
                        </select>
                        <input class="inp-select-nf-style"/>
                    </div>
                    <div class="sp-style" style="display: flex;">
                        <button class="btn-style ma-rt"><span class="btn-text">등록</span> </button>
                        <button style="flex: 3 0 30%; border: none; background: none"></button>
                    </div>
                    <div class="sp-style" ></div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    const fn_showOption = function(obj){
        console.log(obj);
        console.log(obj.id);
        let test = document.getElementById("_" + obj.id);
        let display = test.style.display;
        if(display == 'none'){
            test.style.display = 'block';
            test.style.animation = 'slideDown 0.5s ease-out';
        }else{
            test.style.animation = 'slideUp 0.5s ease-out';
            setTimeout(function() {
                test.style.display = 'none';
            }, 400);
        }
    }
    const fn_close = function(){
        parent.gfn_tabClose("TAB_AM_005_011");
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>