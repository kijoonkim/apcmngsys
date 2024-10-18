<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

				<table id="apcSelectMa" class="table table-bordered tbl_fixed">
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" style="border-bottom:1px solid white " class="th_bg" >클라이언트 코드</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
	<script type="text/javascript">
		var gv_ma_selectedClntCd	= '${loginVO.clntCd}';
		var temp_jsonClientCode		= [];
		gfnma_setComSelect(['gsb-slt-clntCd'], temp_jsonClientCode, 'L_CLIENT', '', '', '', 'CLIENT_CODE', 'CLIENT_NAME', 'Y', gv_ma_selectedClntCd);

		window.addEventListener('DOMContentLoaded', async function(event) {
			$('[data-group]').find('input').on('keydown', function(e) {
				var fieldGroup = $(this).closest('td').data('group');
				var button = $('[data-group="' + fieldGroup + '"]').find('button');

				if (e.key === 'Backspace' || e.key === 'Delete') {
					$('[data-group="' + fieldGroup + '"]').find('input').each(function() {
						var inputId = $(this).attr('id');
						SBUxMethod.set(inputId, "");
					});
				}
				if (e.key === 'Enter') {
					e.preventDefault();
					button.click();
				}
			});
		});

		/**
		 * @name
		 * @description
		 * @function
		 * @param {string} _apcCd
		 */
		const cfn_onChangeClntCd = function(obj) {
			 gv_ma_selectedClntCd = obj.value;
		}		
	</script>								
								<c:choose>
									<c:when test="${loginVO != null && loginVO.apcAdminType != null}">
										<sbux-select
											id="gsb-slt-clntCd"
											name="gsb-slt-clntCd"
											uitype="single"
											jsondata-ref="temp_jsonClientCode"
											jsondata-text="label"
											jsondata-value="value"
											class="form-control input-sm"
											onchange="cfn_onChangeClntCd(this)"
											style="max-width:150px;"
										></sbux-select>
									</c:when>
									<c:otherwise>
										<c:set scope="request" var="clntCd" value="${loginVO.clntCd}"></c:set>
										<sbux-input
											id="gsb-slt-clntCd"
											name="gsb-slt-clntCd"
											uitype="text"
											class="form-control input-sm"
											readonly
										><c:out value='${clntCd}'></c:out></sbux-input>
									</c:otherwise>
								</c:choose>
							</td>
							
							<th scope="row" style="border-bottom:1px solid white " class="th_bg" >APC명</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
	<script type="text/javascript">
	<c:choose>
		<c:when test="${comApcList != null}">
		var cjsonApcList = ${comApcList};
		</c:when>
		<c:otherwise>
		var cjsonApcList = {};
		</c:otherwise>
	</c:choose>
		
		var gv_ma_selectedApcCd	= '${loginVO.apcCd}';
		var gv_ma_selectedApcNm	= '${loginVO.apcNm}';
		//값선택
		for (var i = 0; i < cjsonApcList.length; i++) {
			var obj = cjsonApcList[i];
			if(i==0){
				obj['selected'] 	= "selected";
				gv_ma_selectedApcCd 	= obj['apcCd'];
			}
			if(obj['apcCd']=='${loginVO.apcCd}'){
				obj['selected'] 	= "selected";
				gv_ma_selectedApcCd 	= obj['apcCd'];
			}
		}

		/**
		 * @name
		 * @description
		 * @function
		 * @param {string} _apcCd
		 */
		const cfn_onChangeApc = function(obj) {
			gv_ma_selectedApcCd = obj.value;
			gv_ma_selectedApcNm = obj.text;
		}

	</script>
	<c:choose>
		<c:when test="${loginVO != null && loginVO.apcAdminType != null}">
			<sbux-select
				id="gsb-slt-apcCd"
				name="gsb-slt-apcCd"
				uitype="single"
				jsondata-ref="cjsonApcList"
				jsondata-text="apcNm"
				jsondata-value="apcCd"
				class="form-control input-sm"
				onchange="cfn_onChangeApc(this)"
				style="max-width:150px;"
			></sbux-select>
		</c:when>
		<c:otherwise>
			<c:set scope="request" var="apcNm" value="${loginVO.apcNm}"></c:set>
			<sbux-input
				id="gsb-slt-apcCd"
				name="gsb-slt-apcCd"
				uitype="text"
				class="form-control input-sm"
				readonly
			><c:out value='${apcNm}'></c:out></sbux-input>
		</c:otherwise>
	</c:choose>
							</td>
							
							<td colspan="4"></td>
						</tr>
				</table>
						
				