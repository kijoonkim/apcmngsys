var BASE_PATH =  sessionStorage.getItem("contextRootPath");

/* 이력서 등록 팝업 */
fnResumePopup = function (_popType,_resumeSeq,_stdNo,_repYn){
	$.ajaxSetup({cache:false});
	var popupDivId = "#layerPopup";
	var popupUrl	= BASE_PATH+"/portfolio/r/n/mergeResumePopup.do";
	var popupParams = {
			popType:_popType,
			resumeSeq:_resumeSeq,
			stdNo:_stdNo,
			repYn:_repYn
	}; // 팝업 호출시의 파라미터
	clientLoadPopup (popupDivId, popupUrl, popupParams);
}

/* 자기소개서 등록 팝업 */
fnCoverLetterPopup = function (_popType,_resumeSeq,_stdNo,_repYn){
	$.ajaxSetup({cache:false});
	var popupDivId = "#layerPopup";
	var popupUrl	= BASE_PATH+"/portfolio/r/n/mergeCoverLetterPopup.do";
	var popupParams = {
			popType:_popType,
			resumeSeq:_resumeSeq,
			clStdNo:_stdNo,
			clRepYn:_repYn
	}; // 팝업 호출시의 파라미터
	clientLoadPopup (popupDivId, popupUrl, popupParams);
}

/* 기업분석/직무분석 작성가이드 팝업 */
fnFormGuidePopup = function (_formType){
	$.ajaxSetup({cache:false});
	var popupDivId = "#layerPopup";
	var popupUrl	= BASE_PATH+"/portfolio/r/n/formGuidePopup.do";
	var popupParams = {
			formType:_formType,
	}; // 팝업 호출시의 파라미터
	clientLoadPopup (popupDivId, popupUrl, popupParams);
}

/* ?? */
fnHopeEmployPopup = function (_popType){

	if ($('#stdNo').val() == null || $('#stdNo').val() == '') {
		alert("로그인 후 등록 가능합니다.");
		fnGoLoginPopUp(BASE_PATH+"/portfolio/a/m/getPortfolio.do");
		return false;
	}

	$.ajaxSetup({cache:false});
	var popupDivId = "#layerPopup";
	var popupUrl	= BASE_PATH+"/portfolio/r/n/mergeHopeEmployPopup.do";
	var popupParams = {
			popType :_popType
	}; // 팝업 호출시의 파라미터
	clientLoadPopup (popupDivId, popupUrl, popupParams);
}

/* 대표 이력서 || 대표 자기소개서 등록 */
representResume = function(obj,_resumeSeq, _stdNo, _resumeDiv){

	var _div = "";
	var _redirectTab = "";
	if(_resumeDiv == "RESM") {
		_div = "대표 이력서";
		_redirectTab = "resume";
	}else if (_resumeDiv == "CL"){
		_div = "대표 자기소개서";
		_redirectTab = "coverLetter";
	}else if (_resumeDiv == "CMPNY"){
		_div = "대표 기업분석";
		_redirectTab = "companyanalysis";
	}else if (_resumeDiv == "JOB"){
		_div = "대표 직무분석";
		_redirectTab = "jobanalysis";
	}

	if( confirm( _div+" 설정 하시겠습니까?" ) ){
		$.post(
			BASE_PATH+"/portfolio/w/n/updateRepresentResume.do"
			, {
				resumeSeq : _resumeSeq
				, stdNo : _stdNo
				, resumeDiv : _resumeDiv
			}
			, function(res){
				if( res.success ){
					alert(_div+" 설정 되었습니다.");

					if($(obj).hasClass('on')){
						$(obj).removeClass('on');
					}else{
						$(obj).addClass('on');
					}
					fnTepAjaxBtn(_redirectTab);

				} else {
					alert(_div+" 설정 실패하였습니다.\n잠시후 다시 시도해주세요");
				}
			}
		);
	}
}

/* 이력서 || 자기소개서 삭제 */
removeResume = function(_resumeSeq, _resumeDiv){

	var _div ="";
	var _redirectTab = "";
	if (_resumeDiv == "RESM") {
		_div = "이력서";
		_redirectTab = "resume";
	}else if(_resumeDiv == "CL"){
		_div = "자기소개서";
		_redirectTab = "coverLetter";
	}else if(_resumeDiv == "CMPNY"){
		_div = "기업분석";
		_redirectTab = "companyanalysis";
	}else if(_resumeDiv == "JOB"){
		_div = "직무분석";
		_redirectTab = "jobanalysis";
	}

	if( confirm(_div+" 삭제 하시겠습니까?") ){
		$.post(
			BASE_PATH+"/portfolio/w/n/deleteResumeList.do"
			, {
				resumeSeq : _resumeSeq
			}
			, function(res){
				if( res.success ){
					alert("삭제 되었습니다.");

					fnTepAjaxBtn(_redirectTab);

				} else {
					alert(_div+" 삭제 실패하였습니다.\n잠시후 다시 시도해주세요");
				}
			}
		);
	}
}

/* 포트폴리오 공유 URL 팝업*/
sharePortfolioOld = function (_stdNo, _portType){
	var sessionUserId = sessionStorage.getItem("sessionUserId");
	var basePath = sessionStorage.getItem("contextRootPath");

	if(sessionUserId == ''){
		if (confirm("공유하기는 로그인이 필요한 기능 입니다. \n"+"로그인 하시겠습니까?")) {
			fnGoLoginPopUp(basePath+'portfolio/a/m/getPortfolio.do');
			return;
		}else{
			return;
		}
	}
	$.ajaxSetup({cache:false});
	var popupDivId	= "#layerPopup";	// 팝업이 들어가는 div의 id
	var popupUrl	= BASE_PATH+"/portfolio/a/n/sharePortfolioPopup.do";	// 팝업 내용을 호출하는 url
	var popupParams = {
			stdNo : _stdNo
			, portType : _portType
	};	// 팝업 호출시의 파라미터
	clientLoadPopup (popupDivId, popupUrl, popupParams);
}

/* 선택출력 팝업 */
function selectPrint(stdNo, _portType){
	var sessionUserId = sessionStorage.getItem("sessionUserId");
	var basePath = sessionStorage.getItem("contextRootPath");

	if(sessionUserId == ''){
		if (confirm("공유하기는 로그인이 필요한 기능 입니다. \n"+"로그인 하시겠습니까?")) {
			fnGoLoginPopUp(basePath+'portfolio/a/m/getPortfolio.do');
			return;
		}else{
			return;
		}
	}

	var popupDivId	= "#layerPopup";	// 팝업이 들어가는 div의 id
	var popupUrl	= BASE_PATH+"/portfolio/a/n/selectPrintPopup.do";	// 팝업 내용을 호출하는 url
	var popupParams = {
			stdNo : stdNo
			, portType : _portType
	};	// 팝업 호출시의 파라미터

	clientLoadPopup(popupDivId, popupUrl, popupParams);
}

/* 전체출력 팝업 */
function onPrint(stdNo , ck, _portType){
	var sessionUserId = sessionStorage.getItem("sessionUserId");
	var basePath = sessionStorage.getItem("contextRootPath");

	if(ck != 'admin') {
		if(sessionUserId == ''){
			if (confirm("공유하기는 로그인이 필요한 기능 입니다. \n"+"로그인 하시겠습니까?")) {
				fnGoLoginPopUp(basePath+'portfolio/a/m/getPortfolio.do');
				return;
			}else{
				return;
			}
		}
	}

	var url	= BASE_PATH+"/cmm/fms/goOnPrintPopUp.do?stdNo="+stdNo+"&p1=Y&p2=Y&p3=Y&p4=Y&p5=Y&p6=Y&p7=Y&adPopYn="+ck+"&portType="+_portType
	window.open(url,"selectPrintForm","toolbar=no,directories=no,scrollbars=yes,resizable=no,status=no,menubar=no,width=1200, height=830, left=100");
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

/* 그래프 */
function drawProgramGraph(chartDataArry,chartTitleArry, divNm){
	var chartData = new Array();
	// 차트데이터 생성
	var graphColor = ['#D0F5A9','#A9BCF5','#0A9696','#FF8200', '#0000FF', '#AE5E1A', '#7A00FC', '#FF1493', '#28E7FF','#009933']
	for(var idx= 0; idx < chartDataArry.length; idx++  ){
		var chartArray = {
						  "graphColor": graphColor[idx]
						  ,"category": chartTitleArry[idx]
						  ,"data": chartDataArry[idx]
						  ,"title": chartTitleArry[idx]
		};
		chartData.push(chartArray);
	}

	// 각 그래프 객체 설정

	//X 축 기준값 설정
	var chart = new AmCharts.AmSerialChart();
	    chart.dataProvider = chartData;
		chart.categoryField = "category";
		chart.fontSize = 12;
		chart.fontFamily = "NanumGothic";

	//y 축 기준값 설정
	var valueAxis = new AmCharts.ValueAxis();
		valueAxis.autoGridCount = false;
		valueAxis.axisColor = "#000000";
		valueAxis.baseValue = 0;
		valueAxis.gridCount = 5;
		valueAxis.gridThickness = 1;

	var graph = new AmCharts.AmGraph();
		graph.balloonText = "[[title]]:[[value]]";
		graph.fillAlphas = 2;
		graph.id = "title";
		graph.titleField = "title";
		graph.type = "column";
		graph.fillColorsField = "graphColor";
		graph.lineColorField = "graphColor";
		graph.columnWidth = 0.7;
		graph.valueField = "data";

	chart.addGraph(graph);
	chart.addValueAxis(valueAxis);
	chart.dataProvider = chartData;
	// 차트 그리기
	chart.write(divNm);
}

/* 그래프 */
function drawProgramGraphTwoLine(chartDataArry, chartDataTitleArry, chartDataArry2, chartDataTitleArry2, chartCategoryTitleArry, chartTitleArry, divNm){
	var chartData = new Array();
	// 차트데이터 생성
	var graphColor = ['#FF6600','#FCD202','#0A9696','#FF8200', '#0000FF', '#AE5E1A', '#7A00FC', '#FF1493', '#28E7FF','#009933']

	for(var idx= 0; idx < chartDataArry.length; idx++  ){
		var chartArray = {
						  "category": chartCategoryTitleArry[idx]
						  ,"graphColor": graphColor[0]
						  ,"data": chartDataArry[idx]
						  ,"dataTitle": chartDataTitleArry[idx]
						  ,"graphColor2": graphColor[1]
						  ,"data2": chartDataArry2[idx]
						  ,"dataTitle2": chartDataTitleArry2[idx]

		};
		chartData.push(chartArray);
	}
	// 각 그래프 객체 설정
	//X 축 기준값 설정
	var chart = new AmCharts.AmSerialChart();
	    chart.dataProvider = chartData;
		chart.categoryField = "category";
		chart.fontSize = 12;
		chart.fontFamily = "NanumGothic";

	//y 축 기준값 설정
	var valueAxis = new AmCharts.ValueAxis();
		valueAxis.autoGridCount = false;
		valueAxis.axisColor = "#000000";
		valueAxis.baseValue = 0;
		valueAxis.gridCount = 5;
		valueAxis.gridThickness = 1;

	// legend (명각) 객체
	var legend = new AmCharts.AmLegend();
		legend.enabled = true;
		legend.useGraphSettings = true;
		legend.align = "center";
		legend.markerSize = 9;
		legend.valueWidth = 45;
		legend.autoMargins = false;
		legend.marginLeft = 0;
		legend.marginRight = 0;
		legend.spacing = 0;

	var graph = new AmCharts.AmGraph();
		graph.balloonText = "[[dataTitle]]:[[value]]";
		graph.fillAlphas = 1;
		graph.id = "title";
		graph.title = chartTitleArry[0];
		graph.type = "column";
		graph.fillColorsField = "graphColor";
		graph.lineColorField = "graphColor";
		graph.columnWidth = 0.7;
		graph.valueField = "data";


	var graph2 = new AmCharts.AmGraph();
		graph2.balloonText = "[[dataTitle2]]:[[value]]";
		graph2.fillAlphas = 2;
		graph2.id = "title2";
		graph2.title = chartTitleArry[1];
		graph2.type = "column";
		graph2.fillColorsField = "graphColor2";
		graph2.lineColorField = "graphColor2";
		graph2.columnWidth = 0.7;
		graph2.valueField = "data2";

	// legend (명각) 객체
	var legend = new AmCharts.AmLegend();
		legend.enabled = true;
		legend.useGraphSettings = true;
		legend.align = "center";
		legend.markerSize = 9;
		legend.valueWidth = 45;
		legend.autoMargins = false;
		legend.marginLeft = 0;
		legend.marginRight = 0;
		legend.spacing = 0;

	chart.addGraph(graph);
	chart.addGraph(graph2);
	chart.addLegend(legend);
	chart.addValueAxis(valueAxis);
	chart.dataProvider = chartData;
	// 차트 그리기
	chart.write(divNm);
}

//기본 DIV 호출
function getDataDivHtml(pageNo, _url, searchKey, portFolioGbn, viewType, portType) {
	$.ajax({
		url : _url
		,type : "POST"
		,dataType : "html"
		,async : true
		,data : {
			searchKey : searchKey
		    ,portFolioGbn : portFolioGbn
		    ,pageIndex : pageNo
		    ,viewType : viewType
		    ,portType : portType
		}
		, success : function(res) {
			if (portFolioGbn == "BASIC_USER_INFO") {
				$("#userBasicInfoDiv").html(res);
			}
			else if (portFolioGbn == "HOPE_EMPLOY_INFO") {
				$("#hopeEmployStyleDiv").html(res);
			}
			else if (portFolioGbn == "RESUME_INFO") {
				if(portType == 'A') {
					$("#resumeInfoDiv").html(res);
				}
				else {
					$("#resumeInfoDiv2").html(res);
				}
			}
			else if (portFolioGbn == "COVERLETTER_INFO") {
				if(portType == 'A') {
					$("#coverLetterInfoDiv").html(res);
				}
				else {
					$("#coverLetterInfoDiv2").html(res);
				}
			}
			else if (portFolioGbn == "MAJOR_RCR_PROGRAM_INFO") {
				$("#majorRcrProgramInfoDiv").html(res);
			}
			else if (portFolioGbn == "MAJOR_NCR_PROGRAM_INFO") {
				$("#majorNcrProgramInfoDiv").html(res);
			}
			else if (portFolioGbn == "CORE_RCR_PROGRAM_INFO") {
				if(portType == 'A') {
					$("#coreRcrProgramInfoDiv").html(res);
				}
				else {
					$("#coreRcrProgramInfoDiv2").html(res);
				}
			}
			else if (portFolioGbn == "CORE_NCR_PROGRAM_INFO") {
				if(portType == 'A') {
					$("#coreNcrProgramInfoDiv").html(res);
				}
				else {
					$("#coreNcrProgramInfoDiv2").html(res);
				}
			}
			else if (portFolioGbn == "MAJOR_PROGRAM_GRAPH") {
				$("#majorProgramGraphDiv").html(res);
			}
			else if (portFolioGbn == "CORE_PROGRAM_GRAPH") {
				if(portType == 'A') {
					$("#coreProgramGraphDiv").html(res);
				}
				else {
					$("#coreProgramGraphDiv2").html(res);
				}
			}
			else if (portFolioGbn == "DIAG_GRAPH") {
				$("#diagAnalyDiv").html(res);
			}
		}
	});
}

//팝업창으로 실행시 clientSubTemplate가 다시 로드 되는게 아니라 기존것을 사용하여서 테이블 가로스크롤을 적용시키기 위해 추가
function ScrollReady() {

	if (navigator.platform) {

		// 모바일 기기 접속 여부 체크 후 PC일때만 스크롤 custom
		var filter = "win16|win32|win64|mac|macintel";

		if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
			// alert('모바일');

			// 테이블 스크롤  커스터마이징 해제
			$(".pp_scrollx_tbl, .pp_scrollx_tbl_sm, .pp_scrollx_tbl_md , .pp_scrollx_tbl_lg, .pp_scrollx_tbl_xl").off(mCustomScrollbar);

		} else {
			// alert('PC');

			// 테이블 스크롤  커스터마이징
			$(".pp_scrollx_tbl_lg, .pp_scrollx_tbl_xl").mCustomScrollbar({
				axis:"x",
				theme:"dark",
				advanced:{
					autoExpandHorizontalScroll:true
				}
			});
			$(".pp_scrollx_tbl, .pp_scrollx_tbl_sm, .pp_scrollx_tbl_md").mCustomScrollbar({
				axis:"x",
				theme:"dark",
				advanced:{
					autoExpandHorizontalScroll:false
				}
			});
		};
	};
}

// fnPortFolioBGPopup = function (_fimSectionName){
// 	 $.ajaxSetup({cache:false});
// 	 var popupDivId = "#layerPopup";
// 	 var popupUrl	= BASE_PATH+"/portfolio/w/n/mergeBackGroundImgPopup.do";
// 	 var popupParams = {
// 	 		fimSectionName : _fimSectionName
// 	 }; // 팝업 호출시의 파라미터
// 	 clientLoadPopup (popupDivId, popupUrl, popupParams);
// }
