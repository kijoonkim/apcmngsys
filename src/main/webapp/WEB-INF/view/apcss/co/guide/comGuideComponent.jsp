<%
 /**
  * @Class Name : apcEvmntStng.jsp
  * @Description : APC환경설정 화면
  * @author SI개발부
  * @since 2023.05.30
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.05.30   	김호			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : APC환경설정</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false;">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ Ex) Component</h3>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 5%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r th_bg" rowspan="3">INPUT</th>
							<td scope="row" align="right">기본 input</td>
							<td scope="row" colspan="2">
								<sbux-input id="ex-inp" name="ex-inp" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td>SBUx에서 지원하는 기본 API중 input박스 형식</td>
						</tr>
						<tr>
							<td scope="row" align="right">3글자 제한 input</td>
							<td scope="row" colspan="2">
								<sbux-input id="ex-inp-maxLength" name="ex-inp-maxLength" uitype="text" class="form-control input-sm" maxlength="3"></sbux-input>
							</td>
							<td>SBUx에서 지원하는 기본 API중 input박스에 이름에 맞춘 3글자로 제한하는 형식</td>
						</tr>
						<tr>
							<td scope="row" align="right">전화번호 form</td>
							<td scope="row" colspan="2">
								<sbux-input id="ex-inp-telno" name="ex-inp-telno" uitype="text" class="form-control input-sm"
								mask = "{ 'mask': '999-999-9999', 'clearIncomplete': true, 'autoUnmask': true }"
								></sbux-input>
							</td>
							<td>SBUx에서 지원하는 기본 API중 input박스에 전화번호 양식에 맞춘 타입</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" rowspan="11">SELECT</th>
							<td scope="row" align="right">기본 select</td>
							<td scope="row" colspan="2">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="ex-slt"
									name="ex-slt"
									jsondata-ref="jsonComboExSlt"
									class="form-control input-sm input-sm-ast"
								></sbux-select>
							</td>
							<td>SBUx에서 지원하는 기본 API중 기본 콤보박스 형식</td>
						</tr>
						<tr>
							<td scope="row" align="right">품목/품종</td>
							<td scope="row">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm input-sm-ast"
									jsondata-ref="jsonComItem"
									onchange="fn_onChangeSrchItemCd(this)"
								/>
								</td>
								<td>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm input-sm-ast "
									jsondata-ref="jsonComVrty"
									jsondata-value="itemVrtyCd"
									onchange="fn_onChangeSrchVrtyCd(this)"
								/>
							</td>
							<td>품목과 품종에 대한 콤보박스 <br/>
								품목을 선택시 해당 품목에 퓸종이 출력된다.
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">창고</td>
							<td scope="row" colspan="2">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-warehouseSeCd"
									name="srch-slt-warehouseSeCd"
									class="form-control input-sm input-sm-ast "
									jsondata-ref="jsonComWarehouse"
								/>
							</td>
							<td>창고에 대한 콤보박스 <br/>
								해당 APC에 등록된 창고 목록들을 출력한다.
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">박스종류</td>
							<td scope="row" colspan="2">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-bxKnd"
									name="srch-slt-bxKnd"
									class="form-control input-sm"
									jsondata-ref="jsonComBx"
								/>
							</td>
							<td>박스종류에 대한 콤보박스 <br/>
								해당 APC에 등록된 박스종류를 출력한다.
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">규격</td>
							<td scope="row" colspan="2">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-spcfctCd"
									name="srch-slt-spcfctCd"
									class="form-control input-sm"
									jsondata-ref="jsonComSpcfct"
								/>
							</td>
							<td>규격에 대한 콤보박스 <br/>
								선택된 품목에 대한 규격 목록들을 출력한다.
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">출하포장단위</td>
							<td scope="row" colspan="2">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-spmtPckgUnitCd"
									name="srch-slt-spmtPckgUnitCd"
									class="form-control input-sm"
									jsondata-ref="jsonSpmtPckgUnitCd"
								/>
							</td>
							<td>출하포장단위에 대한 콤보박스 <br/>
								선택된 품목에 대한 출하포장단위 목록들을 출력한다.
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">입출고구분</td>
							<td scope="row" colspan="2">
								<sbux-select
									id="srch-slt-wrhsSpmtSe"
									name="srch-slt-wrhsSpmtSe"
									uitype="single"
									jsondata-ref="jsonWrhsSpmtSe"
									class="form-control input-sm"
									unselected-text="전체"
								/>
							</td>
							<td>입출고구분에 대한 콤보박스 <br/>
								입고와 출고를 구분하는 콤보박스 목록들을 출력한다.
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">팔레트/박스 구분</td>
							<td scope="row" colspan="2">
								<sbux-select
									id="srch-slt-pltBxSe"
									name="srch-slt-pltBxSe"
									uitype="single"
									jsondata-ref="jsonPltBxSe"
									class="form-control input-sm"
									unselected-text="전체"
								/>
							</td>
							<td>팔레트/박스 구분에 대한 콤보박스 <br/>
								팔레트와 박스를 구분하는 콤보박스 목록들을 출력한다.
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">선별기명</td>
							<td scope="row" colspan="2">
								<sbux-select
									uitype="single"
									id="srch-slt-inptFclt"
									name="srch-slt-inptFclt"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonComFclt"
								/>
							</td>
							<td>선별기에 대한 콤보박스 <br/>
								해당 APC에 등록된 선별기 목록들을 출력한다.
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">포장기명</td>
							<td scope="row" colspan="2">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-pckg"
									name="srch-slt-pckg"
									class="form-control input-sm"
									jsondata-ref="jsonComPckg"
								/>
							</td>
							<td>포장기 목록에 대한 콤보박스 <br/>
								해당 APC에 등록된 포장기 목록들을 출력한다.
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">운송회사명</td>
							<td scope="row" colspan="2">
								<sbux-select
									id="srch-slt-trsprtCo"
									name="srch-slt-trsprtCo"
									uitype="single"
									jsondata-ref="jsonTrsprtCo"
									class="form-control input-sm" 
									unselected-text="전체"
								/>
							</td>
							<td>운송회사 목록에 대한 콤보박스 <br/>
								해당 APC에 등록된 운송회사 목록들을 출력한다.
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" rowspan="2">DATAPICKER</th>
							<td scope="row" align="right">기본 datepicker</td>
							<td scope="row" class="td_input" colspan="2" style="text-align: right;">
								<sbux-datepicker
									id="srch-dtp-sortYmdFrom"
									name="srch-dtp-sortYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm"
									style="width:100%;"
								/>
							</td>
							<td>SBUx에서 지원하는 기본 API중 날짜 출력 형식</td>
						</tr>
						<tr>
							<td scope="row" align="right">기본 datepicker</td>
							<td scope="row" class="td_input">
								<sbux-datepicker
									id="srch-dtp-exYmdFrom"
									name="srch-dtp-exYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm"
									style="width:100%;"
								/>
							</td>
							<td scope="row" class="td_input">
								<sbux-datepicker
									id="srch-dtp-exYmdTo"
									name="srch-dtp-exYmdTo"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm"
									style="width:100%;"
								/>
							</td>
							<td>SBUx에서 지원하는 기본 API중 처음기간부터 뒤에 기간 까지 날짜 선택</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" rowspan="4">RADIO</th>
							<td scope="row" align="right">기본 radio</td>
							<td scope="row" class="td_input" colspan="2">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-exRadio"
										name="srch-rdo-exRadio"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComExRadio"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl"
									/>
								</p>
							</td>
							<td>SBUx에서 지원하는 기본 API중 라디오 형식</td>
						</tr>
						<tr>
							<td scope="row" align="right">입고구분</td>
							<td scope="row" class="td_input" colspan="2">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-wrhsSeCd"
										name="srch-rdo-wrhsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComWrhsSeCd"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl"
									/>
								</p>
							</td>
							<td>입고구분에 대한 라디오 형식<br/>
								로그인한 APC에 대한 입고구분명을 출력한다.
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">상품구분</td>
							<td scope="row" class="td_input" colspan="2">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-gdsSeCd"
										name="srch-rdo-gdsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComGdsSeCd"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl"
									/>
								</p>
							</td>
							<td>상품구분에 대한 라디오 형식<br/>
								로그인한 APC에 대한 상품명을 출력한다.
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">운송구분</td>
							<td scope="row" class="td_input" colspan="2">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-trsprtSeCd"
										name="srch-rdo-trsprtSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComTrsprtSeCd"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl"
									/>
								</p>
							</td>
							<td>운송구분에 대한 라디오 형식<br/>
								로그인한 APC에 대한 운송명을 출력한다.
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" rowspan="4">CHECKBOX</th>
							<td scope="row" align="right">기본 checkBox</td>
							<td scope="row" class="td_input" colspan="2">
								<p class="ad_input_row">
									<sbux-checkbox
										id="srch-chk-exCheckBox"
										name="srch-chk-exCheckBox"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonExCheckBox">
									</sbux-checkbox>
								</p>
							</td>
							<td>SBUx에서 재공하는 기본 API중 체크박스 형식</td>
						</tr>
						<tr>
							<td scope="row" align="right">입고구분</td>
							<td scope="row" class="td_input" colspan="2">
								<p class="ad_input_row">
									<sbux-checkbox
										id="dtl-chk-wrhsSeCd"
										name="dtl-chk-wrhsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonWrhsSeCd">
									</sbux-checkbox>
								</p>
							</td>
							<td>입고구분에 대한 체크박스<br/>
								로그인한 APC에 대해 등록된 입고구분명을 출력한다.
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">상품구분</td>
							<td scope="row" class="td_input" colspan="2">
								<p class="ad_input_row">
									<sbux-checkbox
										id="dtl-chk-gdsSeCd"
										name="dtl-chk-gdsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonGdsSeCd">
									</sbux-checkbox>
								</p>
							</td>
							<td>상품구분에 대한 체크박스<br/>
								로그인한 APC에 대해 등록된 상품명을 출력한다.
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">운송구분</td>
							<td scope="row" class="td_input" colspan="2">
								<p class="ad_input_row">
									<sbux-checkbox
										id="dtl-chk-trsprtSeCd"
										name="dtl-chk-trsprtSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonTrsprtSeCd">
									</sbux-checkbox>
								</p>
							</td>
							<td>운송구분에 대한 체크박스<br/>
								로그인한 APC에 등록된 운송구분명을 출력한다.
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonComItem = [];
	var jsonComVrty = [];
	var jsonComWarehouse = [];
	var jsonComBx = [];
	var jsonComSpcfct = [];
	var jsonSpmtPckgUnitCd = [];
	var jsonWrhsSpmtSe = [];
	var jsonPltBxSe = [];
	var jsonComFclt = [];
	var jsonComPckg = [];
	var jsonTrsprtCo = [];
	var jsonComExRadio = [];
	var jsonComWrhsSeCd = [];
	var jsonComGdsSeCd = [];
	var jsonComTrsprtSeCd = [];
	var jsonExCheckBox = [];
	var jsonWrhsSeCd = [];
	var jsonGdsSeCd = [];
	var jsonTrsprtSeCd = [];
	
	// 기본 체크박스 데이터
	jsonExCheckBox = [
		{text:'선택1', label:'선택1', value:'1', checked:'checked'},
		{text:'선택2', label:'선택2', value:'2', checked:'checked'},
		{text:'선택3', label:'선택3', value:'3', checked:'checked'},
		{text:'선택4', label:'선택4', value:'4', checked:'checked'}
	];
	
	// 기본 라디오 버튼 데이터
	jsonComExRadio = [
		{cdVlNm:'선택1', cdVl:'0000'},
		{cdVlNm:'선택2', cdVl:'0001'},
		{cdVlNm:'선택3', cdVl:'0002'},
		{cdVlNm:'선택4', cdVl:'0003'}
	];

	// 기본 콤보박스 데이터
	jsonComboExSlt = [
		{text:'선택1', value:'0000'},
		{text:'선택2', value:'0000'},
		{text:'선택3', value:'0000'},
		{text:'선택4', value:'0000'}
	];

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-sortYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-exYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-exYmdTo", gfn_dateToYmd(new Date()));
		
		fn_initSBSelect();
	});
	
	// 라디오 값 세팅
	const fn_setRadioData = async function(){
		SBUxMethod.set("srch-rdo-exRadio", "0000");
		SBUxMethod.set("srch-rdo-wrhsSeCd", "3"); // 입고구분 라디오 값 세팅
		SBUxMethod.set("srch-rdo-gdsSeCd", "1"); // 상품구분 라디오 값 세팅
		SBUxMethod.set("srch-rdo-trsprtSeCd", "1"); // 운송구분 라디오 값 세팅
	}

    /**
     * @name fn_initSBSelect
     * @description SBSelect JSON 불러오기
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let result = await Promise.all([
			 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_selectedApcCd),						// 품목
			 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 		gv_selectedApcCd),						// 품종
			 	gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD',	gv_selectedApcCd),	// 창고
			 	gfn_setPltBxSBSelect('srch-slt-bxKnd', 			jsonComBx, 			gv_selectedApcCd, 	'B'),				// 박스
			 	gfn_setComCdSBSelect('srch-slt-wrhsSpmtSe', 	jsonWrhsSpmtSe, 	'WRHS_SPMT_SE_CD'),						// 입출고구분
			 	gfn_setComCdSBSelect('srch-slt-pltBxSe', 		jsonPltBxSe, 		'PLT_BX_SE_CD'),						// 창고
			 	gfn_setComCdSBSelect('srch-slt-inptFclt', 		jsonComFclt, 		'SORT_FCLT_CD', 	gv_selectedApcCd),	// 설비
			 	gfn_setComCdSBSelect('srch-slt-pckg', 			jsonComPckg, 		'PCKG_FCLT_CD', 	gv_selectedApcCd),	// 포장기
			 	gfn_setTrsprtsSBSelect('srch-slt-trsprtCo', 	jsonTrsprtCo, 		gv_selectedApcCd),						// 운송회사
			 	gfn_setComCdSBSelect('srch-chk-wrhsSeCd', 		jsonWrhsSeCd, 		'WRHS_SE_CD'), 							// 운송구분
			 	gfn_setComCdSBSelect('srch-chk-gdsSeCd', 		jsonGdsSeCd, 		'GDS_SE_CD', 		gv_selectedApcCd), 	// 상품구분
			 	gfn_setComCdSBSelect('srch-chk-trsprtSeCd', 	jsonTrsprtSeCd, 	'TRSPRT_SE_CD'), 						// 운송구분
			]);
		
		let resultRadio = await Promise.all([
		 	gfn_getComCdDtls('WRHS_SE_CD'),
		 	gfn_getComCdDtls('GDS_SE_CD', gv_selectedApcCd),
    		gfn_getComCdDtls('TRSPRT_SE_CD')
		]);
		
		jsonWrhsSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('srch-chk-exCheckBox');
		jsonWrhsSeCd = gfn_getJsonFilter(jsonWrhsSeCd, 'value', ["1", "2", "3"]);
		jsonWrhsSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('dtl-chk-wrhsSeCd');
		jsonGdsSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('dtl-chk-gdsSeCd');
		jsonTrsprtSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('dtl-chk-trsprtSeCd');

		jsonComWrhsSeCd = gfn_getJsonFilter(resultRadio[0], 'cdVl', ["1", "2", "3"]);
		jsonComGdsSeCd = resultRadio[1];
		jsonComTrsprtSeCd = resultRadio[2];
		
		SBUxMethod.refresh('srch-rdo-wrhsSeCd');
		SBUxMethod.refresh('srch-rdo-gdsSeCd');
		SBUxMethod.refresh('srch-rdo-trsprtSeCd');
		
		await fn_setRadioData();
	}
	
	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd, itemCd),
		]);
		if(!gfn_isEmpty(itemCd)){
			await gfn_setSpmtPckgUnitSBSelect('srch-slt-spmtPckgUnitCd', jsonSpmtPckgUnitCd, gv_selectedApcCd, itemCd, "");		// 포장구분
			await gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonComSpcfct, gv_selectedApcCd,itemCd);
		}else{
			jsonSpmtPckgUnitCd.length=0;
			SBUxMethod.refresh('srch-slt-spmtPckgUnitCd');
			jsonApcSpcfct.length=0;
			SBUxMethod.refresh('srch-slt-spcfctCd');
		}
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		const itemCd = vrtyCd.substring(0,4);

		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if(!gfn_isEmpty(vrtyCd)){
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}
	}
	
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>