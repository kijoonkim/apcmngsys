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
	<section id="compopup3">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<table class="table table-bordered tbl_row tbl_fixed">
						<colgroup>
							<col style="width:auto">
							<col style="width:150px">
						</colgroup>
						<tbody>
							<tr>
								<td class="td_input" >
									<a href="#" class="cu-btn-plus" title="행추가" >
										<img src="../../../resource/images/plus.png" width="20px" />
									</a>
									<a href="#" class="cu-btn-minus" title="행삭제" style="padding-left:5px">
										<img src="../../../resource/images/minus.png" width="20px" />
									</a>
									<a href="#" class="cu-btn-clear" title="초기화" style="padding-left:5px">
										<img src="../../../resource/images/clear.png" width="20px" />
									</a>
								</td>
								
								<td class="td_input" style="text-align:right;" >
									<sbux-button uitype="normal" text="확인" class="btn btn-sm btn-outline-danger cu-btn-ok" ></sbux-button>
									<sbux-button uitype="normal" text="취소" class="btn btn-sm btn-outline-danger cu-btn-cancel" ></sbux-button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="box-body">
				
				<div class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
					<table class="table table-bordered table-hover cu-data-table">
				        <colgroup>
							<col style="width:30px">
							<col style="width:auto">
				        </colgroup>
						<thead class="thead-light" style="background-color:#f5fbff;position:sticky;top:0;z-index:3">
							<th></th>
							<th style="text-align:center;" >코드</th>
						</thead>
						<tbody style="vertical-align:middle;">
						</tbody>
				    </table>
				</div>
				
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script >

/**
 * @description 복수코드
 */
function compopup3(options) {
	
	// id 선언
	var modalId  	= '#compopup3';
	var modalDivId 	= 'modal-compopup3';
	
	var settings = {
		height				: null
		,callbackEvent		: null
	};
	$.extend(settings, options);	
	//console.log('settings:', settings);

	//css
 	$(modalId).find('.cu-table-div').css('height', settings.height);
 	$(modalId).find('.cu-table-div').find('tbody').html('')
 	
	//넘버링
	var fn_numbering = function(){
		var cnt = 0;
		$(modalId).find('.cu-table-div').find('tbody tr').each(function(){
			cnt ++;
			$(this).find('td').eq(0).text(cnt);
		});
	}
	
	//행추가
	var addTr = function(){
		var tar = $(modalId).find('.cu-table-div').find('tbody');
		var htm = '';
		htm += '<tr>';
		htm += '<td></td>';
		htm += '<td>';
		htm += '<input uitype="text" class="form-control input-sm" style="width:100%" value="" />'
		htm += '</td>';
		htm += '</tr>';
		tar.append(htm);
		
		fn_numbering();
		tar.find('tr').off('click');
		tar.find('tr').click(function(){
		     if($(this).hasClass("cu-table-selected")){
		        $(this).removeClass('cu-table-selected');
		     } else {
		        $(this).addClass('cu-table-selected').siblings().removeClass('cu-table-selected');
		     }
		});			
	};
	$(modalId).find('.cu-btn-plus').off('click');
	$(modalId).find('.cu-btn-plus').click(function(e){
		e.preventDefault()
		addTr();
	});	

	//행삭제
	$(modalId).find('.cu-btn-minus').off('click');
	$(modalId).find('.cu-btn-minus').click(function(e){
		e.preventDefault()
		var tar = $(modalId).find('.cu-table-div').find('tbody').find('.cu-table-selected');
		var idx = tar.index();
		tar.eq(0).remove();
		fn_numbering();
		var len = $(modalId).find('.cu-table-div').find('tbody tr').length;
		if(idx > (len-1)){
			idx = len-1;
		}
		$(modalId).find('.cu-table-div').find('tbody').find('tr').eq(idx).addClass('cu-table-selected').siblings().removeClass('cu-table-selected');
	});	

	//클리어
	$(modalId).find('.cu-btn-clear').off('click');
	$(modalId).find('.cu-btn-clear').click(function(e){
		e.preventDefault()
		$(modalId).find('.cu-table-div').find('tbody').html('');
	});	
	
	//값 추출
	var getList = function(){
		var rlist = []
		$(modalId).find('.cu-table-div').find('tbody').find('tr').each(function(){
			var val = $(this).find('td').find('input').val();
			if(val){
				rlist.push(val);
			}			
		});
		return rlist;
	};	
	
	//ok
	$(modalId).find('.cu-btn-ok').off('click');
	$(modalId).find('.cu-btn-ok').click(function(){
 		if(settings.callbackEvent){
 			settings.callbackEvent(getList());
 		}
	 	SBUxMethod.closeModal(modalDivId);
	});
	
	//close event
	$(modalId).find('.cu-btn-cancel').off('click');
	$(modalId).find('.cu-btn-cancel').click(function(){
	 	SBUxMethod.closeModal(modalDivId);
	});	
	
}
 
</script>
</html>