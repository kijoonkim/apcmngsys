<%--
  Created by IntelliJ IDEA.
  User: GGAMP
  Date: 2024-05-08
  Time: 오전 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 지금방법/조건</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3><!-- 지급방법/조건 -->

                <div class="box-body">

                    <!--[pp] 검색 -->
                    <table class="table table-bordered tbl_fixed">
                        <caption>검색 조건 설정</caption>
                        <colgroup>
                            <col style="width: 7%">
                            <col style="width: 6%">
                            <col style="width: 3%">
                            <col style="width: 7%">
                            <col style="width: 6%">
                            <col style="width: 3%">
                            <col style="width: 7%">
                            <col style="width: 6%">
                            <col style="width: 3%">
                            <col style="width: 7%">
                            <col style="width: 6%">

                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_bg">법인</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-nation-bi"
                                        name="srch-nation-bi"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonApcBx"
                                        readonly
                                />
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">수금,지급구분</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-nation-sg"
                                        name="srch-nation-sg"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonApcBx"
                                />
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">기준일자</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-nation-stDate"
                                        name="srch-nation-stDate"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonApcBx"
                                />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">지급기준코드</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input
                                        uitype="text"
                                        id="srch-inp-cd"
                                        name="srch-inp-cd"
                                        class="form-control input-sm"
                                        autocomplete="off"
                                />
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">지급기준명</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input
                                        uitype="text"
                                        id="srch-inp-nm"
                                        name="srch-inp-nm"
                                        class="form-control input-sm"
                                        autocomplete="off"
                                />
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">지급조건</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-inp-term"
                                        name="srch-inp-term"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonApcBx"
                                />
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">지급예정일</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input
                                        uitype="text"
                                        id="srch-inp-date"
                                        name="srch-inp-date"
                                        class="form-control input-sm"
                                        autocomplete="off"
                                />
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <div class="ad_tbl_top2">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>지급기준 관리</span>
                            </li>
                        </ul>
                        <div class="ad_tbl_toplist">
                            <sbux-button
                                    id="btnDel"
                                    name="btnDel"
                                    uitype="normal"
                                    text="행삭제"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_delRow"
                                    style="float: right;"
                            >
                            </sbux-button>
                            <sbux-button
                                    id="btnAdd"
                                    name="btnAdd"
                                    uitype="normal"
                                    text="행추가"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_addRow"
                                    style="float: right;"
                            ></sbux-button>
                            <sbux-button
                                    id="btmCopyClear"
                                    name="btmCopyClear"
                                    uitype="normal"
                                    text="복사해제모드" <%--그리드 복사 불가. 붙여넣기 불가.--%>
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_gridCopyClear"
                                    style="float: right; display: block"
                            ></sbux-button>
                            <sbux-button
                                    id="btmCopyLine"
                                    name="btmCopyLine"
                                    uitype="normal"
                                    text="행복사모드" <%--행단위로 복사--%>
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_gridCopyLine"
                                    style="float: right; display: none;"
                            ></sbux-button>
                            <sbux-button
                                    id="btmCopyCell"
                                    name="btmCopyCell"
                                    uitype="normal"
                                    text="셀복사모드" <%--셀단위로 복사--%>
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_gridCopyCell"
                                    style="float: right; display: none;"
                            ></sbux-button>
                            </sbux-button>
                        </div>
                    </div>

                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwInfo" style="height:283px;"></div>
                    </div>
                </div>

                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">

    // ${comMenuVO.menuId}

    // 공통코드 JSON
    var jsonColtxmType = [];	// 수급,지급유형
    var jsoncColbasisType = [];	// 기산일기준
    var jsonColperiodType = [];	// 기간유형
    var jsonCcolstartRule = [];	// 기산일 시작일기준
    var jsonColaddDay1 = [];	// 기준일수1
    var jsonColaddDay2 = [];	// 기준일수2
    var jsonColstandard1Day = [];	// 특정기준일1
    var jsonColstandard2Day = [];	// 기준일2
    var jsonColstandard3Day = [];	// 기준일3
    var jsonColstandard4Day = [];	// 기준일4
    var jsonColstandard5Day = [];	// 기준일5
    var jsonColstdType = [];	// 휴일제외 기준일구분
    var jsonColpayMethod = [];	// 지급방법
    var jsonColbillDueType = [];	// 어음-휴일기준

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });

    const fn_init = async function() {

        let rst = await Promise.all([
        //지역
        gfnma_setComSelect(['grdFimList'], jsonColtxmType, 'L_COM045', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['grdFimList'], jsoncColbasisType, 'L_FIM037', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['grdFimList'], jsonColperiodType, 'L_FIM038', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['grdFimList'], jsonCcolstartRule, 'L_FIM038', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['grdFimList'], jsonColaddDay1, 'L_FIM042', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['grdFimList'], jsonColaddDay2, 'L_FIM042', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['grdFimList'], jsonColstandard1Day, 'L_FIM042', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['grdFimList'], jsonColstandard2Day, 'L_FIM042', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['grdFimList'], jsonColstandard3Day, 'L_FIM042', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['grdFimList'], jsonColstandard4Day, 'L_FIM042', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['grdFimList'], jsonColstandard5Day, 'L_FIM042', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['grdFimList'], jsonColstdType, 'L_FIM040', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['grdFimList'], jsonColpayMethod, 'L_FIM081', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['grdFimList'], jsonColbillDueType, 'L_FIM040', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);

        fn_createGrid('clear');

      /*  gfn_setComCdSBSelect(
            ['srch-select-msgKnd', 'dtl-select-msgKnd'],
            jsonComMsgKnd,
            'MSG_KND');*/

    }

    // grid
    // 선별실적
    var grdFimList;
    var jsonNationList = [];

    const columns1 = [
        {
            caption: ["기간유형","수급,지급유형"],
            ref : 'txm_type',
            width : '120px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonColtxmType',
                displayui : true,
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["기간유형","지급기준코드"],
            ref: 'pay_term_code',
            type:'input',
            width:'120px',
            style:'text-align:center'
        },
        {
            caption: ["기간유형","지급기준명"],
            ref: 'pay_term_name',
            type:'input',
            width:'120px',
            style:'text-align:center'
        },
        {
            caption: ["기간유형","사용여부"],
            ref: 'use_yn',
            type:'checkbox',
            width:'120px',
            style:'text-align:center',
            typeinfo: {
                ignoreupdate : true,
                fixedcellcheckbox : {
                    usemode : true,
                    rowindex : 1,
                    deletecaption : false
                },
                checkedvalue : 'Y',
                uncheckedvalue : 'N'
            }
        },
        {
            caption : ["일반기준","기산일기준"],
            ref : 'basis_type',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsoncColbasisType',
                displayui : true,
                label : 'label',
                value : 'value'
            }
        },
        {
            caption : ["일반기준","기간유형"],
            ref : 'period_type',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonColperiodType',
                displayui : true,
                label : 'label',
                value : 'value'
            }
        },
        {
            caption : ["일반기준","기산일 시작일기준"],
            ref : 'start_rule',
            width : '150px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonCcolstartRule',
                displayui : true,
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["기간유형","가산월"],
            ref: 'add_month',
            type:'input',
            width:'70px',
            style:'text-align:center',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption: ["기간유형","가산일"],
            ref: 'add_day',
            type:'input',
            width:'70px',
            style:'text-align:center',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption : ["일반기준","기준일수1"],
            ref : 'add_day1',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonColaddDay1',
                displayui : true,
                label : 'label',
                value : 'value'
            }
        },{
            caption : ["일반기준","기준일수2"],
            ref : 'add_day2',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonColaddDay2',
                displayui : true,
                label : 'label',
                value : 'value'
            }
        },{
            caption : ["기준일(특정일)","특정기준일1"],
            ref : 'standard1_day',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonColstandard1Day',
                displayui : true,
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["기준일(특정일)","특정일1보다 작을때 가산월"],
            ref: 's1_add_month',
            type:'input',
            width:'120px',
            style:'text-align:center',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption: ["기준일(특정일)","특정일1보다 작을때 가산일"],
            ref: 's1_add_day',
            type:'input',
            width:'120px',
            style:'text-align:center',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption : ["기준일2 ","기준일2"],
            ref : 'standard2_day',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonColstandard2Day',
                displayui : true,
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["기준일2 ","기준일2보다 작을때 가산월"],
            ref: 's2_add_month',
            type:'input',
            width:'120px',
            style:'text-align:center',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption: ["기준일2 ","기준일2보다 작을때 가산일"],
            ref: 's2_add_day',
            type:'input',
            width:'120px',
            style:'text-align:center',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption : ["기준일3 ","기준일3"],
            ref : 'standard3_day',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonColstandard3Day',
                displayui : true,
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["기준일3 ","기준일3보다 작을때 가산월"],
            ref: 's3_add_month',
            type:'input',
            width:'120px',
            style:'text-align:center',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption: ["기준일3 ","기준일3보다 작을때 가산일"],
            ref: 's3_add_day',
            type:'input',
            width:'120px',
            style:'text-align:center',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption : ["기준일4 ","기준일4"],
            ref : 'standard4_day',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonColstandard4Day',
                displayui : true,
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["기준일4 ","기준일4보다 작을때 가산월"],
            ref: 's4_add_month',
            type:'input',
            width:'120px',
            style:'text-align:center',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption: ["기준일4 ","기준일4보다 작을때 가산일"],
            ref: 's4_add_day',
            type:'input',
            width:'120px',
            style:'text-align:center',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption : ["기준일5 ","기준일5"],
            ref : 'standard5_day',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonColstandard5Day',
                displayui : true,
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["기준일5 ","기준일5보다 작을때 가산월"],
            ref: 's5_add_month',
            type:'input',
            width:'120px',
            style:'text-align:center',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption: ["기준일5 ","기준일5보다 작을때 가산일"],
            ref: 's5_add_day',
            type:'input',
            width:'120px',
            style:'text-align:center',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption : ["휴일제외기준일구분","휴일제외 기준일구분"],
            ref : 'std_type',
            width : '120px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonColstdType',
                displayui : true,
                label : 'label',
                value : 'value'
            }
        },
        {
            caption : ["지불방식 ","지급방법"],
            ref : 'pay_method',
            width : '100px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonColpayMethod',
                displayui : true,
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["지불방식 ","적용가능지급조건"],
            ref: 'avail_pay_method',
            type:'input',
            width:'120px',
            style:'text-align:center',
        },
        {
            caption: ["어음일수 ","어음일수"],
            ref: 'bill_day',
            type:'input',
            width:'120px',
            style:'text-align:center',
            typeinfo : {mask : {alias :'numeric'}}
        },
        {
            caption : ["어음일수 ","어음-휴일기준"],
            ref : 'bill_due_type',
            width : '120px',
            style : 'text-align:center',
            type : 'combo',
            typeinfo : {
                ref : 'jsonColbillDueType',
                displayui : true,
                label : 'label',
                value : 'value'
            }
        },
        {
            caption: ["비고","비고"],
            ref: 'memo',
            type:'input',
            width:'70px',
            style:'text-align:center',
        },

    ];

    const fn_createGrid = function(chMode, rowData) {

        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwInfo';
        SBGridProperties.id = 'grdFimList';
        SBGridProperties.jsonref = 'jsonNationList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사

        if (chMode == 'clear') { //복사해제모드
            SBGridProperties.selectmode = 'free';
        } else if(chMode == 'line'){ //행복사모드
            SBGridProperties.selectmode = 'byrow'; //byrow 선택row  채우는 방향 옵션
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
            SBGridProperties.selectcellfocus = true; //selectmode가 byrow, byrows일 때 선택한 셀을 표시 여부를 설정합니다.

        } else if(chMode == 'cell'){ //셀복사모드
            SBGridProperties.selectmode = 'free';
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        }
        /*SBGridProperties.explorerbar = 'move';*/				// 개인화 컬럼 이동 가능
       /* SBGridProperties.contextmenu = true;*/				// 우클린 메뉴 호출 여부
        /*SBGridProperties.contextmenulist = objMenuList1;*/	// 우클릭 메뉴 리스트
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.frozencols = 4; //고정열 지정


        SBGridProperties.columns = [];

        columns1.forEach((col) => {
            SBGridProperties.columns.push(col);
        });

        grdFimList = _SBGrid.create(SBGridProperties);

        if (rowData != null){
            grdFimList.push(rowData);
        }

    }

    // 행 추가
    const fn_addRow = function() {
        let rowVal = gvwInfoGrid.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            grdFimList.addRow(true);
        }else{
            grdFimList.insertRow(rowVal);
        }
    }

    // 행삭제
    const fn_delRow = async function() {

        let checkCol = grdFimList.getColRef("use_yn");
        let checkeds = grdFimList.getCheckedRows(checkCol, true);
        /* let reverseCheckeds = checkeds.reverse();*/

        if (checkeds.length == 0) {

            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        }else{

            for (let i = checkeds.length -1; i >= 0; i--){
                grdFimList.deleteRow(checkeds[i]);
            }

        }


    }

    const fn_gridCopyClear = function (){ /*셀복사 해제 (복사해제모드)*/
        $('#btmCopyClear').hide();
        $('#btmCopyLine').show();
        $('#btmCopyCell').hide();

        /*grdFimList.bind('selectmode', 'free');*/

        let datas = grdFimList.getGridDataAll();
        _SBGrid.destroy('grdFimList');

        let line = 'line'; //그리드 프로퍼티스 라인모드

        fn_createGrid(line, datas);


    }
    const fn_gridCopyLine = function () { /*행복사 (행복사모드)*/
        $('#btmCopyClear').hide();
        $('#btmCopyLine').hide();
        $('#btmCopyCell').show();

        let datas = grdFimList.getGridDataAll();
        _SBGrid.destroy('grdFimList');

        let cell = 'cell'; //그리드 프로퍼티스 셀모드

        fn_createGrid(cell, datas);

    }
    const fn_gridCopyCell = function () { /*셀복사 (셀복사모드)*/
        $('#btmCopyClear').show();
        $('#btmCopyLine').hide();
        $('#btmCopyCell').hide();

        let datas = grdFimList.getGridDataAll();
        _SBGrid.destroy('grdFimList');

        let clear = 'clear'; //그리드 프로퍼티스 클리어모드

        fn_createGrid(clear, datas);
    }



</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
