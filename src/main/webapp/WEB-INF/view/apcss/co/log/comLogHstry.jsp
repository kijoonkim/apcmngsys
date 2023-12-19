<%
/**
 * @Class Name : comLogHstry.jsp
 * @Description : 이력관리 화면
 * @author SI개발부
 * @since 2023.08.23
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.10.23   	김호			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 이력조회</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 이력관리 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search()"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<div id="tab_content">
					<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
					<!-- 접속이력 탭 화면 -->
					    <div id="LogCntnHstry">
					    	<jsp:include page="../../co/log/comLogCntnHstry.jsp"></jsp:include>
					    </div>
						<!-- 화면열람이력 탭 화면 -->
					    <div id="LogMenuHstry">
					    	<jsp:include page="../../co/log/comLogMenuHstry.jsp"></jsp:include>
					    </div>
						<!-- 송수신이력 탭 화면 -->
					    <div id="LogTrsmHstry">
					    	<jsp:include page="../../co/log/comLogTrsmHstry.jsp"></jsp:include>
					    </div>
						<!-- 배치실행이력 탭 화면 -->
					    <div id="LogBatchHstry">
					    	<jsp:include page="../../co/log/comLogBatchHstry.jsp"></jsp:include>
					    </div>
					</c:if>
				    <!-- 원물재고변경이력 탭 화면 -->
				    <div id="RawMtrChgHstry">
				    	<jsp:include page="../../co/log/rawMtrChgHstry.jsp"></jsp:include>
				    </div>
				    <!-- 선별재고변경이력 탭 화면 -->
				    <div id="SortInvntrChgHstry">
				    	<jsp:include page="../../co/log/sortInvntrChgHstry.jsp"></jsp:include>
				    </div>
				    <!-- 상품재고변경이력 탭 화면 -->
				    <div id="GdsInvntrChgHstry">
				    	<jsp:include page="../../co/log/gdsInvntrChgHstry.jsp"></jsp:include>
				    </div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var searchTarget = "logCntnHstry";
	var ymdFrom;
	var ymdTo;

	$(function(){
		$('.ad_tbl_toplist button').click(function(){
			ymdFrom = SBUxMethod.get($('input:visible[name*="YmdFrom"]').attr('id'));
			ymdTo = SBUxMethod.get($('input:visible[name*="YmdTo"]').attr('id'));

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

		    (new Function('tab'+btnName.slice(3)+'.init(gv_selectedApcCd, gv_selectedApcNm, '+ymdFrom+', '+ymdTo+')'))();
		    searchTarget = btnName.slice(3);
		});

		ymdFrom = gfn_dateFirstYmd(new Date());
		ymdTo = gfn_dateToYmd(new Date());
		var userType = '${loginVO.userType}';

		if(userType == "00" || userType == "01"){
			(new Function('tabLogCntnHstry.init(gv_selectedApcCd, gv_selectedApcNm, '+ymdFrom+', '+ymdTo+')'))();
			$('#LogCntnHstry [name=btnLogCntnHstry]').click();
		}else{
			(new Function('tabRawMtrChgHstry.init(gv_selectedApcCd, gv_selectedApcNm, '+ymdFrom+', '+ymdTo+')'))();
			$('#RawMtrChgHstry [name=btnRawMtrChgHstry]').click();
		}
	});

	window.addEventListener('DOMContentLoaded', function(e) {

	})

	// 이력 조회 (조회 버튼)
    async function fn_search() {
		if(searchTarget == "LogCntnHstry"){
			tabLogCntnHstry.search();
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
		} else if(searchTarget == "GdsInvntrChgHstry"){
			tabGdsInvntrChgHstry.search();
		}
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>