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
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search()"></sbux-button>
				</div>
			</div>
			
			<div class="box-body">
				<div id="tab_content">
					<!-- 지도 탭 화면 -->
				    <div id="GdsInvntrChgHstry">
				    	<jsp:include page="../../fm/fclt/map.jsp"></jsp:include>
				    </div>
					<!-- 산지유통시설현황 탭 화면 -->
				    <div id="LogCntnHstry">
				    	<jsp:include page="../../fm/fclt/mdRtlOgnzNow.jsp"></jsp:include>
				    </div>
					<!-- 산지유통시설지역별현황 탭 화면 -->
				    <div id="LogMenuHstry">
				    	<jsp:include page="../../fm/fclt/mdRtlFcltRgnNow.jsp"></jsp:include>
				    </div>
					<!-- 정부지원산지유통시설현황 탭 화면 -->
				    <div id="LogTrsmHstry">
				    	<jsp:include page="../../fm/fclt/gvrngmtSprtMdRtlFclt.jsp"></jsp:include>
				    </div>
					<!-- 정부지원산지유통시설지역별현황 탭 화면 -->
				    <div id="LogBatchHstry">
				    	<jsp:include page="../../fm/fclt/gvrngmtSprtMdRtlFcltRgn.jsp"></jsp:include>
				    </div>
				    <!-- 산지유통시설운영실적 탭 화면 -->
				    <div id="RawMtrChgHstry">
				    	<jsp:include page="../../fm/fclt/mdRtlFcltOperPrfmnc.jsp"></jsp:include>
				    </div>
				    <!-- 정부지원지역별운영실적 탭 화면 -->
				    <div id="SortInvntrChgHstry">
				    	<jsp:include page="../../fm/fclt/gvrngmtSprtRgnOperPrfmnc.jsp"></jsp:include>
				    </div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var searchTarget = "GdsInvntrChgHstry";
	
	$(function(){
		$('.ad_tbl_toplist button').click(function(){
			var btnName = $(this).attr('id').slice(0, $(this).attr('id').length-1);
			$('.ad_tbl_toplist button').css({'background-color':'#FFFFFF', 'border':'1px solid #666666', 'color': '#666666'});
			$('#LogCntnHstry').hide();
		    $('#LogMenuHstry').hide();
		    $('#LogTrsmHstry').hide();
		    $('#LogBatchHstry').hide();
		    $('#RawMtrChgHstry').hide();
		    $('#SortInvntrChgHstry').hide();
		    $('#GdsInvntrChgHstry').hide();
		    $('#'+btnName.slice(3)).show();
		    $('#'+btnName.slice(3)+' [name='+btnName+']').css({'background-color':'#149FFF', 'border':'1px solid #149FFF', 'color': '#FFFFFF'});
// 		    eval('tab'+btnName.slice(3)+'.init(gv_selectedApcCd, gv_selectedApcNm)');
		    searchTarget = btnName.slice(3);
		});
		$('#GdsInvntrChgHstry [name=btnGdsInvntrChgHstry]').click();
	});
	
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_search();
	})
	
	// 이력 조회 (조회 버튼)
    async function fn_search() {
		if(searchTarget == "LogCntnHstry"){
			fn_cellSearchGrid();
		} else if(searchTarget == "LogMenuHstry"){
			tabLogMenuHstry.search();
		} else if(searchTarget == "LogTrsmHstry"){
			tabLogTrsmHstry.search();
		} else if(searchTarget == "LogBatchHstry"){
			tabLogBatchHstry.search();
		} else if(searchTarget == "RawMtrChgHstry"){
			tabRawMtrChgHstry.search();
		} else if(searchTarget == "SortInvntrChgHstry"){
			tabSortInvntrChgHstry.search();
		} else if(searchTarget == "LogMap"){
			tabLogMap.search();
		}
    }
</script>
</html>