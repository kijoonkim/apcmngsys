<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 사용자 선택</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">사용자를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;"></span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchApcUserInfo" name="btnSearchApcUserInfo" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popApcUserInfo.search"></sbux-button>
					<sbux-button id="btnEndApcUserInfo" name="btnEndApcUserInfo" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-apcUserInfo')"></sbux-button>
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
		                        <sbux-select
		                        	id="apcUserInfo-inp-apcCd"
		                        	name="apcUserInfo-inp-apcCd"
		                        	uitype="single"
		                        	jsondata-ref="cjsonApcList"
		                        	jsondata-text="apcNm"
		                        	jsondata-value="apcCd"
		                        	unselected-text="선택">
		                    </td>
		                </tr>
	                </tbody>
                </table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdApcUserInfo" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var grdApcUserInfo = null;
	var jsonApcUserInfoPopUp = [];



	const popApcUserInfo = {
		modalId: 'modal-apcUserInfo',
		gridId: 'grdApcUserInfo',
		jsonId: 'jsonApcUserInfoPopUp',
		areaId: "sb-area-grdApcUserInfo",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		apcCd :"",
		callbackSelectFnc: function() {},
		init: async function(_callbackChoiceFnc) {

			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}

			if (grdApcUserInfo === null) {
				this.createGrid();
				this.search();
			} else {
				this.search();
			}
		},
		close: function(_apcUser) {
			gfn_closeModal(this.modalId, this.callbackSelectFnc, _apcUser);
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
	 	        {caption: ['ID'], 			ref: 'userId', 	width: '200px', type: 'output', style:'text-align:center'},
	 	        {caption: ['사용자명'], 	ref: 'userNm', 	width: '200px', type: 'output', style:'text-align:center'},


		    ];
		    grdApcUserInfo = _SBGrid.create(SBGridProperties);
		    grdApcUserInfo.bind('dblclick', popApcUserInfo.choice);
		},
		choice: function() {
			let nRow = grdApcUserInfo.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdApcUserInfo.getRowData(nRow);
				popApcUserInfo.close(rowData);
			}
		},
		search: async function() {
			grdApcUserInfo.rebuild();

	    	// grid clear
	    	jsonApcUserInfoPopUp.length = 0;
	    	await this.setGrid();
		},
		setGrid: async function() {
			jsonApcUserInfoPopUp = [];
			var apcCd = SBUxMethod.get("apcUserInfo-inp-apcCd");
			if (apcCd === null){
				return;
			}
			let postJsonPromise = gfn_postJSON("/co/user/selectComUserList.do",{apcCd : apcCd});
		    let data = await postJsonPromise;

		    try{
		    	data.resultList.forEach((item, index) => {
					let apcUserInfo = {

	 				  apcCd 		: item.apcCd
	 				  , apcNm   : item.apcNm
	 				  , addr		: item.addr
	 				  , userId	: item.userId
	 				  , userNm  : item.userNm
					}
					jsonApcUserInfoPopUp.push(apcUserInfo);
				});

		    	grdApcUserInfo.rebuild();
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