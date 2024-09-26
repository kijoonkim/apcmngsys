<%
/**
 * @Class Name : ognzAprvApcPopup.jsp
 * @Description : 승인된 법인APC선택 화면
 * @author SI개발부
 * @since 2024.07.22
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	 ----------	 ---------------------------
 * @ 2024.07.22  신정철			최초 생성
 * @see
 *
 */
 %>
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
					<sbux-button 
						id="ognzAprvApc-btn-search" 
						name="ognzAprvApc-btn-search" 
						uitype="normal" 
						text="조회" 
						class="btn btn-sm btn-outline-danger" 
						onclick="popOgnzAprvApc.search"
					></sbux-button>
					<sbux-button
						id="ognzAprvApc-btn-close" 
						name="ognzAprvApc-btn-close" 
						uitype="normal" 
						text="종료" 
						class="btn btn-sm btn-outline-danger" 
						onclick="popOgnzAprvApc.close"
					></sbux-button>
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
		                        <sbux-input 
		                        	id="ognzAprvApc-inp-apcNm" 
		                        	name="ognzAprvApc-inp-apcNm" 
		                        	uitype="text" 
		                        	class="form-control input-sm"
		                        ></sbux-input>
		                    </td>
		                    <th scope="row" class="th_bg">APC코드</th>
		                    <td class="td_input" style="border-right: hidden;border-top: hidden">
		                        <sbux-input 
		                        	id="ognzAprvApc-inp-apcCd" 
		                        	name="ognzAprvApc-inp-apcCd" 
		                        	uitype="text" 
		                        	class="form-control input-sm"
		                        ></sbux-input>
		                    </td>
		                </tr>
	                </tbody>
                </table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdOgnzAprvApcPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var grdOgnzAprvApcPop = null;
	var jsonOgnzAprvApcPop = [];


	const popOgnzAprvApc = {
		modalId: 'modal-ognzAprvApc',
		gridId: 'grdOgnzAprvApcPop',
		jsonId: 'jsonOgnzAprvApcPop',
		areaId: "sb-area-grdOgnzAprvApcPop",
		objGrid: null,
		gridJson: [],
		initParam: {
			apcCd: "", apcNm: ""
		},
		callbackSelectFnc: function() {},
		init: async function(_param, _callbackChoiceFnc) {

			this.initParam.apcCd = _param.apcCd;
			this.initParam.apcNm = _param.apcNm;
			
			SBUxMethod.set("ognzAprvApc-inp-apcCd", _param.apcCd);
			SBUxMethod.set("ognzAprvApc-inp-apcNm", _param.apcNm);
			
			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}
			
			if (grdOgnzAprvApcPop === null) {
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
		    	{
	 	        	caption: ['APC코드'], 		
	 	        	ref: 'apcCd',		
	 	        	width: '10%', 
	 	        	type: 'output', 
	 	        	style:'text-align:center'
	 	        },
		    	{
	 	        	caption: ['APC명'], 		
	 	        	ref: 'apcNm',		
	 	        	width: '15%', 
	 	        	type: 'output', 
	 	        	style:'text-align:left'
	 	        },
	 	       	{
	 	        	caption: ['사업자번호'], 			
	 	        	ref: 'brno', 	
	 	        	width: '15%', 
	 	        	type: 'output', 
	 	        	style:'text-align:left'
	 	        },
	 	        {
	 	        	caption: ['주소'], 			
	 	        	ref: 'addr', 	
	 	        	width: '30%', 
	 	        	type: 'output', 
	 	        	style:'text-align:left'
	 	        },
	 	        {
	 	        	caption: ['시/도'], 			
	 	        	ref: 'ctpvNm', 	
	 	        	width: '10%', 
	 	        	type: 'output', 
	 	        	style:'text-align:left'
	 	        },
	 	        {
	 	        	caption: ['시/군/구'], 			
	 	        	ref: 'sggExpln', 	
	 	        	width: '20%', 
	 	        	type: 'output', 
	 	        	style:'text-align:left'
	 	        },
	 	        
		    ];
		    grdOgnzAprvApcPop = _SBGrid.create(SBGridProperties);
		    grdOgnzAprvApcPop.bind('dblclick', popOgnzAprvApc.choice);
		},
		choice: function() {
			let nRow = grdOgnzAprvApcPop.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdOgnzAprvApcPop.getRowData(nRow);
				popOgnzAprvApc.close(rowData);
			}
		},
		search: async function() {
			grdOgnzAprvApcPop.rebuild();

	    	// grid clear
	    	jsonOgnzAprvApcPop.length = 0;
	    	await this.setGrid();
		},
		setGrid: async function() {
			
			jsonOgnzApcPop = [];
			const apcNm = SBUxMethod.get("ognzAprvApc-inp-apcNm");
			const apcCd = SBUxMethod.get("ognzAprvApc-inp-apcCd");
			
			const param = {
				apcNm: apcNm, apcCd: apcCd
			}
			
			let postJsonPromise = gfn_postJSON("/co/apc/selectAprvApcInfoList.do", param);
		    let data = await postJsonPromise;

		    try{
		    	data.resultList.forEach((item, index) => {
		    		jsonOgnzAprvApcPop.push(item);
				});

		    	grdOgnzAprvApcPop.rebuild();
		    	
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