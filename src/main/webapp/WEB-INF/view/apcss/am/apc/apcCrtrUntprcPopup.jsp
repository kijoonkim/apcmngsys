<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 기준단가 등록</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">기본 단가 정보를 등록하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">차후 출고시 수수료 단가 관리하기 위한 기초 정보입니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchApcCrtrUntprc" name="btnSearchApcCrtrUntprc" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchApcCrtrUntprc"></sbux-button>
					<sbux-button id="btnInsertApcCrtrUntprc" name="btnInsertApcCrtrUntprc" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveApcCrtrUntprc"></sbux-button>
					<sbux-button id="btnEndApcCrtrUntprc" name="btnEndApcCrtrUntprc" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-apcCrtrUntprc')"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 100px">
						<col style="width: 200px">
						<col style="width: 80px">
						<col style="width: 160px">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="apcCrtrUntprc-inp-apcNm" name="apcCrtrUntprc-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</th>
							<th>&nbsp</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdApcCrtrUntprc" style="height:250px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	//설비 등록
	var jsonApcCrtrUntprc = []; // 그리드의 참조 데이터 주소 선언
	var grdApcCrtrUntprc;

	const fn_ApcCrtrUntprcMngCreateGrid = async function() {

		SBUxMethod.set("apcCrtrUntprc-inp-apcNm", SBUxMethod.get("inp-apcNm"));
		jsonApcCrtrUntprc = [];
		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdApcCrtrUntprc';
	    SBGridProperties.id = 'grdApcCrtrUntprc';
	    SBGridProperties.jsonref = 'jsonApcCrtrUntprc';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.columns = [
			{caption: ["수수료명"], 	ref: 'cdVlNm',  	type:'output', width:'140px',    style:'text-align:center'},
	        {caption: ["단가"], 		ref: 'crtrUntprc',  type:'input',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,###.##'}, validate : gfn_chkByte.bind({byteLimit: 16})},
			{caption: ["표시설명"], 	ref: 'indctNm',  	type:'input',  width:'250px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 300})},
			{caption: ["사용유무"], 	ref: 'useYn',   	type:'combo',  width:'100px',    style:'text-align:center;',
				typeinfo : {ref:'comboUesYnJsData', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["APC코드"], 		ref: 'apcCd',   type:'output',  hidden : true},
	        {caption: ["기준단가코드"], 	ref: 'crtrUntprcCd',   type:'output',  hidden : true}
	    ];
	    grdApcCrtrUntprc = _SBGrid.create(SBGridProperties);
	    fn_searchApcCrtrUntprc();
	}

	const fn_searchApcCrtrUntprc = async function() {
		let apcCd 	= SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectApcCrtrUntprcList.do", {
    		apcCd 		: apcCd
		  , cdId	 	: 'CRTR_UNTPRC_CD'
			});
        let data = await postJsonPromise;
        jsonApcCrtrUntprc.length = 0;
        try{
  			if (_.isEqual("S", data.resultStatus)) {
  	        	data.resultList.forEach((item, index) => {
  					let apcCrtrUntprcVO = {
  						cdId 		: item.cdId
  					  , crtrUntprcCd: item.cdVl
  					  , cdVlNm 		: item.cdVlNm
  					  , crtrUntprc 	: item.crtrUntprc
  					  , indctNm 	: item.indctNm
  					  , useYn 		: item.useYn
  					  , delYn 		: item.delYn
  					  , apcCd 		: item.apcCd
  					}
  					jsonApcCrtrUntprc.push(apcCrtrUntprcVO);
  				});
  	        	grdApcCrtrUntprc.rebuild();

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_saveApcCrtrUntprc = async function() {
		let gridData = grdApcCrtrUntprc.getGridDataAll();
		let saveList = [];
		for (let i=1; i<=gridData.length; i++ ){

			let rowData = grdApcCrtrUntprc.getRowData(i);
			let rowSts = grdApcCrtrUntprc.getRowStatus(i);
			console.log("rowSts", rowSts)
			if (grdApcCrtrUntprc.getRowStatus(i) === 3) {
				rowData.rowSts = "I";
				saveList.push(rowData);
			}
			if (grdApcCrtrUntprc.getRowStatus(i) === 2) {
				rowData.rowSts = "U";
				saveList.push(rowData);
			}
		}
		if (gfn_comConfirm("Q0001", "저장")) {
			let postJsonPromise = gfn_postJSON("/am/cmns/multiSaveApcCrtrUntprcList.do", saveList);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
					fn_searchApcCrtrUntprc();
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);
	        	}
	        } catch(e) {
	        	console.error("failed", e.message);
	        }
		}
	}

	const fn_deleteApcCrtrUntprc = async function(apcCrtrUntprcVO, nRow) {
		let postJsonPromise = gfn_postJSON("/am/cmns/deleteApcCrtrUntprc.do", apcCrtrUntprcVO);
        let data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
				grdApcCrtrUntprc.deleteRow(nRow);
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch(e) {
        	console.error("failed", e.message);
        }
	}
</script>
</html>