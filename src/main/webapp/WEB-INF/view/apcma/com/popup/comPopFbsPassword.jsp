<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title></title>
    
    <style>
		.cu-table-selected {
		    background-color: #adddff; 
		    font-weight:bold;
		}		
    </style>
    
</head>
<body oncontextmenu="return false">
<section id="compopfbspassword">
	<div class="box box-solid">
		<div class="box-body">
			<div class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
				<table class="table table-bordered table-hover cu-data-table">
					<colgroup>
						<col style="width:30px">
						<col style="width:auto">
					</colgroup>
					<tbody style="vertical-align:middle;">
						<th scope="row" class="th_bg">비밀번호</th>
						<td class="td_input" style="border-right:hidden;">
							<sbux-input id="POP_PASSWORD" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
						</td>
						<td class="td_input" style="border-right:hidden;">
							<button class="btn btn-sm btn-outline-danger cu-btn-sch-compopfbspassword" style="min-width:40px" >확인</button>
						</td>
					</tbody>
				</table>
			</div>

		</div>
		<!--[pp] //검색결과 -->
	</div>
</section>
</body>
<script>

	/**
	 * @description 전기취소
	 */
	function compopfbspassword() {

		// id 선언
		var modalId  	= '#compopfbspassword';
		var modalDivId 	= 'modal-compopfbspassword';

		var settings = {
			callback			: null
		};

		//ok
		$(modalId).find('.cu-btn-sch-compopfbspassword').off('click');
		$(modalId).find('.cu-btn-sch-compopfbspassword').click(function(){
			if(settings.callbackEvent){
				var robj = {
					PASSWORD : gfn_nvl(SBUxMethod.get("POP_PASSWORD"))
				};
				settings.callbackEvent(robj);
				SBUxMethod.closeModal(modalDivId);
			}
		});
	}
 
</script>
</html>