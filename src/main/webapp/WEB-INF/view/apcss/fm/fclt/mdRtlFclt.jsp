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
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
			
				<div class="ad_tbl_toplist">
					<sbux-button id="btnMap" name="btnMap" uitype="normal" text="APC전수조사현황" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnMdRtlOgnzNow" name="btnMdRtlOgnzNow" uitype="normal" text="산지유통시설현황" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnMdRtlFcltRgnNow" name="btnMdRtlFcltRgnNow" uitype="normal" text="산지유통시설지역별현황" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnGvrngmtSprtMdRtlFclt" name="btnGvrngmtSprtMdRtlFclt" uitype="normal" text="정부지원산지유통시설현황" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnGvrngmtSprtMdRtlFcltRgn" name="btnGvrngmtSprtMdRtlFcltRgn" uitype="normal" text="정부지원산지유통시설지역별현황" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnMdRtlFcltOperPrfmnc" name="btnMdRtlFcltOperPrfmnc" uitype="normal" text="산지유통시설운영실적" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnGvrngmtSprtRgnOperPrfmnc" name="btnGvrngmtSprtRgnOperPrfmnc" uitype="normal" text="정부지원지역별운영실적" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
				</div>
			
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search()"></sbux-button>
				</div>
			</div>
			
			<div class="box-body">
				<div id="tab_content">
					<!-- 지도 탭 화면 -->
				    <div id="Map">
				    	<jsp:include page="../../fm/fclt/map.jsp"></jsp:include>
				    </div>
					<!-- 산지유통시설현황 탭 화면 -->
				    <div id="MdRtlOgnzNow">
				    	<jsp:include page="../../fm/fclt/mdRtlOgnzNow.jsp"></jsp:include>
				    </div>
					<!-- 산지유통시설지역별현황 탭 화면 -->
				    <div id="MdRtlFcltRgnNow">
				    	<jsp:include page="../../fm/fclt/mdRtlFcltRgnNow.jsp"></jsp:include>
				    </div>
					<!-- 정부지원산지유통시설현황 탭 화면 -->
				    <div id="GvrngmtSprtMdRtlFclt">
				    	<jsp:include page="../../fm/fclt/gvrngmtSprtMdRtlFclt.jsp"></jsp:include>
				    </div>
					<!-- 정부지원산지유통시설지역별현황 탭 화면 -->
				    <div id="GvrngmtSprtMdRtlFcltRgn">
				    	<jsp:include page="../../fm/fclt/gvrngmtSprtMdRtlFcltRgn.jsp"></jsp:include>
				    </div>
				    <!-- 산지유통시설운영실적 탭 화면 -->
				    <div id="MdRtlFcltOperPrfmnc">
				    	<jsp:include page="../../fm/fclt/mdRtlFcltOperPrfmnc.jsp"></jsp:include>
				    </div>
				    <!-- 정부지원지역별운영실적 탭 화면 -->
				    <div id="GvrngmtSprtRgnOperPrfmnc">
				    	<jsp:include page="../../fm/fclt/gvrngmtSprtRgnOperPrfmnc.jsp"></jsp:include>
				    </div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var searchTarget = "Map";
	
	$(function(){
		$('.ad_tbl_toplist button').click(function(){
			var btnName = $(this).attr('id');
			$('.ad_tbl_toplist button').css({'background-color':'#FFFFFF', 'border':'1px solid #666666', 'color': '#666666'});
		    $('#Map').hide();
			$('#MdRtlOgnzNow').hide();
		    $('#MdRtlFcltRgnNow').hide();
		    $('#GvrngmtSprtMdRtlFclt').hide();
		    $('#GvrngmtSprtMdRtlFcltRgn').hide();
		    $('#MdRtlFcltOperPrfmnc').hide();
		    $('#GvrngmtSprtRgnOperPrfmnc').hide();
		    $('#'+btnName.slice(3)).show();
		    $('[name='+btnName+']').css({'background-color':'#149FFF', 'border':'1px solid #149FFF', 'color': '#FFFFFF'});
		    searchTarget = btnName.slice(3);
		    fn_search();
		});
		$('[id=btnMap]').click();
	});
	
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_search();
	})
	
	// 이력 조회 (조회 버튼)
    async function fn_search() {
		if(searchTarget == "Map"){
// 			tabLogMenuHstry.search();
		} else if(searchTarget == "MdRtlOgnzNow"){
			fn_cellMdRtlOgnzNowGrid();
		} else if(searchTarget == "MdRtlFcltRgnNow"){
			fn_cellMdRtlFcltRgnNowGrid();
		} else if(searchTarget == "GvrngmtSprtMdRtlFclt"){
// 			tabLogBatchHstry.search();
		} else if(searchTarget == "GvrngmtSprtMdRtlFcltRgn"){
// 			tabRawMtrChgHstry.search();
		} else if(searchTarget == "MdRtlFcltOperPrfmnc"){
// 			tabSortInvntrChgHstry.search();
		} else if(searchTarget == "GvrngmtSprtRgnOperPrfmnc"){
// 			tabLogMap.search();
		}
    }
</script>
</html>