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
		$('.ad_tbl_toplist button').click(function(){
			var btnName = $(this).attr('id').slice(0, $(this).attr('id').length-1);
			$('.ad_tbl_toplist button').css({'background-color':'#FFFFFF', 'border':'1px solid #666666', 'color': '#666666'});
			$('#comLogCntnHstry').hide();
		    $('#comLogMenuHstry').hide();
		    $('#comLogTrsmHstry').hide();
		    $('#comLogBatchHstry').hide();
		    $('#com'+btnName.slice(3)).show();
		    $('#com'+btnName.slice(3)+' [name='+btnName.slice(0)+']').css({'background-color':'#149FFF', 'border':'1px solid #149FFF', 'color': '#FFFFFF'});
		    eval('tab'+btnName.slice(3)+'.init(gv_selectedApcCd, gv_selectedApcNm)');
		    searchTarget = 'l' + btnName.slice(4);
		});
		$('#comLogCntnHstry [name=btnLogCntnHstry]').click();
	});
	
	window.addEventListener('DOMContentLoaded', function(e) {
		
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