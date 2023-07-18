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
			<div class="box-header">
				<h3 class="box-title"> ▶ 포장실적조회</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSltnCfmtn" name="btnSltnCfmtn" uitype="normal" class="btn btn-sm btn-success" text="선별확인서"></sbux-button>
						<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
						<sbux-button id="btnEnd" name="btnEnd" uitype="normal" class="btn btn-sm btn-outline-danger" text="종료"></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
					    <col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcName" name="srch-inp-apcName" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row">포장일자</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-pckgDate" name="srch-dtp-pckgDate" uitype="range" class="form-control pull-right input-sm"></sbux-datepicker>
							</td>
							<th scope="row">품목</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-item" name="srch-slt-item" uitype="single" class="form-control input-sm"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchItem" name="btnSrchItem" uitype="normal" class="btn btn-xs btn-outline-dark" text="찾기"></sbux-button>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-vrty" name="srch-slt-vrty" uitype="single" unselected-text="멀티선택" class="form-control input-sm"></sbux-select>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" uitype="normal" class="btn btn-xs btn-outline-dark" text="찾기"></sbux-button>
							</td>
						</tr>
						<tr>
							<th scope="row">포장기</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-pckg" name="srch-slt-pckg" uitype="single" class="form-control input-sm"></sbux-select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" style="border-right: hidden;">저장창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-strg" name="srch-slt-strg" uitype="single" class="form-control input-sm"></sbux-select>
							<td colspan= "2" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfct" name="srch-slt-spcfct" uitype="single" class="form-control input-sm"></sbux-select>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" style="border-right: hidden;">대표생산자</th>
							<td class="td_input">
								<sbux-input id="srch-inp-rprsPrdctr" name="srch-inp-rprsPrdctr" uitype="text" class="form-control input-sm" title="대표생산자"></sbux-input>
						    </td>
						    <td class="td_input">
					    		<sbux-button id="btnSrchRprsPrdctr" name="btnSrchRprsPrdctr" uitype="normal" class="btn btn-xs btn-outline-dark" text="찾기"></sbux-button>
							</td>
							<th scope="row">상품등급</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-gdsGrd" name="srch-slt-gdsGrd" uitype="single" class="form-control input-sm"></sbux-select>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<td>&nbsp;</td>
							<li><span>포장내역</span></li>
							<td>&nbsp;</td>
						<li><span>포장수량/중량 : 99/99,999 Kg</span></li>
						</ul>
					</div>
						<div class="table-responsive tbl_scroll_sm">
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>

								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 6%">
								<col style="width: 4%">
								<col style="width: 4%">
								<col style="width: 4%">
								<col style="width: 4%">
								<col style="width: 4%">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">포장내역</th>
									<th rowspan="2">포장일자</th>
									<th rowspan="2">지시번호</th>
									<th rowspan="2">품종</th>
									<th rowspan="2">규격</th>
									<th rowspan="2">상품등급</th>
									<th rowspan="2">중량</th>
									<th rowspan="2">포장기</th>
									<th rowspan="2">대표생산자</th>
									<th rowspan="2">창고</th>
									<th colspan="2">포장</th>
									<th colspan="2">출하</th>
								</tr>
								<tr>
									<th scope="col">수량</th>
									<th scope="col">중량</th>
									<th scope="col">수량</th>
									<th scope="col">중량</th>
								</tr>

							</thead>
							<tbody>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
</html>