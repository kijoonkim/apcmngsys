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
						<span style="font-weight:bold;">통합조직,출자출하조직을 선택합니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<!-- 팝업창이 어려개 include 하는 경우 중복 id,name 쓰면 안됨 변경 필수 -->
					<sbux-button id="btnSearchInvstmntSpmt2" name="btnSearchInvstmntSpmt2" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popInvstmntSpmt2.search"></sbux-button>
					<sbux-button id="btnEndInvstmntSpmt2" name="btnEndInvstmntSpmt2" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popInvstmntSpmt2.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="invstmnt-inp-apcCd2" name="invstmnt-inp-apcCd2" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<tbody>
						<tr>
							<th scope="row">사업자번호</th>
							<td colspan="2">
								<sbux-input id="srch-inp-code2" name="srch-inp-code2" uitype="text" class="form-control input-sm" onkeyenter="enterKey3();"></sbux-input>
							</td>
							<th scope="row">조직명</th>
							<td colspan="2">
								<sbux-input id="srch-inp-codeNm2" name="srch-inp-codeNm2" uitype="text" class="form-control input-sm" onkeyenter="enterKey3();"></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row">생산유통통합조직여부</th>
							<td>
								<sbux-select id="srch-slt-mainGbn2" name="srch-slt-mainGbn2" uitype="single" class="form-control input-sm" unselected-text="선택">
									<option-item value="Y">Y</option-item>
									<option-item value="N">N</option-item>
								</sbux-select>
							</td>
							<th scope="row">출자출하조직여부</th>
							<td>
								<sbux-select id="srch-slt-subGbn2" name="srch-slt-subGbn2" uitype="single" class="form-control input-sm" unselected-text="선택">
									<option-item value="Y">Y</option-item>
									<option-item value="N">N</option-item>
								</sbux-select>
							</td>
							<th colspan="2"></th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="color: black;">통합조직,출자출하조직 목록</span>
								<span style="font-size:12px">(조회건수 <span id="apc-pop-cnt2">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdInvstmntSpmtPop2" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var grdInvstmntSpmtPop2 = null;
	var jsonInvstmntSpmtPop2 = [];

	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popInvstmntSpmt2 = {
		prgrmId: 'InvstmntSpmtPopup2',
		modalId: 'modal-invstmntSpmt2',
		gridId: 'grdInvstmntSpmtPop2',
		jsonId: 'jsonInvstmntSpmtPop2',
		areaId: "sb-area-grdInvstmntSpmtPop2",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_apcCd, _apcNm, _callbackFnc) {

			SBUxMethod.set("invstmnt-inp-apcCd2", _apcCd);
			SBUxMethod.attr('btnSearchApc', 'disabled', false);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}
			this.createGrid();
			this.search();
		},
		close: function(rowData) {
			gfn_closeModal(this.modalId, this.callbackFnc, rowData);
		},
		choice: function() {
			let nRow = grdInvstmntSpmtPop2.getRow();
			let rowData = grdInvstmntSpmtPop2.getRowData(nRow);
			popInvstmntSpmt2.close(rowData);
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
		    SBGridProperties.id = this.gridId;			//'grdInvstmntSpmtPop2';					//'grdInvstmntSpmtPop2';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonInvstmntSpmtPop2';		//'jsonInvstmntSpmtPop2';
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'byrow';
		    SBGridProperties.explorerbar = 'sortmove';
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.allowcopy = true;
			SBGridProperties.explorerbar = 'sortmove';
		    SBGridProperties.scrollbubbling = false;
		    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
		    SBGridProperties.columns = [
		        {caption: ['사업자번호'], ref: 'mainCode', width: '120px', type: 'input', style: 'text-align:center'},
		        {caption: ['생산유통통합조직명'], ref: 'mainCodeNm', width: '150px', type: 'input', style: 'text-align:center'},
		        {caption: ['사업자번호'], ref: 'subCode', width: '120px', type: 'input', style: 'text-align:center'},
		        {caption: ['출자출하조직명'], ref: 'subCodeNm', width: '150px', type: 'input', style: 'text-align:center'},
		        {caption: ['생산유통통합조직여부'], ref: 'mainGbn', width: '80px', type: 'input', style: 'text-align:center'},
		        {caption: ['출자출하조직여부'], ref: 'subGbn', width: '80px', type: 'input', style: 'text-align:center'},
		        {caption: ['계약형태'], ref: 'gbnNmRemark', width: '300px', type: 'input', style: 'text-align:center'},
		    ];

		    grdInvstmntSpmtPop2 = _SBGrid.create(SBGridProperties);
		    grdInvstmntSpmtPop2.bind('beforepagechanged', this.paging);
		    grdInvstmntSpmtPop2.bind('dblclick', popInvstmntSpmt2.choice);	//'popInvstmntSpmt2Choice');
		    //this.search();
		},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdInvstmntSpmtPop2.rebuild();
	    	let pageSize = grdInvstmntSpmtPop2.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonInvstmntSpmtPop2.length = 0;
	    	grdInvstmntSpmtPop2.refresh();
	    	//grdInvstmntSpmtPop2.clearStatus();
	    	this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

	    	var code = SBUxMethod.get("srch-inp-code2");			//사업자 번호
	    	var codeNm = SBUxMethod.get("srch-inp-codeNm2");		//조직명
	    	var mainGbn = SBUxMethod.get("srch-slt-mainGbn2");	//생산유통통합조직여부
	    	var subGbn = SBUxMethod.get("srch-slt-subGbn2");		//출자출하조직여부

	        const postJsonPromise = gfn_postJSON("/fm/popup/selectInvstmntSpmtList.do", {
	        	searchCode : code,
	        	searchCodeNm : codeNm,
				mainGbn : mainGbn,
				subGbn : subGbn,
	        	// pagination
		  		pagingYn : 'Y',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize
			});

	        const data = await postJsonPromise;

			try {
	        	/** @type {number} **/
	    		let totalRecordCount = 0;

	    		jsonInvstmntSpmtPop2.length = 0;
	        	data.resultList.forEach((item, index) => {
					const apc = {
						mainCode	: item.mainCode,
						mainCodeNm	: item.mainCodeNm,
						subCode		: item.subCode,
						subCodeNm	: item.subCodeNm,
						mainGbn		: item.mainGbn,
						subGbn		: item.subGbn,
						gbnNmRemark	: item.gbnNmRemark,
					}
					jsonInvstmntSpmtPop2.push(apc);
					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

	        	if (jsonInvstmntSpmtPop2.length > 0) {
	        		if(grdInvstmntSpmtPop2.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdInvstmntSpmtPop2.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdInvstmntSpmtPop2.rebuild();
					}else{
						grdInvstmntSpmtPop2.refresh();
					}
	        	} else {
	        		grdInvstmntSpmtPop2.setPageTotalCount(totalRecordCount);
	        		grdInvstmntSpmtPop2.rebuild();
	        	}

	        	if (isEditable) {
	        		grdInvstmntSpmtPop2.setCellDisabled(0, 0, grdInvstmntSpmtPop2.getRows() - 1, grdInvstmntSpmtPop2.getCols() - 1, false);
	        		let nRow = grdInvstmntSpmtPop2.getRows();
					grdInvstmntSpmtPop2.addRow(true);
					grdInvstmntSpmtPop2.setCellDisabled(nRow, 0, nRow, grdInvstmntSpmtPop2.getCols() - 1, true);
	        	} else {
	        		grdInvstmntSpmtPop2.setCellDisabled(0, 0, grdInvstmntSpmtPop2.getRows() - 1, grdInvstmntSpmtPop2.getCols() - 1, true);
	        	}

	        	document.querySelector('#apc-pop-cnt2').innerText = totalRecordCount;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
	    },
	    paging: function() {
	    	let recordCountPerPage = grdInvstmntSpmtPop2.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdInvstmntSpmtPop2.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popInvstmntSpmt2.setGrid(recordCountPerPage, currentPageNo);
	    }
	}

function enterKey3() {
		if(window.event.keyCode == 13) {
			popInvstmntSpmt2.search();
		}
	}

	//null 체크
function nvlScnd(str, defaultStr){

       if(typeof str == "undefined" || str == null || str == "" || str == "null")
           str = defaultStr ;

       return str ;
   }



</script>
</html>