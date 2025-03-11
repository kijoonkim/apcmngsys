<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    var cjsonApcList = {};
    <c:choose>
    <c:when test="${comApcList != null}">
        cjsonApcList = ${comApcList};
    </c:when>
    <c:otherwise>
        cjsonApcList = {};
    </c:otherwise>
    </c:choose>
    cjsonApcList.forEach( (apc) => {
        if (gfn_isEmpty(gv_selectedApcCd)) {
            gv_selectedApcCd = apc.apcCd;
            gv_selectedApcNm = apc.apcNm;
            gv_selectedApcSeCd = apc.apcSeCd;
            return false;
        }
    });

    <c:if test="${loginVO != null && loginVO.apcAdminType != null}">
    //gv_selectedApcCd = null;
    //gv_selectedApcNm = null;
    //gv_selectedApcSeCd = null;
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
            gv_selectedApcSeCd = apc.apcSeCd;

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
                jsondata-text="apcNm"
                jsondata-value="apcCd"
                class="form-control input-sm"
                unselected-text="전체"
                onchange="cfn_onChangeApc(this)"
                style="max-width:80%;"
        ></sbux-select>
    </c:when>
    <c:otherwise>
        <sbux-select
                id="gsb-slt-apcCd"
                name="gsb-slt-apcCd"
                uitype="single"
                jsondata-ref="cjsonApcList"
                jsondata-text="apcNm"
                jsondata-value="apcCd"
                class="form-control input-sm"
                onchange="cfn_onChangeApc(this)"
                style="max-width:80%;"
        ></sbux-select>
    </c:otherwise>
</c:choose>
