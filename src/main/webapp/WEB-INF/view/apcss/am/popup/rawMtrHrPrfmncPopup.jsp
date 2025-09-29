<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 입고예상마감설정</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<sbux-button id="btnSaveRawMtrHr" name="btnSaveRawMtrHr" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popRawMtrHrPrfmnc.save"></sbux-button>
					<sbux-button id="btnSearchRawMtrHr" name="btnSearchRawMtrHr" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popRawMtrHrPrfmnc.search"></sbux-button>
					<sbux-button id="btnEndRawMtrHr" name="btnEndRawMtrHr" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-rawMtrHrPrfmnc')"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<div>
					<!--[pp] 검색 -->
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 100px">
							<col style="width: 200px">
							<col style="width: 100px">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">일자</th>
							<th class="td_input">
								<sbux-datepicker
										id="rawMtrHr-dtp-wrhsYmd"
										name="rawMtrHr-dtp-wrhsYmd"
										uitype="popup"
										date-format="yyyy-mm-dd"
										class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
								></sbux-datepicker>
							</th>
							<th scope="row"></th>
						</tr>
						</tbody>
					</table>

				</div>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="row">
					<div class="ad_tbl_top"  style="width: 100%;">
						<ul class="ad_tbl_count">
							<li><span>시간별 내역</span></li>
						</ul>
					</div>
					<div>
						<div id="sb-area-rawMtrHrPrfmncPop" style="height:210px;width:100%; "></div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script >

	var grdRawMtrHrPrfmncPop
	var jsonRawMtrHrPrfmncPop = []
	var jsonHdofcExtrnlSeCdPop = [];

	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popRawMtrHrPrfmnc = {
		modalId: 'modal-rawMtrHrPrfmnc',
		prvApcCd : "",
		callbackFnc: function() {},
		init: async function(_apcCd) {
			prvApcCd = _apcCd;

			SBUxMethod.set('rawMtrHr-dtp-wrhsYmd', gfn_dateToYmd(new Date()))
			this.createGrid();
			await this.search();

		},
		search : async function () {

			jsonRawMtrHrPrfmncPop.length = 0;

			let postJsonPromise = gfn_postJSON("/am/wrhs/selectRawMtrHrPrfmncList.do", {
				apcCd 	: prvApcCd,
				wrhsYmd : SBUxMethod.get('rawMtrHr-dtp-wrhsYmd')
	 		});
		    let data = await postJsonPromise;

		    try{

				data.resultList.forEach((item, index) => {

					const rawMtrHrPrfmncVO = {
						  apcCd 		: item.apcCd
						, wrhsYmd 		: item.wrhsYmd
						, wrhsHmCd 		: item.wrhsHmCd
						, wrhsHmNm		: item.wrhsHmNm
						, rmrk			: item.rmrk
						, qntt1			: fn_zero(item.qntt1)
						, wght1			: fn_zero(item.wght1)
						, qntt2			: fn_zero(item.qntt2)
						, wght2			: fn_zero(item.wght2)
						, rowSts		: item.rowSts
					}
					jsonRawMtrHrPrfmncPop.push(rawMtrHrPrfmncVO)
				})

				grdRawMtrHrPrfmncPop.rebuild();

		    } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		    }
		},
		createGrid : async function () {
			var SBGridProperties = {};
			SBGridProperties.parentid = "sb-area-rawMtrHrPrfmncPop";
			SBGridProperties.id = "grdRawMtrHrPrfmncPop";
			SBGridProperties.jsonref = "jsonRawMtrHrPrfmncPop";
			SBGridProperties.emptyrecords = '데이터가 없습니다.';
			SBGridProperties.selectmode = 'free';
			SBGridProperties.oneclickedit = true;
			SBGridProperties.allowcopy = true;
			SBGridProperties.scrollbubbling = false;

			let columns = [
				{caption : ['시간'], 			ref: 'wrhsHmNm', 		type : 'output', 		width: '40%', 	style:'text-align:center;'},
			]
			let rst = await Promise.all([
				gfn_setComCdSBSelect('grdRawMtrHrPrfmncPop', 	jsonHdofcExtrnlSeCdPop,  		'HDOFC_EXTRNL_SE_CD')		// 본사/외부창고
			]);

			for (var i=1; i<=jsonHdofcExtrnlSeCdPop.length; i++) {

				let igiDtlCdCaption = jsonHdofcExtrnlSeCdPop[i-1].text;
				let igiDtlCdQnttRef = 'qntt' + i;
				columns.push(
						{
							caption : [igiDtlCdCaption],
							ref: igiDtlCdQnttRef,
							type: 'input',
							width: '30%',
							style:'text-align:right;',
							format : {type:'number', rule:'#,###'}
						},
				)
			}

			SBGridProperties.columns = columns;
			grdRawMtrHrPrfmncPop = _SBGrid.create(SBGridProperties);
			grdRawMtrHrPrfmncPop.rebuild();

		},
		close: function () {
			gfn_closeModal(this.modalId, this.callbackFnc());
		},
		save : async function () {
			let gridData = grdRawMtrHrPrfmncPop.getGridDataAll();

			let saveList = [];

			for (let i=0; i<gridData.length; i++) {

				let rowData = JSON.parse(JSON.stringify(gridData[i]));

				let rowSts = rowData.rowSts;
				let qntt1 = rowData.qntt1;
				let qntt2 = rowData.qntt2;

				if (rowSts == 'I' && (qntt1 > 0 || qntt2 > 0)) {

					let rawMtrHrPrfmncDtlList = [];
					for (let j=1; j <= jsonHdofcExtrnlSeCdPop.length; j++) {
						let qnttKey = 'qntt' + j;
						let qntt = rowData[qnttKey];

						if (qntt > 0) {
							let rawMtrHrPrfmncDtlVO = {
								  apcCd 	: rowData.apcCd
								, wrhsYmd 	: rowData.wrhsYmd
								, wrhsHmCd 	: rowData.wrhsHmCd
								, qntt 		: qntt
								, dtlCd		: jsonHdofcExtrnlSeCdPop[j-1].value
								, rowSts 	: rowData.rowSts
							};
							rawMtrHrPrfmncDtlList.push(rawMtrHrPrfmncDtlVO);
						}
					}

					if (rawMtrHrPrfmncDtlList.length > 0) {
						rowData.rawMtrHrPrfmncDtlList = rawMtrHrPrfmncDtlList;
						saveList.push(rowData);
					}
				}

				if (rowSts == 'U') {

					let rawMtrHrPrfmncDtlList = [];
					for (let k=1; k <= jsonHdofcExtrnlSeCdPop.length; k++) {
						let qnttKey = 'qntt' + k;
						let qntt = rowData[qnttKey];

						let rawMtrHrPrfmncDtlVO = {
							  apcCd 	: rowData.apcCd
							, wrhsYmd 	: rowData.wrhsYmd
							, wrhsHmCd 	: rowData.wrhsHmCd
							, qntt 		: qntt
							, dtlCd		: jsonHdofcExtrnlSeCdPop[k-1].value
							, rowSts 	: rowData.rowSts
						};
						rawMtrHrPrfmncDtlList.push(rawMtrHrPrfmncDtlVO);
					}

					if (rawMtrHrPrfmncDtlList.length > 0) {
						rowData.rawMtrHrPrfmncDtlList = rawMtrHrPrfmncDtlList;
						saveList.push(rowData);
					}
				}
			}

			const postJsonPromise = gfn_postJSON("/am/wrhs/multiSaveRawMtrHrPrfmncList.do", saveList);
			const data = await postJsonPromise;
			try{
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001");   // 처리되었습니다.
					this.search();
				} else {
					gfn_comAlert(data.resultCode, data.resultMessage);
				}
			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
				gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		},
	}

</script>
</html>