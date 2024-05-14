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
				<div>
					<p>
						<span style="font-weight:bold;">pdf 미리보기 샘플</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<!--
					<sbux-button id="btnSearchbizPlanPdfViewer" name="btnSearchbizPlanPdfViewer" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popbizPlanPdfViewer.search" onkeyup="enterKey();"></sbux-button>
					<sbux-button id="btnSavebizPlanPdfViewer" name="btnSavebizPlanPdfViewer" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popbizPlanPdfViewer.save"></sbux-button>
					<sbux-button id="btnEndbizPlanPdfViewer" name="btnEndbizPlanPdfViewer" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popbizPlanPdfViewer.close"></sbux-button>
					 -->
				</div>
			</div>

			<div class="box-body">
				<div id = "pdfArea">
					<sbux-pdfviewer id="test1" name="test1" width="900px" height="600px" url="/upload/pdf/test.pdf">
					</sbux-pdfviewer>

				</div>
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
		bizPlanPdfViewerBrno: null,
		callbackFnc: function() {},
		init: async function(_brno , _callbackFnc) {
			console.log('bizPlanPdfViewer');
			console.log('_brno = '+_brno);
			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}
			this.bizPlanPdfViewerBrno = _brno;
		},
		close: function() {
			gfn_closeModal(this.modalId, this.callbackFnc);
		},
		search: async function(/** {boolean} */ isEditable) {
			const postJsonPromise = gfn_postJSON("/pd/bsm/selectGetFilepath.do", {
				//검색 파라미터
				brno : this.bizPlanPdfViewerBrno
			});

			const data = await postJsonPromise;

			try {
				data.resultList.forEach((item, index) => {
					let filepath = item.filepath;
					$('#pdfArea').sbPdfviewer({
						name : 'sbScriptNm',
						url : filepath //pdf파일 경로
					});
				});

			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		}
	}
</script>
</html>