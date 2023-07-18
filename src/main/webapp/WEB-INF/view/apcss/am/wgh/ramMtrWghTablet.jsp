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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 원물계량등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDocRawMtrWgh" name="btnDocRawMtrWgh" uitype="button" class="btn btn-sm btn-primary">계량확인서</sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="button" class="btn btn-sm btn-outline-danger">초기화</sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger">조회</sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="button" class="btn btn-sm btn-outline-danger">등록</sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="button" class="btn btn-sm btn-outline-danger">삭제</sbux-button>
				</div>
			</div>
			<div></div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 5%">
						<col style="width: 4%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 2%">
						<col style="width: 3%">
						<col style="width: 5%">
						<col style="width: 2%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 12%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC 명</th>
							<td colspan="6" class="td_input"  style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">생산자</th>
							<td colspan="6" class="td_input"  style="border-right: hidden;">
								<input type="text" class="form-control input-sm">
							<td colspan="2" class="td_input"  style="border-right: hidden;">
								<button class="btn btn-xs btn-outline-dark" type="button">조회</button>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" style="border-right: hidden;"> → 초성 검색기능 적용</td>
						</tr>
						<tr>
							<th scope="row">품목 / 품종</th>
							<td colspan="2"class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
								<option>선택</option>
								</select>
							</td>
							<td colspan="4"class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
							<td colspan="2"class="td_input"  style="border-right: hidden;">
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_all">
									<label class="check_label" for="check_all">고정</label>
								</p>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="4" style="border-right: hidden;"> → 생산자 기본설정 값에 따라 자동으로 설정 or 고정 선택 시 해당품종 유지</td>
						</tr>
						<tr>
							<th scope="row">계량일자</th>
							<td colspan="6"class="td_input" style="border-right: hidden;">
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023-01-01" class="form-control pull-right input-sm">
									</div>
								</div>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2"  style="border-right: hidden;"> → 기본 현재일자로 지정</td>
						</tr>
						<tr>
							<th scope="row">차량번호/성명</th>
							<td class="td_input"><input type="text"
								class="form-control input-sm" placeholder="입력"title="">
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<button class="btn btn-xs btn-outline-dark" type="button">찾기</button>
							</td>
							<td colspan="3"class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="입력"disabled>
							</td>
						</tr>
						<tr>
							<th scope="row">전체/공차증량</th>
							<td class="td_input"  style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder=""title="">
							</td>
							<td colspan="3"class="td_input"  style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder=""title="">
							</td>
							<td colspan="2"class="td_input" style="border-right: hidden;"><label class="bold">감량 %</label></td>
							<td class="td_input">
								<select class="form-control input-sm"></select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_all">
									<label class="check_label" for="check_all">고정</label>
								</p>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;" class="td_input"><label class="bold">감량 Kg</label></td>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td class="td_input"><label class="bold">실중량 Kg</label></td>
							<td class="td_input">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
						</tr>
						<tr>
							<th scope="row">입고창고</th>
							<td class="td_input"  style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
							<td colspan="3"class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_all">
									<label class="check_label" for="check_all">고정</label>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row"  style="border-right: hidden;">팔레트/박스</th>
						 	<td style="border-right: hidden;"><button class="btn btn-xs btn-outline-dark" type="button">입력</button></td>
							<td colspan="3"class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td colspan="2"class="td_input" style="border-right: hidden;"><label class="bold">Kg</label></td>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td colspan="2"class="td_input" style="border-right: hidden;"><label class="bold">Kg</label></td>
						</tr>
						<tr>
							<th scope="row" >입고등급</th>
							<td style="border-right: hidden;"><button class="btn btn-xs btn-outline-dark" type="button">입력</button></td>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled >
							</td>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td class="td_input"  style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td class="td_input"  style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
						</tr>
						<tr>
							<th scope="row">정산중량</th>
							<td class="td_input"  style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td class="td_input"  style="border-right: hidden;"><label class="bold">Kg</label></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>개량등록 내역</span></li>
						</ul>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<table
							class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>
								<col style="width: 5%">
								<col style="width: 3%">
								<col style="width: 4%">
								<col style="width: 3%">
								<col style="width: 3%">
								<col style="width: 5%">
								<col style="width: 4%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 4%">
								<col style="width: 7%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">계량일자</th>
									<th scope="col">순번</th>
									<th scope="col">생산자</th>
									<th scope="col">품목</th>
									<th scope="col">품종</th>
									<th scope="col">차량번호</th>
									<th scope="col">기사명</th>
									<th scope="col">전체중량</th>
									<th scope="col">공차중량</th>
									<th scope="col">감량</th>
									<th scope="col">실중량</th>
									<th scope="col">정산중량</th>
									<th scope="col">창고</th>
									<th scope="col">비고</th>
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