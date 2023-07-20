<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header">
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSearchGrd" name="btnSearchGrd" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectGrdList()"></sbux-button>
						<sbux-button id="btnInsertGrd" name="btnInsertGrd" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertApcGrdList"></sbux-button>
						<sbux-button id="btnEndGrd" name="btnEndGrd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('grdSpcfctMngModal')"></sbux-button>

					</div>
				</div>
			</div>

			<div class="box-body">
				<div>
					<!--[pp] 검색 -->
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 7%">
							<col style="width: 15%">
							<col style="width: 7%">
							<col style="width: 15%">
							<col style="width: 7%">
							<col style="width: 15%">
							<col style="width: auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">APC명</th>
								<th>
									<sbux-input id=spcfct-inp-apcNm name="spcfct-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th scope="row">품목명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id=spcfct-inp-itemNm name="spcfct-inp-itemNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
									<sbux-input id=spcfct-inp-itemCd name="spcfct-inp-itemCd" uitype="hidden" class="form-control input-sm"></sbux-input>
								</th>
								<th scope="row">규격명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id=spcfct-inp-spcfctNm name="spcfct-inp-spcfctNm" uitype="text" class="form-control input-sm"></sbux-input>
								</th>
								<th>&nbsp;</th>
							</tr>
						</tbody>
					</table>

				</div>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<b>&nbsp;</b>

				<div class="row">

					<div class="col-sm-6">
						<div>
							<div id="grdGridArea" style="height:157px; width: 100%;"></div>
						</div>
					</div>


					<div class="col-sm-6">
						<div>
							<div id="apcGrdGridArea" style="height:157px; width: 100%;"></div>
						</div>
					</div>
					<b>&nbsp;</b>
				</div>
				<div class="">
					<table class="table table-bordered tbl_row tbl_fixed mg_t10">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 10%">
							<col style="width: 20%">
							<col style="width: 10%">
							<col style="width: 20%">
							<col style="width: auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">품목명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id=spcfct-inp-itemNm name="spcfct-inp-itemNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th scope="row">규격명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id=spcfct-inp-spcfctNm name="spcfct-inp-spcfctNm" uitype="text" class="form-control input-sm"></sbux-input>
								</th>
								<th>&nbsp;</th>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="row">
					<div class="col-sm-6">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span>품종등록</span></li>
								</ul>
							</div>
						<div>
							<div id="vrtyGridArea" style="height:157px; width: 100%;"></div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span class="font_default" >&nbsp;</span></li>
								</ul>
						</div>
						<div>
							<div id="apcVrtyGridArea" style="height:157px; width: 100%;"></div>
						</div>
					</div>
				</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
	</section>
</body>
</html>