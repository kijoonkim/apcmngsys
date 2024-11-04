<%
/**
 * @Class Name : corpApcUser.jsp
 * @Description : 법인APC사용자 선택 화면
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
    <title>title : APC 사용자 선택</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">APC 사용자를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;"></span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button 
						id="apcUser-btn-search" 
						name="apcUser-btn-search" 
						uitype="normal" 
						text="조회" 
						class="btn btn-sm btn-outline-danger" 
						onclick="popApcUser.search"
					></sbux-button>
					<sbux-button
						id="apcUser-btn-close" 
						name="apcUser-btn-close" 
						uitype="normal" 
						text="종료" 
						class="btn btn-sm btn-outline-danger" 
						onclick="popApcUser.close"
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
		                    <th scope="row" class="th_bg">법인명</th>
		                    <td class="td_input" style="border-right: hidden;border-top: hidden">
		                        <sbux-input 
		                        	id="apcUser-inp-ognzNm" 
		                        	name="apcUser-inp-ognzNm" 
		                        	uitype="text" 
		                        	class="form-control input-sm"
		                        ></sbux-input>
		                    </td>
		                    <th scope="row" class="th_bg">회원구분</th>
		                    <td class="td_input" style="border-right: hidden;border-top: hidden">
		                        <sbux-select
									id="apcUser-slt-mbrTypeCd"
									name="apcUser-slt-mbrTypeCd" 
									uitype="single" 
									jsondata-ref="jsonMbrTypeCdApcUserPop" 
									jsondata-value="cdVl"
									jsondata-text="cdVlNm"
									unselected-text="전체" 
									class="form-control input-sm"
								></sbux-select>
		                    </td>
		                </tr>
						<tr>
		                    <th scope="row" class="th_bg">사용자명</th>
		                    <td class="td_input" style="border-right: hidden;border-top: hidden">
		                        <sbux-input 
		                        	id="apcUser-inp-userNm" 
		                        	name="apcUser-inp-userNm" 
		                        	uitype="text" 
		                        	class="form-control input-sm"
		                        ></sbux-input>
		                    </td>
		                    <th scope="row" class="th_bg">사용자ID</th>
		                    <td class="td_input" style="border-right: hidden;border-top: hidden">
		                        <sbux-input 
		                        	id="apcUser-inp-userId" 
		                        	name="apcUser-inp-userId" 
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
					<div id="sb-area-grdApcUserPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var grdApcUserPop = null;
	var jsonApcUserPop = [];
	var jsonMbrTypeCdApcUserPop = [];

	const popApcUser = {
		modalId: 'modal-apcUser',
		gridId: 'grdApcUserPop',
		jsonId: 'jsonApcUserPop',
		areaId: "sb-area-grdApcUserPop",
		objGrid: null,
		gridJson: [],
		initParam: {
			ognzNm: "",
			mbrTypeCd: "",
			userNm: "", 
			userId: "",
			excludeUsers: []
		},
		callbackSelectFnc: function() {},
		init: async function(_param, _callbackChoiceFnc) {

			this.initParam.ognzNm = _param.ognzNm;
			this.initParam.mbrTypeCd = _param.mbrTypeCd;
			this.initParam.userNm = _param.userNm;
			this.initParam.userId = _param.userId;
			
			this.initParam.excludeUsers.length = 0;
			if (!gfn_isEmpty(_param.excludeUsers) && Array.isArray(_param.excludeUsers)) {
				_param.excludeUsers.forEach((item) => {
					this.initParam.excludeUsers.push(item);
				});
			}
			
			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}
			
			SBUxMethod.set("apcUser-inp-ognzNm", _param.ognzNm);
			SBUxMethod.set("apcUser-inp-userNm", _param.userNm);
			SBUxMethod.set("apcUser-inp-userId", _param.userId);
			
			
			if (grdApcUserPop === null) {
				let rst = await Promise.all([
					gfn_setComCdSBSelect(
							'apcUser-slt-mbrTypeCd', 
							jsonMbrTypeCdApcUserPop, 
							'TYPE_CD')						
				]);
				
				this.createGrid();
			}
			
			SBUxMethod.set("apcUser-slt-mbrTypeCd", _param.mbrTypeCd);
			
			this.search();
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
		    	{
	 	        	caption: ['사용자ID'], 		
	 	        	ref: 'userId',		
	 	        	width: '100px', 
	 	        	type: 'output', 
	 	        	style:'text-align:center'
	 	        },
		    	{
	 	        	caption: ['사용자명'], 		
	 	        	ref: 'userNm',		
	 	        	width: '100px', 
	 	        	type: 'output', 
	 	        	style:'text-align:left'
	 	        },
	 	       	{
	 	        	caption: ['회원구분'], 			
	 	        	ref: 'mbrTypeNm', 	
	 	        	width: '80px', 
	 	        	type: 'output', 
	 	        	style:'text-align:center'
	 	        },
	 	        {
	 	        	caption: ['법인명'], 			
	 	        	ref: 'ognzNm', 	
	 	        	width: '100px', 
	 	        	type: 'output', 
	 	        	style:'text-align:left'
	 	        },
	 	        {
	 	        	caption: ['직위'], 			
	 	        	ref: 'jbps', 	
	 	        	width: '80px', 
	 	        	type: 'output', 
	 	        	style:'text-align:left'
	 	        },
	 	        {
	 	        	caption: ['휴대전화'], 			
	 	        	ref: 'mblTelno', 	
	 	        	width: '120px', 
	 	        	type: 'output', 
	 	        	style:'text-align:left'
	 	        },
	 	        {
	 	        	caption: ['전화번호'], 			
	 	        	ref: 'coTelno', 	
	 	        	width: '120px', 
	 	        	type: 'output', 
	 	        	style:'text-align:left'
	 	        },
	 	        
		    ];
		    grdApcUserPop = _SBGrid.create(SBGridProperties);
		    grdApcUserPop.bind('dblclick', popApcUser.choice);
		},
		choice: function() {
			const nRow = grdApcUserPop.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				const rowData = grdApcUserPop.getRowData(nRow);
				popApcUser.close(rowData);
			}
		},
		search: async function() {
			grdApcUserPop.rebuild();

	    	// grid clear
	    	jsonApcUserPop.length = 0;
	    	await this.setGrid();
		},
		setGrid: async function() {
			
			jsonOgnzApcPop = [];
			const ognzNm = SBUxMethod.get("apcUser-inp-ognzNm");
			const userNm = SBUxMethod.get("apcUser-inp-userNm");
			const userId = SBUxMethod.get("apcUser-inp-userId");
			const mbrTypeCd = SBUxMethod.get("apcUser-slt-mbrTypeCd");
			
			const param = {
				ognzNm: ognzNm,
				userNm: userNm,
				userId: userId,
				mbrTypeCd: mbrTypeCd,
			}
			
			let postJsonPromise = gfn_postJSON("/co/user/selectApcUserPopList.do", param);
		    let data = await postJsonPromise;
			
		    try{
		    	
		    	if (_.isEqual("S", data.resultStatus)) {
	        		
		    		data.resultList.forEach((item, index) => {
			    		jsonApcUserPop.push(item);
					});

			    	grdApcUserPop.rebuild();
	        		
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
	        	}
		    	
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