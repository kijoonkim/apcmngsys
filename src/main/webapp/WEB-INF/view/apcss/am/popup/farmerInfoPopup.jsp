<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 경영체정보 선택</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">경영체 정보 정보를 선택합니다.</span>
					</p>
					<p>
						
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchPrdcr" name="btnSearchPrdcr" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popFrmerInfo.search"></sbux-button>
					<sbux-button id="btnEndFrmer" name="btnEndFrmer" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popFrmerInfo.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="prdcr-inp-apcCd" name="prdcr-inp-apcCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 11%">
						<col style="width: 22%">
						<col style="width: 15%">
						<col style="width: 22%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>

							<th scope="row">농업인 번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-frmerSn" name="srch-inp-frmerSn" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
							<th class="th_bg">경영체 등록번호</th>
							<td class="td_input" style="border-right:hidden;">
									<sbux-input id="srch-inp-mngmstRegno" name="srch-inp-mngmstRegno" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				
					<div>
						<div id="sb-area-frmerInfo" style="height:300px; width: 100%;"></div>
					</div>
				</div>
				<!--[pp] //검색결과 -->

			</div>
		</div>
		
	</section>
</body>
<script >

	/* grid 내 select json */
	

	var grdFrmerInfo = null;
	var jsonFrmerInfo = [];
	var excelYn = "N";
	var editMode = false;

	const excelDwnldPrdcrPop = function () {
		grdPrdcrPop.exportLocalExcel("생산자 목록", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popFrmerInfo = {
		prgrmId: 'frmerPopup',
		modalId: 'modal-frmer',
		gridId: 'grdFrmerInfo',
		jsonId: 'jsonFrmerInfo',
		areaId: "sb-area-frmerInfo",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		objMenuListPrdcrPop : {
			"excelDwnldPop": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": excelDwnldPrdcrPop,		//콜백함수명
			}
		},
		callbackFnc: function() {},
		init: async function(_apcCd, _apcNm, _callbackFnc, _frmerSn, _latesFlag = false) {
				popFrmerInfo.createGrid();
				popFrmerInfo.setGrid();
				popFrmerInfo.callbackFnc = _callbackFnc;
				
				SBUxMethod.set('srch-inp-frmerSn',_frmerSn);
				grdFrmerInfo.bind('dblclick', popFrmerInfo.choice);
		},
		close: function(_frmer) {
			gfn_closeModal(popFrmerInfo.modalId, popFrmerInfo.callbackFnc, _frmer);
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	
		    SBGridProperties.id = this.gridId;			
		    SBGridProperties.jsonref = this.jsonId;		
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'free';
		    SBGridProperties.explorerbar = 'move';
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.allowcopy = true;
		    SBGridProperties.scrollbubbling = false;
		    SBGridProperties.frozencols = 2;
		    //SBGridProperties.contextmenu = true;					// 우클린 메뉴 호출 여부
		    //SBGridProperties.contextmenulist = this.objMenuListPrdcrPop;	// 우클릭 메뉴 리스트
		    SBGridProperties.dblclickeventarea = {fixed: false, empty: false};
		    SBGridProperties.columns = [
		    	{caption: ["농업인 번호"], 		ref: 'frmerSn',   	type:'input',  style:'text-align:center', hidden : false},
		        {caption: ["경영체 등록번호"], 	ref: 'bzobRgno',   	type:'input',     style:'text-align:center' ,width: '100px'},
		        {caption: ["경영주 및 경영주와 의 관계"], 	ref: 'mngerRelate',   	type:'input',     style:'text-align:center' ,width: '180px'},
		        {caption: ["경영주 법인 명"], 	ref: 'bzmCorpNm',   	type:'input',     style:'text-align:left' ,width: '200px'},
		        {caption: ["경영주 주민등록 주소"], 	ref: 'addr',   	type:'input',     style:'text-align:left' ,width: '300px'},
		        {caption: ["경영주 실거주 주소"], 	ref: 'rrsdAddr',   	type:'input',     style:'text-align:left' ,width: '300px'},
		        {caption: ["경영주 실거주 도로명 주소"], 	ref: 'rdnmAddr',   	type:'input',     style:'text-align:left' ,width: '300px'},
		        {caption: ["마을명"], 	ref: 'twNm',   	type:'input',     style:'text-align:left' ,width: '100px'},
		        {caption: ["개인 법인 구분코드명"], 	ref: 'perCorpDvcdNm',   	type:'input',     style:'text-align:center' ,width: '150px'},
		        {caption: ["내외국인 구분코드명"], 	ref: 'nafoDvcdNm',   	type:'input',     style:'text-align:center' ,width: '150px'},
		        {caption: ["전화번호"], 	ref: 'telno',   	type:'input',     style:'text-align:center' ,width: '100px'},
		        {caption: ["휴대 전화번호"], 	ref: 'mblTelno',   	type:'input',     style:'text-align:center' ,width: '100px'},
		        {caption: ["팩스 전화번호"], 	ref: 'faxTelno',   	type:'input',     style:'text-align:center' ,width: '100px'},
		        {caption: ["이메일 주소"], 	ref: 'emailAddr',   	type:'input',     style:'text-align:center' ,width: '100px'},
		        {caption: ["영농 시작 일자"], 	ref: 'famgStrYmd',   	type:'input',     style:'text-align:center' ,width: '100px'},
		        {caption: ["농업시작형태"], 	ref: 'farmngBeginStleCdNm',   	type:'input',     style:'text-align:center' ,width: '100px'},
		        {caption: ["농업종사형태"], 	ref: 'farmngEngageStleCdNm',   	type:'input',     style:'text-align:center' ,width: '100px'},
		        {caption: ["설립 년도"], 	ref: 'fndtYr',   	type:'input',     style:'text-align:center' ,width: '100px'},
		        {caption: ["사업자 등록 번호"], 	ref: 'bzmRgno',   	type:'input',     style:'text-align:center' ,width: '100px'},
		        {caption: ["대표자 명"], 	ref: 'reprNm',   	type:'input',     style:'text-align:center' ,width: '100px'},
		        {caption: ["대표자 주소"], 	ref: 'reprAddr',   	type:'input',     style:'text-align:left' ,width: '300px'},
		        {caption: ["생년월일"], 	ref: 'brthdy',   	type:'input',     style:'text-align:center' ,width: '100px'},
		        {caption: ["성별"], 	ref: 'sexdstn',   	type:'input',     style:'text-align:center' ,width: '100px'},
		        {caption: ['ROW STATUS'], ref: 'rowSts', hidden : true}
		    ];
		    grdFrmerInfo = _SBGrid.create(SBGridProperties);
		    grdFrmerInfo.bind('dblclick', popFrmerInfo.choice);
		},
		choice: function() {
			let nRow = grdFrmerInfo.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdFrmerInfo.getRowData(nRow);
				//SBUxMethod.set("srch-inp-frmerSn", rowData.frmerSn);
				
				gfn_closeModal(popFrmerInfo.modalId, popFrmerInfo.callbackFnc, rowData);
			}
		},
		
		search: async function(/** {boolean} */ isEditable) {
			popFrmerInfo.setGrid();
		},
		setGrid: async function() {

			let frmerSn = SBUxMethod.get("srch-inp-frmerSn");//
			let mngmstRegno = SBUxMethod.get("srch-inp-mngmstRegno");//
			
			const postJsonPromise = gfn_postJSON("/fm/farm/selectFarmerInfoList.do", {
	    		 frmerSn : frmerSn
	    		,mngmstRegno : mngmstRegno
			});

	        const data = await postJsonPromise;

			try {
				jsonFrmerInfo.length = 0;
	        	data.resultList.forEach((item, index) => {
					const FrmerInfo = {
							frmerSn : item.frmerSn
							  , bzobRgno 		: item.bzobRgno
							  , mngerRelate 	: item.mngerRelate
							  , bzmCorpNm 	: item.bzmCorpNm
							  , addr 		: item.addr
							  , rrsdAddr 		: item.rrsdAddr
							  , rdnmAddr 		: item.rdnmAddr
							  , twNm 		: item.twNm
							  , perCorpDvcdNm 		: item.perCorpDvcdNm
							  , nafoDvcdNm 		: item.nafoDvcdNm
							  , telno 		: item.telno
							  , mblTelno 		: item.mblTelno
							  , faxTelno 		: item.faxTelno
							  , emailAddr 		: item.emailAddr
							  , famgStrYmd 		: item.famgStrYmd
							  , farmngEngageStleCdNm 		: item.farmngEngageStleCdNm
							  , fndtYr 		: item.fndtYr
							  , bzmRgno 		: item.bzmRgno
							  , reprNm 		: item.reprNm
							  , reprAddr 		: item.reprAddr
							  , brthdy 		: item.brthdy
							  , sexdstn 		: item.sexdstn
					}
					jsonFrmerInfo.push(FrmerInfo);
				});
	        	grdFrmerInfo.rebuild();
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
	    
		}	
	}
</script>
</html>