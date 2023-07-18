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
				<h3 class="box-title">▶ 포장투입등록 (테블릿)</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-outline-danger">초기화</button>
						<button type="button" class="btn btn-sm btn-outline-danger">조회</button>
						<button type="button" class="btn btn-sm btn-outline-danger">등록</button>
						<button type="button" class="btn btn-sm btn-outline-danger">삭제</button>
						<button type="button" class="btn btn-sm btn-outline-danger">종료</button>
					</div>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 6%">
						<col style="width: 8%">
						<col style="width: 6%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
						<tr>
							<th scope="row">APC명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">포장기</th>
							<td colspan= "3" class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option></option>
								</select>
							</td>
							<td>
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_all">
									<label class="check_label" for="check_all">고정</label>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">선별번호/등급</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm">
							<td class="td_input">
								<button class="btn btn-xs btn-outline-dark" type="button"> 조회 </button>
						  	</td>
				        </tr>
						<tr>
							<th scope="row">생산지시번호</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm">
							<td class="td_input" style="border-right: hidden;">
								<button class="btn btn-xs btn-outline-success" type="button">조회</button>
						    </td>
						</tr>
						<tr>
							<th scope="row">투입일자</th>
							<td class="td_input">
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023-01-01" class="form-control pull-right input-sm">
									</div>
								</div>
							</td>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">투입수량/중량</th>
							<td class="td_input"  style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder=""title="">
							</td>
							<td class="td_input" style="border-right: hidden;"><input type="text" class="form-control input-sm" placeholder=""title="">
							</td>
							<td style="border-right: hidden;"><label class="bold">Kg</label></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm" disabled>
									<option>선택</option>
								</select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm" disabled>
									<option>선택</option>
								</select>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">선별수량/중량</th>
							<td class="td_input" style="border-right: hidden;"><input type="text"
								class="form-control input-sm" placeholder="" disabled>
							</td>
							<td class="td_input" style="border-right: hidden;"><input type="text"
								class="form-control input-sm" placeholder="" disabled>
							<td style="border-right: hidden;"><label class="bold">Kg</label></td>
						</tr>
						<tr>
							<th scope="row">규 격 명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;"><input type="text"
								class="form-control input-sm" placeholder="" disabled>
							</td>
							<td>&nbsp;</td>
						</tr>

					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>포장투입 내역</span></li>
						</ul>
					</div>
					<div class="table-responsive tbl_scroll_sm">
					<table	class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>

								<col style="width: 9%">
								<col style="width: 9%">
								<col style="width: 9%">
								<col style="width: 9%">
								<col style="width: 4%">
								<col style="width: 4%">
								<col style="width: 7%">
								<col style="width: 7%">
								<col style="width: 7%">
								<col style="width: 15%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">투입일자</th>
									<th scope="col">포장기명</th>
									<th scope="col">선별번호/등급</th>
									<th scope="col">생산지시번호</th>
									<th scope="col">품목</th>
									<th scope="col">품종</th>
									<th scope="col">투입수량</th>
									<th scope="col">투입중량</th>
									<th scope="col">규격명</th>
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

				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
</html>