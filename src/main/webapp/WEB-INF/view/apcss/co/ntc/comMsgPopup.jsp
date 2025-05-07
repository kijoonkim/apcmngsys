<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
    <title>title : APC업무지원시스템 - 알림</title>
    <style>
        .table {
            margin: 0 0 40px 0;
            width: 100%;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
            display: table;
            position: relative;
        }

        @media screen and (max-width: 580px) {
            .table {
                display: block;
            }
        }

        .rowP {
            display: table-row;
            background: #f6f6f6;
        }

        .colspan {
            position: absolute;
            left: 0;
            width: 100%;
            text-align: center;
        }

        .rowP:nth-of-type(odd) {
            background: #e9e9e9;
        }

        .rowP.header {
            font-weight: 900;
            color: #ffffff;
            background: #ea6153;
        }
        .rowP.header .cell{
            color: white;
        }

        .rowP.blue {
            background: #2980b9;
        }

        @media screen and (max-width: 580px) {
            .rowP {
                padding: 14px 0 7px;
                display: block;
            }

            .rowP.header {
                padding: 0;
                height: 6px;
            }

            .rowP.header .cell {
                display: none;
                color: white;
            }

            .rowP .cell {
                margin-bottom: 10px;
            }

            .rowP .cell:before {
                margin-bottom: 3px;
                content: attr(data-title);
                min-width: 98px;
                font-size: 10px;
                line-height: 10px;
                font-weight: bold;
                text-transform: uppercase;
                color: #969696;
                display: block;
            }
        }

        .cell {
            padding: 6px 12px;
            display: table-cell;
        }

        @media screen and (max-width: 580px) {
            .cell {
                padding: 2px 16px;
                display: block;
            }
        }
    </style>
</head>
<body>
    <div style="display: flex; flex-direction: column; gap: 1vh">
       <div style="display: flex;justify-items: center;align-items: center;gap:5px">
           <svg width="10%" height="10%" style="enable-background:new 0 0 256 256;" version="1.1" viewBox="0 0 256 256" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><style type="text/css">
               .st0{fill:#D5E2EB;}
               .st2{fill:#FFFFFF;}
               .st4{fill:#EA685E;}
               .st5{fill:#4B687F;}
               .st7{fill:#3E5063;}
           </style><g id="Layer_2"><circle class="st0" cx="128" cy="128" r="120"/></g><g id="Layer_1"><g><g><path class="st5" d="M58.17838,154.6655h139.68784V69.32594c0-2.49929-2.04488-4.54417-4.54417-4.54417H62.72255     c-2.4993,0-4.54417,2.04488-4.54417,4.54417V154.6655z"/></g><g><path class="st5" d="M148.40526,174.3745c0.73039,2.08173-0.8455,4.07103-2.8476,4.07103H136.2H119.8h-9.35766     c-2.00211,0-3.578-1.9893-2.8476-4.07103H46v5.86537c0,6.06319,4.91518,10.97836,10.97836,10.97836H119.8H136.2h62.82164     c6.06319,0,10.97836-4.91518,10.97836-10.97836v-5.86537H148.40526z"/></g><g><rect class="st2" height="71.70703" width="121.51115" x="67.26672" y="73.87012"/></g><g><polygon class="st7" points="197.86621,157.55962 58.17838,157.55962 46,174.3745 210,174.3745    "/></g><g><circle class="st4" cx="199.79562" cy="182.57449" r="2.89412"/></g></g></g></svg>
           <h3> 업무 요청 리스트</h3>
       </div>
        <div class="table">
            <div class="rowP header blue">
                <div class="cell">

                </div>
                <div class="cell">
                    발신자
                </div>
                <div class="cell">
                    구분
                </div>
                <div class="cell">
                    수신일시
                </div>
                <div class="cell">
                    내용
                </div>
                <div class="cell" style="text-align: center">
                    바로가기
                </div>
            </div>
        </div>
        </div>
    </div>

</body>
<script type="application/javascript">
    let jsonNtcSeCd = []
    window.addEventListener('DOMContentLoaded',function(){
       fn_searchComCd();
    });
    const popMsg= {
        init: async function(_userId){
            let data = await this.search(_userId);
            try{
                if(!gfn_isEmpty(data.resultList)){
                    if(data.resultList.length > 0){
                        /** 알림 카운트 셋팅 **/
                        $("#pop_cnt").text(data.resultList.length);
                        $("#body-modal-msgAlarm > div > div.table").children(':not(:first-child)').remove();

                        /** 알림 목록 리스트 셋팅 **/
                        for (const item of data.resultList) {
                            let tmp = this.getTemplate({
                                idntyYn : item.idntyYn,
                                dsptchUserId : item.dsptchUserId,
                                ntcSeCd : item.ntcSeCd,
                                rcptnDt : item.rcptnDt,
                                ntcMsg : item.ntcMsg,
                                rcptnSeq : item.rcptnSeq,
                                userId : item.userId,
                                acsMenuId : item.acsMenuId
                            });
                            $("#body-modal-msgAlarm > div > div.table").append(tmp);
                        }
                        /** update btn action **/
                        const idtyYnElements = document.querySelectorAll('[id^="btn_idntyYn"]');
                        idtyYnElements.forEach(element => {
                            $(element).on("click",function(){
                                let targetId = "#"+this.id;
                                let row = $(targetId).closest('.rowP');

                                /** update Val**/
                                let rcptnDt = row.find('[data-title="rcptnDt"]').text().trim();
                                let userId = row.find('[data-title="userId"]').text().trim();
                                let rcptnSeq = row.find('[data-title="rcptnSeq"]').text().trim();
                                popMsg.update(rcptnDt,userId,rcptnSeq);
                            });
                        });

                        /** 바로가기 btn action **/
                        const actionElements = document.querySelectorAll('[id^="btn_action"]');
                        actionElements.forEach(element => {
                            $(element).on("click",function(){
                                let menuId = $(element).attr('data-menuId')
                                fn_actionPage(menuId);
                            });
                        });

                    }
                }else{
                    $("#pop_wrap").css("display","none");
                    $("#body-modal-msgAlarm > div > div.table").children(':not(:first-child)').remove();
                    $("#body-modal-msgAlarm > div > div.table").append(`<div class="rowP">
                            <div class="cell colspan" data-title="action">
                              조회된 메세지가 없습니다.
                            </div></div>`);
                }
            }catch (e){
                console.error(e);
            }
        },
        search: async function(_userId){
            const postJsonPromise = gfn_postJSON("/co/ntc/selectUserMsgPopupList",{userId:_userId});
            const data = await postJsonPromise;
            return data;
        },
        getTemplate: function(_vo,_index){
            let ntcSeCd = jsonNtcSeCd.filter(function(item){
               return item.cdVl == _vo.ntcSeCd;
            });
            ntcSeCd = ntcSeCd[0].cdVlNm;
            return ` <div class="rowP">
                <div class="cell" data-title="idntyYn" style="text-align:center">
                    <button id="btn_idntyYn_${'${_vo.rcptnSeq}'}" style="border:0; color:white; background:#2980b9">확인</button>
                </div>
                <div class="cell" data-title="dsptchUserId">
                     ${'${_vo.dsptchUserId}'}
                </div>
                <div class="cell" data-title="ntcSeCd">
                     ${'${ntcSeCd}'}
                </div>
                <div class="cell" data-title="rcptnDt">
                     ${'${_vo.rcptnDt}'}
                </div>
                <div class="cell" data-title="ntcMsg">
                     ${'${_vo.ntcMsg}'}
                </div>
                <div class="cell" data-title="action" style="text-align:center">
                     <button id="btn_action_${'${_vo.rcptnSeq}'}" style="border:0; color:white; background:#2980b9" data-menuId="${'${_vo.acsMenuId}'}">이동</button>
                </div>
                <div style="display:none" data-title="userId">
                    ${'${_vo.userId}'}
                </div>
                <div style="display:none" data-title="rcptnSeq">
                    ${'${_vo.rcptnSeq}'}
                </div>
            </div>`
        },
        update: async function(_rcptnDt, _userId, _rcptnSeq){
            try{
                const postJsonPromise = gfn_postJSON("/co/ntc/updateMsgPopup",{
                    rcptnDt: new Date(_rcptnDt),
                    userId: _userId,
                    rcptnSeq: _rcptnSeq
                });
                const data = await postJsonPromise;
                if (_.isEqual("S", data.resultStatus)){
                    let btnEl = '#btn_idntyYn_' + _rcptnSeq;
                    $(btnEl).css("display","none");
                }
            }catch (e) {
                console.error(e);
            }
        },
    }
    /** 공통코드 메세지 구분 **/
    const fn_searchComCd = async function(){
        jsonNtcSeCd = await gfn_getComCdDtls("NTC_SE_CD");
    }
    const fn_actionPage = async function(_menuId){
        SBUxMethod.closeModal("modal-msgAlarm");
        let topId = _menuId.slice(0,_menuId.indexOf("_"));
        await fn_setLeftMenu(topId);

        let data = sideJsonData.filter((item) => item.id == _menuId);

        fn_actionGoPage(
            data[0].url
            , 'LEFT'
            , data[0].id
            , data[0].text
            , data[0].pid
        );
    }
</script>
</html>
