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
				<sbux-button id="btnInsertSimpleStng" name="btnInsertSimpleStng" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertSimpleStng"></sbux-button>
				<sbux-button id="btnEndSimpleStng" name="btnEndSimpleStng" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-simpleStng')"></sbux-button>
			</div>
		</div>
	</div>




   <div class="case_b">

		<div class="case_in">
<!-- 			<p><input type="radio" name="simpleCase" value="case1" >case1</p> -->
			<p><sbux-radio uitype="normal" id="simpleCase1" name="simpleCase1" value="CASE_01" text="case 1"></sbux-radio></p>
			<div class="in">
				<ul>
					<li class="blue_b">
						<div class="line01">
							<span>계량</span>
							<p class="arrow_b">APC에 차량 계근대가 있는 경우. 원물 입고 시 계근대를 통해 입고중량을 관리 합니다.</p>
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
							<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다. 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수 있습니다</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별투입</span>
							<p class="arrow_b">
								테블릿 또는 키오스크를 통해 선별에 투입되는 원물 재고를 선택합니다. 선별 투입 작업자가 필요합니다. <br>선별투입 등록을 하지 않아도 선별실적은 처리할 수 있습니다.
							</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>선별실적</span>
							<p class="arrow_b">선별실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장지시</span>
							<p class="arrow_b">포장작업을 위한 포장지시를 관리합니다.포장지시서를 출력할 수 있습니다.<br> 포장실적 등록 시 지시정보를 참조할 수 있습니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장투입</span>
							<p class="arrow_b">
								테블릿 또는 키오스크를 통해 포장기에 투입되는 선별재고 정보를 입력합니다. 포장 투입 작업자가 필요합니다.<br> 포장투입 등록을 하지 않아도 포장실적은 처리할 수 있습니다.
							</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>포장실적</span>
							<p class="arrow_b">
								포장실적 결과를 등록합니다.선별실적을 통해 포장실적을 자동으로 생성할 수도 있습니다. <br>선별과 포장이 동시에 처리되는 경우는 포장실적은 선택하지 마세요.
							</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>출하지시</span>
							<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다. 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="x">
							<span>발주등록</span>
							<p class="arrow_b">거래처의 발주정보를 관리합니다. 발주정보를 기준으로 자동으로 작업지시를 편성할 수 있습니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="case_in">
<!-- 			<p><input type="radio" name="simpleCase" value="case2" >case2</p> -->
			<p><sbux-radio uitype="normal" id="simpleCase2" name="simpleCase2" value="CASE_02" text="case 2"></sbux-radio></p>
			<div class="in">
				<ul>
					<li class="blue_b">
						<div class="line01">
							<span>계량</span>
							<p class="arrow_b">APC에 차량 계근대가 있는 경우. 원물 입고 시 계근대를 통해 입고중량을 관리 합니다.</p>
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
							<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다. 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수 있습니다</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별투입</span>
							<p class="arrow_b">
								테블릿 또는 키오스크를 통해 선별에 투입되는 원물 재고를 선택합니다. 선별 투입 작업자가 필요합니다. <br>선별투입 등록을 하지 않아도 선별실적은 처리할 수 있습니다.
							</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>선별실적</span>
							<p class="arrow_b">선별실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장지시</span>
							<p class="arrow_b">포장작업을 위한 포장지시를 관리합니다.포장지시서를 출력할 수 있습니다.<br> 포장실적 등록 시 지시정보를 참조할 수 있습니다.</p>
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
							<p class="arrow_b">
								포장실적 결과를 등록합니다.선별실적을 통해 포장실적을 자동으로 생성할 수도 있습니다. <br>선별과 포장이 동시에 처리되는 경우는 포장실적은 선택하지 마세요.
							</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>출하지시</span>
							<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다. 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="x">
							<span>발주등록</span>
							<p class="arrow_b">거래처의 발주정보를 관리합니다. 발주정보를 기준으로 자동으로 작업지시를 편성할 수 있습니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="case_in">
<!-- 			<p><input type="radio" name="simpleCase" value="case3" >case3</p> -->
			<p><sbux-radio uitype="normal" id="simpleCase3" name="simpleCase3" value="CASE_03" text="case 3"></sbux-radio></p>
			<div class="in">
				<ul>
					<li class="blue_b">
						<div class="line01">
							<span>계량</span>
							<p class="arrow_b">APC에 차량 계근대가 있는 경우. 원물 입고 시 계근대를 통해 입고중량을 관리 합니다.</p>
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
							<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다. 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수 있습니다</p>
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
							<p class="arrow_b">선별실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장지시</span>
							<p class="arrow_b">포장작업을 위한 포장지시를 관리합니다.포장지시서를 출력할 수 있습니다.<br> 포장실적 등록 시 지시정보를 참조할 수 있습니다.</p>
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
							<p class="arrow_b">
								포장실적 결과를 등록합니다.선별실적을 통해 포장실적을 자동으로 생성할 수도 있습니다. <br>선별과 포장이 동시에 처리되는 경우는 포장실적은 선택하지 마세요.
							</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>출하지시</span>
							<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다. 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="x">
							<span>발주등록</span>
							<p class="arrow_b">거래처의 발주정보를 관리합니다. 발주정보를 기준으로 자동으로 작업지시를 편성할 수 있습니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="case_in">
<!-- 				<p><input type="radio" name="simpleCase" value="case4" >case4</p> -->
				<p><sbux-radio uitype="normal" id="simpleCase4" name="simpleCase4" value="CASE_04" text="case 4"></sbux-radio></p>
				<div class="in">
					<ul>
						<li class="blue_b">
							<div class="line01">
								<span>계량</span>
								<p class="arrow_b">APC에 차량 계근대가 있는 경우. 원물 입고 시 계근대를 통해 입고중량을 관리 합니다.</p>
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
								<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다. 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수 있습니다</p>
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
								<p class="arrow_b">선별실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
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
								<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다. 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수 있습니다.</p>
							</div>
						</li>
						<li class="blue_b">
							<div class="line01">
								<span>출하실적</span>
								<p class="arrow_b">출하실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
							</div>
						</li>
						<li class="wh_b">
							<div class="x">
								<span>발주등록</span>
								<p class="arrow_b">거래처의 발주정보를 관리합니다. 발주정보를 기준으로 자동으로 작업지시를 편성할 수 있습니다.</p>
							</div>
						</li>
					</ul>
				</div>
			</div>

		<div class="case_in">
<!-- 			<p><input type="radio" name="simpleCase" value="case5" >case5</p> -->
			<p><sbux-radio uitype="normal" id="simpleCase5" name="simpleCase5" value="CASE_05" text="case 5"></sbux-radio></p>
			<div class="in">
				<ul>
					<li class="blue_b">
						<div class="line01">
							<span>계량</span>
							<p class="arrow_b">APC에 차량 계근대가 있는 경우. 원물 입고 시 계근대를 통해 입고중량을 관리 합니다.</p>
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
							<p class="arrow_b">선별실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
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
							<p class="arrow_b">출하실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
						</div>
					</li>

				</ul>
			</div>
		</div>

		<div class="case_in">
<!-- 			<p><input type="radio" name="simpleCase" value="case6" >case6</p> -->
			<p><sbux-radio uitype="normal" id="simpleCase6" name="simpleCase6" value="CASE_06" text="case 6"></sbux-radio></p>
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
							<p class="arrow_b">계근대 없이 원물을 입고 처리합니다. 원물 입고실적을 등록합니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별지시</span>
							<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다. 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수 있습니다</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별투입</span>
							<p class="arrow_b">
								테블릿 또는 키오스크를 통해 선별에 투입되는 원물 재고를 선택합니다. 선별 투입 작업자가 필요합니다. <br>선별투입 등록을 하지 않아도 선별실적은 처리할 수 있습니다.
							</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>선별실적</span>
							<p class="arrow_b">선별실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장지시</span>
							<p class="arrow_b">포장작업을 위한 포장지시를 관리합니다.포장지시서를 출력할 수 있습니다.<br> 포장실적 등록 시 지시정보를 참조할 수 있습니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장투입</span>
							<p class="arrow_b">
								테블릿 또는 키오스크를 통해 포장기에 투입되는 선별재고 정보를 입력합니다. 포장 투입 작업자가 필요합니다.<br> 포장투입 등록을 하지 않아도 포장실적은 처리할 수 있습니다.
							</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>포장실적</span>
							<p class="arrow_b">
								포장실적 결과를 등록합니다.선별실적을 통해 포장실적을 자동으로 생성할 수도 있습니다. <br>선별과 포장이 동시에 처리되는 경우는 포장실적은 선택하지 마세요.
							</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>출하지시</span>
							<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다. 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="x">
							<span>발주등록</span>
							<p class="arrow_b">거래처의 발주정보를 관리합니다. 발주정보를 기준으로 자동으로 작업지시를 편성할 수 있습니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="case_in">
<!-- 			<p><input type="radio" name="simpleCase" value="case7" >case7</p> -->
			<p><sbux-radio uitype="normal" id="simpleCase7" name="simpleCase7" value="CASE_07" text="case 7"></sbux-radio></p>
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
							<p class="arrow_b">계근대 없이 원물을 입고 처리합니다. 원물 입고실적을 등록합니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별지시</span>
							<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다. 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수 있습니다</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별투입</span>
							<p class="arrow_b">
								테블릿 또는 키오스크를 통해 선별에 투입되는 원물 재고를 선택합니다. 선별 투입 작업자가 필요합니다. <br>선별투입 등록을 하지 않아도 선별실적은 처리할 수 있습니다.
							</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>선별실적</span>
							<p class="arrow_b">선별실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장지시</span>
							<p class="arrow_b">포장작업을 위한 포장지시를 관리합니다.포장지시서를 출력할 수 있습니다.<br> 포장실적 등록 시 지시정보를 참조할 수 있습니다.</p>
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
							<p class="arrow_b">
								포장실적 결과를 등록합니다.선별실적을 통해 포장실적을 자동으로 생성할 수도 있습니다. <br>선별과 포장이 동시에 처리되는 경우는 포장실적은 선택하지 마세요.
							</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>출하지시</span>
							<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다. 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="x">
							<span>발주등록</span>
							<p class="arrow_b">거래처의 발주정보를 관리합니다. 발주정보를 기준으로 자동으로 작업지시를 편성할 수 있습니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="case_in">
<!-- 			<p><input type="radio" name="simpleCase" value="case8" >case8</p> -->
			<p><sbux-radio uitype="normal" id="simpleCase8" name="simpleCase8" value="CASE_08" text="case 8"></sbux-radio></p>
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
							<p class="arrow_b">계근대 없이 원물을 입고 처리합니다. 원물 입고실적을 등록합니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별지시</span>
							<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다. 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수 있습니다</p>
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
							<p class="arrow_b">선별실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>포장지시</span>
							<p class="arrow_b">포장작업을 위한 포장지시를 관리합니다.포장지시서를 출력할 수 있습니다.<br> 포장실적 등록 시 지시정보를 참조할 수 있습니다.</p>
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
							<p class="arrow_b">
								포장실적 결과를 등록합니다.선별실적을 통해 포장실적을 자동으로 생성할 수도 있습니다. <br>선별과 포장이 동시에 처리되는 경우는 포장실적은 선택하지 마세요.
							</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>출하지시</span>
							<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다. 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="x">
							<span>발주등록</span>
							<p class="arrow_b">거래처의 발주정보를 관리합니다. 발주정보를 기준으로 자동으로 작업지시를 편성할 수 있습니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="case_in">
<!-- 			<p><input type="radio" name="simpleCase" value="case9" >case9</p> -->
			<p><sbux-radio uitype="normal" id="simpleCase9" name="simpleCase9" value="CASE_09" text="case 9"></sbux-radio></p>
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
							<p class="arrow_b">계근대 없이 원물을 입고 처리합니다. 원물 입고실적을 등록합니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별지시</span>
							<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다. 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수 있습니다</p>
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
							<p class="arrow_b">선별실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
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
							<p class="arrow_b">출하작업을 위한 출하지시를 관리합니다. 출하지시서를 출력할 수 있습니다. <br>출하실적 등록 시 지시정보를 참조할 수 있습니다.</p>
						</div>
					</li>
					<li class="blue_b">
						<div class="line01">
							<span>출하실적</span>
							<p class="arrow_b">출하실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="x">
							<span>발주등록</span>
							<p class="arrow_b">거래처의 발주정보를 관리합니다. 발주정보를 기준으로 자동으로 작업지시를 편성할 수 있습니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="case_in">
<!-- 			<p><input type="radio" name="simpleCase" value="case10" >case10</p> -->
			<p><sbux-radio uitype="normal" id="simpleCase10" name="simpleCase10" value="CASE_10" text="case 10"></sbux-radio></p>
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
							<p class="arrow_b">계근대 없이 원물을 입고 처리합니다. 원물 입고실적을 등록합니다.</p>
						</div>
					</li>
					<li class="wh_b">
						<div class="line01">
							<span>선별지시</span>
							<p class="arrow_b">선별작업을 위한 선별지시를 관리합니다. 선별지시서를 출력할 수 있습니다.<br> 선별실적 등록 시 지시정보를 참조할 수 있습니다</p>
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
							<p class="arrow_b">선별실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
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
							<p class="arrow_b">출하실적 결과를 등록합니다. 필수 선택항목 입니다.</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	async function fn_insertSimpleStng(){
		let authrtCaseId = SBUxMethod.get('simpleCase');
		let postJsonPromise = gfn_postJSON("/co/authrt/insertApcSimpleAuthrt.do", {apcCd : gv_apcCd, authrtCaseId : authrtCaseId});
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