<%--
  Created by IntelliJ IDEA.
  User: LKH
  Date: 2024-08-06
  Time: 오후 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body oncontextmenu="return false">
<section id="fbs2040Popup">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <table class="table table-bordered tbl_row tbl_fixed">
                    <colgroup>
                        <col style="width:14%">
                        <col style="width:14%">
                        <col style="width:1%">
                        <col style="width:14%">
                        <col style="width:14%">
                        <col style="width:14%">
                        <col style="width:14%">
                        <col style="width:3%">
                        <col style="width:10%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg">입출유형</th>
                        <td colspan="3" class="td_output" style="border-right: hidden;">
                            <div class="dropdown">
                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_TRANSFER_TYPE_POP" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="SRCH_TRANSFER_TYPE_POP" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                        <th scope="row" class="th_bg">FBS서비스</th>
                        <td colspan="3" class="td_output" style="border-right: hidden;">
                            <div class="dropdown">
                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_FBS_SERVICE_POP" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="SRCH_FBS_SERVICE_POP" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                        <td rowspan="2">
                            <sbux-button id="btnQuery" name="btnQuery" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger cu-btn-sch-fbs2040Popup" style="float: right;"></sbux-button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">지급예정일자</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-datepicker
                                    uitype="popup"
                                    id="SRCH_TXN_DATE_FR_POP"
                                    name="SRCH_TXN_DATE_FR_POP"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                    style="width:100%;"
                            />
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <span> ~ </span>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-datepicker
                                    uitype="popup"
                                    id="SRCH_TXN_DATE_TO_POP"
                                    name="SRCH_TXN_DATE_TO_POP"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                    style="width:100%;"
                            />
                        </td>
                        <th scope="row" class="th_bg">입출계좌</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-input id="SRCH_DEPOSIT_CODE_POP" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-input id="SRCH_DEPOSIT_NAME_POP" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark  cu-btn-findDepositCode-fbs2040Popup"
                                    text="찾기" uitype="modal"
                                    target-id="modal-compopup1"
                            ></sbux-button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="box-body">
            <div class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
                <div id="sb-area-fbs2024Grid" style="width:930px;height:500px;"></div>
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확인" class="btn btn-sm btn-outline-danger cu-btn-confirm-fbs2040Popup" style="float: right;"></sbux-button>
                <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger cu-btn-cancel-fbs2040Popup" style="float: right;"></sbux-button>
            </div>
        </div>
        <!--[pp] //검색결과 -->

    </div>
</section>
</body>
<script>
    var fbs2024Grid;
    var fbs2024GridList = [];

    var settings = {
        FROM_DATE : null,
        TO_DATE : null,
        DEPOSIT_CODE : null,
        TRANSFER_TYPE : null,
        callback : null
    };

    const fn_fbs2024GridDblClick = async function() {
        if(typeof options.callback === 'function') {
            options.callback(fbs2024Grid.getRowData(fbs2024Grid.getRow()));
        }
    };

    async function fbs2040Popup(options) {

        // id 선언
        var modalId = '#fbs2040Popup';
        var modalDivId = 'modal-fbs2040Popup';
        $.extend(settings, options);

        const onload = async function () {
            let rst = await Promise.all([
                // 입출유형
                gfnma_multiSelectInit({
                    target: ['#SRCH_TRANSFER_TYPE_POP']
                    , compCode: gv_ma_selectedApcCd
                    , clientCode: gv_ma_selectedClntCd
                    , bizcompId: 'L_FBS016'
                    , whereClause: ''
                    , formId: p_formId
                    , menuId: p_menuId
                    , selectValue: ''
                    , dropType: 'down' 	// up, down
                    , dropAlign: 'right' 	// left, right
                    , colValue: 'SUB_CODE'
                    , colLabel: 'CODE_NAME'
                    , columns: [
                        {caption: "코드", ref: 'SUB_CODE', width: '150px', style: 'text-align:left'},
                        {caption: "명칭", ref: 'CODE_NAME', width: '150px', style: 'text-align:left'}
                    ]
                }),
                // FBS서비스
                gfnma_multiSelectInit({
                    target: ['#SRCH_FBS_SERVICE_POP']
                    , compCode: gv_ma_selectedApcCd
                    , clientCode: gv_ma_selectedClntCd
                    , bizcompId: 'L_FBS019'
                    , whereClause: ''
                    , formId: p_formId
                    , menuId: p_menuId
                    , selectValue: ''
                    , dropType: 'down' 	// up, down
                    , dropAlign: 'right' 	// left, right
                    , colValue: 'SUB_CODE'
                    , colLabel: 'CODE_NAME'
                    , columns: [
                        {caption: "코드", ref: 'SUB_CODE', width: '150px', style: 'text-align:left'},
                        {caption: "명", ref: 'CODE_NAME', width: '150px', style: 'text-align:left'}
                    ]
                }),
            ]);
        }

        //setGrid
        const setGrid = async function () {
            //기간별환율 탭 - 기간별환율등록
            var SBGridProperties = {};
            SBGridProperties.parentid = 'sb-area-fbs2024Grid';
            SBGridProperties.id = 'fbs2024Grid';
            SBGridProperties.jsonref = 'fbs2024GridList';
            SBGridProperties.emptyrecords = '데이터가 없습니다.';
            SBGridProperties.selectmode = 'byrow';
            SBGridProperties.explorerbar = 'sortmove';
            SBGridProperties.extendlastcol = 'scroll';
            SBGridProperties.columns = [
                {caption: [""], ref: 'CHECK_YN', type:'checkbox', width:'40px', style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
                {caption: ["순번"], ref: 'SEQ', type: 'output', width: '44px', style: 'text-align:left'},
                {caption: ["사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '111px',
                    typeinfo: {
                        ref			: 'jsonSiteCode',
                        label		: 'label',
                        value		: 'value',
                        itemcount	: 10
                    }
                    , disabled: true
                },
                {caption: ["등록일"],       ref: 'TXN_DATE', 		type:'datepicker',  	width:'96px',  	style:'text-align:left',
                    typeinfo: {dateformat: 'yyyy-mm-dd'},
                    format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                    , disabled: true
                },
                {caption: ["등록시간"],       ref: 'TXN_TIME', 		type:'datepicker',  	width:'74px',  	style:'text-align:left',
                    format : {type:'date', rule:'HH:mm:ss', origin:'HHmmss'}, typeinfo : {mask : {alias : 'numeric'}}
                    , disabled: true
                },
                {caption: ["순번"], ref: 'TXN_SEQ', type: 'output', width: '49px', style: 'text-align:left'},
                {caption: ["입출유형"], 		ref: 'TRANSFER_TYPE',   	    type:'combo', style:'text-align:left' ,width: '111px',
                    typeinfo: {
                        ref			: 'jsonTransferType',
                        label		: 'label',
                        value		: 'value',
                        itemcount	: 10
                    }
                    , disabled: true
                },
                {caption: ["출금계좌"], ref: 'BANK_ACCOUNT_NO', type: 'output', width: '192px', style: 'text-align:left'},
                {caption: ["예약여부"], ref: 'RESERVE_YN', type: 'output', width: '66px', style: 'text-align:left', hidden: true},
                {caption: ["입금처"], 		ref: 'PAYER_NAME',   	    type:'combo', style:'text-align:left' ,width: '147px',
                    typeinfo: {
                        ref			: 'jsonPayerName',
                        label		: 'label',
                        value		: 'value',
                        itemcount	: 10
                    }
                    , disabled: true
                },
                {caption: ["입금은행"], ref: 'PAYER_BANK_CODE', type: 'output', width: '70px', style: 'text-align:left'},
                {caption: ["입금은행명"], ref: 'PAYER_BANK_NAME', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
                {caption: ["입금계좌"], ref: 'PAYER_BANK_ACCOUNT', type: 'output', width: '142px', style: 'text-align:left'},
                {caption: ["CMS코드"], ref: 'CMS_CODE', type: 'output', width: '110px', style: 'text-align:left'},
                {caption: ["이체금액"],         ref: 'TXN_AMT',    type:'output',  	width:'143px',  style:'text-align:right',
                    typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                    , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
                },
                {caption: ["예금주"], ref: 'PAYER_BANK_ACCOUNT_OWNER', type: 'output', width: '142px', style: 'text-align:left'},
                {caption: ["지급구분"], ref: 'PAYROLL_FLAG', type: 'output', width: '60px', style: 'text-align:left', hidden: true},
                {caption: ["입금적요"], ref: 'IN_PRINT', type: 'output', width: '118px', style: 'text-align:left'},
                {caption: ["출금적요"], ref: 'OUT_PRINT', type: 'output', width: '115px', style: 'text-align:left'},
                {caption: ["거래ID"], ref: 'TXN_ID', type: 'output', width: '137px', style: 'text-align:left', hidden: true},
                {caption: ["입력시간"], ref: 'INSERT_TIME', type: 'output', width: '160px', style: 'text-align:left'},
                {caption: ["출금은행"], ref: 'BANK_CODE', type: 'output', width: '66px', style: 'text-align:left', hidden: true},
                {caption: ["출금은행명"], ref: 'BANK_NAME', type: 'output', width: '118px', style: 'text-align:left', hidden: true},
                {caption: ["지급예정일"], ref: 'PLANNED_PAY_DATE', type: 'output', width: '75px', style: 'text-align:left'},
                {caption: ["통화"], ref: 'CURRENCY_CODE', type: 'output', width: '75px', style: 'text-align:left'},
                {caption: ["예적금코드"], ref: 'DEPOSIT_CODE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
                {caption: ["예적금명"], ref: 'DEPOSIT_NAME', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
                {caption: ["지급보류"], ref: 'DEFER_YN', type: 'output', width: '75px', style: 'text-align:left'},
                {caption: ["TREASURY_ID"], ref: 'TREASURY_ID', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
                {caption: ["입금처아이디"], ref: 'PAYER_ID', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
                {caption: ["ITEM_ID"], ref: 'ITEM_ID', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
                {caption: ["DOC_ID"], ref: 'DOC_ID', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            ];
            fbs2024Grid = _SBGrid.create(SBGridProperties);
            fbs2024Grid.bind('dblclick', 'fn_fbs2024GridDblClick');
        }

        // get data
        const getData = async function () {
            let FBS_SERVICE = gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE_POP'));
            let TXN_DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE_FR_POP"));
            let TXN_DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE_TO_POP"));
            let DEPOSIT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPOSIT_CODE_POP"));
            let TRANSFER_TYPE = gfn_nvl(gfnma_multiSelectGet('#SRCH_TRANSFER_TYPE_POP'));

            var paramObj = {
                V_P_DEBUG_MODE_YN: '',
                V_P_LANG_ID: '',
                V_P_COMP_CODE: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                V_P_FBS_SERVICE: FBS_SERVICE,
                V_P_TXN_DATE_FR: TXN_DATE_FR,
                V_P_TXN_DATE_TO: TXN_DATE_TO,
                V_P_DEPOSIT_CODE: DEPOSIT_CODE,
                V_P_TRANSFER_TYPE: TRANSFER_TYPE,
                V_P_FORM_ID: p_formId,
                V_P_MENU_ID: p_menuId,
                V_P_PROC_ID: '',
                V_P_USERID: '',
                V_P_PC: '',
            };
            const postJsonPromise = gfn_postJSON("/com/fbs2040tList.do", {
                getType: 'json',
                workType: 'Q',
                cv_count: '1',
                params: gfnma_objectToString(paramObj)
            });
            const data = await postJsonPromise;
            console.log('popup get data:', data);

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    data.cv_1.forEach((item, index) => {
                        fbs2024GridList.legnth = 0;
                        const msg = {
                            CHECK_YN: item.CHECK_YN,
                            SEQ: item.SEQ,
                            SITE_CODE: item.SITE_CODE,
                            TXN_DATE: item.TXN_DATE,
                            TXN_TIME: item.TXN_TIME,
                            TXN_SEQ: item.TXN_SEQ,
                            TRANSFER_TYPE: item.TRANSFER_TYPE,
                            RESERVE_YN: item.RESERVE_YN,
                            DEPOSIT_CODE: item.DEPOSIT_CODE,
                            BANK_CODE: item.BANK_CODE,
                            BANK_NAME: item.BANK_NAME,
                            BANK_ACCOUNT_NO: item.BANK_ACCOUNT_NO,
                            PAYER_ID: item.PAYER_ID,
                            PAYER_NAME: item.PAYER_NAME,
                            PAYER_BANK_CODE: item.PAYER_BANK_CODE,
                            PAYER_BANK_NAME: item.PAYER_BANK_NAME,
                            PAYER_BANK_ACCOUNT: item.PAYER_BANK_ACCOUNT,
                            PAYER_BANK_ACCOUNT_OWNER: item.PAYER_BANK_ACCOUNT_OWNER,
                            CMS_CODE: item.CMS_CODE,
                            TXN_AMT: item.TXN_AMT,
                            PAYROLL_FLAG: item.PAYROLL_FLAG,
                            IN_PRINT: item.IN_PRINT,
                            OUT_PRINT: item.OUT_PRINT,
                            INSERT_TIME: item.INSERT_TIME,
                            TREASURY_ID: item.TREASURY_ID,
                            DOC_ID: item.DOC_ID,
                            DOC_NAME: item.DOC_NAME,
                            ITEM_ID: item.ITEM_ID,
                            DEFER_YN: item.DEFER_YN,
                            PLANNED_PAY_DATE: item.PLANNED_PAY_DATE,
                            CURRENCY_CODE: item.CURRENCY_CODE
                        }
                        fbs2024GridList.push(msg);
                    });
                    fbs2024Grid.rebuild();

                } else {
                    alert(data.resultMessage);
                }

            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        };

        const fn_findDepositCode = function() {
            var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_DEPOSIT_NAME_POP"));
            var replaceText0 	= "_DEPOSIT_CODE_";
            var replaceText1 	= "_DEPOSIT_NAME_";
            var replaceText2 	= "_CURRENCY_CODE_";
            var strWhereClause 	= "AND DEPOSIT_CODE LIKE '%" + replaceText0 + "%' AND DEPOSIT_NAME LIKE '%" + replaceText1 + "%' AND CURRENCY_CODE LIKE '%"+ replaceText2 + "%'";

            SBUxMethod.attr('modal-compopup1', 'header-title', '계좌정보(예적금원장) 정보');
            compopup1({
                compCode				: gv_ma_selectedApcCd
                ,clientCode				: gv_ma_selectedClntCd
                ,bizcompId				: 'P_DEPOSIT'
                ,popupType				: 'A'
                ,whereClause			: strWhereClause
                ,searchCaptions			: ["예적금코드", "예적금명", "통화코드" ]
                ,searchInputFields		: ["DEPOSIT_CODE", "DEPOSIT_NAME", "CURRENCY_CODE"]
                ,searchInputValues		: ["", searchText, ""]
                ,height					: '400px'
                ,tableHeader			: ["예적금코드", "예적금명", "계좌번호", "계좌유형", "금융기관코드", "금융기관명", "수금자금수지", "수금계정", "수금계정명", "수수료계정", "수수료계정명", "통화코드", "은행코드"]
                ,tableColumnNames		: ["DEPOSIT_CODE" , "DEPOSIT_NAME", "ACCOUNT_NUM", "DEPOSIT_TYPE", "BANK_CS_CODE", "BANK_CS_NAME", "RECEIPT_TR_TYPE", "RECEIPT_ACCOUNT", "RECEIPT_ACCOUNT_NAME", "FEE_ACCOUNT", "FEE_ACCOUNT_NAME", "CURRENCY_CODE", "BANK_CODE"]
                ,tableColumnWidths		: ["100px", "200px", "140px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px"]
                ,itemSelectEvent		: function (data){
                    console.log('callback data:', data);
                    SBUxMethod.set('SRCH_DEPOSIT_NAME_POP', data.DEPOSIT_NAME);
                    SBUxMethod.set('SRCH_DEPOSIT_CODE_POP', data.DEPOSIT_CODE);
                },
            });
        }

        const fn_confirm = async function () {
            let gvwListCheckedList = fbs2024Grid.getCheckedRows(fbs2024Grid.getColRef("CHECK_YN"), true);

            var checkedDataList = [];

            gvwListCheckedList.forEach((item, index) => {
                checkedDataList.push(fbs2024Grid.getRowData(item));
            });

            if(typeof options.callback === 'function') {
                options.callback(checkedDataList);
            }
        }

        const fn_cancel = async function () {
            if(typeof options.callback === 'function') {
                options.callback(null);
            }
        }

        await onload();
        await setGrid();

        //start
        if (!gfn_isEmpty(settings.DEPOSIT_CODE)) {
            if (gfn_nvl(settings.DEPOSIT_CODE) != "") {
                SBUxMethod.set("SRCH_DEPOSIT_CODE_POP", settings.DEPOSIT_CODE);
                SBUxMethod.set("SRCH_DEPOSIT_NAME_POP", settings.DEPOSIT_NAME);
            }
        }

        if (!gfn_isEmpty(settings.TRANSFER_TYPE)) {
            if (gfn_nvl(settings.TRANSFER_TYPE) != "") {
                gfnma_multiSelectSet('#SRCH_TRANSFER_TYPE_POP', 'SUB_CODE', 'CODE_NAME', gfn_nvl(settings.TRANSFER_TYPE));
            }
        }

        if (!gfn_isEmpty(settings.FROM_DATE)) {
            SBUxMethod.set("SRCH_TXN_DATE_FR_POP", settings.FROM_DATE);
        } else {
            SBUxMethod.set("SRCH_TXN_DATE_FR_POP", gfn_dateToYmd(new Date(new Date().getFullYear(), 1, 1)));
        }

        if (!gfn_isEmpty(settings.TO_DATE)) {
            SBUxMethod.set("SRCH_TXN_DATE_TO_POP", settings.TO_DATE);
        } else {
            SBUxMethod.set("SRCH_TXN_DATE_TO_POP", gfn_dateToYmd(new Date()));
        }

        gfnma_multiSelectSet('#SRCH_FBS_SERVICE_POP', 'SUB_CODE', 'CODE_NAME', "ECBANK");

        await getData();

        $(modalId).find('.cu-btn-sch-fbs2040Popup').off('click');
        $(modalId).find('.cu-btn-sch-fbs2040Popup').click(function(){
            getData();
        });

        $(modalId).find('.cu-btn-findDepositCode-fbs2040Popup').off('click');
        $(modalId).find('.cu-btn-findDepositCode-fbs2040Popup').click(function(){
            fn_findDepositCode();
        });

        $(modalId).find('.cu-btn-confirm-fbs2040Popup').off('click');
        $(modalId).find('.cu-btn-confirm-fbs2040Popup').click(function(){
            fn_confirm();
        });

        $(modalId).find('.cu-btn-cancel-fbs2040Popup').off('click');
        $(modalId).find('.cu-btn-cancel-fbs2040Popup').click(function(){
            fn_cancel();
        });


    }
</script>
</html>
