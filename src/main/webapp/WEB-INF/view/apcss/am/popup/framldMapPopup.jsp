<%--
  Created by IntelliJ IDEA.
  User: huno
  Date: 24. 5. 10.
  Time: 오전 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title : 팜맵데이터</title>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <p>
                    <span style="font-weight:bold;">팜맵데이터 출력</span>
                </p>
                <p>
                    <span style="color:black; font-weight:bold;"></span>
                </p>
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnSearchCnpt" name="btnSearchCnpt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="test()"></sbux-button>
                <sbux-button id="btnEndCnpt" name="btnEndCnpt" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-framldMap')"></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <!--[pp] 검색 -->
            <table class="table table-bordered tbl_row tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 12%">
                    <col style="width: 24%">
                    <col style="width: 12%">
                    <col style="width: 24%">
                    <col style="width: auto">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">APC명</th>
                    <th>
                        <sbux-input id="framld-inp-apcNm" name="cnpt-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
                    </th>
                    <th scope="row">주소</th>
                    <th class="td_input">
                        <sbux-input id="framld-inp-addr" name="framld-inp-addr" uitype="text" class="form-control input-sm" onkeyenter=""></sbux-input>
                    </th>
                    <th>&nbsp;</th>
                </tr>
                </tbody>
            </table>
            <!--[pp] //검색 -->
            <!--[pp] 검색결과 -->
            <div class="ad_section_top">
                <div id="sb-area-grdCnpt" style="width:100%;height:300px;"></div>
            </div>
            <!--[pp] //검색결과 -->
        </div>
    </div>
</section>
</body>
<script type="text/javascript">

    /**
     * @description
     */
    const popFramldMap = {
        prgrmId: 'FramldMapPopup',
        modalId: 'modal-framldMap',
        gridId: 'grdFramldMapPop',
        jsonId: 'jsonFramldMapPop',
        areaId: "sb-area-grdFramldMapPop",
        prvApcCd: "",
        objGrid: null,
        gridJson: [],
        callbackFnc: function() {},
        init: async function(_apcCd, _framldData, _callbackFnc) {
            console.log('popFramldMap init');
            console.log('popFramldMap _framldData', _framldData);
            SBUxMethod.set("framld-inp-apcNm", gv_selectedApcNm);
            SBUxMethod.set("framld-inp-addr", _framldData.stdg_addr);
        }
    }

</script>
</html>