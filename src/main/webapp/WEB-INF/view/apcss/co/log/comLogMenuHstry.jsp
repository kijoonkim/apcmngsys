<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<section>
		<table class="table table-bordered tbl_fixed">
			<caption>검색 조건 설정</caption>
			<colgroup>
				<col style="width: 7%">
				<col style="width: 6%">
				<col style="width: 6%">
				<col style="width: 3%">
				<col style="width: 7%">
				<col style="width: 6%">
				<col style="width: 31%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="th_bg"><span class="data_required"></span>조회일자</th>
					<td class="td_input" style="border-right: hidden;">
						<sbux-datepicker id="srch-dtp-menuYmdFrom" name="srch-dtp-menuYmdFrom" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
					</td>
					<td class="td_input" style="border-right: hidden;">
						<sbux-datepicker id="srch-dtp-menuYmdTo" name="srch-dtp-menuYmdTo" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
					</td>
					<td></td>
					<th scope="row" class="th_bg">화면명</th>
					<td class="td_input" style="border-right: hidden;">
						<sbux-input id="srch-inp-scrnNm" name="srch-inp-scrnNm" uitype="text" class="form-control input-sm"></sbux-input>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="table-responsive tbl_scroll_sm">
			<div class="ad_tbl_top">
				<ul class="ad_tbl_count">
					<li><span>화면열람이력 정보</span></li>
				</ul>
			</div>	
			<div class="table-responsive tbl_scroll_sm">
				<div id="sb-area-logMenuHstry" style="height:400px;"></div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonLogMenuHstry = [];
	var grdLogMenuHstry = null;

	const tabLogMenuHstry = {
			prgrmId: 'logMenuHstryTab',
			gridId: 'grdLogMenuHstry',
			jsonId: 'jsonLogMenuHstry',
			areaId: "sb-area-logMenuHstry",
			prvApcCd: "",
			objGrid: null,
			gridJson: [],
			callbackFnc: function() {},
			init: async function(_apcCd, _apcNm, _callbackFnc) {
				if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
					this.callbackFnc = _callbackFnc;
				}

				if (grdLogMenuHstry === null || this.prvApcCd != _apcCd) {
					SBUxMethod.set("srch-dtp-menuYmdFrom", gfn_dateToYmd(new Date()));
					SBUxMethod.set("srch-dtp-menuYmdTo", gfn_dateToYmd(new Date()));
					this.createGrid();
					this.search();
				} else {
					this.search();
				}

				this.prvApcCd = _apcCd;
			},
			createGrid: function() {
				var SBGridProperties = {};
			    SBGridProperties.parentid = 'sb-area-logMenuHstry';
			    SBGridProperties.id = 'grdLogMenuHstry';
			    SBGridProperties.jsonref = 'jsonLogMenuHstry';
			    SBGridProperties.emptyrecords = '데이터가 없습니다.';
			    SBGridProperties.selectmode = 'byrow';
			    SBGridProperties.extendlastcol = 'scroll';
			    SBGridProperties.oneclickedit = true;
			    SBGridProperties.allowcopy = true;
				SBGridProperties.explorerbar = 'sortmove';
		    	SBGridProperties.paging = {
		    			'type' : 'page',
		    		  	'count' : 5,
		    		  	'size' : 20,
		    		  	'sorttype' : 'page',
		    		  	'showgoalpageui' : true
		    	    };
		        SBGridProperties.columns = [
		        	{caption: ['화면ID'], 	ref: 'scrnId',		width: '15%',	type: 'output',	style:'text-align: center'},
		            {caption: ['화면명'], 	ref: 'scrnNm', 		width: '15%', 	type: 'output',	style:'text-align: center'},
		            {caption: ['사용자ID'],	ref: 'userId', 		width: '15%', 	type: 'output',	style:'text-align: center'},
		            {caption: ['사용자명'],	ref: 'userNm', 		width: '15%', 	type: 'output',	style:'text-align: center'},
		            {caption: ['APC명'], 	ref: 'apcNm', 		width: '15%', 	type: 'output',	style:'text-align: center'},
		            {caption: ['접속일시'],	ref: 'spcfctNm',	width: '15%', 	type: 'output',	style:'text-align: center'},
		            {caption: ['종료일시'], 	ref: 'brndCd',		width: '15%', 	type: 'output',	style:'text-align: center'}
		        ];
		        grdLogMenuHstry = _SBGrid.create(SBGridProperties);
		        grdLogMenuHstry.bind( "afterpagechanged" , tabLogMenuHstry.setGrid );
			},
			search: async function() {
				// set pagination
				grdLogMenuHstry.rebuild();
		    	let recordCountPerPage = grdLogMenuHstry.getPageSize();
		    	let currentPageNo = 1;

		    	// grid clear
		    	jsonLogMenuHstry.length = 0;
		    	await this.setGrid(recordCountPerPage, currentPageNo);
			},
			setGrid: async function(recordCountPerPage, currentPageNo) {

				let apcCd = gv_selectedApcCd;
				let menuYmdFrom = SBUxMethod.get("srch-dtp-menuYmdFrom");
				let menuYmdTo = SBUxMethod.get("srch-dtp-menuYmdTo");
				let scrnNm = SBUxMethod.get("srch-inp-scrnNm");

		        const postJsonPromise = gfn_postJSON("/co/log/selectWrhsVhclList.do", {
		        		apcCd 				: apcCd
					  , menuYmdFrom 		: menuYmdFrom
					  , menuYmdTo 			: menuYmdTo
					  , scrnNm 				: scrnNm
					  , pagingYn 			: 'Y'
					  , currentPageNo 		: currentPageNo
					  , recordCountPerPage 	: recordCountPerPage
				});

		        const data = await postJsonPromise;

				try {
		        	/** @type {number} **/
		    		let totalRecordCount = 0;

		    		jsonLogMenuHstry.length = 0;
		        	data.resultList.forEach((item, index) => {
						const log = {
							userId			: item.rowSeq,
							userNm			: item.vhclno,
							apcNm 			: item.drvrNm
						}
						jsonLogMenuHstry.push(log);

						if (index === 0) {
							totalRecordCount = item.totalRecordCount;
						}
					});

		        	if (jsonLogMenuHstry.length > 0) {
		        		if(grdLogMenuHstry.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
		        			grdLogMenuHstry.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
		        			grdLogMenuHstry.rebuild();
						}else{
							grdLogMenuHstry.refresh();
						}
		        	} else {
		        		grdLogMenuHstry.setPageTotalCount(totalRecordCount);
		        		grdLogMenuHstry.rebuild();
		        	}
		        } catch (e) {
		    		if (!(e instanceof Error)) {
		    			e = new Error(e);
		    		}
		    		console.error("failed", e.message);
		        }
		    },
		    paging: function() {
		    	let recordCountPerPage = grdComAuthUserPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		    	let currentPageNo = grdComAuthUserPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

		    	popComAuthUser.setGrid(recordCountPerPage, currentPageNo);
		    }
		}
</script>
</html>