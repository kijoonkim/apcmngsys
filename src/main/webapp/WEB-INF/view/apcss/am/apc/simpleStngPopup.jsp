<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="box-header">
		<div class="ad_tbl_top">
			<div class="ad_tbl_toplist">
				<sbux-button id="btnInsertSimpleStng" name="btnInsertSimpleStng" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertApcVrtyList"></sbux-button>
				<sbux-button id="btnEndSimpleStng" name="btnEndSimpleStng" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('modal-simpleStng')"></sbux-button>
			</div>
		</div>
	</div>
   <div class="case_b">
      <div class="case_in">
         <p><sbux-radio uitype="normal" id="simpleCase1" name="simpleCase" value="case1" text="case 1"></sbux-radio></p>
         <div class="in">
            <ul>
               <li class="blue1_b">
               		<sbux-label id="label-wgh-1" name="label-wgh-1" uitype="normal" text="계량" popover-html="true" popover-placement="bottom"
               		sbux-popover="차량 계근대가 있는 경우<br>원물 입고시 계근대를 통해 입고중량을<br>관리 합니다"></sbux-label>
               	</li>
               <li class="line">&nbsp;</li>
               <li class="wh_b">
               		<sbux-label id="label-sortCmnd-1" name="label-sortCmnd-1" uitype="normal" text="선별지시" tooltip-html="true"
               		tooltip="선별작업을 위한 선별지시를 관리합니다.<br>선별지시서를 출력할 수 있습니다.<br>선별실적 등록 시 지시정보를 참조할 수<br>있습니다."></sbux-label>
               	</li>
				<li class="wh_b">
               		<sbux-label id="label-sortInpt-1" name="label-sortInpt-1" uitype="normal" text="선별투입" tooltip-html="true"
               		tooltip="테블릿 또는 키오스크를 통해 선별에<br>투입되는 원물정보를 입력합니다.<br>선별 투입 작업자가 필요합니다.<br>선별투입등록을 하지 않아도 선별실적은<br>등록할 수 있습니다."></sbux-label>
               	</li>
				<li class="blue2_b">
               		<sbux-label id="label-sortInptPrfmnc-1" name="label-sortInptPrfmnc-1" uitype="normal" text="선별실적" tooltip-html="true"
               		tooltip="선별실적 결과를 등록합니다.<br>필수 선택항목 입니다."></sbux-label></li>
				<li class="wh_b">
               		<sbux-label id="label-pckgCmnd-1" name="label-pckgCmnd-1" uitype="normal" text="포장지시" tooltip-html="true"
               		tooltip="포장작업을 위한 포장지시를 관리합니다.<br>포장지시서를 출력할 수 있습니다.<br>포장실적 등록 시 지시정보를 참조할 수<br>있습니다."></sbux-label></li>
				<li class="wh_b">
               		<sbux-label id="label-pckgInpt-1" name="label-pckgInpt-1" uitype="normal" text="포장투입" tooltip-html="true"
               		tooltip="테블릿 또는 키오스크를 통해 포장기에<br>투입되는 선별재고 정보를 입력합니다.<br>포장 투입 작업자가 필요합니다.<br>포장투입등록을 하지 않아도 포장실적은<br>등록할 수 있습니다."></sbux-label></li>
				<li class="wh_b">
               		<sbux-label id="label-pckgInptPrfmnc-1" name="label-pckgInptPrfmnc-1" uitype="normal" text="포장실적" tooltip-html="true"
               		tooltip="포장실적 결과를 등록합니다.<br>선별실적을 통해 포장실적을 자동으로 생<br>성할 수도 있습니다.<br>선별과 포장이 동시에 처리되는 경우는<br>포장실적은 선택하지 마세요"></sbux-label></li>
				<li class="wh_b">
               		<sbux-label id="label-spmtCmnd-1" name="label-spmtCmnd-1" uitype="normal" text="출하지시" tooltip-html="true"
               		tooltip="출하작업을 위한 출하지시를 관리합니다.<br>출하지시서를 출력할 수 있ㅆ습니다.<br>출하실적 등록 시 지시정보를 참조할 수<br>있습니다"></sbux-label></li>
				<li class="blue2_b">
               		<sbux-label id="label-spmtPrfmnc-1" name="label-spmtPrfmnc-1" uitype="normal" text="출하실적" tooltip-html="true"
               		tooltip="출하실적 결과를 등록합니다.<br>필수 선택항목 입니다."></sbux-label></li>
				<li class="wh_b">
               		<sbux-label id="label-outordrInfo-1" name="label-outordrInfo-1" uitype="normal" text="발주등록" tooltip-html="true"
               		tooltip="거래처의 발주정보를 관리합니다.<br>발주정보를 기준으로 자동으로 작업지시<br>를 편성할 수 있습니다."></sbux-label></li>
            </ul>
         </div>
      </div>
      <div class="case_in">
         <p><sbux-radio uitype="normal" id="simpleCase2" name="simpleCase" value="2" text="case 2"></sbux-radio></p>
         <div class="in">
            <ul>
               <li class="blue1_b"><sbux-label id="123" name="123" uitype="normal" text="계량" toltip="아무개"></sbux-label></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="wh_b"><span>선별지시</span></li>
               <li class="wh_b"><span>선별투입</span></li>
               <li class="blue2_b"><span>선별실적</span></li>
               <li class="wh_b"><span>포장지시</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="wh_b"><span>포장실적</span></li>
               <li class="wh_b"><span>출하지시</span></li>
               <li class="blue2_b"><span>출하실적</span></li>
               <li class="wh_b"><span>발주등록</span></li>
            </ul>
         </div>
      </div>
      <div class="case_in">
         <p><sbux-radio uitype="normal" id="simpleCase3"  name="simpleCase" value="3" text="case 3"></sbux-radio></p>
         <div class="in">
            <ul>
               <li class="blue1_b"><span>계량</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="wh_b"><span>선별지시</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="blue2_b"><span>선별실적</span></li>
               <li class="wh_b"><span>포장지시</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="wh_b"><span>포장실적</span></li>
               <li class="wh_b"><span>출하지시</span></li>
               <li class="blue2_b"><span>출하실적</span></li>
               <li class="wh_b"><span>발주등록</span></li>
            </ul>
         </div>
      </div>
      <div class="case_in">
         <p><sbux-radio uitype="normal" id="simpleCase4" name="simpleCase" value="4" text="case 4"></sbux-radio></p>
         <div class="in">
            <ul>
               <li class="blue1_b"><span>계량</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="wh_b"><span>선별지시</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="blue2_b"><span>선별실적</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="wh_b"><span>출하지시</span></li>
               <li class="blue2_b"><span>출하실적</span></li>
               <li class="wh_b"><span>발주등록</span></li>
            </ul>
         </div>
      </div>
      <div class="case_in">
         <p><sbux-radio uitype="normal" id="simpleCase5" name="simpleCase" value="5" text="case 5"></sbux-radio></p>
         <div class="in">
            <ul>
               <li class="blue1_b"><span>계량</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="blue2_b"><span>선별실적</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="blue2_b"><span>출하실적</span></li>
            </ul>
         </div>
      </div>
      <div class="case_in">
         <p><sbux-radio uitype="normal" id="simpleCase6" name="simpleCase" value="6" text="case 6"></sbux-radio></p>
         <div class="in">
            <ul>
               <li class="noline">&nbsp;</li>
               <li class="blue1_b">
               		<sbux-label id="label-wgh-case" name="label-wgh-case" uitype="normal" text="원물입고" tooltip-html="true"
               		tooltip="출하실적 결과를 등록 합니다.<br>필수 선택항목 입니다."></sbux-label></li>
               <li class="wh_b"><span>선별지시</span></li>
               <li class="wh_b"><span>선별투입</span></li>
               <li class="blue2_b"><span>선별실적</span></li>
               <li class="wh_b"><span>포장지시</span></li>
               <li class="wh_b"><span>포장투입</span></li>
               <li class="wh_b"><span>포장실적</span></li>
               <li class="wh_b"><span>출하지시</span></li>
               <li class="blue2_b"><span>출하실적</span></li>
               <li class="wh_b"><span>발주등록</span></li>
            </ul>
         </div>
      </div>
      <div class="case_in">
         <p><sbux-radio uitype="normal" id="simpleCase7" name="simpleCase" value="7" text="case 7"></sbux-radio></p>
         <div class="in">
            <ul>
               <li class="noline">&nbsp;</li>
               <li class="blue1_b"><span>원물입고</span></li>
               <li class="wh_b"><span>선별지시</span></li>
               <li class="wh_b"><span>선별투입</span></li>
               <li class="blue2_b"><span>선별실적</span></li>
               <li class="wh_b"><span>포장지시</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="wh_b"><span>포장실적</span></li>
               <li class="wh_b"><span>출하지시</span></li>
               <li class="blue2_b"><span>출하실적</span></li>
               <li class="wh_b"><span>발주등록</span></li>
            </ul>
         </div>
      </div>
      <div class="case_in">
         <p><sbux-radio uitype="normal" id="simpleCase8" name="simpleCase" value="8" text="case 8"></sbux-radio></p>
         <div class="in">
            <ul>
               <li class="noline">&nbsp;</li>
               <li class="blue1_b"><span>원물입고</span></li>
               <li class="wh_b"><span>선별지시</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="blue2_b"><span>선별실적</span></li>
               <li class="wh_b"><span>포장지시</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="wh_b"><span>포장실적</span></li>
               <li class="wh_b"><span>출하지시</span></li>
               <li class="blue2_b"><span>출하실적</span></li>
               <li class="wh_b"><span>발주등록</span></li>
            </ul>
         </div>
      </div>
      <div class="case_in">
         <p><sbux-radio uitype="normal" id="simpleCase9" name="simpleCase" value="9" text="case 9"></sbux-radio></p>
         <div class="in">
            <ul>
               <li class="noline">&nbsp;</li>
               <li class="blue1_b"><span>원물입고</span></li>
               <li class="wh_b"><span>선별지시</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="blue2_b"><span>선별실적</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="wh_b"><span>출하지시</span></li>
               <li class="blue2_b"><span>출하실적</span></li>
               <li class="wh_b"><span>발주등록</span></li>
            </ul>
         </div>
      </div>
      <div class="case_in">
         <p><sbux-radio uitype="normal" id="simpleCase10" name="simpleCase" value="10" text="case 10"></sbux-radio></p>
         <div class="in">
            <ul>
               <li class="noline">&nbsp;</li>
               <li class="blue1_b"><span>원물입고</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="blue2_b"><span>선별실적</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="line"><span>&nbsp;</span></li>
               <li class="blue2_b"><span>출하실적</span></li>
            </ul>
         </div>
      </div>
   </div>
</body>
</html>