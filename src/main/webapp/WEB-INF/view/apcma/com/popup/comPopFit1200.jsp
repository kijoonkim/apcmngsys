<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Title</title>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: end; padding-top: 0px" >
                <sbux-button
                        id="btnSearch"
                        name="btnSearch"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        onclick="popFit1200.fn_search"
                        text="조회"
                ></sbux-button>
            </div>
            <div class="box-body" style="padding-top: 0px">
                <table class="table table-bordered tbl_fixed">
                    <colgroup>
                        <col style="width: 20%">
                        <col style="width: 80%">
                    </colgroup>
                    <tbod>
                        <tr>
                            <th scope="row" class="th_bg">코드</th>
                            <td class="td_input" style="display: flex;">
                                <sbux-input id="srch-inp-taxSiteCode" name="srch-inp-taxSiteCode" uitype="text"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">코드명</th>
                            <td class="td_input" style="display: flex;">
                                <sbux-input id="srch-inp-taxSiteName" name="srch-inp-taxSiteName" uitype="text" wrap-style="flex-basis:70%"></sbux-input>
                            </td>
                        </tr>
                    </tbod>
                </table>
                <div class="ad_tbl_top" style="margin-top: 10px">
                    <ul class="ad_tbl_count">
                        <li><span>Popup 정보</span></li>
                    </ul>
                </div>
                <div class="table-responsive tbl_scroll_sm">
                    <div id="sb-area-grdTaxSite" style="width: 100%; height: 300px;"></div>
                </div>
            </div>
        </div>
    </section>
</body>
<script type="application/javascript">
    var grdTaxSite;
    // var jsonTaxSite = [{TAX_SITE_NAME : '그린에어주속회사', TAX_SITE_CODE : 'T02', BIZ_REGNO : '181818'}];
    var jsonTaxSite = [];
 
    const popFit1200 = {
        fn_callBack: () => {},
 
        fn_init: async function(callbackFn) {
            if (typeof callbackFn === 'function') {
                this.fn_callBack = callbackFn;
            }
 
            await this.fn_createTaxSite();
            await this.fn_search();
        },
 
        fn_search: async function() {
            let data = await gfnma_getComList('P_TAXSITE','',gv_ma_selectedCorpCd,gv_ma_selectedClntCd,'CO_CD',"CORP_NM",'');
            jsonTaxSite = [...data.cv_1];
            grdTaxSite.rebuild();
        },

        fn_createTaxSite: function() {
            const gridProperties = {
                parentid: 'sb-area-grdTaxSite',
                id: 'grdTaxSite',
                jsonref: 'jsonTaxSite',
                emptyrecords: '데이터가 없습니다.',
                columns: [
                    {caption: ['코드'], ref: 'TX_SITE_CD', type: 'output', width: '15%', style: 'text-align:center'},
                    {caption: ['사업장명'], ref: 'TX_SITE_NM', type: 'output', width: '45%', style: 'text-align:center'},
                    {caption: ['사업자번호'], ref: 'BRNO', type: 'output', width: '40%', style: 'text-align:center'}
                ]
            };
            grdTaxSite = _SBGrid.create(gridProperties);
            grdTaxSite.bind('dblclick', this.fn_callBack);
        }
    };
</script>
</html>
