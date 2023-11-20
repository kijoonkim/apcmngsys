
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
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-body">
				<div class="row">
					<div class ="row">
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
							<div class ="row">
								<div id="sb-area-apcAreaList" style="width:95%;height:610px;"></div>
							</div>
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

	window.addEventListener('DOMContentLoaded', async function(e) {
		fn_apcSttn();
		fn_createGrid();

	});

	const fn_createGrid = function(){
		var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-apcAreaList';
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

	const fn_apcSttn = async function(){
		const postJsonPromise = gfn_postJSON("/fm/fclt/selectMapSttn.do", {
			crtrYr			: "2023"
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
          	createMap();
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
			ctpvCd = "45"
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

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectCtpvAreaList.do", {
					crtrYr	: "2023"
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
</script>
</html>
