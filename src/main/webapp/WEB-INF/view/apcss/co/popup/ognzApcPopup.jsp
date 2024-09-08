<%
/**
 * @Class Name : ognzApcPopup.jsp
 * @Description : 법인APC선택 화면
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
						id="ognzApc-btn-search" 
						name="ognzApc-btn-search" 
						uitype="normal" 
						text="조회" 
						class="btn btn-sm btn-outline-danger" 
						onclick="popOgnzApc.search"
					></sbux-button>
					<sbux-button
						id="ognzApc-btn-close" 
						name="ognzApc-btn-close" 
						uitype="normal" 
						text="종료" 
						class="btn btn-sm btn-outline-danger" 
						onclick="popOgnzApc.close"
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
		                        	id="ognzApc-inp-apcNm" 
		                        	name="ognzApc-inp-apcNm" 
		                        	uitype="text" 
		                        	class="form-control input-sm"
		                        ></sbux-input>
		                    </td>
		                    <th scope="row" class="th_bg">APC코드</th>
		                    <td class="td_input" style="border-right: hidden;border-top: hidden">
		                        <sbux-input 
		                        	id="ognzApc-inp-apcCd" 
		                        	name="ognzApc-inp-apcCd" 
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
					<div id="sb-area-grdOgnzApcPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var grdOgnzApcPop = null;
	var jsonOgnzApcPop = [];


	const popOgnzApc = {
		modalId: 'modal-ognzApc',
		gridId: 'grdOgnzApcPop',
		jsonId: 'jsonOgnzApcPop',
		areaId: "sb-area-grdOgnzApcPop",
		objGrid: null,
		gridJson: [],
		initParam: {
			apcCd: "", apcNm: ""
		},
		callbackSelectFnc: function() {},
		init: async function(_param, _callbackChoiceFnc) {

			this.initParam.apcCd = _param.apcCd;
			this.initParam.apcNm = _param.apcNm;
			
			SBUxMethod.set("ognzApc-inp-apcCd", _param.apcCd);
			SBUxMethod.set("ognzApc-inp-apcNm", _param.apcNm);
			
			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}
			
			if (grdOgnzApcPop === null) {
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
	 	        	width: '20%', 
	 	        	type: 'output', 
	 	        	style:'text-align:left'
	 	        },
	 	       	{
	 	        	caption: ['사업자번호'], 			
	 	        	ref: 'addr', 	
	 	        	width: '20%', 
	 	        	type: 'output', 
	 	        	style:'text-align:left'
	 	        },
	 	        {
	 	        	caption: ['주소'], 			
	 	        	ref: 'addr', 	
	 	        	width: '50%', 
	 	        	type: 'output', 
	 	        	style:'text-align:left'
	 	        },
		    ];
		    grdOgnzApcPop = _SBGrid.create(SBGridProperties);
		    grdOgnzApcPop.bind('dblclick', popOgnzApc.choice);
		},
		choice: function() {
			let nRow = grdOgnzApcPop.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdOgnzApcPop.getRowData(nRow);
				popOgnzApc.close(rowData);
			}
		},
		search: async function() {
			grdOgnzApcPop.rebuild();

	    	// grid clear
	    	jsonOgnzApcPop.length = 0;
	    	await this.setGrid();
		},
		setGrid: async function() {
			
			jsonOgnzApcPop = [];
			const apcNm = SBUxMethod.get("ognzApc-inp-apcNm");
			const apcCd = SBUxMethod.get("ognzApc-inp-apcCd");
			
			const param = {
				apcNm: apcNm, apcCd: apcCd
			}
			
			let postJsonPromise = gfn_postJSON("/co/apc/selectApcInfoList.do", param);
		    let data = await postJsonPromise;

		    try{
		    	data.resultList.forEach((item, index) => {
		    		jsonOgnzApcPop.push(item);
				});

		    	grdOgnzApcPop.rebuild();
		    	
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