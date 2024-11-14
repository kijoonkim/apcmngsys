<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%
    String colgroupDataStr = request.getParameter("colgroupData");
    String colspanDataStr = request.getParameter("colspanData");
    String colTdCntStr = request.getParameter("colTdCnt");

    JSONArray colgroupData = new JSONArray(colgroupDataStr); // JSON 배열로 변환
    JSONArray colspanData = new JSONArray(colspanDataStr);
    JSONArray colTdCnt = new JSONArray(colTdCntStr);
%>
<table id="apcSelectMa" class="table table-bordered tbl_fixed">
    <colgroup>
        <% for (int i = 0; i < colgroupData.length(); i++) { %>
        <col style="width:<%= colgroupData.getJSONObject(i).getString("width") %>">
        <% } %>
    </colgroup>
    <tbody>
    <tr>
        <th scope="row" style="border-bottom:1px solid white " class="th_bg" >클라이언트 코드</th>
        <td <% if (colspanData.getInt(0) > 1) { %> colspan="<%= colspanData.getInt(0) %>" <% } %> class="td_input" style="border-right:hidden;border-bottom: hidden">
            <script type="text/javascript">
                var gv_ma_selectedClntCd	= '${loginVO.clntCd}';
                var temp_jsonClientCode		= [];
                gfnma_setComSelect(['gsb-slt-clntCd'], temp_jsonClientCode, 'L_CLIENT', '', '', '', 'CLIENT_CODE', 'CLIENT_NAME', 'Y', gv_ma_selectedClntCd);

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
        <td <% if (colspanData.getInt(0) > 1) { %> colspan="<%= colspanData.getInt(1) %>" <% } %> class="td_input" style="border-right:hidden;border-bottom: hidden">
            <script type="text/javascript">
                <c:choose>
                <c:when test="${comApcList != null}">
                var cjsonApcList = ${comApcList};
                </c:when>
                <c:otherwise>
                var cjsonApcList = {};
                </c:otherwise>
                </c:choose>

                var gv_ma_selectedCorpCd	= '${loginVO.corpCd}';
                var gv_ma_selectedCorpNm	= '${loginVO.corpNm}';
                //값선택
                for (var i = 0; i < cjsonApcList.length; i++) {
                    var obj = cjsonApcList[i];
                    if(i==0){
                        obj['selected'] 	= "selected";
                        gv_ma_selectedCorpCd 	= obj['value'];
                    }
                    if(obj['corpCd']=='${loginVO.corpCd}'){
                        obj['selected'] 	= "selected";
                        gv_ma_selectedCorpCd 	= obj['value'];
                    }
                }

                /**
                 * @name
                 * @description
                 * @function
                 * @param {string} _apcCd
                 */
                const cfn_onChangeApc = function(obj) {
                    gv_ma_selectedCorpCd = obj.value;
                    gv_ma_selectedCorpNm = obj.text;
                }

            </script>
            <c:choose>
                <c:when test="${loginVO != null && loginVO.apcAdminType != null}">
                    <sbux-select
                            id="gsb-slt-apcCd"
                            name="gsb-slt-apcCd"
                            uitype="single"
                            jsondata-ref="cjsonApcList"
                            jsondata-text="label"
                            jsondata-value="value"
                            class="form-control input-sm"
                            onchange="cfn_onChangeApc(this)"
                            style="max-width:150px;"
                    ></sbux-select>
                </c:when>
                <c:otherwise>
                    <c:set scope="request" var="apcNm" value="${loginVO.corpNm}"></c:set>
                    <sbux-input
                            id="gsb-slt-apcCd"
                            name="gsb-slt-apcCd"
                            uitype="text"
                            class="form-control input-sm"
                            readonly
                    ><c:out value='${corpNm}'></c:out></sbux-input>
                </c:otherwise>
            </c:choose>
        </td>

        <td <% if (colspanData.getInt(0) > 1) { %> colspan="<%= colspanData.getInt(2) %>" <% } %>></td>
    </tr>
</table>

