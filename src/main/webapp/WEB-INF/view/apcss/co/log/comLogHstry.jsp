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
				<div>
					<h3 class="box-title" style="line-height: 30px;"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search()"></sbux-button>
				</div>
			</div>
			
			<div class="box-body">
				<div class="ad_tbl_top2">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnLogCntnHstry" name="btnLogCntnHstry" uitype="normal" text="접속이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
						<sbux-button id="btnLogMenuHstry" name="btnLogMenuHstry" uitype="normal" text="화면열람이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
						<sbux-button id="btnLogTrsmHstry" name="btnLogTrsmHstry" uitype="normal" text="송수신이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
						<sbux-button id="btnLogBatchHstry" name="btnLogBatchHstry" uitype="normal" text="배치실행이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					</div>
				</div>
				<div id="tab_content">
					<!-- 접속이력 탭 화면 -->
				    <div id="comLogCntnHstry">
				    	<jsp:include page="../../co/log/comLogCntnHstry.jsp"></jsp:include>
				    </div>
					<!-- 화면열람이력 탭 화면 -->
				    <div id="comLogMenuHstry">
				    	<jsp:include page="../../co/log/comLogMenuHstry.jsp"></jsp:include>
				    </div>
					<!-- 송수신이력 탭 화면 -->
				    <div id="comLogTrsmHstry">
				    	<jsp:include page="../../co/log/comLogTrsmHstry.jsp"></jsp:include>
				    </div>
					<!-- 배치실행이력 탭 화면 -->
				    <div id="comLogBatchHstry">
				    	<jsp:include page="../../co/log/comLogBatchHstry.jsp"></jsp:include>
				    </div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var searchTarget = "logCntnHstry";

	$(function(){
		$('#btnLogCntnHstry').click(function(){
		    $('#comLogCntnHstry').show();
		    $('#comLogMenuHstry').hide();
		    $('#comLogTrsmHstry').hide();
		    $('#comLogBatchHstry').hide();
		    searchTarget = "logCntnHstry";
		});
		$('#btnLogMenuHstry').click(function(){
		    $('#comLogCntnHstry').hide();
		    $('#comLogMenuHstry').show();
		    $('#comLogTrsmHstry').hide();
		    $('#comLogBatchHstry').hide();
		    searchTarget = "logMenuHstry";
		});
		$('#btnLogTrsmHstry').click(function(){
		    $('#comLogCntnHstry').hide();
		    $('#comLogMenuHstry').hide();
		    $('#comLogTrsmHstry').show();
		    $('#comLogBatchHstry').hide();
		    searchTarget = "logTrsmHstry";
		});
		$('#btnLogBatchHstry').click(function(){
		    $('#comLogCntnHstry').hide();
		    $('#comLogMenuHstry').hide();
		    $('#comLogTrsmHstry').hide();
		    $('#comLogBatchHstry').show();
		    searchTarget = "logBatchHstry";
		});
		$('#btnLogCntnHstry').click();
	});

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			
		]);
	}

	const fn_initTabs = function() {
		tabLogCntnHstry.init(gv_selectedApcCd, gv_selectedApcNm);
		tabLogMenuHstry.init(gv_selectedApcCd, gv_selectedApcNm);
		tabLogTrsmHstry.init(gv_selectedApcCd, gv_selectedApcNm);
		tabLogBatchHstry.init(gv_selectedApcCd, gv_selectedApcNm);
	}
	
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_initSBSelect();
		fn_initTabs();
	})
	
	// 이력 조회 (조회 버튼)
    async function fn_search() {
		if(searchTarget == "logCntnHstry"){
			tabLogCntnHstry.search();
		} else if(searchTarget == "logMenuHstry"){
			tabLogMenuHstry.search();
		} else if(searchTarget == "logTrsmHstry"){
			tabLogTrsmHstry.search();
		} else if(searchTarget == "logBatchHstry"){
			tabLogBatchHstry.search();
		}
    }
</script>
</html>