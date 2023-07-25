<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> ▶ 사용자정보변경</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger"></sbux-button>
				</div>	
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td colspan="8" class="td_input"></td>
						</tr>
						<tr>
							<th scope="row">사용자ID</th>
							<td td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-userId" name="srch-inp-userId" uitype="text" class="form-control input-sm" placeholder=""></sbux-input>
							</td>
							<td colspan="2" style="border-right: hidden;"></td>
							<th scope="row">사용자명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-userNm" name="srch-inp-userNm" uitype="text" class="form-control input-sm" placeholder=""></sbux-input>
							</td>
							<td colspan="2" class="td_input"></td>
							<th scope="row">유형</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-type" name="srch-slt-type" uitype="single" class="form-control fl_fixed mg_r5 wd_130" unselected-text="선택" disabled style="height:100%; line-height:100%;"></sbux-select>
							</td>
							<td colspan="2" class="td_input"></td>
						</tr>
					</tbody>
				</table>
											
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
			<div class="ad_tbl_top">
				<ul class="ad_tbl_count">
					<li><span>사용자 내역</span></li>
				</ul>
			</div>
			<div id="sb-area-grdUserDsctn" style="height:300px;"></div>
			</div>
		</div>
</section>
</body>
<script type="text/javascript">

window.addEventListener('DOMContentLoaded', function(e) {
	fn_createUserDsctnGrid();

	let today = new Date();
	let year = today.getFullYear();
	let month = ('0' + (today.getMonth() + 1)).slice(-2);
	let day = ('0' + today.getDate()).slice(-2);
	SBUxMethod.set("srch-dtp-inqYmd1", year+month+day);
	SBUxMethod.set("srch-dtp-inqYmd2", year+month+day);
})

function fn_createUserDsctnGrid() {
    var SBGridProperties1 = {};
	    SBGridProperties1.parentid = 'sb-area-grdUserDsctn';
	    SBGridProperties1.id = 'grdComMsgList';
	    SBGridProperties1.jsonref = 'jsonComMsgList';
	    SBGridProperties1.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties1.selectmode = 'byrow';
	    SBGridProperties1.extendlastcol = 'scroll';
	    SBGridProperties1.columns = [
	         {caption: ["선택"],			ref: 'msgKey',      type:'output',  width:'15%'},
	         {caption: ["사용자ID"], 		ref: 'msgCn',     	type:'input',  	width:'15%'},
	         {caption: ["사용자명"], 	 	ref: 'msgKndNm',    type:'output',  width:'15%'},
	         {caption: ["비밀번호"],    	ref: 'rmrk',        type:'output',  width:'15%'},
	         {caption: ["APC명"],	    ref: 'creUserId',   type:'output',  width:'15%'},
	         {caption: ["메일주소"],	    ref: 'creDateTime', type:'output',  width:'15%'},
	         {caption: ["전화번호"],  		ref: 'updUserId',   type:'output',  width:'15%'},
	         {caption: ["직책명"],  		ref: 'updUserId',   type:'output',  width:'15%'},
	         {caption: ["담당업무"],  		ref: 'updUserId',   type:'output',  width:'15%'},
	         {caption: ["사용유무"],  		ref: 'updUserId',   type:'input',  	width:'15%'},
	         {caption: ["잠김여부"],  		ref: 'updUserId',   type:'input',  	width:'15%'},
	         {caption: ["최종접속일시"],  	ref: 'updUserId',   type:'output',  width:'15%'}
    ];
    grdWghPrfmnc1 = _SBGrid.create(SBGridProperties1);
}
    
</script>

</html>