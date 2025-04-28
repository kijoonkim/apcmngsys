
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title : SBUx2.6</title>
    <style>
    .boxbox {
	  display: flex;
	  width: 100%;
	}

	.box1 {
	  flex: 8;
	}

	.box2 {
	  flex: 2;
	  padding-right: 30px;
	}

    </style>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-body">
				<div class="row">
					<div class ="row">
						<div class="boxbox">
							<div class="box1">
								<div class="ad_tbl_top" style="padding-right: 60px;">
										<ul class="ad_tbl_count">
											<li><span>전수조사 집계현황</span></li>
										</ul>
										<sbux-radio id="rdo_json" name="rdo_json" uitype="hidden" jsondata-ref="radioJsonData" >
										</sbux-radio>
								</div>
									<div id="sb-area-grdApcTotList" style="width:97.5%;height:310px;"></div>
							</div>
	  						<div class="box2">
	  							<div class="ad_tbl_top">
									<ul class="ad_tbl_count">
										<li><span>지역별현황</span></li>
									</ul>
								</div>
								<div id="sb-area-grdApcLocSttnList" style="width:97.5%;height:310px;"></div>
	  						</div>
						</div>
					</div>
					<div class ="row no-print">
						<div class="col-sm-6">
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li><span>APC현황</span></li>
								</ul>
							</div>
							<div class ="row">
								<div id="mapchart" style="width:98%;height:610px;"></div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li><span>APC지역현황</span></li>
								</ul>
							</div>
							<div id="sb-area-grdApcAreaList" style="width:95%;height:610px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var mapApcSttn = [];
	var jsonApcAreaList = [];
	var jsonApcTotList = [];
	var jsonApcLocSttnList = [];

	var grdApcAreaList;
	var grdApcTotList;
	var grdApcLocSttnList;

	var radioJsonData = [
		{ text : "개소"  , value : "01", checked : "checked"},
		{ text : "면적"  , value : "02"  },
		{ text : "취급액"  , value : "03"   }
	];

	window.addEventListener('DOMContentLoaded', async function(e) {

		let result = await Promise.all([
			fn_createGrid(),
			fn_createGrid2(),
			fn_createGrid3(),
			fn_search(),
		]);

	});

	const fn_createGrid = function(){
		var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdApcAreaList';
	    SBGridProperties.id = 'grdApcAreaList';
	    SBGridProperties.jsonref = 'jsonApcAreaList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
        SBGridProperties.columns = [
            {caption: ['APC명'], 		ref: 'apcNm',			width: '200px',	type: 'output',	style:'text-align: left'},
        	{caption: ['운영조직명'], 	ref: 'operOgnzNm', 		width: '200px',	type: 'output',	style:'text-align: left'},
        	{caption: ['시군'], 		ref: 'sigunNm', 		width: '100px',	type: 'output',	style:'text-align: center'},
        	{caption: ['조직유형'], 	ref: 'ognzType', 		width: '200px',	type: 'output',	style:'text-align: left'},
        	{caption: ['유형명'], 		ref: 'typeNm', 			width: '100px',	type: 'output',	style:'text-align: center'},
        ];
        grdApcAreaList = _SBGrid.create(SBGridProperties);
	}
	// chart를 담기 위한 객체 선언
	function createMap(){
		const chart = new sb.chart.render("#mapchart",{
	        	"global":{
	                "svg":{
	                    "classname":"sbchart",      		//svg 엘리먼트의 css클래스명 정의
	                    "accessibility":{
	                      "use":false                         //웹 접근성 관련 항목의 사용 여부 설정
	                    }
	                },
	                "export":{
	                  "show":true                            //이미지 다운로드 기능 사용 여부 설정
	                },
	                "size":{
	                  "width":800,                            //맵차트 너비 지정
	                  "height":535,                           //맵차트 높이 지정
	                }
	            },
	            "data":{
	                "type":"map",                        //차트 타입을 설정
	                "json":mapApcSttn,
	                "keys":{
	                    "x":"code",                        //각 지역 코드 데이터에 매핑되는 속성명을 지정
	                    "value":["APC수"]                 //차트에 사용될 사용자 데이터 속성을 지정
	                }
	            },
	            "extend":{
	                "map":{
	                    "mapUrl":"/resource/json/res/SIGUNGU.json",  //맵차트를 그리는 데이터의 경로를 설정
                        onclick : function(code) {
                          fn_selectCtpvArea(code);
                        }
	                },
	            }
	    })
	}
	const fn_apcTotList = async function(){

		let crtrYr = SBUxMethod.get("srch-slt-crtrYr");

		if(gfn_isEmpty(crtrYr)){

			let result = await Promise.all([
				gfn_setCrtrYr('srch-slt-crtrYr', jsonCrtrYr),		// 기준년도 목록
			])
			crtrYr = jsonCrtrYr[0].value;
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectApcTotList.do", {
			crtrYr			: crtrYr
  		});
        const data = await postJsonPromise;
        try {
          	/** @type {number} **/
      		jsonApcTotList.length = 0;
      		jsonApcTotList = data.resultList;

          	grdApcTotList.rebuild();
		}catch (e) {

			if (!(e instanceof Error)) {
				e = new Error(e);
			}

			console.error("failed", e.message);
		}
	}


	const fn_apcSttn = async function(){

		let crtrYr = SBUxMethod.get("srch-slt-crtrYr");

		if(gfn_isEmpty(crtrYr)){

			let result = await Promise.all([
				gfn_setCrtrYr('srch-slt-crtrYr', jsonCrtrYr),		// 기준년도 목록
			])
			crtrYr = jsonCrtrYr[0].value;
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectMapSttn.do", {
			crtrYr			: crtrYr
  		});
        const data = await postJsonPromise;
        try {
          	/** @type {number} **/
      		mapApcSttn.length = 0;
          	data.resultList.forEach((item, index) => {
          		if(item.invntrWght != 0){
	          		const apcSttn = {
	          				'code' : item.ctpvCd
	          			  , 'APC수' : item.apcQntt
	  				}
	          		mapApcSttn.push(apcSttn);
          		}
  			});
          	await fn_apcTotList();
          	fn_grid3Value(mapApcSttn);
          	createMap();
          	jsonApcAreaList.length = 0;
    		grdApcAreaList.rebuild();
		}catch (e) {

			if (!(e instanceof Error)) {
				e = new Error(e);
			}

			console.error("failed", e.message);
		}
	}
	const fn_selectCtpvArea = async function(code){
		let ctpvCd = "";
		if(code == "11"){
			ctpvCd = "11"
		}else if(code == "21"){
			ctpvCd = "26"
		}else if(code == "22"){
			ctpvCd = "27"
		}else if(code == "23"){
			ctpvCd = "28"
		}else if(code == "24"){
			ctpvCd = "29"
		}else if(code == "25"){
			ctpvCd = "30"
		}else if(code == "26"){
			ctpvCd = "31"
		}else if(code == "29"){
			ctpvCd = "36"
		}else if(code == "31"){
			ctpvCd = "41"
		}else if(code == "33"){
			ctpvCd = "43"
		}else if(code == "34"){
			ctpvCd = "44"
		}else if(code == "35"){
			let crtrYr = SBUxMethod.get("srch-slt-crtrYr");
			if(crtrYr  >= "2024"){
				ctpvCd = "52"
			}else{
				ctpvCd = "45"
			}
		}else if(code == "36"){
			ctpvCd = "46"
		}else if(code == "37"){
			ctpvCd = "47"
		}else if(code == "38"){
			ctpvCd = "48"
		}else if(code == "39"){
			ctpvCd = "50"
		}else if(code == "32"){
			ctpvCd = "51"
		}
		let crtrYr = SBUxMethod.get("srch-slt-crtrYr");
		const postJsonPromise = gfn_postJSON("/fm/fclt/selectCtpvAreaList.do", {
					crtrYr	: crtrYr
				  , ctpvCd	: ctpvCd
  		});
		const data = await postJsonPromise;
        try {
          	/** @type {number} **/
      		jsonApcAreaList.length = 0;
          	data.resultList.forEach((item, index) => {
          		if(item.invntrWght != 0){
	          		const apcAreaVO = {
	          				apcCd 			: item.apcCd
	          			  , apcNm 			: item.apcNm
	          			  , ctpvNm 			: item.ctpvNm
	          			  , operOgnzNm 		: item.operOgnzNm
	          			  , sigunNm			: item.sigunNm
	          			  , ognzType		: item.ognzType
	          			  , typeNm			: item.typeNm
	  				}
	          		jsonApcAreaList.push(apcAreaVO);
          		}
  			});
          	grdApcAreaList.rebuild();
		}catch (e) {

			if (!(e instanceof Error)) {
				e = new Error(e);
			}

			console.error("failed", e.message);
		}
	}


	const fn_createGrid2 = function(){
		var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdApcTotList';
	    SBGridProperties.id = 'grdApcTotList';
	    SBGridProperties.jsonref = 'jsonApcTotList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.mergecells = 'byrow';
        SBGridProperties.columns = [
        	{caption: ['구분','구분','구분'], 		ref: 'S0', 		width: '10%',	type: 'output',	style:'text-align: center'},
        	{caption: ['통합조직','농협','승인형'], 		ref: 'S1', 		width: '10%',	type: 'output',	style:'text-align: center',merge :  false},
        	{caption: ['통합조직','농협','육성형'], 		ref: 'S2', 		width: '10%',	type: 'output',	style:'text-align: center',merge :  false},
        	{caption: ['통합조직','농업법인','승인형'], 		ref: 'S3', 		width: '10%',	type: 'output',	style:'text-align: center',merge :  false},
        	{caption: ['통합조직','농업법인','육성형'], 		ref: 'S4', 		width: '10%',	type: 'output',	style:'text-align: center',merge :  false},
        	{caption: ['개별조직','농협','승인형'], 		ref: 'S5', 		width: '10%',	type: 'output',	style:'text-align: center',merge :  false},
        	{caption: ['개별조직','농협','육성형'], 		ref: 'S6', 		width: '10%',	type: 'output',	style:'text-align: center',merge :  false},
        	{caption: ['개별조직','농업법인','승인형'], 		ref: 'S7', 		width: '10%',	type: 'output',	style:'text-align: center',merge :  false},
        	{caption: ['개별조직','농업법인','육성형'], 		ref: 'S8', 		width: '10%',	type: 'output',	style:'text-align: center',merge :  false},
        	{caption: ['합계','합계','합계'], 		ref: 'S9', 		width: '10%',	type: 'output',	style:'text-align: center',merge :  false},
        ];
        grdApcTotList = _SBGrid.create(SBGridProperties);
	}

	// 부산,울산, 대구 , 광주, 세종,대전, 서울 -> 10
	const fn_createGrid3 = function(){
		var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdApcLocSttnList';
	    SBGridProperties.id = 'grdApcLocSttnList';
	    SBGridProperties.jsonref = 'jsonApcLocSttnList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
        SBGridProperties.columns = [

        	{caption: ['시도명'], 		ref: '01', 		width: '80%',	type: 'output',	style:'text-align: center'}
        	, {caption: ['개수'], 		ref: '02', 		width: '20%',	type: 'output',	style:'text-align: center'}
        ];
        grdApcLocSttnList = _SBGrid.create(SBGridProperties);
	}
	const fn_grid3Value = function(list){
		//let result = {'10' : 0};

		let etc = 0;
		jsonApcLocSttnList.length = 0;
		list.forEach(item => {
			let code = item.code;

			if(code == "21" ||code == "22" || code == "24" || code == "26" || code == "29"){
				etc += item.APC수;
			}else if(code == "32"){
				//result['01'] = item.APC수; //강원도
				jsonApcLocSttnList.push({'01':'강원도','02':item.APC수});
			}else if(code == "31"){
				//result['02'] = item.APC수; //경기도
				jsonApcLocSttnList.push({'01':'경기도','02':item.APC수});
			}else if(code == "38"){
				//result['03'] = item.APC수; //경남도
				jsonApcLocSttnList.push({'01':'경남도','02':item.APC수});
			}else if(code == "37"){
				//result['04'] = item.APC수; //경북도
				jsonApcLocSttnList.push({'01':'경북도','02':item.APC수});
			}else if(code == "36"){
				//result['05'] = item.APC수; //전남도
				jsonApcLocSttnList.push({'01':'전남도','02':item.APC수});
			}else if(code == "35"){
				//result['06'] = item.APC수; //전북도
				jsonApcLocSttnList.push({'01':'전북도','02':item.APC수});
			}else if(code == "39"){
				//result['07'] = item.APC수; //제주도
				jsonApcLocSttnList.push({'01':'제주도','02':item.APC수});
			}else if(code == "34"){
				//result['08'] = item.APC수; //충남도
				jsonApcLocSttnList.push({'01':'충남도','02':item.APC수});
			}else if(code == "33"){
				//result['09'] = item.APC수; //충북도
				jsonApcLocSttnList.push({'01':'충북도','02':item.APC수});
			}
		})
		//jsonApcLocSttnList = [result];
		jsonApcLocSttnList.push({'01':'기타','02':etc});
		const sum = jsonApcLocSttnList.reduce((acc, obj) => acc + (obj["02"] || 0), 0);
		jsonApcLocSttnList.push({'01':'합계','02':sum});
		grdApcLocSttnList.refresh();
	};

</script>
</html>
