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
				<sbux-button id="btnEndSimpleStng" name="btnEndSimpleStng" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('itemMngModal')"></sbux-button>
			</div>
		</div>
	</div>
   <div class="case_b">
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 1</p>
         <div class="in">
            <ul>
               <li class="blue1_b">
               		<sbux-label id="label-wgh-case" name="label-wgh-case" uitype="normal" text="계량" tooltip-html="true"
               		tooltip="차량 계근대가 있는 경우<br>원물 입고시 계근대를 통해 입고중량을<br>관리 합니다"></sbux-label>
               	</li>
               <li>&nbsp;</li>
               <li class="wh_b">
               		<sbux-label id="label-wgh-case" name="label-wgh-case" uitype="normal" text="선별지시" tooltip-html="true"
               		tooltip="선별작업을 위한 선별지시를 관리합니다.<br>선별지시서를 출력할 수 있습니다.<br>선별실적 등록 시 지시정보를 참조할 수<br>있습니다."></sbux-label>
               	</li>
				<li class="wh_b">
               		<sbux-label id="label-wgh-case" name="label-wgh-case" uitype="normal" text="선별투입" tooltip-html="true"
               		tooltip="테블릿 또는 키오스크를 통해 선별에<br>투입되는 원물정보를 입력합니다.<br>선별 투입 작업자가 필요합니다.<br>선별투입등록을 하지 않아도 선별실적은<br>등록할 수 있습니다."></sbux-label>
               	</li>
				<li class="blue2_b">
               		<sbux-label id="label-wgh-case" name="label-wgh-case" uitype="normal" text="선별실적" tooltip-html="true"
               		tooltip="선별실적 결과를 등록합니다.<br>필수 선택항목 입니다."></sbux-label></li>
				<li class="wh_b">
               		<sbux-label id="label-wgh-case" name="label-wgh-case" uitype="normal" text="포장지시" tooltip-html="true"
               		tooltip="포장작업을 위한 포장지시를 관리합니다.<br>포장지시서를 출력할 수 있습니다.<br>포장실적 등록 시 지시정보를 참조할 수<br>있습니다."></sbux-label></li>
				<li class="wh_b">
               		<sbux-label id="label-wgh-case" name="label-wgh-case" uitype="normal" text="포장투입" tooltip-html="true"
               		tooltip="테블릿 또는 키오스크를 통해 포장기에<br>투입되는 선별재고 정보를 입력합니다.<br>포장 투입 작업자가 필요합니다.<br>포장투입등록을 하지 않아도 포장실적은<br>등록할 수 있습니다."></sbux-label></li>
				<li class="sk_b">
               		<sbux-label id="label-wgh-case" name="label-wgh-case" uitype="normal" text="포장실적" tooltip-html="true"
               		tooltip="포장실적 결과를 등록합니다.<br>선별실적을 통해 포장실적을 자동으로 생<br>성할 수도 있습니다.<br>선별과 포장이 동시에 처리되는 경우는<br>포장실적은 선택하지 마세요"></sbux-label></li>
				<li class="wh_b">
               		<sbux-label id="label-wgh-case" name="label-wgh-case" uitype="normal" text="출하지시" tooltip-html="true"
               		tooltip="출하작업을 위한 출하지시를 관리합니다.<br>출하지시서를 출력할 수 있ㅆ습니다.<br>출하실적 등록 시 지시정보를 참조할 수<br>있습니다"></sbux-label></li>
				<li class="blue2_b">
               		<sbux-label id="label-wgh-case" name="label-wgh-case" uitype="normal" text="출하실적" tooltip-html="true"
               		tooltip="출하실적 결과를 등록합니다.<br>필수 선택항목 입니다."></sbux-label></li>
				<li class="wh_b">
               		<sbux-label id="label-wgh-case" name="label-wgh-case" uitype="normal" text="발주등록" tooltip-html="true"
               		tooltip="거래처의 발주정보를 관리합니다.<br>발주정보를 기준으로 자동으로 작업지시<br>를 편성할 수 있습니다."></sbux-label></li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 2</p>
         <div class="in">
            <ul>
               <li class="blue1_b">계량</li>
               <li>&nbsp;</li>
               <li class="wh_b">선별지시</li>
               <li class="wh_b">선별투입</li>
               <li class="blue2_b">선별실적</li>
               <li class="wh_b">포장지시</li>
               <li>&nbsp;</li>
               <li class="sk_b">포장실적</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 3</p>
         <div class="in">
            <ul>
               <li class="blue1_b">계량</li>
               <li>&nbsp;</li>
               <li class="wh_b">선별지시</li>
               <li>&nbsp;</li>
               <li class="blue2_b">선별실적</li>
               <li class="wh_b">포장지시</li>
               <li>&nbsp;</li>
               <li class="sk_b">포장실적</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 4</p>
         <div class="in">
            <ul>
               <li class="blue1_b">계량</li>
               <li>&nbsp;</li>
               <li class="wh_b">선별지시</li>
               <li>&nbsp;</li>
               <li class="blue2_b">선별실적</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 5</p>
         <div class="in">
            <ul>
               <li class="blue1_b">계량</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li class="blue2_b">선별실적</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li class="blue2_b">출하실적</li>
               <li>&nbsp;</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="" value="case1" >case 6</p>
         <div class="in">
            <ul>
               <li>&nbsp;</li>
               <li class="blue1_b">
               		<sbux-label id="label-wgh-case" name="label-wgh-case" uitype="normal" text="계량" tooltip-html="true"
               		tooltip="출하실적 결과를 등록 합니다.<br>필수 선택항목 입니다."></sbux-label>원물입고</li>
               <li class="wh_b">선별지시</li>
               <li class="wh_b">선별투입</li>
               <li class="blue2_b">선별실적</li>
               <li class="wh_b">포장지시</li>
               <li class="wh_b">포장투입</li>
               <li class="sk_b">포장실적</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 7</p>
         <div class="in">
            <ul>
               <li>&nbsp;</li>
               <li class="blue1_b">원물입고</li>
               <li class="wh_b">선별지시</li>
               <li class="wh_b">선별투입</li>
               <li class="blue2_b">선별실적</li>
               <li class="wh_b">포장지시</li>
               <li>&nbsp;</li>
               <li class="sk_b">포장실적</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 8</p>
         <div class="in">
            <ul>
               <li>&nbsp;</li>
               <li class="blue1_b">원물입고</li>
               <li class="wh_b">선별지시</li>
               <li>&nbsp;</li>
               <li class="blue2_b">선별실적</li>
               <li class="wh_b">포장지시</li>
               <li>&nbsp;</li>
               <li class="sk_b">포장실적</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 8</p>
         <div class="in">
            <ul>
               <li>&nbsp;</li>
               <li class="blue1_b">원물입고</li>
               <li class="wh_b">선별지시</li>
               <li>&nbsp;</li>
               <li class="blue2_b">선별실적</li>
               <li class="wh_b">포장지시</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 9</p>
         <div class="in">
            <ul>
               <li>&nbsp;</li>
               <li class="blue1_b">원물입고</li>
               <li class="wh_b">선별지시</li>
               <li>&nbsp;</li>
               <li class="blue2_b">선별실적</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="" value="case1" >case 10</p>
         <div class="in">
            <ul>
               <li>&nbsp;</li>
               <li class="blue1_b">원물입고</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li class="blue2_b">선별실적</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li class="blue2_b">출하실적</li>
               <li>&nbsp;</li>
            </ul>
         </div>
      </div>
   </div>





   <div class="case_b">

		<div class="case_in">
			<p><input type="radio" name="simpleCase" value="case1" >case1</p>
			<div class="in">
				<ul>
					<li class="blue1_b"><span>계량</span></li>
					<li class="line"><span>&nbsp;</span></li> <!-- 라인만 있는 경우 -->
					<li class="wh_b"><span>선별지시</span></li>
					<li class="wh_b"><span>선별투입</span></li>
					<li class="blue2_b"><span>선별실적</span></li>
					<li class="wh_b"><span>포장지시</span></li>
					<li class="wh_b"><span>포장투입</span></li>
					<li class="sk_b"><span>포장실적</span></li>
					<li class="wh_b"><span>출하지시</span></li>
					<li class="blue2_b"><span>출하실적</span></li>
					<li class="wh_b"><span>발주등록</span></li>
				</ul>
			</div>
		</div>

		<div class="case_in">
				<p><input type="radio" name="simpleCase" value="case2" >case2</p>
				<div class="in">
					<ul>
						<li class="blue1_b"><span>계량</span></li>
						<li class="line"><span>&nbsp;</span></li>
						<li class="line"><span>&nbsp;</span></li>
						<li class="line"><span>&nbsp;</span></li>
						<li class="blue2_b"><span>선별실적</span></li>
						<li class="wh_b"><span>포장지시</span></li>
						<li class="wh_b"><span>포장투입</span></li>
						<li class="sk_b"><span>포장실적</span></li>
						<li class="wh_b"><span>출하지시</span></li>
						<li class="blue2_b"><span>출하실적</span></li>
						<li class="wh_b"><span>발주등록</span></li>
					</ul>
				</div>
			</div>

		<div class="case_in">
			<p><input type="radio" name="simpleCase" value="case3" >case3</p>
			<div class="in">
				<ul>
					<li class="noline">&nbsp;</li><!-- 라인이 없는 경우 -->
					<li class="blue1_b"><span>계량</span></li>
					<li class="wh_b"><span>선별지시</span></li>
					<li class="wh_b"><span>선별투입</span></li>
					<li class="blue2_b"><span>선별실적</span></li>
					<li class="wh_b"><span>포장지시</span></li>
					<li class="wh_b"><span>포장투입</span></li>
					<li class="sk_b"><span>포장실적</span></li>
					<li class="wh_b"><span>출하지시</span></li>
					<li class="blue2_b"><span>출하실적</span></li>
					<li class="wh_b"><span>발주등록</span></li>
				</ul>
			</div>
		</div>
	</div>



</body>
</html>