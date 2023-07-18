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
				<h3 class="box-title"> ▶ 상품코드조회</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
						<sbux-button id="btnEnd" name="btnEnd" uitype="normal" class="btn btn-sm btn-outline-danger" text="종료"></sbux-button>
					</div>
				</div>
			</div>
			<div>
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
						<col style="width: 9%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r">APC명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcName" name="srch-inp-apcName" uitype="text" class="form-control input-sm" placeholder="통합조직" title="입력하세요." disabled></sbux-input>
							</td>
						</tr>
						<tr>
							<th class="ta_r">상품코드</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-gdsCode" name="srch-inp-gdsCode" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td></td>
							<th class="ta_r">품목</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-item" name="srch-slt-item" uitype="single" class="form-control"></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchItem" name="btnSrchItem" uitype="normal" class="btn btn-sm btn-outline-danger" text="찾기"></sbux-button>
							</td>
							<th class="ta_r">품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-vrty" name="srch-slt-vrty" uitype="single" unselected-text="멀티선택" class="form-control"></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" uitype="normal" class="btn btn-sm btn-outline-danger" text="찾기"></sbux-button>
							</td>
						</tr>
						<tr>
							<th>규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfct" name="srch-slt-spcfct" class="form-control" style="width: 80%;"></sbux-select>
							</td>
							<td></td>
							<th class="ta_r">상품등급</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-gdsGrd" name="srch-slt-gdsGrd" uitype="single" class="form-control" style="width: 70%;"></sbux-select>
							</td>
							<td></td>
							<th class="ta_r">브랜드</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-brand" name="srch-slt-brand" uitype="single" class="form-control"></sbux-select>
							</td>
							<td></td>
						</tr>
						<tr>
							<th>산지</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-plor" name="srch-slt-plor" uitype="single" class="form-control"></sbux-select>
							</td>
							<td></td>
							<th class="ta_r">포장구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-pckgKind" name="srch-slt-pckgKind" uitype="single" class="form-control"></sbux-select>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="ad_tbl_top">
				</div>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>상품코드내역</span></li>
					</ul>
				</div>
					<table class="table table-bordered table-hover tbl_col tbl_fixed">
						<colgroup>
							<col style="width: 8%">
							<col style="width: 8%">
							<col style="width: 10%">
							<col style="width: 8%">
							<col style="width: 8%">
							<col style="width: 8%">
							<col style="width: 8%">
							<col style="width: 8%">
							<col style="width: 8%">
							<col style="width: 10%">
						</colgroup>
						<thead>
							<tr>
								<th scope="row">
									상품코드
								</th>
								<th scope="row">
									상품명
								</th>
								<th scope="row">
									품목
								</th>
								<th scope="row">
									규격
								</th>
								<th scope="row">
									상품등급
								</th>
								<th scope="row">
									브랜드
								</th>
								<th scope="row">
									산지
								</th>
								<th scope="row">
									포장구분
								</th>
								<th scope="row" >
									입수
								</th>
								<th scope="row" >
									중량
								</th>
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
							</tr>
						</tbody>
					  </table>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
</html>