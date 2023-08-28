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
			<div class="box-body">
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>조회일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-trsmYmdFrom" name="srch-dtp-trsmYmdFrom" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-trsmYmdTo" name="srch-dtp-trsmYmdTo" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">송수신구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-sendRcptnSeCd" name="srch-slt-sendRcptnSeCd" uitype="single" jsondata-ref="jsonComSendRcptnSeCd" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg">인터페이스명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-intrfcNm" name=srch-inp-intrfcNm uitype="text" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="table-responsive tbl_scroll_sm">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>송수신이력 정보</span></li>
						</ul>
					</div>	
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-logTrsmHstry" style="height:400px;"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonLogTrsmHstry = [];
	var jsonComSendRcptnSeCd = [];
	var grdLogTrsmHstry = null;

	const tabLogTrsmHstry = {
			prgrmId: 'logTrsmHstryTab',
			gridId: 'grdLogTrsmHstry',
			jsonId: 'jsonLogTrsmHstry',
			areaId: "sb-area-logTrsmHstry",
			prvApcCd: "",
			objGrid: null,
			gridJson: [],
			callbackFnc: function() {},
			init: async function(_apcCd, _apcNm, _callbackFnc) {
				if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
					this.callbackFnc = _callbackFnc;
				}

				if (grdLogTrsmHstry === null || this.prvApcCd != _apcCd) {
					SBUxMethod.set("srch-dtp-trsmYmdFrom", gfn_dateToYmd(new Date()));
					SBUxMethod.set("srch-dtp-trsmYmdTo", gfn_dateToYmd(new Date()));
					let rst = await Promise.all([
						gfn_setComCdSBSelect('srch-slt-sendRcptnSeCd', jsonComSendRcptnSeCd, 'SEND_RCPTN_SE_CD', gv_selectedApcCd),	// 창고구분
					]);
					this.createGrid();
					this.search();
				} else {
					this.search();
				}

				this.prvApcCd = _apcCd;
			},
			createGrid: function() {
				var SBGridProperties = {};
			    SBGridProperties.parentid = 'sb-area-logTrsmHstry';
			    SBGridProperties.id = 'grdLogTrsmHstry';
			    SBGridProperties.jsonref = 'jsonLogTrsmHstry';
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
		        	{caption: ['처리일시'], 		ref: 'prcsDt',			width: '15%',	type: 'output',	style:'text-align: center'},
		            {caption: ['인터페이스ID'], 	ref: 'intrfcId', 		width: '15%', 	type: 'output',	style:'text-align: center'},
		            {caption: ['인터페이스명'],		ref: 'intrfcNm', 		width: '15%', 	type: 'output',	style:'text-align: center'},
		            {caption: ['송수신구분'],		ref: 'sendRcptnSeCd', 	width: '15%', 	type: 'output',	style:'text-align: center'},
		            {caption: ['처리결과'], 		ref: 'vrtyNm', 			width: '15%', 	type: 'output',	style:'text-align: center'},
		            {caption: ['접속일시'], 		ref: 'spcfctNm',		width: '15%', 	type: 'output',	style:'text-align: center'},
		            {caption: ['종료일시'], 		ref: 'brndCd',			width: '15%', 	type: 'output',	style:'text-align: center'}
		        ];
		        grdLogTrsmHstry = _SBGrid.create(SBGridProperties);
		        grdLogTrsmHstry.bind( "afterpagechanged" , tabLogTrsmHstry.setGrid );
			},
			search: async function() {
				// set pagination
				grdLogTrsmHstry.rebuild();
		    	let recordCountPerPage = grdLogTrsmHstry.getPageSize();
		    	let currentPageNo = 1;

		    	// grid clear
		    	jsonLogTrsmHstry.length = 0;
		    	await this.setGrid(recordCountPerPage, currentPageNo);
			},
			setGrid: async function(recordCountPerPage, currentPageNo) {

				let apcCd = gv_selectedApcCd;
				let trsmYmdFrom = SBUxMethod.get("srch-dtp-trsmYmdFrom");
				let trsmYmdTo = SBUxMethod.get("srch-dtp-trsmYmdTo");
				let sendRcptnSeCd = SBUxMethod.get("srch-slt-sendRcptnSeCd");
				let intrfcNm = SBUxMethod.get("srch-inp-intrfcNm");

		        const postJsonPromise = gfn_postJSON("/co/log/selectWrhsVhclList.do", {
		        		apcCd 				: apcCd
					  , trsmYmdFrom 		: trsmYmdFrom
					  , trsmYmdTo 			: trsmYmdTo
					  , sendRcptnSeCd 		: sendRcptnSeCd
					  , intrfcNm 			: intrfcNm
					  , pagingYn 			: 'Y'
					  , currentPageNo 		: currentPageNo
					  , recordCountPerPage 	: recordCountPerPage
				});

		        const data = await postJsonPromise;

				try {
		        	/** @type {number} **/
		    		let totalRecordCount = 0;

		    		jsonLogTrsmHstry.length = 0;
		        	data.resultList.forEach((item, index) => {
						const log = {
							userId			: item.rowSeq,
							userNm			: item.vhclno,
							apcNm 			: item.drvrNm
						}
						jsonLogTrsmHstry.push(log);

						if (index === 0) {
							totalRecordCount = item.totalRecordCount;
						}
					});

		        	if (jsonLogTrsmHstry.length > 0) {
		        		if(grdLogTrsmHstry.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
		        			grdLogTrsmHstry.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
		        			grdLogTrsmHstry.rebuild();
						}else{
							grdLogTrsmHstry.refresh();
						}
		        	} else {
		        		grdLogTrsmHstry.setPageTotalCount(totalRecordCount);
		        		grdLogTrsmHstry.rebuild();
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