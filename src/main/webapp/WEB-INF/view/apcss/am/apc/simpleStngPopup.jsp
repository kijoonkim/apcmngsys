<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="box-header" style="display:flex; justify-content: flex-start;" >
		<div>
			<p>
				<span style="font-weight:bold;">APC 업무 특성에 맞는 메뉴설정을 간편하게 할수 있습니다.</span>
			</p>
			<p>
				<span style="color:black; font-weight:bold;">유형을 선택하면 메뉴가 자동으로 설정 됩니다.(재로그인 필요)</span>
			</p>
		</div>
		<div style="margin-left: auto;">
			<sbux-button id="btnSaveSimpleStng" name="btnSaveSimpleStng" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveSimpleStng"></sbux-button>
			<sbux-button id="btnEndSimpleStng" name="btnEndSimpleStng" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('modal-simpleStng')"></sbux-button>
		</div>
	</div>
   	<div class="case_b">

		<div class="case_in">
			<p><sbux-radio uitype="normal" id="simpleCase1" name="simpleCase" value="CASE_01" text="유형 1"></sbux-radio></p>
			<div class="in">
				<ul>
					<li class="blue_b">
						<div class="line01">
							<span>계량</span>
							<p class="arrow_b">차량 계근대가 있는 경우.<br> 원물 입고 시 계근대를 통해 입고중량을<br> 관리 합니다.</p>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별지시</span>
							<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다.<br> 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수<br> 있습니다</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별투입</span>
							<p class="arrow_b">테블릿 또는 키오스크를 통해 선별에<br> 투입되는 원물정보를 입력합니다.<br> 선별 투입 작업자가 필요합니다. <br>선별투입 등록을 하지 않아도 선별실적은<br> 처리할 수 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>선별실적</span>
							<p class="arrow_b">선별실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장지시</span>
							<p class="arrow_b">포장작업을 위한 포장지시를 관리합니다.<br>포장지시서를 출력할 수 있습니다.<br> 포장실적 등록 시 지시정보를 참조할 수 <br>있습니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장투입</span>
							<p class="arrow_b">테블릿 또는 키오스크를 통해 포장기에<br> 투입되는 선별재고 정보를 입력합니다.<br> 포장 투입 작업자가 필요합니다.<br> 포장투입 등록을 하지 않아도 포장실적은 <br>처리할 수 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>포장실적</span>
							<p class="arrow_b">포장실적 결과를 등록합니다.<br>선별실적을 통해 포장실적을 자동으로<br> 생성할 수도 있습니다. <br>선별과 포장이 동시에 처리되는 경우는<br> 포장실적은 선택하지 마세요.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>출하지시</span>
							<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다.<br> 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수<br> 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="x">
							<span>발주등록</span>
							<p class="arrow_b">거래처의 발주정보를 관리합니다.<br> 발주정보를 기준으로 자동으로 <br>작업지시를 편성할 수 있습니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="case_in">
			<p><sbux-radio uitype="normal" id="simpleCase2" name="simpleCase" value="CASE_02" text="유형 2"></sbux-radio></p>
			<div class="in">
				<ul>
					<li class="blue_b">
						<div class="line01">
							<span>계량</span>
							<p class="arrow_b">차량 계근대가 있는 경우.<br> 원물 입고 시 계근대를 통해 입고중량을<br> 관리 합니다.</p>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별지시</span>
							<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다.<br> 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수<br> 있습니다</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별투입</span>
							<p class="arrow_b">테블릿 또는 키오스크를 통해 선별에<br> 투입되는 원물정보를 입력합니다.<br> 선별 투입 작업자가 필요합니다. <br>선별투입 등록을 하지 않아도 선별실적은<br> 처리할 수 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>선별실적</span>
							<p class="arrow_b">선별실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장지시</span>
							<p class="arrow_b">포장작업을 위한 포장지시를 관리합니다.<br>포장지시서를 출력할 수 있습니다.<br> 포장실적 등록 시 지시정보를 참조할 수 <br>있습니다.</p>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>포장실적</span>
							<p class="arrow_b">포장실적 결과를 등록합니다.<br>선별실적을 통해 포장실적을 자동으로<br> 생성할 수도 있습니다. <br>선별과 포장이 동시에 처리되는 경우는<br> 포장실적은 선택하지 마세요.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>출하지시</span>
							<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다.<br> 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수<br> 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="x">
							<span>발주등록</span>
							<p class="arrow_b">거래처의 발주정보를 관리합니다.<br> 발주정보를 기준으로 자동으로 <br>작업지시를 편성할 수 있습니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="case_in">
			<p><sbux-radio uitype="normal" id="simpleCase3" name="simpleCase" value="CASE_03" text="유형 3"></sbux-radio></p>
			<div class="in">
				<ul>
					<li class="blue_b">
						<div class="line01">
							<span>계량</span>
							<p class="arrow_b">차량 계근대가 있는 경우.<br> 원물 입고 시 계근대를 통해 입고중량을<br> 관리 합니다.</p>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별지시</span>
							<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다.<br> 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수<br> 있습니다</p>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>선별실적</span>
							<p class="arrow_b">선별실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장지시</span>
							<p class="arrow_b">포장작업을 위한 포장지시를 관리합니다.<br>포장지시서를 출력할 수 있습니다.<br> 포장실적 등록 시 지시정보를 참조할 수 <br>있습니다.</p>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>포장실적</span>
							<p class="arrow_b">포장실적 결과를 등록합니다.<br>선별실적을 통해 포장실적을 자동으로<br> 생성할 수도 있습니다. <br>선별과 포장이 동시에 처리되는 경우는<br> 포장실적은 선택하지 마세요.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>출하지시</span>
							<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다.<br> 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수<br> 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="x">
							<span>발주등록</span>
							<p class="arrow_b">거래처의 발주정보를 관리합니다.<br> 발주정보를 기준으로 자동으로 <br>작업지시를 편성할 수 있습니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="case_in">
				<p><sbux-radio uitype="normal" id="simpleCase4" name="simpleCase" value="CASE_04" text="유형 4"></sbux-radio></p>
				<div class="in">
					<ul>
						<li class="blue_b">
							<div class="line01">
								<span>계량</span>
								<p class="arrow_b">차량 계근대가 있는 경우.<br> 원물 입고 시 계근대를 통해 입고중량을<br> 관리 합니다.</p>
							</div>
						</li>
						<li>
							<div class="line02">
								<span>&nbsp;</span>
							</div>
						</li>
						<li class="wh_b">
							<div class="line01">
								<span>선별지시</span>
								<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다.<br> 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수<br> 있습니다</p>
							</div>
						</li>
						<li>
							<div class="line02">
								<span>&nbsp;</span>
							</div>
						</li>
						<li class="blue_b">
							<div class="line01">
								<span>선별실적</span>
								<p class="arrow_b">선별실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
							</div>
						</li>
						<li>
							<div class="line02">
								<span>&nbsp;</span>
							</div>
						</li>
						<li>
							<div class="line02">
								<span>&nbsp;</span>
							</div>
						</li>
						<li>
							<div class="line02">
								<span>&nbsp;</span>
							</div>
						</li>
						<li class="wh_b">
							<div class="line01">
								<span>출하지시</span>
								<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다.<br> 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수<br> 있습니다.</p>
							</div>
						</li>
						<li class="blue_b">
							<div class="line01">
								<span>출하실적</span>
								<p class="arrow_b">출하실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
							</div>
						</li>
						<li class="wh_b">
							<div class="x">
								<span>발주등록</span>
								<p class="arrow_b">거래처의 발주정보를 관리합니다.<br> 발주정보를 기준으로 자동으로 <br>작업지시를 편성할 수 있습니다.</p>
							</div>
						</li>
					</ul>
				</div>
			</div>

		<div class="case_in">
			<p><sbux-radio uitype="normal" id="simpleCase5" name="simpleCase" value="CASE_05" text="유형 5"></sbux-radio></p>
			<div class="in">
				<ul>
					<li class="blue_b">
						<div class="line01">
							<span>계량</span>
							<p class="arrow_b">차량 계근대가 있는 경우.<br> 원물 입고 시 계근대를 통해 입고중량을<br> 관리 합니다.</p>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>선별실적</span>
							<p class="arrow_b">선별실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="x">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>

				</ul>
			</div>
		</div>

		<div class="case_in">
			<p><sbux-radio uitype="normal" id="simpleCase6" name="simpleCase" value="CASE_06" text="유형 6"></sbux-radio></p>
			<div class="in">
				<ul>
					<li>
						<div class="">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>원물입고</span>
							<p class="arrow_b">계근대 없이 원물을 입고 처리합니다.<br> 원물 입고실적을 등록합니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별지시</span>
							<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다.<br> 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수<br> 있습니다</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별투입</span>
							<p class="arrow_b">테블릿 또는 키오스크를 통해 선별에<br> 투입되는 원물정보를 입력합니다.<br> 선별 투입 작업자가 필요합니다. <br>선별투입 등록을 하지 않아도 선별실적은<br> 처리할 수 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>선별실적</span>
							<p class="arrow_b">선별실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장지시</span>
							<p class="arrow_b">포장작업을 위한 포장지시를 관리합니다.<br>포장지시서를 출력할 수 있습니다.<br> 포장실적 등록 시 지시정보를 참조할 수 <br>있습니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장투입</span>
							<p class="arrow_b">테블릿 또는 키오스크를 통해 포장기에<br> 투입되는 선별재고 정보를 입력합니다.<br> 포장 투입 작업자가 필요합니다.<br> 포장투입 등록을 하지 않아도 포장실적은 <br>처리할 수 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>포장실적</span>
							<p class="arrow_b">포장실적 결과를 등록합니다.<br>선별실적을 통해 포장실적을 자동으로<br> 생성할 수도 있습니다. <br>선별과 포장이 동시에 처리되는 경우는<br> 포장실적은 선택하지 마세요.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>출하지시</span>
							<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다.<br> 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수<br> 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="x">
							<span>발주등록</span>
							<p class="arrow_b">거래처의 발주정보를 관리합니다.<br> 발주정보를 기준으로 자동으로 <br>작업지시를 편성할 수 있습니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="case_in">
			<p><sbux-radio uitype="normal" id="simpleCase7" name="simpleCase" value="CASE_07" text="유형 7"></sbux-radio></p>
			<div class="in">
				<ul>
					<li>
						<div class="">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>원물입고</span>
							<p class="arrow_b">계근대 없이 원물을 입고 처리합니다.<br> 원물 입고실적을 등록합니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별지시</span>
							<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다.<br> 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수<br> 있습니다</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별투입</span>
							<p class="arrow_b">테블릿 또는 키오스크를 통해 선별에<br> 투입되는 원물정보를 입력합니다.<br> 선별 투입 작업자가 필요합니다. <br>선별투입 등록을 하지 않아도 선별실적은<br> 처리할 수 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>선별실적</span>
							<p class="arrow_b">선별실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장지시</span>
							<p class="arrow_b">포장작업을 위한 포장지시를 관리합니다.<br>포장지시서를 출력할 수 있습니다.<br> 포장실적 등록 시 지시정보를 참조할 수 <br>있습니다.</p>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>포장실적</span>
							<p class="arrow_b">포장실적 결과를 등록합니다.<br>선별실적을 통해 포장실적을 자동으로<br> 생성할 수도 있습니다. <br>선별과 포장이 동시에 처리되는 경우는<br> 포장실적은 선택하지 마세요.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>출하지시</span>
							<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다.<br> 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수<br> 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="x">
							<span>발주등록</span>
							<p class="arrow_b">거래처의 발주정보를 관리합니다.<br> 발주정보를 기준으로 자동으로 <br>작업지시를 편성할 수 있습니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="case_in">
			<p><sbux-radio uitype="normal" id="simpleCase8" name="simpleCase" value="CASE_08" text="유형 8"></sbux-radio></p>
			<div class="in">
				<ul>
					<li>
						<div class="">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>원물입고</span>
							<p class="arrow_b">계근대 없이 원물을 입고 처리합니다.<br> 원물 입고실적을 등록합니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별지시</span>
							<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다.<br> 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수<br> 있습니다</p>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>선별실적</span>
							<p class="arrow_b">선별실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장지시</span>
							<p class="arrow_b">포장작업을 위한 포장지시를 관리합니다.<br>포장지시서를 출력할 수 있습니다.<br> 포장실적 등록 시 지시정보를 참조할 수 <br>있습니다.</p>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>포장실적</span>
							<p class="arrow_b">포장실적 결과를 등록합니다.<br>선별실적을 통해 포장실적을 자동으로<br> 생성할 수도 있습니다. <br>선별과 포장이 동시에 처리되는 경우는<br> 포장실적은 선택하지 마세요.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>출하지시</span>
							<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다.<br> 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수<br> 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="x">
							<span>발주등록</span>
							<p class="arrow_b">거래처의 발주정보를 관리합니다.<br> 발주정보를 기준으로 자동으로 <br>작업지시를 편성할 수 있습니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="case_in">
			<p><sbux-radio uitype="normal" id="simpleCase9" name="simpleCase" value="CASE_09" text="유형 9"></sbux-radio></p>
			<div class="in">
				<ul>
					<li>
						<div class="">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>원물입고</span>
							<p class="arrow_b">계근대 없이 원물을 입고 처리합니다.<br> 원물 입고실적을 등록합니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별지시</span>
							<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다.<br> 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수<br> 있습니다</p>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>선별실적</span>
							<p class="arrow_b">선별실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>출하지시</span>
							<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다.<br> 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수<br> 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="x">
							<span>발주등록</span>
							<p class="arrow_b">거래처의 발주정보를 관리합니다.<br> 발주정보를 기준으로 자동으로 <br>작업지시를 편성할 수 있습니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="case_in">
			<p><sbux-radio uitype="normal" id="simpleCase10" name="simpleCase" value="CASE_10" text="유형 10"></sbux-radio></p>
			<div class="in">
				<ul>
					<li>
						<div class="">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>원물입고</span>
							<p class="arrow_b">계근대 없이 원물을 입고 처리합니다.<br> 원물 입고실적을 등록합니다.</p>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>선별실적</span>
							<p class="arrow_b">선별실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="line02">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="blue_b">
						<div class="x">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="case_in">
			<p><sbux-radio uitype="normal" id="simpleCase11" name="simpleCase" value="CASE_11" text="유형 11"></sbux-radio></p>
			<div class="in">
				<ul>
					<li>
						<div class="">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="">
							<span>&nbsp;</span>
						</div>
					</li>
					<li>
						<div class="">
							<span>&nbsp;</span>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>출하지시</span>
							<p class="arrow_b2">출하작업을 위한 출하지시를 관리합니다.<br> 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수<br> 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>출하실적</span>
							<p class="arrow_b3">출하실적 결과를 등록합니다.<br> 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="x">
							<span>발주등록</span>
							<p class="arrow_b4">거래처의 발주정보를 관리합니다.<br> 발주정보를 기준으로 자동으로 <br>작업지시를 편성할 수 있습니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	async function fn_saveSimpleStng(){
		let authrtCaseId = SBUxMethod.get('simpleCase');
		let postJsonPromise = gfn_postJSON("/am/apc/insertApcSimpleAuthrt.do", {apcCd : gv_apcCd, authrtCaseId : authrtCaseId});
    	let data = await postJsonPromise;
    	try{
    		if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        	} else {
        		//alert(data.resultMessage);
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
    	}catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
</script>
</html>