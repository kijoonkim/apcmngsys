<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
				<h3 class="box-title" style="line-height: 30px;"> ▶ ${comMenuVO.menuNm}</h3><!-- 선별투입등록(태블릿) -->
				</div>
				<div style="margin-left: auto;">
						<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset()"></sbux-button>
						<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectSortInptList"></sbux-button>
						<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save()"></sbux-button>
						<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete()"></sbux-button>
						<sbux-button id="btnEnd" name="btnEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger"></sbux-button>
				</div>
			</div>
			<div class="box-body">
			<!--[APC] START -->
				<%@ include file="../../../frame/inc/apcSelect.jsp" %>
			<!--[APC] END -->
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 8%">
						<col style="width: 8%">
						<col style="width: 8%">
						<col style="width: 8%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>선별기명</th>
							<td colspan= "2" class="td_input"  style="border-right:hidden ;">
								<sbux-select id="slt-fcltNm" name="slt-fcltNm" uitype="single" class="form-control input-sm input-sm-ast inpt_data_reqed" unselected-text="선택"></sbux-select>
							</td>
							<td colspan="2" style="border-right:hidden ;">
								<p class="ad_input_row">
									<sbux-checkbox id="chk-slt-fcltNm" name="chk-slt-fcltNm" uitype="normal" text="고정"></sbux-checkbox>
								</p>
							</td>
							<td class="td_input"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>팔레트번호</th>
							<td colspan="2" class="td_input" style="border-right:hidden ;">
								<sbux-input id="inp-plt" name="inp-plt" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-input>
							<td class="td_input" colspan="2" style="border-right:hidden ;">
								<sbux-button id="btn-plt" name="btn-plt" uitype="normal" text="조회" class="btn btn-xs btn-outline-dark"></sbux-button>
						    </td>
						    <td class="td_input"></td>
			            </tr>
						<tr>
							<th scope="row" class="th_bg">투입지시번호</th>
							<td colspan="2" class="td_input" style="border-right:hidden ;">
								<sbux-input id="inp-inptCmnd" name="inp-plt" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" colspan="2" style="border-right:hidden ;">
								<sbux-button id="btn-inq" name="btn-inq" uitype="normal" text="조회" class="btn btn-xs btn-outline-success"></sbux-button>
						    </td>
						    <td class="td_input"></td>
					    </tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>투입일자</th>
							<td class="td_input" colspan="2" style="border-right:hidden ;">
								<sbux-datepicker id="srch-dtp-inptYmd" name="srch-dtp-inptYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed" style="width:100%;"></sbux-datepicker>
						    </td>
							<td colspan="2" style="border-right:hidden;"></td>
							<td class="td_input"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>투입수량/중량</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-input id="srch-inp-inptQntt" name="input_text" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-input id="srch-inp-inptSortWght" name="inp-inptSortWght" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed" placeholder="" title=""></sbux-input>
							</td>
							<td style="border-right:hidden ;"><label class="bold">Kg</label></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목 / 품종</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-input id="srch-inp-item" name="srch-inp-item" uitype="text" class="form-control input-sm" placeholder="" title="" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-input id="srch-inp-vrty" name="srch-inp-vrty" uitype="text" class="form-control input-sm" placeholder="" title="" disabled></sbux-input>
							</td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">생산지</th>
							<td colspan="2" class="td_input" style="border-right:hidden ;">
								<sbux-input id="inp-prdcrCd" name="inp-prdcrCd" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고일자</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-datepicker id="srch-dtp-wrhsYmd" name="srch-dtp-wrhsYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc" style="width:100%;"></sbux-datepicker>
							</td>
							<td colspan="3" style="border-left:hidden;"></td>
						</tr>
							<tr>
							<th scope="row" class="th_bg">박스종류</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-input id="srch-inp-bxKnd" name="srch-inp-bxKnd" uitype="text" class="form-control input-sm" placeholder="" title="" disabled></sbux-input>
							</td>
							<td colspan="4"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">원물창고</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-input id="srch-inp-rawMtrWarehouse" name="srch-inp-rawMtrWarehouse" uitype="text" class="form-control input-sm" placeholder="" title="" disabled></sbux-input>
							</td>
							<td colspan="4"></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>선별투입 내역</span></li>
						</ul>
					</div>
					<div id="sb-area-grdSortInptDsctn" style="height:250px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
    <!-- 팔레트/박스 선택 Modal -->
    <div>
        <sbux-modal id="modal-pltBx" name="modal-pltBx" uitype="middle" header-title="원물입고 팔레트/박스 입고등록" body-html-id="body-modal-pltBx" footer-is-close-button="false" style="width:1200px"></sbux-modal>
    </div>
    <div id="body-modal-pltBx">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/pltBxPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
function fn_closeModal(modalId){
	SBUxMethod.closeModal(modalId);
}
	// ${comMenuVO.menuId}

	// 공통코드 JSON
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd
	
	//오늘 날짜 구하기
	let today = new Date();
	let year = today.getFullYear();
	let month = ('0' + (today.getMonth() + 1)).slice(-2);
	let day = ('0' + today.getDate()).slice(-2);
	
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_createSortInptDsctnGrid();
    	//apcNm 설정
    	SBUxMethod.set("inp-apcCd", gv_apcNm);

		
		SBUxMethod.set("srch-dtp-inptYmd", year+month+day);
		SBUxMethod.set("srch-dtp-wrhsYmd", year+month+day);
		
		fn_selectSortInptList();
    });

    //grid 초기화
    var grdComMsgList; // 그리드를 담기위한 객체 선언
    var jsonComMsgList = []; // 그리드의 참조 데이터 주소 선언

    function fn_createSortInptDsctnGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSortInptDsctn';
	    SBGridProperties.id = 'grdComMsgList';
	    SBGridProperties.jsonref = 'jsonComMsgList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
        SBGridProperties.columns = [
            {caption: ["투입일자"],		ref: 'inptYmd',      		type:'output',  width:'9%',    style:'text-align:center'},
            {caption: ["선별기명"], 		ref: 'sortNm',     			type:'output',  width:'9%',    style:'text-align:center'},
            {caption: ["팔레트번호"], 	ref: 'pltNo',    			type:'output',  width:'9%',    style:'text-align:center'},
            {caption: ["투입지시번호"],  ref: 'inptCmndNo',        	type:'output',  width:'9%',    style:'text-align:center'},
            {caption: ["품목"],	    	ref: 'itemNm',   			type:'output',  width:'5%',    style:'text-align:center'},
            {caption: ["품종"],	    	ref: 'vrtyNm', 				type:'output',  width:'5%',    style:'text-align:center'},
            {caption: ["투입중량"],  	ref: 'inptSortWght',   		type:'output',  width:'9%',    style:'text-align:center'},
            {caption: ["생산자"],  		ref: 'prdcrCd',   			type:'output',  width:'9%',    style:'text-align:center'},
            {caption: ["입고일자"],  	ref: 'wrhsYmd', 			type:'output',  width:'9%',    style:'text-align:center'},
            {caption: ["박스종류"],  	ref: 'bxKnd', 				type:'output',  width:'9%',    style:'text-align:center'},
            {caption: ["원물창고"], 		ref: 'rawMtrWarehouse',		type:'output',  width:'9%',    style:'text-align:center'},
            {caption: ["비고"], 			ref: 'rmrk',  				type:'output',  width:'9%',    style:'text-align:center'}
        ];

        grdComMsgList = _SBGrid.create(SBGridProperties);
    }
    
    //검색조건 초기화
    function fn_reset() {
    	console.log('초기화버튼 클릭');
    	console.log('fn_reset');
    	SBUxMethod.clear("slt-fcltNm", null);
        SBUxMethod.clear("inp-plt", null);
        SBUxMethod.clear("inp-inptCmnd", null);
        SBUxMethod.set("srch-dtp-inptYmd", year+month+day);
		SBUxMethod.set("srch-dtp-wrhsYmd", year+month+day);
        SBUxMethod.clear("srch-inp-inptQntt", null);
        SBUxMethod.clear("srch-inp-inptSortWght", null);
        SBUxMethod.clear("srch-inp-item", null);
        SBUxMethod.clear("srch-inp-vrty", null);
        SBUxMethod.clear("ainp-prdcrCd", null);
        SBUxMethod.clear("srch-inp-bxKnd", null);
        SBUxMethod.clear("srch-inp-rawMtrWarehouse", null);
    }
    
  //조회 
    const fn_selectSortInptList = async function() {
    	grdComMsgList.rebuild();
    	let pageSize = grdComMsgList.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonComMsgList.length = 0;
    	grdComMsgList.clearStatus();
    	fn_callSelectSortInptList(pageSize, pageNo);
    	
    }

    var newSortInptPrfmncGridData = [];
	const fn_callSelectSortInptList = async function(pageSize, pageNo) {
    	let apcNm  = SBUxMethod.get("inp-apcCd");
    	let pltNo  = SBUxMethod.get("inp-plt");
    	let fcltNm = SBUxMethod.get("slt-fcltNm");
    	let inptCmndNo = SBUxMethod.get("inp-inptCmnd");
    	let inptYmd = SBUxMethod.get("srch-dtp-inptYmd");
		let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");
		let inptSortWght = SBUxMethod.get("srch-inp-inptSortWght");
		let itemNm = SBUxMethod.get("srch-inp-item");
		let vrtyNm = SBUxMethod.get("srch-inp-vrty");
		let prdcrCd = SBUxMethod.get("ainp-prdcrCd");
		let bxKnd = SBUxMethod.get("srch-inp-bxKnd");
		let rawMtrWarehouse = SBUxMethod.get("srch-inp-rawMtrWarehouse");
    	
    	console.log('apcNm',apcNm);
    	
		const postJsonPromise = gfn_postJSON("/am/sort/sortPrfmncInq.do", {
   			apcNm: apcNm,
   			fcltNm: fcltNm,
   			pltNo: pltNo,
   			inptCmndNo: inptCmndNo,
   			wrhsYmd: wrhsYmd,
   			inptSortWght: inptSortWght,
   			itemNm: itemNm,
   			vrtyNm: vrtyNm,
   			prdcrCd: prdcrCd,
   			bxKnd: bxKnd,
   			rawMtrWarehouse: rawMtrWarehouse,

          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

		console.log('test','test');
        let data = await postJsonPromise;                
        newSortInptPrfmncGridData = [];
        sortInptPrfmncGridData = [];
        
  		try {

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonComMsgList.length = 0;
          	data.resultList.forEach((item, index) => {
          		const rawMtrWrhs = {
          			  fcltNm: item.fcltNm
          			, pltNo: item.pltNo
          			, inptYmd: item.inptYmd
   					, sortNm: item.sortNm
   					, pltNo: item.pltNo
   					, inptCmndNo: item.inptCmndNo
   					, itemNm: item.itemNm
   					, vrtyNm: item.vrtyNm
   					, inptSortWght: item.inptSortWght
   					, prdcrCd: item.prdcrCd
   					, wrhsYmd: item.wrhsYmd
   					, bxKnd: item.bxKnd
   					, rawMtrWarehouse: item.rawMtrWarehouse
   					, rmrk: item.rmrk
  				}
  				jsonComMsgList.push(rawMtrWrhs);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

          	if (jsonComMsgList.length > 0) {
          		if(grdComMsgList.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdComMsgList.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdComMsgList.rebuild();
  				}else{
  					grdComMsgList.refresh();
  				}
          	} else {
          		grdComMsgList.setPageTotalCount(totalRecordCount);
          		grdComMsgList.rebuild();
          	}

          	document.querySelector('#listCount').innerText = totalRecordCount;

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
    }

    //저장버튼
    async function fn_updataUserList(){
    	fn_callUpdateUserList();
    }

    async function fn_callUpdateUserList(){
    	console.log("sortInptPrfmncGridData", sortInptPrfmncGridData);
    	console.log("sortInptPrfmncGridData.length", sortInptPrfmncGridData.length);
    	
    	let regMsg = "등록 하시겠습니까?";
    	if(confirm(regMsg)){
    		console.log('newSortInptPrfmncGridData',newSortInptPrfmncGridData);
    		console.log('sortInptPrfmncGridData',sortInptPrfmncGridData);
//     		let postJsonPromise = gfn_postJSON("/am/cmns/compareComUserAprv.do", {origin : newSortInptPrfmncGridData, modified : sortInptPrfmncGridData});
    		let postJsonPromise = await gfn_postJSON("/co/user/compareComUserAprv.do", {origin : newSortInptPrfmncGridData, modified : sortInptPrfmncGridData});
    		alert("등록 되었습니다.");
    	}
    	fn_selectUserList();

    }

</script>
</html>