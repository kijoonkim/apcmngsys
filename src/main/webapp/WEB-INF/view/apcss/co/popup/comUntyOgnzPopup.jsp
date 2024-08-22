<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 통합조직 선택</title>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header">
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button 
							id="untyOgnz-btn-choice" 
							name="untyOgnz-btn-choice" 
							uitype="normal" 
							text="선택" 
							class="btn btn-sm btn-outline-danger" 
							onclick="popUntyOgnz.choice"
						></sbux-button>
						<sbux-button 
							id="untyOgnz-btn-search" 
							name="untyOgnz-btn-search" 
							uitype="normal" text="조회" 
							class="btn btn-sm btn-outline-danger" 
							onclick="popUntyOgnz.search"
						></sbux-button>
						<sbux-button 
							id="untyOgnz-btn-close" 
							name="untyOgnz-btn-close" 
							uitype="normal" 
							text="종료" 
							class="btn btn-sm btn-outline-danger" 
							onclick="popUntyOgnz.close"
						></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 11%">
						<col style="width: 22%">
						<col style="width: 11%">
						<col style="width: 22%">
						<col style="width: 11%">
						<col style="width: 22%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">조직유형</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="popUntyOgnz-slt-untyOgnzType"
									name="popUntyOgnz-slt-untyOgnzType"
									class="form-control input-sm"
									jsondata-ref="jsonUntyOgnzTypeOgnzPop"
									jsondata-value="cdVl"
									jsondata-text="cdVlNm"
									style="background-color:#FFFFFF;"
								/>
							</th>
							<th scope="row">조직명</th>
							<th class="td_input">
								<sbux-input 
									id="popUntyOgnz-inp-untyOgnzNm" 
									name="popUntyOgnz-inp-untyOgnzNm" 
									uitype="text" 
									class="form-control input-sm" 
									onkeyenter="popUntyOgnz.search" 
								></sbux-input>
							</th>
							<th scope="row">조직ID</th>
							<th class="td_input">
								<sbux-input 
									id="popUntyOgnz-inp-untyOgnzId" 
									name="popUntyOgnz-inp-untyOgnzId" 
									uitype="text" 
									class="form-control input-sm" 
									onkeyenter="popUntyOgnz.search" 
								></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
						<tr>
							<th scope="row">시/도</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="popUntyOgnz-slt-untyCtpv"
									name="popUntyOgnz-slt-untyCtpv"
									class="form-control input-sm"
									jsondata-ref="jsonUntyCtpvOgnzPop"
									jsondata-value="cdVl"
									jsondata-text="cdVlNm"
									style="background-color:#FFFFFF;"
								/>
							</th>
							<th scope="row">시/군/구</th>
							<th class="td_input">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="popUntyOgnz-slt-untySgg"
									name="popUntyOgnz-slt-untySgg"
									class="form-control input-sm"
									jsondata-ref="jsonUntySggOgnzPop"
									jsondata-value="cdVl"
									jsondata-text="cdVlNm"
									style="background-color:#FFFFFF;"
									filter-source-name="popUntyOgnz-slt-untyCtpv"
									jsondata-filter="upCdVl"
								/>
							</th>
							<th scope="row">사업자번호</th>
							<th class="td_input">
								<sbux-input 
									id="popUntyOgnz-inp-brno" 
									name="popUntyOgnz-inp-brno" 
									uitype="text" 
									class="form-control input-sm" 
									onkeyenter="popUntyOgnz.search" 
								></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="color: black;">통합조직 목록</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdUntyOgnzPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">


	var grdUntyOgnzPop = null;
	var jsonUntyOgnzPop = [];

	var jsonUntyOgnzTypeOgnzPop = [];
	var jsonUntyCtpvOgnzPop = [];
	var jsonUntySggOgnzPop = [];
	
	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popUntyOgnz = {
		modalId: "modal-untyOgnz",
		gridId: 'grdUntyOgnzPop',
		jsonId: 'jsonUntyOgnzPop',
		areaId: "sb-area-grdUntyOgnzPop",
		initParam: {
			untyOgnzType: "",
			untyOgnzNm: "",
			untyOgnzId: "",
			untyCtpv: "",
			untySgg: "",
			brno: ""
		},
		objGrid: null,
		gridJson: [],		
		callbackFnc: function() {},
		init: async function(_param, _callbackFnc) {
			
			this.initParam.untyOgnzType = _param.untyOgnzType;
			this.initParam.untyOgnzNm = _param.untyOgnzNm;
			this.initParam.untyOgnzId = _param.untyOgnzId;
			this.initParam.untyCtpv = _param.untyCtpv;
			this.initParam.untySgg = _param.untySgg;
			this.initParam.brno = _param.brno;
			
			console.log("_param", _param);
			
			if (grdUntyOgnzPop === null) {
				
				let result = await Promise.all([
	    			gfn_getComCdDtls("UNTY_OGNZ_TYPE"),
	    			gfn_getComCdDtls("UNTY_CTPV"),
	    			gfn_getComCdDtls("UNTY_SGG"),
	    		]);
				
				jsonUntyOgnzTypeOgnzPop = result[0];
				jsonUntyCtpvOgnzPop = result[1];
				jsonUntySggOgnzPop = result[2];
		    	
		    	SBUxMethod.refresh("popUntyOgnz-slt-untyOgnzType");
		    	SBUxMethod.refresh("popUntyOgnz-slt-untyCtpv");
		    	SBUxMethod.refresh("popUntyOgnz-slt-untySgg");
		    	
				this.createGrid();				
			} else {
				
			}
			
			// set param
			SBUxMethod.set("popUntyOgnz-slt-untyOgnzType", this.initParam.untyOgnzType);
			SBUxMethod.set("popUntyOgnz-inp-untyOgnzNm", this.initParam.untyOgnzNm);
			SBUxMethod.set("popUntyOgnz-inp-untyOgnzId", this.initParam.untyOgnzId);
			SBUxMethod.set("popUntyOgnz-slt-untyCtpv", this.initParam.untyCtpv);
			SBUxMethod.set("popUntyOgnz-slt-untySgg", this.initParam.untySgg);
			SBUxMethod.set("popUntyOgnz-inp-brno", this.initParam.brno);

			this.search();
			
			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;	
			}
		},
		close: function(_untyOgnz) {
			gfn_closeModal(this.modalId, this.callbackFnc, _untyOgnz);
		},
		createGrid: function() {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;
		    SBGridProperties.id = this.gridId;
		    SBGridProperties.jsonref = this.jsonId;
	        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	        SBGridProperties.tree = {
	            col: 0,
	            levelref: 'level',
	            open: true,
	            lock: true,
	            checkbox: false,
	            checkboxexceptionlevel: [0],
	            openlevel: 0,
	            checkboxchildrencheck: false,
	            iconclickeventignore: true
	        };
	        SBGridProperties.columns = [
	            {caption: ['통합조직목록'], ref: 'untyOgnzNm', width: '100%', type: 'output'}
	        ];

	        grdUntyOgnzPop = _SBGrid.create(SBGridProperties);
	        grdUntyOgnzPop.bind('dblclick', popUntyOgnz.choice);

		    //this.search();
		},
		choice: function() {
			let nRow = grdUntyOgnzPop.getRow();
			let rowData = grdUntyOgnzPop.getRowData(nRow);
			popUntyOgnz.close(rowData);
		},
		search: async function() {
			
			// set pagination
			grdUntyOgnzPop.rebuild();
	        
	    	// grid clear
	    	jsonUntyOgnzPop.length = 0;
	    	grdUntyOgnzPop.refresh();    	
	    	
	    	this.setGrid();
		},
		setGrid: async function() {
			
			grdUntyOgnzPop.clearStatus();
			let untyOgnzType = SBUxMethod.get("popUntyOgnz-slt-untyOgnzType");
			let untyOgnzNm = SBUxMethod.get("popUntyOgnz-inp-untyOgnzNm");
			let untyOgnzId = SBUxMethod.get("popUntyOgnz-inp-untyOgnzId");
			let untyCtpv = SBUxMethod.get("popUntyOgnz-slt-untyCtpv");
			let untySgg = SBUxMethod.get("popUntyOgnz-slt-untySgg");
			let brno = SBUxMethod.get("popUntyOgnz-inp-brno");
			
			const postJsonPromise = gfn_postJSON("/co/ognz/selectUntyOgnzTreeList.do", {
	        	untyOgnzType: untyOgnzType,
	        	untyOgnzNm: gfn_nvl(untyOgnzNm),
	        	untyOgnzId: gfn_nvl(untyOgnzId),
	        	ctpv: 		untyCtpv,
	        	sgg: 		untySgg,
	        	brno: 		gfn_nvl(brno),
	        	// pagination
		  		pagingYn : 'N',
				currentPageNo : 0,
	 		  	recordCountPerPage : 0
			});

	        const data = await postJsonPromise;
	        try {
	  			if (_.isEqual("S", data.resultStatus)) {

	  	        	/** @type {number} **/
	  	    		let totalRecordCount = 0;

	  	    		jsonUntyOgnzPop.length = 0;
	  	        	data.resultList.forEach((item, index) => {
	  					const untyOgnz = {
	  						level: item.untyOgnzLvl,
	  						untyOgnzType: item.untyOgnzType,
	  						upUntyOgnzId: item.upUntyOgnzId,
	  						upUntyOgnzNm : item.upUntyOgnzNm,
	  						untyOgnzId: item.untyOgnzId,
	  						untyOgnzNm : item.untyOgnzNm,
	  						untyOgnzLinkCd : item.untyOgnzLinkCd,
	  						ctpv : item.ctpv,
	  						sgg : item.sgg,
	  						indctSeq : item.indctSeq
	  					}
	  					jsonUntyOgnzPop.push(untyOgnz);
	  				});

	  	        	grdUntyOgnzPop.rebuild();

	        	} else {
	        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
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