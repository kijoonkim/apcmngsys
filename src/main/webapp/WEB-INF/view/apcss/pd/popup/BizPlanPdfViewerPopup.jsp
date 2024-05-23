<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<!--
					<sbux-button id="btnSearchBppvPop" name="btnSearchBppvPop" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popbizPlanPdfViewer.search" onkeyup="enterKey();"></sbux-button>
					<sbux-button id="btnSavebizBppvPop" name="btnSavebizBppvPop" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popbizPlanPdfViewer.save"></sbux-button>
					<sbux-button id="btnEndBppvPop" name="btnEndBppvPop" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popbizPlanPdfViewer.close"></sbux-button>
					 -->
				</div>
			</div>

			<div class="box-body">
				<div id = "bizPlanArea">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶사업게획서/전환서</span>
							</li>
						</ul>
					</div>
					<div id = "iframeBizPlanPdfArea">
					</div>
					<table class="table table-bordered tbl_fixed">
						<caption>사업계획서/전환서 정보</caption>
						<colgroup>
							<col style="width: 10%">
							<col style="width: 25%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 20%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="col" class="th_bg">파일명</th>
								<td colspan="2">
									<sbux-input uitype="hidden" id="bppvPop-inp-bpFileSn" name="bppvPop-inp-bpFileSn" class="form-control input-sm" autocomplete="off"></sbux-input>
									<sbux-input
										uitype="text"
										id="bppvPop-inp-bpFileNm"
										name="bppvPop-inp-bpFileNm"
										class="form-control input-sm"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
								<th scope="col" class="th_bg">등록일</th>
								<td colspan="2">
									<sbux-input
										uitype="text"
										id="bppvPop-inp-bpUldDt"
										name="bppvPop-inp-bpUldDt"
										class="form-control input-sm"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
							</tr>
							<tr>
								<th scope="col" class="th_bg">법인명</th>
								<td>
									<sbux-input
										uitype="text"
										id="bppvPop-inp-bpCorpNm"
										name="bppvPop-inp-bpCorpNm"
										class="form-control input-sm"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
								<th scope="col" class="th_bg">사업자등록번호</th>
								<td>
									<sbux-input
										uitype="text"
										id="bppvPop-inp-bpBrno"
										name="bppvPop-inp-bpBrno"
										class="form-control input-sm"
										mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
								<th scope="col" class="th_bg">법인등록번호</th>
								<td>
									<sbux-input
										uitype="text"
										id="bppvPop-inp-bpCrno"
										name="bppvPop-inp-bpCrno"
										class="form-control input-sm"
										mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
							</tr>
							<tr>
								<th scope="col" class="th_bg">승인여부</th>
								<td>
									<sbux-input
										uitype="text"
										id="bppvPop-inp-bpStts"
										name="bppvPop-inp-bpStts"
										class="form-control input-sm"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
								<th scope="col" class="th_bg">승인자</th>
								<td>
									<sbux-input
										uitype="text"
										id="bppvPop-inp-bpAprvNm"
										name="bppvPop-inp-bpAprvNm"
										class="form-control input-sm"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
								<th scope="col" class="th_bg">승인시간</th>
								<td>
									<sbux-input
										uitype="text"
										id="bppvPop-inp-bpAprvDt"
										name="bppvPop-inp-bpAprvDt"
										class="form-control input-sm"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
							</tr>
							<tr>
								<th scope="col" class="th_bg">비고</th>
								<td colspan="5">
									<sbux-input
										uitype="text"
										id="bppvPop-inp-bpRmrk"
										name="bppvPop-inp-bpRmrk"
										class="form-control input-sm"
										autocomplete="off"
									></sbux-input>
								</td>
							</tr>
							<tr>
								<th scope="col" class="th_bg">반려사유</th>
								<td colspan="5">
									<sbux-input
										uitype="text"
										id="bppvPop-inp-bpRjctRsn"
										name="bppvPop-inp-bpRjctRsn"
										class="form-control input-sm"
										autocomplete="off"
									></sbux-input>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="box-header" style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">
							<sbux-button
								id="btnRmrkBppvPop"
								name="btnRmrkBppvPop"
								uitype="normal"
								text="비고저장"
								class="btn btn-sm btn-outline-danger"
								onclick="popBizPlanPdfViewer.fn_rmrk('BP')"
							></sbux-button>
							<sbux-button
								id="btnDownloadBppvPop"
								name="btnDownloadBppvPop"
								uitype="normal"
								class="btn btn-sm btn-outline-danger"
								text="다운로드"
								onclick="popBizPlanPdfViewer.fn_download('BP')"
							></sbux-button>
							<sbux-button
								id="btnAprvBppvPop"
								name="btnAprvBppvPop"
								uitype="normal"
								text="승인"
								class="btn btn-sm btn-outline-danger"
								onclick="popBizPlanPdfViewer.fn_aprv('BP')"
							></sbux-button>
							<sbux-button
								id="btnRjctBppvPop"
								name="btnRjctBppvPop"
								uitype="normal"
								text="반려"
								class="btn btn-sm btn-outline-danger"
								onclick="popBizPlanPdfViewer.fn_rjct('BP')"
							></sbux-button>
							<sbux-button
								id="btnCancelBppvPop"
								name="btnCancelBppvPop"
								uitype="normal"
								text="미승인"
								class="btn btn-sm btn-outline-danger"
								onclick="popBizPlanPdfViewer.fn_cancel('BP')"
							></sbux-button>
						</div>
					</div>
				</div><!-- bizPlanArea end -->
				<br>
				<br>
				<div id = "sgntrArea">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶서명 포함 스캔본</span>
							</li>
						</ul>
					</div>
					<div id = "iframeSgntrPdfArea">
					</div>
					<table class="table table-bordered tbl_fixed">
						<caption>사업계획서/전환서 정보</caption>
						<colgroup>
							<col style="width: 10%">
							<col style="width: 25%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 20%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="col" class="th_bg">파일명</th>
								<td colspan="2">
									<sbux-input uitype="hidden" id="bppvPop-inp-sFileSn" name="bppvPop-inp-sFileSn" class="form-control input-sm" autocomplete="off"></sbux-input>
									<sbux-input
										uitype="text"
										id="bppvPop-inp-sFileNm"
										name="bppvPop-inp-sFileNm"
										class="form-control input-sm"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
								<th scope="col" class="th_bg">등록일</th>
								<td colspan="2">
									<sbux-input
										uitype="text"
										id="bppvPop-inp-sUldDt"
										name="bppvPop-inp-sUldDt"
										class="form-control input-sm"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
							</tr>
							<tr>
								<th scope="col" class="th_bg">법인명</th>
								<td>
									<sbux-input
										uitype="text"
										id="bppvPop-inp-sCorpNm"
										name="bppvPop-inp-sCorpNm"
										class="form-control input-sm"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
								<th scope="col" class="th_bg">사업자등록번호</th>
								<td>
									<sbux-input
										uitype="text"
										id="bppvPop-inp-sBrno"
										name="bppvPop-inp-sBrno"
										class="form-control input-sm"
										mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
								<th scope="col" class="th_bg">법인등록번호</th>
								<td>
									<sbux-input
										uitype="text"
										id="bppvPop-inp-sCrno"
										name="bppvPop-inp-sCrno"
										class="form-control input-sm"
										mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
							</tr>
							<tr>
								<th scope="col" class="th_bg">승인여부</th>
								<td>
									<sbux-input
										uitype="text"
										id="bppvPop-inp-sStts"
										name="bppvPop-inp-sStts"
										class="form-control input-sm"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
								<th scope="col" class="th_bg">승인자</th>
								<td>
									<sbux-input
										uitype="text"
										id="bppvPop-inp-sAprvNm"
										name="bppvPop-inp-sAprvNm"
										class="form-control input-sm"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
								<th scope="col" class="th_bg">승인시간</th>
								<td>
									<sbux-input
										uitype="text"
										id="bppvPop-inp-sAprvDt"
										name="bppvPop-inp-sAprvDt"
										class="form-control input-sm"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
							</tr>
							<tr>
								<th scope="col" class="th_bg">비고</th>
								<td colspan="5">
									<sbux-input
										uitype="text"
										id="bppvPop-inp-sRmrk"
										name="bppvPop-inp-sRmrk"
										class="form-control input-sm"
										autocomplete="off"
									></sbux-input>
								</td>
							</tr>
							<tr>
								<th scope="col" class="th_bg">반려사유</th>
								<td colspan="5">
									<sbux-input
										uitype="text"
										id="bppvPop-inp-sRjctRsn"
										name="bppvPop-inp-sRjctRsn"
										class="form-control input-sm"
										autocomplete="off"
									></sbux-input>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="box-header" style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">
							<sbux-button
								id="btnRmrkBppvPop1"
								name="btnRmrkBppvPop1"
								uitype="normal"
								text="비고저장"
								class="btn btn-sm btn-outline-danger"
								onclick="popBizPlanPdfViewer.fn_rmrk('S')"
							></sbux-button>
							<sbux-button
								id="btnDownloadBppvPop1"
								name="btnDownloadBppvPop1"
								uitype="normal"
								class="btn btn-sm btn-outline-danger"
								text="다운로드"
								onclick="popBizPlanPdfViewer.fn_download('S')"
							></sbux-button>
							<sbux-button
								id="btnAprvBppvPop1"
								name="btnAprvBppvPop1"
								uitype="normal"
								text="승인"
								class="btn btn-sm btn-outline-danger"
								onclick="popBizPlanPdfViewer.fn_aprv('S')"
							></sbux-button>
							<sbux-button
								id="btnRjctBppvPop1"
								name="btnRjctBppvPop1"
								uitype="normal"
								text="반려"
								class="btn btn-sm btn-outline-danger"
								onclick="popBizPlanPdfViewer.fn_rjct('S')"
							></sbux-button>
							<sbux-button
								id="btnCancelBppvPop1"
								name="btnCancelBppvPop1"
								uitype="normal"
								text="미승인"
								class="btn btn-sm btn-outline-danger"
								onclick="popBizPlanPdfViewer.fn_cancel('S')"
							></sbux-button>
						</div>
					</div>
				</div><!-- sgntrArea end -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	//var jsonPopGrdFundArtcl= [];	// 자금항목 fundArtcl	Grid
	//var jsonPopFundArtcl= [];	// 자금항목 fundArtcl	srch

	var grdBizPlanPdfViewerPop = null;
	var jsonBizPlanPdfViewerPop = [];

	const popBizPlanPdfViewer = {
		prgrmId: 'bizPlanPdfViewerPopup',
		modalId: 'modal-bizPlanPdfViewer',
		gridId: 'grdBizPlanPdfViewerPop',
		jsonId: 'jsonBizPlanPdfViewerPop',
		areaId: "sb-area-grdBizPlanPdfViewerPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		bppvUserData: null,
		callbackFnc: function() {},
		init: async function( rowData , _callbackFnc) {
			console.log('bizPlanPdfViewer');

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}

			//초기화
			SBUxMethod.set('bppvPop-inp-bpCorpNm',null)//
			SBUxMethod.set('bppvPop-inp-bpBrno',null)//
			SBUxMethod.set('bppvPop-inp-bpCrno',null)//

			SBUxMethod.set('bppvPop-inp-sCorpNm',null)//
			SBUxMethod.set('bppvPop-inp-sBrno',null)//
			SBUxMethod.set('bppvPop-inp-sCrno',null)//

			this.bppvUserData = rowData;

			if(!gfn_isEmpty(rowData)){
				SBUxMethod.set('bppvPop-inp-bpCorpNm',rowData.corpNm)//
				SBUxMethod.set('bppvPop-inp-bpBrno',rowData.brno)//
				SBUxMethod.set('bppvPop-inp-bpCrno',rowData.crno)//

				SBUxMethod.set('bppvPop-inp-sCorpNm',rowData.corpNm)//
				SBUxMethod.set('bppvPop-inp-sBrno',rowData.brno)//
				SBUxMethod.set('bppvPop-inp-sCrno',rowData.crno)//
			}

			this.fn_search();
		},
		fn_close: function() {
			gfn_closeModal(this.modalId, this.callbackFnc);
		},
		fn_clearForm: function() {
			$('#iframeBizPlanPdfArea').empty();
			$('#iframeSgntrPdfArea').empty();
			//사업계획서/전환서
			SBUxMethod.set('bppvPop-inp-bpFileNm',null)//
			SBUxMethod.set('bppvPop-inp-bpUldDt',null)//
			SBUxMethod.set('bppvPop-inp-bpStts',null)//
			SBUxMethod.set('bppvPop-inp-bpAprvNm',null)//
			SBUxMethod.set('bppvPop-inp-bpAprvDt',null)//
			SBUxMethod.set('bppvPop-inp-bpRmrk',null)//
			SBUxMethod.set('bppvPop-inp-bpRjctRsn',null)//
			//서명 포함 스캔본
			SBUxMethod.set('bppvPop-inp-sFileNm',null)//
			SBUxMethod.set('bppvPop-inp-sUldDt',null)//
			SBUxMethod.set('bppvPop-inp-sStts',null)//
			SBUxMethod.set('bppvPop-inp-sAprvNm',null)//
			SBUxMethod.set('bppvPop-inp-sAprvDt',null)//
			SBUxMethod.set('bppvPop-inp-sRmrk',null)//
			SBUxMethod.set('bppvPop-inp-sRjctRsn',null)//
		},
		fn_search: async function(/** {boolean} */ isEditable) {
			this.fn_clearForm();

			const postJsonPromise = gfn_postJSON("/pd/pcorm/bppvSelectFilePathList.do", {
				//검색 파라미터
				brno : this.bppvUserData.brno
				,yr : this.bppvUserData.yr
				,dcmntKnd : "BP"
			});

			const data = await postJsonPromise;

			try {
				data.resultList.forEach((item, index) => {

					if(!gfn_isEmpty(item.filePathNm)){
						let $fileArea = null;

						if(item.dcmntKnd == 'BP'){
							$fileArea = $('#iframeBizPlanPdfArea');
							SBUxMethod.set('bppvPop-inp-bpFileNm',item.orgFileNm)//
							SBUxMethod.set('bppvPop-inp-bpUldDt',item.lastUldDt)//
							SBUxMethod.set('bppvPop-inp-bpStts',item.sttsNm)//
							SBUxMethod.set('bppvPop-inp-bpAprvNm',item.aprvNm)//
							SBUxMethod.set('bppvPop-inp-bpAprvDt',item.aprvDt)//
							SBUxMethod.set('bppvPop-inp-bpRmrk',item.rmrk)//
							SBUxMethod.set('bppvPop-inp-bpRjctRsn',item.rjctRsn)//
							SBUxMethod.set('bppvPop-inp-bpFileSn',item.fileSn)//
						}else if (item.dcmntKnd == 'S') {
							$fileArea = $('#iframeSgntrPdfArea');
							SBUxMethod.set('bppvPop-inp-sFileNm',item.orgFileNm)//
							SBUxMethod.set('bppvPop-inp-sUldDt',item.lastUldDt)//
							SBUxMethod.set('bppvPop-inp-sStts',item.sttsNm)//
							SBUxMethod.set('bppvPop-inp-sAprvNm',item.aprvNm)//
							SBUxMethod.set('bppvPop-inp-sAprvDt',item.aprvDt)//
							SBUxMethod.set('bppvPop-inp-sRmrk',item.rmrk)//
							SBUxMethod.set('bppvPop-inp-sRjctRsn',item.rjctRsn)//
							SBUxMethod.set('bppvPop-inp-sFileSn',item.fileSn)//
						}
						if(item.fileExtnNm == '.pdf'){
							let newfilePathNm = item.filePathNm.replace(/\\/g, "/");
							let filepath = "/pdfPath/" + newfilePathNm + '/' + item.srvrFileNm + "_" + item.fileExtnNm;

							const $iframe = $('<iframe>', {
								src: filepath,
								css: {
								width: '100%',
								height: '600px',
								border: '0'
							}
							});
							$fileArea.append($iframe);
						}
					}
				});
			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		},
		fn_aprv: async function(dcmntKnd) {
			console.log('asd');
			this.fn_update(dcmntKnd,"aprv",confirm("승인 처리 하시겠습니까?"));
		},
		fn_rjct: async function(dcmntKnd) {
			this.fn_update(dcmntKnd,"rjct",confirm("반려 처리 하시겠습니까?"));
		},
		fn_cancel: async function(dcmntKnd) {
			this.fn_update(dcmntKnd,"cancel",confirm("미승인 처리 하시겠습니까?"));
		},
		fn_rmrk: async function(dcmntKnd) {
			this.fn_update(dcmntKnd,"rmrk",true);
		},
		fn_update: async function(/*String 서류구분*/ dcmntKnd , /*String 업데이트구분*/ updtSeCd , /** {boolean} */ isConfirmed ) {

			if (!isConfirmed) return;

			//반려 사유
			let rjctRsn;
			let rmrk;
			if(dcmntKnd == "BP"){
				rjctRsn = SBUxMethod.get('bppvPop-inp-bpRjctRsn');
				rmrk = SBUxMethod.get('bppvPop-inp-bpRmrk');
			} else if (dcmntKnd == "S"){
				rjctRsn = SBUxMethod.get('bppvPop-inp-sRjctRsn');
				rmrk = SBUxMethod.get('bppvPop-inp-sRmrk');
			}

			const postJsonPromise = gfn_postJSON("/pd/pcorm/bppvUpdateSbmsnDcnmt.do", {
				dcmntKnd : dcmntKnd
				, brno : this.bppvUserData.brno
				, yr : this.bppvUserData.yr
				, updtSeCd : updtSeCd
				, rjctRsn : rjctRsn
				, rmrk : rmrk
			})
			const data = await postJsonPromise;

			try {
				if (_.isEqual("S", data.resultStatus)) {
					alert("처리 되었습니다.");
					this.fn_search();
				} else {
					console.log(data.resultMessage);
				}
			} catch(e) {
				console.log(data.resultMessage);
			}
		},
		fn_download: async function(dcmntKnd) {
			let fileSnVal;
			if(dcmntKnd == 'BP'){
				fileSnVal = SBUxMethod.get('bppvPop-inp-bpFileSn');
			} else if(dcmntKnd == 'S'){
				fileSnVal = SBUxMethod.get('bppvPop-inp-sFileSn');
			}
			if(gfn_isEmpty(fileSnVal)){
				return;
			}
			var url = "/pd/pcorm/download/"+fileSnVal;
	 		window.open(url);
		}
	}
</script>
</html>