<%
 /**
  * @Class Name : importExcelPopup.jsp
  * @Description : 엑셀import 팝업 화면
  * @author SI개발부
  * @since 2023.09.19
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	신정철			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 엑셀 올리기</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
				</div>
			</div>
			<div class="box-body">
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span id="impPop-spn-title"></span>
						</li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button
							id="impPop-btn-save"
							name="impPop-btn-save"
							uitype="normal"
							text="저장"
							class="btn btn-sm btn-outline-danger"
							onclick="instlInfoExcelPopup.save()"
						></sbux-button>
						<sbux-button
							id="impPop-btn-close"
							name="impPop-btn-close"
							uitype="normal"
							text="종료"
							class="btn btn-sm btn-outline-danger"
							onclick="instlInfoExcelPopup.close()"
						></sbux-button>
					</div>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="sb-area-grdinstlInfoExcelPopup" style="height:380px;"></div>
					</div>
				</div>
				<input type="file" id="impPop-file-upload" name="impPop-file-upload" style="display:none;visibility: hidden;" onchange="instlInfoExcelPopup.afterUpload(event)">
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">

	var grdinstlInfoExcelPopup = null;
	var jsoninstlInfoExcelPopup = [];

	const instlInfoExcelPopup = {
			prgrmId: 'instlInfoExcelPopup',
			modalId: 'modal-instlInfoExcelPopup',
			gridId: 'grdinstlInfoExcelPopup',
			jsonref: 'jsoninstlInfoExcelPopup',
			sbAreaId: 'sb-area-grdinstlInfoExcelPopup',
			objSBGridProp: null,
			saveFnc: function() {},
			callbackFnc: function() {},
			mappingFnc: function() {},
			changedFnc: function() {},
			valuechanged: function() {
				console.log("valuechanged");
				if (!gfn_isEmpty(instlInfoExcelPopup.changedFnc) && typeof instlInfoExcelPopup.changedFnc === 'function') {
					instlInfoExcelPopup.changedFnc(grdinstlInfoExcelPopup);
				}
			},
			init: function() {
				console.log("init");
				document.querySelector("#impPop-file-upload").value = "";
				grdinstlInfoExcelPopup = null;
				jsonImpPop.length = 0;
			},
			afterImport: function(e) {
				console.log("afterImport");
				if (!gfn_isEmpty(instlInfoExcelPopup.mappingFnc) && typeof instlInfoExcelPopup.mappingFnc === 'function') {
					instlInfoExcelPopup.mappingFnc(grdinstlInfoExcelPopup);
				}
			},
			afterUpload: async function(_file) {
				console.log("afterUpload");
				SBUxMethod.openModal(instlInfoExcelPopup.modalId);

				jsonImpPop.length = 0;
				// create grid
				instlInfoExcelPopup.createGrid();
				grdinstlInfoExcelPopup.importExcelData(_file);
			},
			importExcel: async function(
						_title,
						_objSBGridProp,
						_saveFnc,
						_mappingFnc,
						_changedFnc,
						_callbackFnc) {	// return grid
				console.log("importExcel");
				document.querySelector('#impPop-spn-title').innerText = _title;

				if (!gfn_isEmpty(_saveFnc) && typeof _saveFnc === 'function') {
					this.saveFnc = _saveFnc;
				}
				if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
					this.callbackFnc = _callbackFnc;
				}
				if (!gfn_isEmpty(_mappingFnc) && typeof _mappingFnc === 'function') {
					this.mappingFnc = _mappingFnc;
				}
				if (!gfn_isEmpty(_changedFnc) && typeof _changedFnc === 'function') {
					this.changedFnc = _changedFnc;
				}

				this.objSBGridProp = _objSBGridProp;

				document.querySelector("#impPop-file-upload").click();
			},
			createGrid: function() {
				console.log("createGrid");
				this.objSBGridProp.parentid = this.sbAreaId;
				this.objSBGridProp.id = this.gridId;
				this.objSBGridProp.jsonref = this.jsonref;
				grdinstlInfoExcelPopup = _SBGrid.create(this.objSBGridProp);
				grdinstlInfoExcelPopup.bind("afterimportexcel", this.afterImport);
				grdinstlInfoExcelPopup.bind('valuechanged', this.valuechanged);
			},
			save: async function() {
				console.log("save");
				if (!gfn_isEmpty(this.saveFnc) && typeof this.saveFnc === 'function') {
					await this.saveFnc(grdinstlInfoExcelPopup);
				}
			},
			close: function() {
				console.log("close");
				gfn_closeModal(this.modalId, this.callbackFnc);
			},
		}

</script>
</html>