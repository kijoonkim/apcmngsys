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
<script src="${pageContext.request.contextPath}/js/out/bundle.js"></script>

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
	/**신미네 엑셀 서식 변경 enum **/
	var excelObj = [{"팔레트번호":"pltno"}];

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
		// async function(_file) {
			afterUpload:async function handleFile(event) {
				const file = event.target.files[0];
				const reader = new FileReader();
				let desFlag = false;
				jsonImpPop.length = 0;
				await popImp.createGrid();

				SBUxMethod.openModal(popImp.modalId);

				let gridJson = grdImpPop.getColumns();

				const arrayBuffer = await new Promise((resolve, reject) => {
					reader.onload = function(e) {
						resolve(new Uint8Array(e.target.result));
					};
					reader.onerror = function(e) {
						reject(new Error("File read failed"));
					};
					reader.readAsArrayBuffer(file);
				});

				const workbook = XLSX.read(arrayBuffer, {type: 'array'});
				const firstSheetName = workbook.SheetNames[0];
				const worksheet = workbook.Sheets[firstSheetName];
				const jsonData = XLSX.utils.sheet_to_json(worksheet, {header: 1});
				const headers = jsonData[0];

				for (const item of headers) {
					const idx = headers.indexOf(item);
					if (item !== gridJson[idx].caption[0]) {
						desFlag = true;
						excelObj.forEach(obj => {
							Object.keys(obj).forEach(key => {
								if (item == key) {
									popImp.objSBGridProp.columns[idx].caption[0] = key;
									popImp.objSBGridProp.columns[idx].ref = obj[key];
									delete popImp.objSBGridProp.columns[idx].format;
								}
							});
						});
					}
				}

				grdImpPop = _SBGrid.create(popImp.objSBGridProp);
				grdImpPop.bind("afterimportexcel", popImp.afterImport);
				grdImpPop.bind('valuechanged', popImp.valuechanged);
				grdImpPop.importExcelData(event);
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