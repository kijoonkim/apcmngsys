<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<sbux-button id="btnMap" name="btnMap" uitype="normal" text="APC전수조사" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnMdRtlOgnzNow" name="btnMdRtlOgnzNow" uitype="normal" text="산지유통시설" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnMdRtlFcltRgnNow" name="btnMdRtlFcltRgnNow" uitype="normal" text="산지유통시설지역별" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnGvrngmtSprtMdRtlFclt" name="btnGvrngmtSprtMdRtlFclt" uitype="normal" text="정부지원산지유통시설" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnGvrngmtSprtMdRtlFcltRgn" name="btnGvrngmtSprtMdRtlFcltRgn" uitype="normal" text="정부지원산지유통시설지역별" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnMdRtlFcltOperPrfmnc" name="btnMdRtlFcltOperPrfmnc" uitype="normal" text="산지유통시설운영실적" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnGvrngmtSprtRgnOperPrfmnc" name="btnGvrngmtSprtRgnOperPrfmnc" uitype="normal" text="정부지원지역별운영실적" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
				</div>
					
				<div style="margin-left: auto;">
					<table style="border: 0px; margin-bottom: 6px">
						<tr>
							<td style="text-align: right; line-height: 32px">
							<span> 연도 : </span>
							</td>
							<td style="padding-left: 10px; padding-right: 15px;">
								<sbux-select
									uitype="single"
									id="srch-slt-crtrYr"
									name="srch-slt-crtrYr"
									class="form-control input-sm input-sm-ast"
									jsondata-ref="jsonCrtrYr"
									style="width: 200px"
								/>
							</td>
							<td>
								<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search()"></sbux-button>
							</td>
						</tr>
					</table>
				
					
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
	var newSearchTarget = "Map";
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
		fn_initSBSelect();
		fn_search();
	})
	
	// 이력 조회 (조회 버튼)
    async function fn_search() {
		if(searchTarget == "MdRtlOgnzNow"){
			if(searchTarget != newSearchTarget){
				fn_cellCreateMdRtlOgnzNowGrid();
			}else{
				fn_cellMdRtlOgnzNowGrid();
			}
			newSearchTarget = searchTarget;
		} else if(searchTarget == "MdRtlFcltRgnNow"){
			if(searchTarget != newSearchTarget){
				fn_cellCreateMdRtlFcltRgnNowGrid();
			}else{
				fn_cellMdRtlFcltRgnNowGrid();
			}
			newSearchTarget = searchTarget;
		} else if(searchTarget == "GvrngmtSprtMdRtlFclt"){
			if(searchTarget != newSearchTarget){
				fn_cellCreateGvrngmtSprtMdRtlFcltGrid();
			}else{
				fn_cellGvrngmtSprtMdRtlFcltGrid();
			}
			newSearchTarget = searchTarget;
		} else if(searchTarget == "GvrngmtSprtMdRtlFcltRgn"){
			if(searchTarget != newSearchTarget){
				fn_cellCreateGvrngmtSprtMdRtlFcltRgnGrid();
			}else{
				fn_cellGvrngmtSprtMdRtlFcltRgnGrid();
			}
			newSearchTarget = searchTarget;
		} else if(searchTarget == "MdRtlFcltOperPrfmnc"){
			if(searchTarget != newSearchTarget){
				fn_cellCreateMdRtlFcltOperPrfmncGrid();
			}else{
				fn_cellMdRtlFcltOperPrfmncGrid();
			}
			newSearchTarget = searchTarget;
		} else if(searchTarget == "GvrngmtSprtRgnOperPrfmnc"){
			if(searchTarget != newSearchTarget){
				fn_cellCreateGvrngmtSprtRgnOperPrfmncGrid();
			}else{
				fn_cellGvrngmtSprtRgnOperPrfmncGrid();
			}
			newSearchTarget = searchTarget;
		}
    }
	
	var jsonCrtrYr = [];	// 기준년도 검색
	
	const fn_initSBSelect = async function() {
		let result = await Promise.all([
			gfn_setCrtrYr('srch-slt-crtrYr', jsonCrtrYr, gv_selectedApcCd)		// 기준년도 목록
		]);
	}
	
</script>
</html>