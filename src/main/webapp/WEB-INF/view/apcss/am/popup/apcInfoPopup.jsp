<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : APC 선택</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">APC를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;"></span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchApcInfo" name="btnSearchApcInfo" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popApcInfo.search"></sbux-button>
					<sbux-button id="btnEndApcInfo" name="btnEndApcInfo" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-apcInfo')"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table id="search_table" class="table table-bordered tbl_row tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                </colgroup>
	                <tbody>
		                <tr>
		                    <th scope="row" class="th_bg">APC명</th>
		                    <td class="td_input" style="border-right: hidden;border-top: hidden">
		                        <sbux-input id="apcInfo-inp-apcNm" name="apcInfo-inp-apcNm" uitype="text" class="form-control input-sm"></sbux-input>
		                    </td>
		                </tr>
	                </tbody>
                </table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdApcInfo" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var grdApcInfo = null;
	var jsonApcInfoPopUp = [];



	const popApcInfo = {
		modalId: 'modal-apcInfo',
		gridId: 'grdApcInfo',
		jsonId: 'jsonApcInfoPopUp',
		areaId: "sb-area-grdApcInfo",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		apcCd :"",
		callbackSelectFnc: function() {},
		init: async function(_callbackChoiceFnc) {

			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}

			if (grdApcInfo === null) {
				this.createGrid();
				this.search();
			} else {
				this.search();
			}
		},
		close: function(_apc) {
			gfn_closeModal(this.modalId, this.callbackSelectFnc, _apc);
		},
		createGrid: function() {
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
		    SBGridProperties.columns = [
	 	        {caption: ['APC명'], 		ref: 'apcNm',		width: '300px', type: 'output', style:'text-align:center'},
	 	        {caption: ['주소'], 			ref: 'addr', 	width: '200px', type: 'output', style:'text-align:center'},
	 	        {caption: ['APC코드'], 		ref: 'apcCd', 		hidden : true}

		    ];
		    grdApcInfo = _SBGrid.create(SBGridProperties);
		    grdApcInfo.bind('dblclick', popApcInfo.choice);
		},
		choice: function() {
			let nRow = grdApcInfo.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdApcInfo.getRowData(nRow);
				popApcInfo.close(rowData);
			}
		},
		search: async function() {
			grdApcInfo.rebuild();

	    	// grid clear
	    	jsonApcInfoPopUp.length = 0;
	    	await this.setGrid();
		},
		setGrid: async function() {
			jsonApcInfoPopUp = [];
			var apcNm = SBUxMethod.get("apcInfo-inp-apcNm")
			let postJsonPromise = gfn_postJSON("/am/apc/selectApcEvrmntStngListForFarmUser.do",{apcNm : apcNm});
		    let data = await postJsonPromise;

		    try{
		    	data.resultList.forEach((item, index) => {
					let apcInfo = {

	 				  apcCd 		: item.apcCd
	 				  , apcNm   : item.apcNm
	 				  , addr		: item.addr
					}
					jsonApcInfoPopUp.push(apcInfo);
				});

		    	grdApcInfo.rebuild();
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