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
<html>
<head>
	<meta charset="UTF-8">
    <title>title : 엑셀 올리기</title>
</head>
<body>
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
							onclick="popImp.save()"
						></sbux-button>
						<sbux-button
							id="impPop-btn-close"
							name="impPop-btn-close"
							uitype="normal"
							text="종료"
							class="btn btn-sm btn-outline-danger"
							onclick="popImp.close()"
						></sbux-button>
					</div>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="sb-area-grdImpPop" style="height:380px;"></div>
					</div>
				</div>
				<input type="file" id="impPop-file-upload" name="impPop-file-upload" style="display:none;visibility: hidden;" onchange="popImp.afterUpload(event)">
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">

	var grdImpPop = null;
	var jsonImpPop = [];

	const popImp = {
			prgrmId: 'impPopup',
			modalId: 'modal-imp',
			gridId: 'grdImpPop',
			jsonref: 'jsonImpPop',
			sbAreaId: 'sb-area-grdImpPop',
			objSBGridProp: null,
			saveFnc: function() {},			
			callbackFnc: function() {},
			mappingFnc: function() {},
			changedFnc: function() {},
			valuechanged: function() {
				if (!gfn_isEmpty(popImp.changedFnc) && typeof popImp.changedFnc === 'function') {
					popImp.changedFnc(grdImpPop);
				}
			},
			init: function() {
				document.querySelector("#impPop-file-upload").value = "";
				grdImpPop = null;
				jsonImpPop.length = 0;
			},
			afterImport: function(e) {				
				if (!gfn_isEmpty(popImp.mappingFnc) && typeof popImp.mappingFnc === 'function') {
					popImp.mappingFnc(grdImpPop);
				}
			},
			afterUpload: async function(_file) {
				SBUxMethod.openModal(popImp.modalId);

				jsonImpPop.length = 0;
				// create grid
				popImp.createGrid();
				grdImpPop.importExcelData(_file);
			},
			importExcel: async function(
						_title, 
						_objSBGridProp, 
						_saveFnc, 
						_mappingFnc, 
						_changedFnc, 
						_callbackFnc) {	// return grid

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
				this.objSBGridProp.parentid = this.sbAreaId;
				this.objSBGridProp.id = this.gridId;
				this.objSBGridProp.jsonref = this.jsonref;
				grdImpPop = _SBGrid.create(this.objSBGridProp);
				grdImpPop.bind("afterimportexcel", this.afterImport);
				grdImpPop.bind('valuechanged', this.valuechanged);
			},
			save: async function() {
				if (!gfn_isEmpty(this.saveFnc) && typeof this.saveFnc === 'function') {
					await this.saveFnc(grdImpPop);
				}
			},
			close: function() {
				gfn_closeModal(this.modalId, this.callbackFnc);
			},
		}

</script>
</html>