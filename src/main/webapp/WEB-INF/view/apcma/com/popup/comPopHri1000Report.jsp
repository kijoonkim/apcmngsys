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
<section id="comPopHri1000Report">
	<div class="box box-solid">
		<div class="box-body">
			<div class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>출력옵션</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<button class="btn btn-sm btn-outline-danger cu-btn-sch-comPopHri1000Report" style="min-width:40px" >출력</button>
					</div>
				</div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<colgroup>
						<col style="width:33%">
						<col style="width:33%">
						<col style="width:33%">
					</colgroup>
					<tbody style="vertical-align:middle;">
						<tr>
							<td class="td_input" style="border-right:hidden;">
								<sbux-checkbox uitype="normal" id="CHKPAGE1" name="CHKPAGE1" uitype="normal" class="form-control input-sm check" text="인사기록카드(1)" true-value="Y" false-value="N" checked/>
							</td>
							<td class="td_input" style="border-right:hidden;">
								<sbux-checkbox uitype="normal" id="CHKPAGE2" name="CHKPAGE2" uitype="normal" class="form-control input-sm check" text="발령사항" true-value="Y" false-value="N"/>
							</td>
							<td class="td_input" style="border-right:hidden;">
								<sbux-checkbox uitype="normal" id="CHKPAGE3" name="CHKPAGE3" uitype="normal" class="form-control input-sm check" text="교육훈련" true-value="Y" false-value="N"/>
							</td>
						</tr>
						<tr>
							<td class="td_input" style="border-right:hidden;">
								<sbux-checkbox uitype="normal" id="CHKPAGE4" name="CHKPAGE4" uitype="normal" class="form-control input-sm check" text="기타사항" true-value="Y" false-value="N"/>
							</td>
							<td class="td_input" style="border-right:hidden;">
								<sbux-checkbox uitype="normal" id="CHKPAGE5" name="CHKPAGE5" uitype="normal" class="form-control input-sm check" text="인사평가" true-value="Y" false-value="N"/>
							</td>
						</tr>
						<tr>
							<td class="td_input" style="border-right:hidden;">
								<sbux-checkbox uitype="normal" id="CHKCAREER" name="CHKCAREER" uitype="normal" class="form-control input-sm check" text="경력사항 표기" true-value="Y" false-value="N" checked/>
							</td>
						</tr>
						<tr>
							<td class="td_input" style="border-right:hidden;">
								<sbux-checkbox uitype="normal" id="CHKFAMILY_WITH_YN" name="CHKFAMILY_WITH_YN" uitype="normal" class="form-control input-sm check" text="가족사항(부양표기)" true-value="Y" false-value="N" checked/>
							</td>
							<td class="td_input" style="border-right:hidden;">
								<sbux-checkbox uitype="normal" id="CHKFAMILY_LIFE_YN" name="CHKFAMILY_LIFE_YN" uitype="normal" class="form-control input-sm check" text="가족사항(사망포함)" true-value="Y" false-value="N" checked/>
							</td>
						</tr>
						<tr>
							<td class="td_input" style="border-right:hidden;">
								<sbux-checkbox uitype="normal" id="CHKUNION_JOIN_YN" name="CHKUNION_JOIN_YN" uitype="normal" class="form-control input-sm check" text="조합가입여부" true-value="Y" false-value="N"/>
							</td>
						</tr>
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
	function comPopHri1000Report(options) {

		// id 선언
		var modalId  	= '#comPopHri1000Report';
		var modalDivId 	= 'modal-comPopHri1000Report';

		var settings = {
			callbackEvent			: null
		};
		$.extend(settings, options);
		//ok
		$(modalId).find('.cu-btn-sch-comPopHri1000Report').off('click');
		$(modalId).find('.cu-btn-sch-comPopHri1000Report').click(function(){
			if(settings.callbackEvent){
				var robj = {
					PAGE1 : gfn_nvl(SBUxMethod.get("CHKPAGE1").CHKPAGE1),
					PAGE2 : gfn_nvl(SBUxMethod.get("CHKPAGE2").CHKPAGE2),
					PAGE3 : gfn_nvl(SBUxMethod.get("CHKPAGE3").CHKPAGE3),
					PAGE4 : gfn_nvl(SBUxMethod.get("CHKPAGE4").CHKPAGE4),
					PAGE5 : gfn_nvl(SBUxMethod.get("CHKPAGE5").CHKPAGE5),
					CAREER : gfn_nvl(SBUxMethod.get("CHKCAREER").CHKCAREER),
					FAMILY_WITH_YN: gfn_nvl(SBUxMethod.get("CHKFAMILY_WITH_YN").CHKFAMILY_WITH_YN),
					FAMILY_LIFE_YN: gfn_nvl(SBUxMethod.get("CHKFAMILY_LIFE_YN").CHKFAMILY_LIFE_YN),
					UNION_JOIN_YN: gfn_nvl(SBUxMethod.get("CHKUNION_JOIN_YN").CHKUNION_JOIN_YN)
				};
				settings.callbackEvent(robj);
				SBUxMethod.closeModal(modalDivId);
			}
		});
	}
 
</script>
</html>