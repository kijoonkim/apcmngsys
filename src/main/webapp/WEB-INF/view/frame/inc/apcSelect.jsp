<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

				<table class="table table-bordered tbl_fixed">
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
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
	<c:if test="${loginVO != null && loginVO.apcAdminType != null}">
		gv_selectedApcCd = null;
		gv_selectedApcNm = null;
	</c:if>
		/**
		 * @name
		 * @description
		 * @function
		 * @param {string} _apcCd
		 */
		const cfn_onChangeApc = function(obj) {
			gv_selectedApcCd = obj.value;

			const apcInfo = gfn_getJsonFilter(cjsonApcList, 'apcCd', gv_selectedApcCd);
			apcInfo.forEach( (apc) => {
				gv_selectedApcNm = apc.apcNm;
				return false;
			});

			if (typeof fn_onChangeApc === "function") {
				fn_onChangeApc();
			}

		}

	</script>
	<c:choose>
		<c:when test="${loginVO != null && loginVO.apcAdminType != null}">
			<sbux-select
				id="gsb-slt-apcCd"
				name="gsb-slt-apcCd"
				uitype="single"
				jsondata-ref="cjsonApcList"
				unselected-text="전체"
				class="form-control input-sm"
				onchange="cfn_onChangeApc(this)"
				style="max-width:150px;"
			></sbux-select>
		</c:when>
		<c:otherwise>
			<sbux-input id="gsb-slt-apcCd" name="gsb-slt-apcCd" uitype="text"  class="form-control input-sm" disabled >${loginVO.apcNm}</sbux-input>
		</c:otherwise>
	</c:choose>
							</td>
							<td colspan="9"></td>
						</tr>
				</table>