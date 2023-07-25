<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header">
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnCnptSech" name="btnCnptSech" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectCnptList()"></sbux-button>
						<sbux-button id="btnCnptReg" name="btnCnptReg" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertCnptList"></sbux-button>
						<sbux-button id="btnCnptEnd" name="btnCnptEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('cnptMngModal')"></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 20%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id=cnpt-inp-apcNm name="cnpt-inp-apcNm" uitype="text" class="form-control pull-right input-sm" disabled></sbux-input>
							</th>
							<th>
							</th>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>거래처 정보</span></li>
						</ul>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<div id="cnptMngGridArea" style="height:150px;"></div>
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>대형마트 발주서 접수관리</span></li>
							</ul>
						</div>
						<div id="ordrMngGridArea" style="height:220px;"></div>
					</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var cnptMngGridData = [
    ]; // 그리드의 참조 데이터 주소 선언
    function fn_cnptMngCreateGrid() {
    	SBUxMethod.set("cnpt-inp-apcNm", SBUxMethod.get("inp-apcNm"));
    	cnptMngGridData = [];
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'cnptMngGridArea';
	    SBGridProperties.id = 'cnptMngDatagrid';
	    SBGridProperties.jsonref = 'cnptMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
            {caption: ["코드"], 		ref: 'cnptCd',  	type:'output', width:'80px',     style:'text-align:center'},
            {caption: ["거래처명"], 	ref: 'cnptNm',  	type:'input',  width:'150px',    style:'text-align:center'},
            {caption: ["유형"], 		ref: 'cnptType',   	type:'combo',  width:'150px',    style:'text-align:center',
				typeinfo : {ref:'comboGridCnptTypeJsData', label:'label', value:'value', unselect: {label : '선택', value: ''}, displayui : true}},
            {caption: ["사업자번호"], 	ref: 'brno',  		type:'input',  width:'150px',    style:'text-align:center'},
            {caption: ["담당자"], 		ref: 'picNm',  		type:'input',  width:'100px',    style:'text-align:center'},
            {caption: ["전화번호"], 	ref: 'telno',  		type:'input',  width:'120px',    style:'text-align:center'},
            {caption: ["비고"], 		ref: 'rmrk',  		type:'input',  width:'270px',    style:'text-align:center'},
            {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"cnptMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"cnptMngDatagrid\", " + nRow + ")'>삭제</button>";
            	}
		    }}
        ];
        window.cnptMngDatagrid = _SBGrid.create(SBGridProperties);
        fn_selectCnptList();
    }

    async function fn_selectCnptList(){
		fn_callSelectCnptList();
	}


	async function fn_callSelectCnptList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectCnptList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        let newCnptGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let cnpt = {
					cnptCd 		: item.cnptCd
				  , cnptNm 		: item.cnptNm
				  , cnptType 	: item.cnptType
				  , brno 		: item.brno
				  , picNm 		: item.picNm
				  , telno 		: item.telno
				  , rmrk 		: item.rmrk
				  , delYn 		: item.delYn
				  , apcCd 		: item.apcCd
				}
				newCnptGridData.push(cnpt);
			});
        	cnptMngGridData = newCnptGridData;
        	cnptMngDatagrid.rebuild();
        	cnptMngDatagrid.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}


    var ordrMngGridData = [
    	{"martNm": "이마트", "ordrUrl" : "", "userId":"", "userPw":"", "useYn":"","prcsDt":""},
    	{"martNm": "노브랜드", "ordrUrl" : "", "userId":"", "userPw":"", "useYn":"","prcsDt":""},
    	{"martNm": "트레이더스", "ordrUrl" : "", "userId":"", "userPw":"", "useYn":"","prcsDt":""},
    	{"martNm": "GS리테일(슈파)", "ordrUrl" : "", "userId":"", "userPw":"", "useYn":"","prcsDt":""},
    	{"martNm": "홈플러스", "ordrUrl" : "", "userId":"", "userPw":"", "useYn":"","prcsDt":""},
    	{"martNm": "에브리데이", "ordrUrl" : "", "userId":"", "userPw":"", "useYn":"","prcsDt":""},
    	{"martNm": "SSG", "ordrUrl" : "", "userId":"", "userPw":"", "useYn":"","prcsDt":""},
    ]; // 그리드의 참조 데이터 주소 선언

    function fn_ordrMngCreateGrid() {
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'ordrMngGridArea';
	    SBGridProperties.id = 'ordrMngDatagrid';
	    SBGridProperties.jsonref = 'ordrMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["대형마트 명"], 		ref: 'martNm',  	type:'input',  width:'150px',     style:'text-align:center'},
            {caption: ["발주정보 URL"], 	ref: 'ordrUrl',  	type:'input',  width:'250px',    style:'text-align:center'},
            {caption: ["사용자ID"], 		ref: 'userId',  	type:'input',  width:'150px',    style:'text-align:center'},
            {caption: ["패스워드"], 		ref: 'userPw',  	type:'input',  width:'150px',    style:'text-align:center'},
            {caption: ["사용유무"], 		ref: 'useYn',   	type:'combo',  	width:'100px',    style:'text-align:center',
						typeinfo : {ref:'comboReverseYnJsData', label:'label', value:'value', displayui : true}},
            {caption: ["최종처리일시"], 	ref: 'prcsDt',  	type:'input',  width:'150px',    style:'text-align:center'}
        ];
        window.ordrMngDatagrid = _SBGrid.create(SBGridProperties);
    }
</script>
</html>