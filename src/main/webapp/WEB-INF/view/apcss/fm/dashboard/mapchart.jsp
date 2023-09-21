<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../../../frame/inc/headerMeta.jsp"%>
<%@ include file="../../../frame/inc/headerScript.jsp"%>


<script type="text/javascript">
		<c:choose>
			<c:when test="${comApcList != null}">
				var cjsonApcList = ${comApcList};
			</c:when>
			<c:otherwise>
				var cjsonApcList = {};
			</c:otherwise>
		</c:choose>
		<c:if test="${loginVO != null && loginVO.apcAdminType != null}">
			gv_selectedApcCd = null;
			gv_selectedApcNm = null;
		</c:if>
		/**
		 * @name
		 * @description
		 * @function
		 * @param {string} _apcCd
		 */
		const cfn_onChangeApc = function(obj) {
			gv_selectedApcCd = obj.value;

			const apcInfo = gfn_getJsonFilter(cjsonApcList, 'apcCd', gv_selectedApcCd);
			apcInfo.forEach( (apc) => {
				gv_selectedApcNm = apc.apcNm;
				return false;
			});

			if (typeof fn_onChangeApc === "function") {
				fn_onChangeApc();
			}
		}
	</script>

</head>
<body>
	<section class="content container-fluid">
	    
<!-- 		<div class="box-header" -->
<!-- 				style="display: flex; justify-content: flex-start;"> -->
<!-- 				<div> -->
<!-- 					<h3 class="box-title" style="line-height: 30px;"> -->
<!-- 						▶ -->
<!-- 						<sbux-label id="lbl-today2" name="lbl-today2" -->
<!-- 							style="font-weight:bold;"> -->
<!-- 					</h3> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
	   
		
		<div class="box box-solid">


			<!-- 			<div class="box-body"> -->
			<div class="box box-solid"
				style="width: 60%; height: 700px; float: left; margin-right: 30px; margin-top: 30px; margin-left: 10px;">
				<h1 class="box-title" style="margin-top: 10px; margin-left: 10px;"></h1>
				<div id="chart-area-wrhs"
					style="height: 670px;; margin-right: 10px;"></div>
			</div>

			<div class="box box-solid"
				style="width: 35%; height: 700px; float: left; margin-right: 20px; margin-top: 30px; margin-left: 20px;">

				<!--                   <div class="table-responsive tbl_scroll_sm"> -->
				<div class="box-body">
					<div id="sb-area-dashboardCnt" style="height: 670px;"></div>
				</div>


			</div>

			<!-- 			</div> -->


		</div>

        <div class="box-header"
			style="display: flex; justify-content: flex-start;">
			<div>
				<h3 class="box-title" style="line-height: 30px;">
					▶
					<sbux-label id="lbl-today2" name="lbl-today2" style="font-weight:bold;">
				</h3>
			</div>
			
			
			
			
			<h3 class="box-title" style="line-height: 30px; float:left;"><sbux-label id="lbl-apcNm" name="lbl-apcNm" style="font-weight:bold;"></sbux-label></h3>
				<span style="display:inline-block;">
				<h5 style="float:left; margin:9px 16px 0 0; color:black;">생산유통통합조직</h5>
				<sbux-select
					id="slt-itemCd"
					name="slt-itemCd"
					uitype="single"
					jsondata-ref="jsonComItemCd"
					onchange="fn_search(this)"
					unselected-text="전체"
					class="form-control input-sm input-sm-ast inpt_data_reqed"
				    
					style="width:170px; float:left; margin-left:auto;"
					
				></sbux-select>
				</span>
			
			
			<h3 class="box-title" style="line-height: 30px; float:left;"><sbux-label id="lbl-apcNm2" name="lbl-apcNm2" style="font-weight:bold;"></sbux-label></h3>
				<span style="display:inline-block;">
				<h5 style="float:left; margin:9px 16px 0 0; color:black;">출자출하조직</h5>
				<sbux-select
					id="slt-itemCd2"
					name="slt-itemCd2"
					uitype="single"
					jsondata-ref="jsonComItemCd"
					onchange="fn_search(this)"
					unselected-text="전체"
					class="form-control input-sm input-sm-ast inpt_data_reqed"
					style="width:170px; float:left; margin-left:auto;"
				></sbux-select>
<!-- 				<button type="button" class="btn btn-sm btn-outline-danger" style="float:left; margin-left:20px;"  onclick="fn_setgrdDashboardInfoListCnt">조회</button> -->
				</span>
			
			
			
		</div>
		

		<div class="box-body">
		
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-dashboard" style="height: 300px;"></div>
					</div>

		</div>
		
		<div class="box-body">
		
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-dashboard3" style="height: 300px;"></div>
					</div>

		</div>
		
		<div class="box-body">
		
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-dashboard4" style="height: 300px;"></div>
					</div>

		</div>
		



		








	</section>


	<script type="text/javascript">
	var jsonComItemCd = [];
	var jsonComItemCd2 = [];
	
	//only document
	window.addEventListener('DOMContentLoaded', function(e) {
		gfn_setComCdSBSelect(
    			['slt-itemCd', 'slt-itemCd2'],
    			jsonComItemCd,
			'GBN_YN');
		
		let date = new Date();
		let year  = date.getFullYear();
	    let month = ('0' + (date.getMonth() + 1)).slice(-2);
	    let day   = ('0' + date.getDate()).slice(-2);

		let strYmd = year + "년 " + month + "월 " + day + "일 현황";
		SBUxMethod.set("lbl-today", strYmd);
		SBUxMethod.set("lbl-today2", strYmd);
		
		
// 		SBUxMethod.set("srch-input-trgtYr", year);

// 		SBUxMethod.set("srch-input-trgtYr", year);
		fn_createGrid();

		
		fn_search();
		// set pagination
//  		let pageSize = grdDashboardInfoList.getPageSize();
//  		let pageNo = 1;

//  		fn_setgrdDashboardInfoList(pageSize, pageNo);
 		fn_createChart();
 		fn_createGridCnt();
 		fn_createGrid3();
		fn_createGrid4();
		//fn_createGridCnt();
		
// 		gfn_setComCdSBSelect(
// 				['dtl-select-msgKnd', 'dtl-select-msgKnd'],
// 				jsonComMsgKnd,
// 			'MSG_KND');

	

// 	sb.chart.render("#chart-area-wrhs", {
// 	   	global:{
// 	        svg :{
// 	            className : 'sbchart'
// 	        },
// 	        "export":{
// 	            show : true
// 	        }
// 	    },
// 	    tooltip: {
// 	    	  format: {
// 	    	      value: function(keys, values, 통합조직) {
// 	    	          return values.length != 0 ? 통합조직 + " 조직원(수) : " + values : 통합조직 + " 조직원\n없음";
// 	    	      }
// 	    	  }
// 	    	},
// 	    data:{
// 	        type:"map",
// 	        json:[
// 	        	 {"code":31,"통합조직":700,"label":"경기도",  "color":"gray" , "outerline": true},
// 	        	 {"code":11,"통합조직":700,"label":"서울", "color":"gray" , "outerline": true},
// 	        	 {"code":23,"통합조직":700,"label":"인천", "color":"gray" , "outerline": false},
// 	        	 {"code":25,"통합조직":700,"label":"대전",  "color":"gray"},
// 	        	 {"code":29,"통합조직":700,"label":"세종",  "color":"gray"},
// 	        	 {"code":36,"통합조직":700,"label":"전라남도",   "color":"gray"},
// 	        	 {"code":33,"통합조직":700,"label":"충청북도"  , "color":"gray"},
// 	        	 {"code":22,"통합조직":700,"label":"대구", "color":"gray"},
// 	        	 {"code":21,"통합조직":700,"label":"부산",  "color":"gray"},
// 	        	 {"code":39,"통합조직":700,"label":"제주도", "color":"gray"},
// 	        	 {"code":37,"통합조직":700,"label":"경상북도",   "color":"gray"},
// 	        	 {"code":38,"통합조직":700,"label":"경상남도",   "color":"gray"},
// 	        	 {"code":32,"통합조직":700,"label":"강원도",  "color":"gray"},
// 	        	 {"code":34,"통합조직":700,"label":"충청남도",   "color":"gray"},
// 	        	 {"code":35,"통합조직":700,"label":"전라북도",   "color":"gray"},
// 	        	 {"code":24,"통합조직":700,"label":"광주",  "color":"gray"},
// 	        	 {"code":26,"통합조직":700,"label":"울산",     "color":"gray"},
// 	             {"code":11190,"color":"yellow","hovercolor":"red","통합조직":60},
// 	             {"code":11140,"통합조직":30,"test":200,"color":"pink"},
// 	             {"code":11150,"color":"gray","통합조직":30,"test":300},
// 	             {"code":11240,"hovercolor":"#F29661","통합조직":100,"test":400},
// 	             {"code":11050,"color":"#FFB2F5","hovercolor":"#F29661","통합조직":120},
// 	             {"code":11180,"color":"#D9E5FF","통합조직":20}
// 	        ],
// 	        keys:{
// 	            x:"code",
// 	            value: ["통합조직"]
// 	        }
// 	    },
// 	    extend:{
// 	        /* map:{
// 	           //mapUrl:"http://sbchart.co.kr/res/SIGUNGU.json",
// 	            mapUrl:"/resource/json/res/SIGUNGU.json",
// 	            drillDown : true,
// 	            mapColor : {
// 	            	type : "gradation",
// 	            	color : "#FFE6EA",
// 	            	endColor : "#E98391"
// 	            }
// 	        } */
	        
// 	    	map: {
// 	            theme: "avocado",
// 	            //mapUrl: "../data/SIGUNGU.json",
// 	            mapUrl: "/resource/json/res/SIGUNGU.json",
// 	            panel: {
// 	                type: "vlabel",
// 	                data: "label",
// 	                //color: "#733410",
// 	                color: "black",
// // 	                format: function(code, label, data) {
// // 	                    return  "출자출하조직 : " + data["통합조직"];
// // 	                },
// 	                //textColor: "#733410",
// 	                textColor: "white",
// 	                //showTextShadow: true,
// 	                value: {
// 	                    color: "#EEEEEE",
// 	                    textColor: "blue",
// 	                },
// 	                useLabelMultiLine: true,
// 	                labelMultiLineGap: 1.5,
// 	                useMapItemEvent: true,
// 	                useMapItemOnclick: function(code, name, keyValue, data) {
// 	                    alert ( name + "!!");
// 	                },
// 	                mapItemBackColor: "black",
// 	                mapItemBackColorOpacity: 0.5,
// 	                mapItemSize: {
// 	                    width: 120,
// 	                    height: 50,
// 	                },
// 	            },
// 	            onclick: function(code, label, data) {
// 	                alert (label  +  "!");
// 	            },
// 	            mapColor: {
// 	            	type : "gradation",
// 	            	color : "#FFE6EA",
// 	            	endColor : "#E98391"
// 	               /*  color: "#FDE1E1",
// 	                hoverColor: "#E2ECFF",
// 	                selectColor: "#F4E9AB",
// 	                showHoverColor: false,
// 	                showSelectColor: false,
// 	                type: "gradation",
// 	                startColor: "#F3F3F3",
// 	                endColor: "SteelBlue" */
// 	            },
// 	            drillDown: true,
// 	            drillDownLevel: 2,
// 	            drillUpClick: function(code) {
// 	                alert (code  +  "!");
// 	            },
// 	            drillDownImage: {
// 	                url: "/resource/json/images/back.png",
// 	                width: 100,
// 	                height: 70,
// 	                x: 50,
// 	                y: 50
// 	            },
// 	            ratio: 4,
// 	            mapAnimation: {
// 	                show: true
// 	            },
// 	            mapTooltip: {
// 	                type: "html",
// 	                color: "#4641D9"
	                
// 	            },
// 	            mapItem: {
// 	                type: "circle",
// 	                onmouseover: function(code, label, data) {
// 	                    alert (label  +  "mouseover!");
// 	                },
// 	                onclick: function(code, label, data) {
// 	                    alert (label  +  "click!");
// 	                },
// 	                imgUrl: "../img/map-pin1.png",
// // 	                imgUrls:[
// // 	    	            "code": "39", "src": "./images/map-pin2.png", "width": "30",  "height":"40"},
// // 	               	],
// 	                imgWidth: 20,
// 	                imgHeight: 20
// 	            }
// 	            //showDefaultLabel: true,
// 	            //defaultLabelColor: "gray",
// 	            //selectedLabelColor: "red",
// 	            //hoverLabelColor: "yellow",
// 	        }
	        
	        
// 	    }
// 	});
	
	

// 	fn_searchCnt();
// 	createChartWrhs();
	

});
	
	var chartWrhs;
	
	
	
	


	
    //grid 초기화
    var grdDashboardInfoList; // 그리드를 담기위한 객체 선언
    var jsonDashboardInfoList = []; // 그리드의 참조 데이터 주소 선언
    var jsonDashboardInfoListCnt = []; // 그리드의 참조 데이터 주소 선언
    var grdDashboardInfoListCnt;
    var grdDashboardInfoList3; // 그리드를 담기위한 객체 선언
    var jsonDashboardInfoList3 = []; // 그리드의 참조 데이터 주소 선언
    var grdDashboardInfoList4; // 그리드를 담기위한 객체 선언
    var jsonDashboardInfoList4 = []; // 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-dashboard';
	    SBGridProperties.id = 'grdDashboardInfoList';
	    SBGridProperties.jsonref = 'jsonDashboardInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [

//             {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
//                 ref: 'checked', type: 'checkbox',   style: 'text-align:center',
//                 typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
//             },
            {caption: ["사업자번호"], 	ref: 'mainCode',     	type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["생산유통통합조직명"],  	ref: 'mainCodeNm',    type:'output',  width:'15%',    style:'text-align:left'},
            {caption: ["사업자번호"],   ref: 'subCode',    type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["출자출하조직명"],	    ref: 'subCodeNm',   type:'output',  width:'15%',    style:'text-align:left'},
            {caption: ["생산유통통합조직여부"],	    ref: 'mainGbn',   type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["출자출하조직여부"],   ref: 'subGbn',    type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["계약형태"],   ref: 'gbnNmRemark',    type:'output',      width:'30%',  style:'text-align:left'}
//             {caption: ["최초등록자ID"],	ref: 'apcCd',           type:'output',  hidden: true},
//             {caption: ["최초등록일시"],	ref: 'trgtYr',           type:'output',  hidden: true},
//             {caption: ["최초등록자ID"],	ref: 'creUserId',   type:'output',  hidden: true},
//             {caption: ["최초등록일시"],	ref: 'creDateTime', type:'output',  hidden: true},
//             {caption: ["최종변경자ID"],	ref: 'updUserId',   type:'output',  hidden: true},
//             {caption: ["최종변경일시"],  ref: 'updDateTime', type:'output',  hidden: true},
//             {caption: ["등록프로그램"],  ref: 'creProgram',  type:'output',  hidden: true},
//             {caption: ["변경프로그램"],  ref: 'updProgram',  type:'output',  hidden: true}

        ];

        
        grdDashboardInfoList = _SBGrid.create(SBGridProperties);
//         grdDashboardInfoList.bind('click', 'fn_view');
//         grdDashboardInfoList.bind('beforepagechanged', 'fn_pagingDashboardInfoList');
    }
    
    

    function fn_createGridCnt() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-dashboardCnt';
        SBGridProperties.id = 'grdDashboardInfoListCnt';
        SBGridProperties.jsonref = 'jsonDashboardInfoListCnt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
        SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
        SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [

//             {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
//                 ref: 'checked', type: 'checkbox',   style: 'text-align:center',
//                 typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
//             },
            {caption: ["지역"], 	ref: 'area',     	type:'output',  width:'22%',    style:'text-align:center'},
            {caption: ["생산유통통합조직"],  	ref: 'mainCnt',    type:'output',  width:'21%',    style:'text-align:center'},
            {caption: ["출자출하조직"],   ref: 'subCnt',    type:'output',  width:'19%',    style:'text-align:center'},
            {caption: ["기초생자자조직"],	    ref: 'aaa',   type:'output',  width:'19%',    style:'text-align:center'},
            {caption: ["생산자"],	      ref: 'bbb',  type:'output',  width:'19%',    style:'text-align:center'}
//             {caption: ["최초등록자ID"],	ref: 'apcCd',           type:'output',  hidden: true},
//             {caption: ["최초등록일시"],	ref: 'trgtYr',           type:'output',  hidden: true},
//             {caption: ["최초등록자ID"],	ref: 'creUserId',   type:'output',  hidden: true},
//             {caption: ["최초등록일시"],	ref: 'creDateTime', type:'output',  hidden: true},
//             {caption: ["최종변경자ID"],	ref: 'updUserId',   type:'output',  hidden: true},
//             {caption: ["최종변경일시"],  ref: 'updDateTime', type:'output',  hidden: true},
//             {caption: ["등록프로그램"],  ref: 'creProgram',  type:'output',  hidden: true},
//             {caption: ["변경프로그램"],  ref: 'updProgram',  type:'output',  hidden: true}

        ];

        
        grdDashboardInfoListCnt = _SBGrid.create(SBGridProperties);
//         grdDashboardInfoListCnt.bind('click', 'fn_view');
//         grdDashboardInfoListCnt.bind('beforepagechanged', 'fn_pagingDashboardInfoListCnt');
    }
    
    
    
    function fn_createGrid3() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-dashboard3';
        SBGridProperties.id = 'grdDashboardInfoList3';
        SBGridProperties.jsonref = 'jsonDashboardInfoList3';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
        SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
        SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [

//             {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
//                 ref: 'checked', type: 'checkbox',   style: 'text-align:center',
//                 typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
//             },
            {caption: ["재배품목"], 	ref: 'ab',     	type:'output',  width:'22%',    style:'text-align:center'},
            {caption: ["생산유통통합조직"],  	ref: 'ac',    type:'output',  width:'21%',    style:'text-align:center'},
            {caption: ["출자출하조직"],   ref: 'ad',    type:'output',  width:'19%',    style:'text-align:center'},
            {caption: ["기초생자자조직"],	    ref: 'af',   type:'output',  width:'19%',    style:'text-align:center'},
            {caption: ["생산자"],	      ref: 'ar',  type:'output',  width:'19%',    style:'text-align:center'}
//             {caption: ["최초등록자ID"],	ref: 'apcCd',           type:'output',  hidden: true},
//             {caption: ["최초등록일시"],	ref: 'trgtYr',           type:'output',  hidden: true},
//             {caption: ["최초등록자ID"],	ref: 'creUserId',   type:'output',  hidden: true},
//             {caption: ["최초등록일시"],	ref: 'creDateTime', type:'output',  hidden: true},
//             {caption: ["최종변경자ID"],	ref: 'updUserId',   type:'output',  hidden: true},
//             {caption: ["최종변경일시"],  ref: 'updDateTime', type:'output',  hidden: true},
//             {caption: ["등록프로그램"],  ref: 'creProgram',  type:'output',  hidden: true},
//             {caption: ["변경프로그램"],  ref: 'updProgram',  type:'output',  hidden: true}

        ];

        
        grdDashboardInfoList3 = _SBGrid.create(SBGridProperties);
//         grdDashboardInfoListCnt.bind('click', 'fn_view');
//         grdDashboardInfoListCnt.bind('beforepagechanged', 'fn_pagingDashboardInfoListCnt');
    }
    

    function fn_createGrid4() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-dashboard4';
        SBGridProperties.id = 'grdDashboardInfoList4';
        SBGridProperties.jsonref = 'jsonDashboardInfoList4';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
        SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
        SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [

//             {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
//                 ref: 'checked', type: 'checkbox',   style: 'text-align:center',
//                 typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
//             },
            {caption: ["생산자"], 	ref: 'ba',     	type:'output',  width:'22%',    style:'text-align:center'},
            {caption: ["생산유통통합조직"],  	ref: 'bc',    type:'output',  width:'21%',    style:'text-align:center'},
            {caption: ["출자출하조직"],   ref: 'bq',    type:'output',  width:'19%',    style:'text-align:center'},
            {caption: ["기초생자자조직"],	    ref: 'bt',   type:'output',  width:'19%',    style:'text-align:center'},
            {caption: ["품목"],	      ref: 'bt',  type:'output',  width:'19%',    style:'text-align:center'}
//             {caption: ["최초등록자ID"],	ref: 'apcCd',           type:'output',  hidden: true},
//             {caption: ["최초등록일시"],	ref: 'trgtYr',           type:'output',  hidden: true},
//             {caption: ["최초등록자ID"],	ref: 'creUserId',   type:'output',  hidden: true},
//             {caption: ["최초등록일시"],	ref: 'creDateTime', type:'output',  hidden: true},
//             {caption: ["최종변경자ID"],	ref: 'updUserId',   type:'output',  hidden: true},
//             {caption: ["최종변경일시"],  ref: 'updDateTime', type:'output',  hidden: true},
//             {caption: ["등록프로그램"],  ref: 'creProgram',  type:'output',  hidden: true},
//             {caption: ["변경프로그램"],  ref: 'updProgram',  type:'output',  hidden: true}

        ];

        
        grdDashboardInfoList4 = _SBGrid.create(SBGridProperties);
//         grdDashboardInfoListCnt.bind('click', 'fn_view');
//         grdDashboardInfoListCnt.bind('beforepagechanged', 'fn_pagingDashboardInfoListCnt');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {

    	// set pagination
    	let pageSize = grdDashboardInfoList.getPageSize();
    	let pageNo = 1;

    	fn_setgrdDashboardInfoList(pageSize, pageNo);
    	
    }
    
    const fn_searchCnt = async function() {
     	let pageSize = grdDashboardInfoListCnt.getPageSize();
     	let pageNo = 1;

     	fn_setgrdDashboardInfoListCnt(pageSize, pageNo);
    }


    /**
     *
     */
    const fn_pagingDashboardInfoList = async function() {
    	let recordCountPerPage = grdDashboardInfoList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdDashboardInfoList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setgrdDashboardInfoList(recordCountPerPage, currentPageNo);
    }

     const fn_pagingDashboardInfoListCnt = async function() {
     	let recordCountPerPage = grdDashboardInfoListCnt.getPageSize();   		// 몇개의 데이터를 가져올지 설정
     	let currentPageNo = grdDashboardInfoListCnt.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
     	fn_setgrdDashboardInfoListCnt(recordCountPerPage, currentPageNo);
     }
    
    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
     // select 그리드 조회 생ㅅ
    const fn_setgrdDashboardInfoList = async function(pageSize, pageNo) {

    	// form clear
    	//fn_clearForm();
        var itemCd = SBUxMethod.get("slt-itemCd");
		var itemCd2 = SBUxMethod.get("slt-itemCd2");
		grdDashboardInfoList.clearStatus();

		//let apcCd = SBUxMethod.get("gsb-slt-apcCd");
		//let trgtYr = SBUxMethod.get("srch-input-trgtYr");

		var chk = {
				//trgtYr: trgtYr,
	        	//apcCd: apcCd,
	        	// pagination
		  		pagingYn : 'N',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize

		};
		console.log('=============chk==================');
// 		console.log(chk);
		
        const postJsonPromise = gfn_postJSON("/fm/dashboard/selectDashboardInfoList.do", {
			itemCd  : itemCd,
			itemCd2 : itemCd2,
	  		pagingYn : 'Y',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize
        });
		console.log("a11111111111111");
        const data = await postJsonPromise;

        console.log("---------------------------")
        console.log(data);
        console.log(data.resultList);



        try {

            
        	/** @type {number} **/
    		let totalRecordCount = 0;

        	jsonDashboardInfoList.length = 0;
        	data.resultList.forEach((item, index) => {
				const msg = {
						mainCode: item.mainCode,	 	
						mainCodeNm: item.mainCodeNm, 	 	
						subCode: item.subCode,  	
						subCodeNm: item.subCodeNm, 	
						mainGbn: item.mainGbn,  
						subGbn: item.subGbn, 
						gbnNmRemark: item.gbnNmRemark
// 			         delYn: item.delYn,                  //삭제유무
// 			         sysFrstInptDt: item.sysFrstInptDt,       //시스템최초입력일시
// 			         sysFrstInptUserId: item.sysFrstInptUserId,      //시스템최초입력사용자id
// 			         sysFrstInptPrgrmId: item.sysFrstInptPrgrmId,     	//시스템최초입력프로그램id
// 			         sysLastChgDt: item.sysLastChgDt,    		  //시스템최종변경일시
// 			         sysLastChgUserId: item.sysLastChgUserId,  	//시스템최종변경사용자id
// 			         sysLastChgPrgrmId: item.sysLastChgPrgrmId   //시스템최종변경프로그램id
				}

				jsonDashboardInfoList.push(msg);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});
        	
        	
        	console.log("c33333333333333333333");
        	console.log("totalRecordCount", totalRecordCount);

        	if (jsonDashboardInfoList.length > 0) {

        		if(grdDashboardInfoList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdDashboardInfoList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdDashboardInfoList.rebuild();
				}else{
					grdDashboardInfoList.refresh()
				}
        	} else {
        		grdDashboardInfoList.setPageTotalCount(totalRecordCount);
        		grdDashboardInfoList.rebuild();
        	}

        	//document.querySelector('#listCount').innerText = totalRecordCount;
        	console.log(grdDashboardInfoList);
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
        
        
        //fn_searchCnt();
        
       
        let pageSize1 = grdDashboardInfoListCnt.getPageSize();
     	let pageNo1 = 1;

     	fn_setgrdDashboardInfoListCnt(pageSize1, pageNo1);
        
        
    }

     
     const fn_setgrdDashboardInfoListCnt = async function(pageSize, pageNo) {

     	// form clear
     	//fn_clearForm();

 		grdDashboardInfoListCnt.clearStatus();

 		//let apcCd = SBUxMethod.get("gsb-slt-apcCd");
 		//let trgtYr = SBUxMethod.get("srch-input-trgtYr");

 		var chk = {
 				//trgtYr: trgtYr,
 	        	//apcCd: apcCd,
 	        	// pagination
 		  		pagingYn : 'N',
 				currentPageNo : 0,
 	 		  	recordCountPerPage : 0

 		}
 		console.log('=============chk==================');
 		console.log(chk);

         const postJsonPromise = gfn_postJSON("/fm/dashboard/selectDashboardInfoListCnt.do", {
         	//trgtYr: trgtYr,
         	//apcCd: apcCd,
         	// pagination
 	  		pagingYn : 'Y',
 			currentPageNo : pageNo,
  		  	recordCountPerPage : pageSize
         });
 		console.log("a11111111111111");
         const data = await postJsonPromise;

         console.log("---------------------------")
         console.log(data);



         try {

             
         	/** @type {number} **/
     		let totalRecordCount = 0;

         	jsonDashboardInfoListCnt.length = 0;
         	
         	
         	data.resultList.forEach((item, index) => {
 				const msg = {
 						area: item.area,	 
 						mainCnt: item.mainCnt,	 	
 						subCnt: item.subCnt
//  			         delYn: item.delYn,                  //삭제유무
//  			         sysFrstInptDt: item.sysFrstInptDt,       //시스템최초입력일시
//  			         sysFrstInptUserId: item.sysFrstInptUserId,      //시스템최초입력사용자id
//  			         sysFrstInptPrgrmId: item.sysFrstInptPrgrmId,     	//시스템최초입력프로그램id
//  			         sysLastChgDt: item.sysLastChgDt,    		  //시스템최종변경일시
//  			         sysLastChgUserId: item.sysLastChgUserId,  	//시스템최종변경사용자id
//  			         sysLastChgPrgrmId: item.sysLastChgPrgrmId   //시스템최종변경프로그램id
 				}

 				jsonDashboardInfoListCnt.push(msg);

 				if (index === 0) {
 					totalRecordCountCnt = item.totalRecordCount;
 				}
 			});
         	
         	
//          	console.log("c33333333333333333333");
//          	console.log("totalRecordCount", totalRecordCount);

         	
         	
         	if (jsonDashboardInfoListCnt.length > 0) {

         		if(grdDashboardInfoListCnt.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
         			grdDashboardInfoListCnt.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
         			grdDashboardInfoListCnt.rebuild();
 				}else{
 					grdDashboardInfoListCnt.refresh()
 				}
         	} else {
         		grdDashboardInfoListCnt.setPageTotalCount(totalRecordCount);
         		grdDashboardInfoListCnt.rebuild();
         	}
         	

         	//document.querySelector('#listCount').innerText = totalRecordCount;
//          	console.log(grdDashboardInfoListCnt);
         } catch (e) {
     		if (!(e instanceof Error)) {
     			e = new Error(e);
     		}
     		console.error("failed", e.message);
         }
         
        
         
     }

     
     
  
     function fn_createChart() {
    	 
    	 

    		sb.chart.render("#chart-area-wrhs", {
    		   	global:{
    		        svg :{
    		            className : 'sbchart'
    		        },
    		        "export":{
    		            show : true
    		        }
    		    },
    		    tooltip: {
    		    	  format: {
    		    	      value: function(keys, values, 통합조직) {
    		    	          return values.length != 0 ? 통합조직 + " 조직원(수) : " + values : 통합조직 + " 조직원\n없음";
    		    	      }
    		    	  }
    		    	},
    		    data:{
    		        type:"map",
    		        json:[
    		        	 {"code":31,"통합조직":700,"label":"경기도",  "color":"gray" , "outerline": true},
    		        	 {"code":11,"통합조직":700,"label":"서울", "color":"gray" , "outerline": true},
    		        	 {"code":23,"통합조직":700,"label":"인천", "color":"gray" , "outerline": false},
    		        	 {"code":25,"통합조직":700,"label":"대전",  "color":"gray"},
    		        	 {"code":29,"통합조직":700,"label":"세종",  "color":"gray"},
    		        	 {"code":36,"통합조직":700,"label":"전라남도",   "color":"gray"},
    		        	 {"code":33,"통합조직":700,"label":"충청북도"  , "color":"gray"},
    		        	 {"code":22,"통합조직":700,"label":"대구", "color":"gray"},
    		        	 {"code":21,"통합조직":700,"label":"부산",  "color":"gray"},
    		        	 {"code":39,"통합조직":700,"label":"제주도", "color":"gray"},
    		        	 {"code":37,"통합조직":700,"label":"경상북도",   "color":"gray"},
    		        	 {"code":38,"통합조직":700,"label":"경상남도",   "color":"gray"},
    		        	 {"code":32,"통합조직":700,"label":"강원도",  "color":"gray"},
    		        	 {"code":34,"통합조직":700,"label":"충청남도",   "color":"gray"},
    		        	 {"code":35,"통합조직":700,"label":"전라북도",   "color":"gray"},
    		        	 {"code":24,"통합조직":700,"label":"광주",  "color":"gray"},
    		        	 {"code":26,"통합조직":700,"label":"울산",     "color":"gray"},
    		             {"code":11190,"color":"yellow","hovercolor":"red","통합조직":60},
    		             {"code":11140,"통합조직":30,"test":200,"color":"pink"},
    		             {"code":11150,"color":"gray","통합조직":30,"test":300},
    		             {"code":11240,"hovercolor":"#F29661","통합조직":100,"test":400},
    		             {"code":11050,"color":"#FFB2F5","hovercolor":"#F29661","통합조직":120},
    		             {"code":11180,"color":"#D9E5FF","통합조직":20}
    		        ],
    		        keys:{
    		            x:"code",
    		            value: ["통합조직"]
    		        }
    		    },
    		    extend:{
    		        /* map:{
    		           //mapUrl:"http://sbchart.co.kr/res/SIGUNGU.json",
    		            mapUrl:"/resource/json/res/SIGUNGU.json",
    		            drillDown : true,
    		            mapColor : {
    		            	type : "gradation",
    		            	color : "#FFE6EA",
    		            	endColor : "#E98391"
    		            }
    		        } */
    		        
    		    	map: {
    		            theme: "avocado",
    		            //mapUrl: "../data/SIGUNGU.json",
    		            mapUrl: "/resource/json/res/SIGUNGU.json",
    		            panel: {
    		                type: "vlabel",
    		                data: "label",
    		                //color: "#733410",
    		                color: "black",
//    	 	                format: function(code, label, data) {
//    	 	                    return  "출자출하조직 : " + data["통합조직"];
//    	 	                },
    		                //textColor: "#733410",
    		                textColor: "white",
    		                //showTextShadow: true,
    		                value: {
    		                    color: "#EEEEEE",
    		                    textColor: "blue",
    		                },
    		                useLabelMultiLine: true,
    		                labelMultiLineGap: 1.5,
    		                useMapItemEvent: true,
    		                useMapItemOnclick: function(code, name, keyValue, data) {
    		                    alert ( name + "!!");
    		                },
    		                mapItemBackColor: "black",
    		                mapItemBackColorOpacity: 0.5,
    		                mapItemSize: {
    		                    width: 120,
    		                    height: 50,
    		                },
    		            },
    		            onclick: function(code, label, data) {
    		                alert (label  +  "!");
    		            },
    		            mapColor: {
    		            	type : "gradation",
    		            	color : "#FFE6EA",
    		            	endColor : "#E98391"
    		               /*  color: "#FDE1E1",
    		                hoverColor: "#E2ECFF",
    		                selectColor: "#F4E9AB",
    		                showHoverColor: false,
    		                showSelectColor: false,
    		                type: "gradation",
    		                startColor: "#F3F3F3",
    		                endColor: "SteelBlue" */
    		            },
    		            drillDown: true,
    		            drillDownLevel: 2,
    		            drillUpClick: function(code) {
    		                alert (code  +  "!");
    		            },
    		            drillDownImage: {
    		                url: "/resource/json/images/back.png",
    		                width: 100,
    		                height: 70,
    		                x: 50,
    		                y: 50
    		            },
    		            ratio: 4,
    		            mapAnimation: {
    		                show: true
    		            },
    		            mapTooltip: {
    		                type: "html",
    		                color: "#4641D9"
    		                
    		            },
    		            mapItem: {
    		                type: "circle",
    		                onmouseover: function(code, label, data) {
    		                    alert (label  +  "mouseover!");
    		                },
    		                onclick: function(code, label, data) {
    		                    alert (label  +  "click!");
    		                },
    		                imgUrl: "../img/map-pin1.png",
//    	 	                imgUrls:[
//    	 	    	            "code": "39", "src": "./images/map-pin2.png", "width": "30",  "height":"40"},
//    	 	               	],
    		                imgWidth: 20,
    		                imgHeight: 20
    		            }
    		            //showDefaultLabel: true,
    		            //defaultLabelColor: "gray",
    		            //selectedLabelColor: "red",
    		            //hoverLabelColor: "yellow",
    		        }
    		        
    		        
    		    }
    		});
    		
    	 
    	 
    	 
     }
     
     
     
     
//      const createChartWrhs = async function (){
//  		var chartConfig = {

//  			   	global:{
//  			        svg :{
//  			            className : 'sbchart'
//  			        },
//  			        "export":{
//  			            show : true
//  			        }
//  			    },
//  			    tooltip: {
//  			    	  format: {
//  			    	      value: function(keys, values, 통합조직) {
//  			    	          return values.length != 0 ? 통합조직 + " 조직원(수) : " + values : 통합조직 + " 조직원\n없음";
//  			    	      }
//  			    	  }
//  			    	},
//  			    data:{
//  			        type:"map",
//  			        json:[
//  			        	 {"code":31,"통합조직":700,"label":"경기도",  "color":"gray" , "outerline": true},
//  			        	 {"code":11,"통합조직":700,"label":"서울", "color":"gray" , "outerline": true},
//  			        	 {"code":23,"통합조직":700,"label":"인천", "color":"gray" , "outerline": false},
//  			        	 {"code":25,"통합조직":700,"label":"대전",  "color":"gray"},
//  			        	 {"code":29,"통합조직":700,"label":"세종",  "color":"gray"},
//  			        	 {"code":36,"통합조직":700,"label":"전라남도",   "color":"gray"},
//  			        	 {"code":33,"통합조직":700,"label":"충청북도"  , "color":"gray"},
//  			        	 {"code":22,"통합조직":700,"label":"대구", "color":"gray"},
//  			        	 {"code":21,"통합조직":700,"label":"부산",  "color":"gray"},
//  			        	 {"code":39,"통합조직":700,"label":"제주도", "color":"gray"},
//  			        	 {"code":37,"통합조직":700,"label":"경상북도",   "color":"gray"},
//  			        	 {"code":38,"통합조직":700,"label":"경상남도",   "color":"gray"},
//  			        	 {"code":32,"통합조직":700,"label":"강원도",  "color":"gray"},
//  			        	 {"code":34,"통합조직":700,"label":"충청남도",   "color":"gray"},
//  			        	 {"code":35,"통합조직":700,"label":"전라북도",   "color":"gray"},
//  			        	 {"code":24,"통합조직":700,"label":"광주",  "color":"gray"},
//  			        	 {"code":26,"통합조직":700,"label":"울산",     "color":"gray"},
//  			             {"code":11190,"color":"yellow","hovercolor":"red","통합조직":60},
//  			             {"code":11140,"통합조직":30,"test":200,"color":"pink"},
//  			             {"code":11150,"color":"gray","통합조직":30,"test":300},
//  			             {"code":11240,"hovercolor":"#F29661","통합조직":100,"test":400},
//  			             {"code":11050,"color":"#FFB2F5","hovercolor":"#F29661","통합조직":120},
//  			             {"code":11180,"color":"#D9E5FF","통합조직":20}
//  			        ],
//  			        keys:{
//  			            x:"code",
//  			            value: ["통합조직"]
//  			        }
//  			    },
//  			    extend:{
//  			        /* map:{
//  			           //mapUrl:"http://sbchart.co.kr/res/SIGUNGU.json",
//  			            mapUrl:"/resource/json/res/SIGUNGU.json",
//  			            drillDown : true,
//  			            mapColor : {
//  			            	type : "gradation",
//  			            	color : "#FFE6EA",
//  			            	endColor : "#E98391"
//  			            }
//  			        } */
 			        
//  			    	map: {
//  			            theme: "avocado",
//  			            //mapUrl: "../data/SIGUNGU.json",
//  			            mapUrl: "/resource/json/res/SIGUNGU.json",
//  			            panel: {
//  			                type: "vlabel",
//  			                data: "label",
//  			                //color: "#733410",
//  			                color: "black",
// // 		 	                format: function(code, label, data) {
// // 		 	                    return  "출자출하조직 : " + data["통합조직"];
// // 		 	                },
//  			                //textColor: "#733410",
//  			                textColor: "white",
//  			                //showTextShadow: true,
//  			                value: {
//  			                    color: "#EEEEEE",
//  			                    textColor: "blue",
//  			                },
//  			                useLabelMultiLine: true,
//  			                labelMultiLineGap: 1.5,
//  			                useMapItemEvent: true,
//  			                useMapItemOnclick: function(code, name, keyValue, data) {
//  			                    alert ( name + "!!");
//  			                },
//  			                mapItemBackColor: "black",
//  			                mapItemBackColorOpacity: 0.5,
//  			                mapItemSize: {
//  			                    width: 120,
//  			                    height: 50,
//  			                },
//  			            },
//  			            onclick: function(code, label, data) {
//  			                alert (label  +  "!");
//  			            },
//  			            mapColor: {
//  			            	type : "gradation",
//  			            	color : "#FFE6EA",
//  			            	endColor : "#E98391"
//  			               /*  color: "#FDE1E1",
//  			                hoverColor: "#E2ECFF",
//  			                selectColor: "#F4E9AB",
//  			                showHoverColor: false,
//  			                showSelectColor: false,
//  			                type: "gradation",
//  			                startColor: "#F3F3F3",
//  			                endColor: "SteelBlue" */
//  			            },
//  			            drillDown: true,
//  			            drillDownLevel: 2,
//  			            drillUpClick: function(code) {
//  			                alert (code  +  "!");
//  			            },
//  			            drillDownImage: {
//  			                url: "/resource/json/images/back.png",
//  			                width: 100,
//  			                height: 70,
//  			                x: 50,
//  			                y: 50
//  			            },
//  			            ratio: 4,
//  			            mapAnimation: {
//  			                show: true
//  			            },
//  			            mapTooltip: {
//  			                type: "html",
//  			                color: "#4641D9"
 			                
//  			            },
//  			            mapItem: {
//  			                type: "circle",
//  			                onmouseover: function(code, label, data) {
//  			                    alert (label  +  "mouseover!");
//  			                },
//  			                onclick: function(code, label, data) {
//  			                    alert (label  +  "click!");
//  			                },
//  			                imgUrl: "../img/map-pin1.png",
// // 		 	                imgUrls:[
// // 		 	    	            "code": "39", "src": "./images/map-pin2.png", "width": "30",  "height":"40"},
// // 		 	               	],
//  			                imgWidth: 20,
//  			                imgHeight: 20
//  			            //showDefaultLabel: true,
//  			            //defaultLabelColor: "gray",
//  			            //selectedLabelColor: "red",
//  			            //hoverLabelColor: "yellow",
//  			         }
//  			    },
//  		};

 		
//  		//chartWrhs = new sb.chart("#chart-area-wrhs", chartConfig).render();
//  		sb.chart.render("#chart-area-wrhs",chartConfig);
//  	};
</script>
</body>
</html>