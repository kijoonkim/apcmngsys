<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title : 출하지시번호 선택</title>

    <style>
        .custom_td{
            padding: 25px 20px !important;
            font-size: 17px;
            font-weight: bold;
        }
        .custom_btn{
            padding: 10px 67px;
            background-color: #3c8dbced;
            border-radius: 5px;
            border: 1px solid #e8f1f9;
            font-size: 15px;
            font-weight: bold;
            color: white;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <p>
                    <span style="font-weight:bold;">출하실적</span>
                </p>
                <p>
                    <span style="color:black; font-weight:bold;"></span>
                </p>
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnSearchSpmtCmnd" name="btnSearchSpmtCmnd" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectSpmtPrfmncComList"></sbux-button>
                <sbux-button id="btnEndSpmtCmnd" name="btnEndSpmtCmnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-spmtPrfmncCom')"></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <!--[pp] 검색 -->
            <table id="spmtPrfmncComTable" class="table table-bordered tbl_row tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">출하지시일자</th>
                    <td class="td_input" style="border-right: hidden">
                        <sbux-datepicker id="spmtCmnd-dtp-cmndYmd" name="spmtCmnd-dtp-cmndYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
                    </td>
                    <td colspan="2" style="text-align: right">
                        <button class="custom_btn" style="padding: 0px 60px !important;" onclick="fn_exportExcel()">일괄 다운로드</button>
                    </td>
                </tr>
                <tr>
                    <th scope="row">일자</th>
                    <th scope="row">거래처</th>
                    <th scope="row">출하번호</th>
                    <th scope="row">엑셀다운로드</th>
                </tr>
                <tr>
                    <td class="td_input custom_td" colspan="4" style="text-align: center"> 출하지시일자를 선택하고 조회를 눌러주세요. </td>
                </tr>
                </tbody>
            </table>
            <!--[pp] //검색 -->
            <!--[pp] 검색결과 -->
            <div class="ad_section_top" style="display: none;">
                <div id="sb-area-grdSpmtCmndPop" style="width:100%;height:300px;"></div>
            </div>
            <!--[pp] //검색결과 -->
        </div>
    </div>
</section>
</body>
<script type="text/javascript">

    window.addEventListener("DOMContentLoaded",function(){
       SBUxMethod.set("spmtCmnd-dtp-cmndYmd", gfn_dateToYmd(new Date()));
    });

    const fn_selectSpmtPrfmncComList = async function(){
        $('#spmtPrfmncComTable tbody tr:gt(1)').remove();

        let spmtYmdFrom = SBUxMethod.get("spmtCmnd-dtp-cmndYmd");

        const postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncComList.do",{apcCd : gv_apcCd,spmtYmdFrom : spmtYmdFrom});
        const data = await postJsonPromise;
        if(data.resultStatus === 'S'){
            data.resultList.forEach(function(item){
               $("#spmtPrfmncComTable > tbody").append(`
               <tr>
                    <td class="td_input custom_td">${'${item.spmtYmd}'}</td>
                    <td class="td_input custom_td">${'${item.cnptNm}'}</td>
                    <td class="td_input custom_td">${'${item.spmtno}'}</td>
                    <td class="td_input"  style="text-align: center;"><button class="custom_btn" onclick="fn_exportExcel(this)">다운로드</button></td>
               </tr>
               `)
            });
            if(data.resultList.length == 0){
                $("#spmtPrfmncComTable > tbody").append(`
               <tr>
                    <td class="td_input custom_td" colspan="4" style="text-align: center">조회 결과가 없습니다.</td>
               </tr>
               `);
            }
        }
    }

    async function fn_exportExcel(_el){
        let postJsonPromise;
        if(gfn_isEmpty(_el)){
            let spmtYmd = SBUxMethod.get("spmtCmnd-dtp-cmndYmd");
            postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncDetailList.do",{apcCd : gv_apcCd, spmtYmd: spmtYmd});
        }else{
            let spmtno = $(_el).closest('td').prev('td').text();
            postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncDetailList.do",{apcCd : gv_apcCd, spmtno: spmtno});
        }

        const data = await postJsonPromise;

        if(data.resultStatus === 'S'){
            jsonPckgPrfmnc = data.resultList;
            gridPckgPrfmnc.rebuild();
            gridPckgPrfmnc.deleteColumn(0);
            gridPckgPrfmnc.exportLocalExcel("출하실적");
        }
    }
    //
    // const fn_create_pckgPrfmnc = async function(){
    //     var SBGridProperties = {};
    //     SBGridProperties.parentid = 'sb-area-pckgPrfmnc';
    //     SBGridProperties.id = 'gridPckgPrfmnc';
    //     SBGridProperties.jsonref = 'jsonPckgPrfmnc';
    //     SBGridProperties.emptyrecords = '데이터가 없습니다.';
    //     SBGridProperties.mergecells = 'bycol';
    //     SBGridProperties.datamergefalseskip = true;
    //     SBGridProperties.columns = [
    //         {caption: ["거래처"],	ref: 'cnptNm',		type:'output',  width:'20%', style: 'text-align:center; font-size:15px',fixedstyle: 'font-size:20px;font-weight:bold'},
    //         {caption: ["생산자"],	ref: 'prdcrNm',		type:'output',  width:'15%', style: 'text-align:center; font-size:15px',fixedstyle: 'font-size:20px;font-weight:bold',merge:false},
    //         {caption: ["품목"],	ref: 'itemNm',		type:'output',  width:'20%', style: 'text-align:center; font-size:15px',fixedstyle: 'font-size:20px;font-weight:bold',merge:false},
    //         {caption: ["품종"],	ref: 'vrtyNm',		type:'output',  width:'20%', style: 'text-align:center; font-size:15px',fixedstyle: 'font-size:20px;font-weight:bold',merge:false},
    //         {caption: ["규격"],	ref: 'spcfctNm',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px',fixedstyle: 'font-size:20px;font-weight:bold',merge:false},
    //         {caption: ["수량"],	ref: 'spmtQntt',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px',fixedstyle: 'font-size:20px;font-weight:bold',merge:false},
    //     ]
    //     gridPckgPrfmnc = _SBGrid.create(SBGridProperties);
    // }
</script>
</html>