function login() {
    $.ajax({
        type: 'post',
        url: './authenticate.do',
        data: JSON.stringify({
            'id': 'admin',
            'password':'1',
        }),
        beforeSend: function(xhr){
            xhr.setRequestHeader("Content-type", "application/json");
        },
        success: function(data, textStatus, xhr) {
            const userInfo = {
                'userId': data.data.userId,
                'comApcList': data.data.comApcList,
                'accessToken': data.data.accessToken
            };
            localStorage.setItem('userInfo', JSON.stringify(userInfo));
            location.reload();
        },
        error: function(xhr, status, error) {
            if(status == '401') {
                showLoginForm(true);
            }
        },
        complete: function(xhr, textStatus) {
            if(xhr.status == '401') {
                showLoginForm(true);
            }
        }
    });
}

function openPopApcInfo(apcCd = '') {
    $.ajax({
        type: 'post',
        url: '/co/user/selectApcEvrmntStngList.do',
        data: JSON.stringify({
            'apcCd': apcCd
        }),
        beforeSend: function(xhr){
            xhr.setRequestHeader("Content-type", "application/json");
        },
        success: function(data, textStatus, xhr) {

            if(data!=null && data.resultStatus == 'S' && data.resultList != null) {
                apcInfoList = [...data.resultList];
                data.resultList.forEach(function(item){
                    let x = parseFloat(item.xcrd);
                    let y = parseFloat(item.ycrd);
                    let flag = apcInfo.apcLists.some(i => i.value === item.apcCd);
                    addMarker(x,y,item.apcNm,flag);
                });
            }
        },
        error: function(xhr, status, error) {
            if(status == '401') {
                showLoginForm(true);
            }
        },
        complete: function(xhr, textStatus) {
            if(xhr.status == '401') {
                showLoginForm(true);
            }
        }
    });
}

function addMarker(lat, lng, label, flag) {
    if (!window.leafletMap) {
        console.error('지도(map)가 아직 초기화되지 않았습니다.');
        return;
    }

    let marker;

    if (flag) {
        // 깜빡이는 커스텀 SVG 마커 (색상: #59A1D5, 사이즈 조정)
        const svgIcon = L.divIcon({
            className: 'blinking-icon',
            html: `
                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="25" viewBox="0 0 24 35">
                    <path d="M12 0C5.4 0 0 5.4 0 12c0 9 12 23 12 23s12-14 12-23C24 5.4 18.6 0 12 0z" fill="#59A1D5"/>
                    <circle cx="12" cy="12" r="5" fill="white"/>
                </svg>
            `,
            iconSize: [20, 30],     // 실제 렌더링 크기
            iconAnchor: [7.5, 25]   // 기준점: 아래 중앙
        });

        marker = L.marker([parseFloat(lng), parseFloat(lat)], { icon: svgIcon }).addTo(window.leafletMap);
    } else {
        // 기존 PNG 마커
        const customIcon = L.icon({
            iconUrl: '/api/mobile/img/marker-icon-grey.png',
            iconSize: [15, 25],
            iconAnchor: [7.5, 25],
            popupAnchor: [0, -25]
        });

        marker = L.marker([parseFloat(lng), parseFloat(lat)], { icon: customIcon }).addTo(window.leafletMap);
    }

    if (label) {
        marker.bindPopup(label);
    }
}

function getApcAgtStatus(){
    $.ajax({
        type: 'get',
        url: '/co/user/getApcAgtStats.do',
        async: false,
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Content-type", "application/json");
        },
        success: function (data, textStatus, xhr) {
            /* APC 현황 시작 */
            apcInfo = {
                apcLists: data.result.resultLists.map(function (item) {
                    const kinds = [];

                    if (item.WGH_AGT_INSTL_YN != null) kinds.push({
                        name: '계량',
                        value: item.WGH_AGT_INSTL_YN === 'Y' ? 'active' : ''
                    });
                    if (item.SORT_AGT_INSTL_YN != null) kinds.push({
                        name: '선별',
                        value: item.SORT_AGT_INSTL_YN === 'Y' ? 'active' : ''
                    });

                    return {
                        name: item.APC_NM,
                        value: item.APC_CD,
                        nh: item.NH === 'Y' ? true : false,
                        cx: item.XCRD,
                        cy: item.YCRD,
                        kinds: kinds,
                        status: [
                            {name: '입고', value: item.WRHS_ACTVTN_YN === 'Y' ? 'active' : ''},
                            {name: '선별', value: item.SORT_ACTVTN_YN === 'Y' ? 'active' : ''},
                            {name: '출고', value: item.SPMT_ACTVTN_YN === 'Y' ? 'active' : ''},
                            {name: '재고', value: item.INVNTR_ACTVTN_YN === 'Y' ? 'active' : ''},
                            {name: '영농', value: item.AGRC_ACTVTN_YN === 'Y' ? 'active' : ''},
                            {name: '정산', value: item.CLCLN_ACTVTN_YN === 'Y' ? 'active' : ''}
                        ],
                        delYn: item.DEL_YN,
                        rcntData : getLatestDate([
                            item.WGH_LAST_USE_DT
                            ,item.WRHS_LAST_USE_DT
                            ,item.SORT_LAST_USE_DT
                            ,item.PCKG_LAST_USE_DT
                            ,item.PCKG_LAST_USE_DT
                            ,item.SPMT_LAST_USE_DT
                            ,item.ORDR_LAST_USE_DT
                            ,item.CLCLN_LAST_USE_DT
                            ,item.AGRC_LAST_USE_DT
                            ,item.INVNTR_LAST_USE_DT
                        ]),
                        useData : [
                            {name: 'wgh', value: item.WGH_LAST_USE_DT || '미사용'},
                            {name: 'wrhs', value: item.WRHS_LAST_USE_DT || '미사용'},
                            {name: 'sort', value: item.SORT_LAST_USE_DT || '미사용'},
                            {name: 'pckg', value: item.PCKG_LAST_USE_DT || '미사용'},
                            {name: 'spmt', value: item.SPMT_LAST_USE_DT || '미사용'},
                            {name: 'ordr', value: item.ORDR_LAST_USE_DT || '미사용'},
                            {name: 'clcln', value: item.CLCLN_LAST_USE_DT || '미사용'},
                            {name: 'agrc', value: item.AGRC_LAST_USE_DT || '미사용'},
                            {name: 'invntr', value: item.INVNTR_LAST_USE_DT || '미사용'},
                        ]
                    };
                })
            };
        },
        error: function (xhr, status, error) {
            if (status == '401') {
                showLoginForm(true);
            }
        },
        complete: function (xhr, textStatus) {
            if (xhr.status == '401') {
                showLoginForm(true);
            }
        }
    });
}
function getCountAllPrdcr(){
    $.ajax({
        type: 'get',
        url: '/co/user/getCountAllPrdcr.do',
        beforeSend: function(xhr){
            xhr.setRequestHeader("Content-type", "application/json");
        },
        success: function(data, textStatus, xhr) {
            $('#prdcrCount').text(data.result);
        },
        error: function(xhr, status, error){
            if(status == '401') {
                showLoginForm(true);
            }
        },
        complete: function(xhr, textStatus) {
            if(xhr.status == '401') {
                showLoginForm(true);
            }
        }
    });
}
function getStatsForOneYearBySearchYmd(){
    $.ajax({
        type: 'get',
        url: '/co/user/getStatsForOneYearBySearchYmd.do',
        beforeSend: function(xhr){
            xhr.setRequestHeader("Content-type", "application/json");
        },
        success: function(data, textStatus, xhr) {
            let values = [];
            let fromYear = parseInt(data.result.SEARCH_YMD_FROM.substring(0, 4));
            let toYear = parseInt(data.result.SEARCH_YMD_TO.substring(0, 4));
            let fromMonth = parseInt(data.result.SEARCH_YMD_FROM.substring(4, 6));
            let toMonth = parseInt(data.result.SEARCH_YMD_TO.substring(4, 6));
            let year = fromYear;
            for(let i = fromMonth; year < toYear || i <= toMonth; i++) {
                if(i == 13) {
                    i = 1;
                    year++;
                }
                let m = i < 10 ? '0' + i : i;
                values.push({'y': year + '-' + m});
            }

            $.each(data.result.RESULTS, function(index, el) {
                if(el.RS_TYPE == 'WRHS') {
                    for(let i = 0; i < values.length; i++) {
                        values[values.length - (i + 1)].wrhs = eval("el.C_" + i);
                    }
                } else if(el.RS_TYPE == 'SORT') {
                    for(let i = 0; i < values.length; i++) {
                        values[values.length - (i + 1)].sort = eval("el.C_" + i);
                    }
                } else if(el.RS_TYPE == 'WGH') {
                    for(let i = 0; i < values.length; i++) {
                        values[values.length - (i + 1)].wgh = eval("el.C_" + i);
                    }
                }
            });
            const series = [
                {
                    name: '입고',
                    data: values.map(v => ({ x: v.y, y: v.wrhs }))
                },
                {
                    name: '선별',
                    data: values.map(v => ({ x: v.y, y: v.sort }))
                },
                {
                    name: '계량',
                    data: values.map(v => ({ x: v.y, y: v.wgh }))
                }
            ];

            const options = {
                chart: {
                    type: 'area',
                    height: 200,
                    toolbar: {
                        show: false
                    }
                },
                series: series,
                xaxis: {
                    type: 'category', // x값이 문자열일 경우
                    labels: {
                        rotate: -45
                    }
                },
                colors: ['#A0D0E0', '#3C8DBC', '#047630'],
                stroke: {
                    curve: 'smooth'
                },
                dataLabels: {
                    enabled: false
                },
                legend: { show: false },
            };

            const chart = new ApexCharts(document.querySelector("#revenue-chart"), options);
            chart.render();
        },
        error: function(xhr, status, error){
            if(status == '401') {
                showLoginForm(true);
            }
        },
        complete: function(xhr, textStatus) {
            if(xhr.status == '401') {
                showLoginForm(true);
            }
        }
    });
}
function openPopApcLinkInfo(apcCd, linkKnd) {
    $.ajax({
        type: 'post',
        url: '/co/user/selectApcLinkTrsmMatSttsList.do',
        data: JSON.stringify({
            'apcCd': apcCd
        }),
        beforeSend: function(xhr){
            xhr.setRequestHeader("Content-type", "application/json");
        },
        success: function(data, textStatus, xhr) {
            if(data != null && data.resultStatus == 'S' && data.resultList != null) {
                let info = apcInfoList.filter(i => i.apcCd === apcCd)[0];
                $("#apcNm").text(info.apcNm);
                $("#apcRprsvNm").text(info.apcRprsvNm);
                $("#brno").text(info.brno);
                $("#telno").text(info.telno);
                $("#fxno").text(info.fxno);
                $("#addr").text(info.addr);
                /** 최근사용일자 **/
                let useData = apcInfo.apcLists.filter(i => i.value === apcCd)[0];
                useData.useData.forEach(i => $(`#${i.name}`).text(`${i.value}`));
                /** 기존 row empty **/
                let agentTbody = $("#agentTable tbody");
                agentTbody.empty();

                data.resultList.forEach(item => {
                    agentTbody.append(`<tr data-apc-cd="${item.apcCd}" data-trsm-mat-id="${item.trsmMatId}" data-link-knd="${item.linkKnd}">
                    <td>${item.trsmMatId}</td>
                    <td>${item.trsmMatNm}</td>
                    <td>${item.trsmMatSttsNm}
                    ${item.trsmMatSttsCd === "E1" ? "<span class='badge bg-red'></span>" :"<span class='badge bg-green'></span>"}
                    </td>
                    <td>${item.linkKndNm}</td>
                    <td style="font-size: 0.8rem">${item.reqDt || ''}</td>
                    <td style="font-size: 0.8rem">${item.prcsCmptnDt || ''}</td>
                    <td style="color: ${item.linkSttsColor}">${item.linkSttsNm}</td>
                    <td>
                    ${item.linkStts === 'P0' ? '<button type="button" onclick="req(this)" class="btn btn-outline-danger">요청</button>' : item.linkStts === 'R0' ? '<button type="button" onclick="reqCncl(this)" class="btn btn-outline-danger">취소</button>':''}
                    </td>
                    </tr>`);
                });

                let linkInfoTbody = $("#linkInfoTable tbody");

                data.resultList.forEach(item => {
                    linkInfoTbody.append(`
                        <tr>
                            <td>${item.apcNm}</td>
                            <td>${item.trsmMatId}</td>
                            <td>${item.trsmMatNm}</td>
                            <td>${item.trsmMatSttsNm} ${item.trsmMatSttsCd === "E1" ? "<span class='badge bg-red'></span>" : "<span class='badge bg-red'></span>"}</td>
                            <td>${item.linkKndNm}</td>
                            <td style="font-size: 0.8rem">${item.reqDt || ''}</td>
                            <td style="font-size: 0.8rem">${item.prcsCmptnDt || ''}</td>
                        </tr>
                    `);
                });
            }
        },
        error: function(xhr, status, error) {
            if(status == '401') {
                showLoginForm(true);
            }
        },
        complete: function(xhr, textStatus) {
            if(xhr.status == '401') {
                showLoginForm(true);
            }
        }
    });
}

var apcInfo;
/** apc 환경설정 **/
var apcInfoList = [];


function fn_selectAgentStat(target){
    let $target = $(target);
    let $apcCd = $target.closest('div.card-body').attr('apc_cd') || '';
    openPopApcLinkInfo($apcCd);
}
function req(target) {
    let $dataEl = $(target).closest('tr');
    let apcCd = $dataEl.data('apcCd');
    let trsmMatId = $dataEl.data('trsmMatId');
    let linkKnd = $dataEl.data('linkKnd');

    $.ajax({
        type: 'post',
        url: '/co/user/updateLinkTrsmReq.do',
        data: JSON.stringify({
            'apcCd': apcCd,
            'trsmMatId': trsmMatId,
            'linkKnd': linkKnd,
            'sysLastChgUserId': 'dashboard',
            'sysLastChgPrgrmId': 'apcLinkPop',
            'linkUseYn': 'Y'
        }),
        beforeSend: function(xhr){
            xhr.setRequestHeader("Content-type", "application/json");
        },
        success: function(data, textStatus, xhr) {
            if(data.resultStatus == "S") {
                alert("처리되었습니다.");
                openPopApcLinkInfo(apcCd, linkKnd);
            } else {
                alert(data.resultCode, data.resultMessage);
            }
        },
        error: function(xhr, status, error) {
            if(status == '401') {
                showLoginForm(true);
            }
        },
        complete: function(xhr, textStatus) {
            if(xhr.status == '401') {
                showLoginForm(true);
            }
        }
    });
}

function reqCncl(target) {
    let $dataEl = $(target).closest('tr');
    let apcCd = $dataEl.data('apcCd');
    let trsmMatId = $dataEl.data('trsmMatId');
    let linkKnd = $dataEl.data('linkKnd');

    $.ajax({
        type: 'post',
        url: '/co/user/updateLinkTrsmReqCncl.do',
        data: JSON.stringify({
            'apcCd': apcCd,
            'trsmMatId': trsmMatId,
            'linkKnd': linkKnd,
            'sysLastChgUserId': 'dashboard',
            'sysLastChgPrgrmId': 'apcLinkPop',
            'linkUseYn': 'Y'
        }),
        beforeSend: function(xhr){
            xhr.setRequestHeader("Content-type", "application/json");
        },
        success: function(data, textStatus, xhr) {
            if(data.resultStatus == "S") {
                alert("처리되었습니다.");
                openPopApcLinkInfo(apcCd, linkKnd);
            } else {
                alert(data.resultCode, data.resultMessage);
            }
        },
        error: function(xhr, status, error) {
            if(status == '401') {
                showLoginForm(true);
            }
        },
        complete: function(xhr, textStatus) {
            if(xhr.status == '401') {
                showLoginForm(true);
            }
        }
    });
}
function getLatestDate(dateList) {
    const validDates = dateList
        .filter(date => date) // null, undefined, '' 제거

    if (validDates.length === 0) {
        return "미사용";
    }

    return validDates
        .map(date => new Date(date))
        .reduce((latest, current) => current > latest ? current : latest)
        .toISOString().slice(0, 10);
}

$(function() {
    // login();
    // const userInfo = localStorage.getItem('userInfo') !== undefined && localStorage.getItem('userInfo') != null
    //     ? JSON.parse(localStorage.getItem('userInfo'))
    //     : {};
    getApcAgtStatus();
    openPopApcInfo();
    getCountAllPrdcr();
    getStatsForOneYearBySearchYmd();

    if(apcInfo !== undefined && apcInfo != null) {
        let fcltCount = 0;
        let oprtngFcltCount = 0;
        let apcCount = 0;

        apcInfo.apcLists.forEach(function(item) {
            fcltCount += item.kinds.length;

            oprtngFcltCount += item.kinds.filter(k => k.value === 'active').length;

            if(item.delYn === 'N') {
                apcCount++;
            }
        });

        $('#wholInstlStts').text(fcltCount);

        let oprtngRate = fcltCount > 0 ? ((oprtngFcltCount / fcltCount) * 100).toFixed(1) : '0.0';
        $('#oprtngRate').html(oprtngRate + "%");
        $('#fcltLinkApc').text(apcCount);

        /** apc 현황 **/
        var carouselWrap = $('<div id="carousel-apc" class="carousel slide carousel-fade" data-bs-ride="carousel"><div class="carousel-indicators carousel-indicators-dot" style="margin: 0!important;bottom: -0.8rem!important;"></div><div class="carousel-inner"></div></div>');
        var carouselInner = carouselWrap.find('.carousel-inner');
        var carouselIndicators = carouselWrap.find('.carousel-indicators');

        $.each(apcInfo.apcLists, function(index, el) {
            if (index % 10 === 0) {
                let slideIndex = index / 10;
                let isActive = (index === 0) ? 'active' : '';
                let carouselItem = $(`<div class="carousel-item ${isActive} d-block w-100"><div class="row row-cards"></div></div>`);
                carouselInner.append(carouselItem);
                let indicatorButton = $(`<button type="button" style="background-color: #609ebc!important;" data-bs-target="#carousel-apc" data-bs-slide-to="${slideIndex}" class="${isActive}" ${isActive ? 'aria-current="true"' : ''}></button>`);
                carouselIndicators.append(indicatorButton);
            }

            var cardWrap = $('<div class="col-lg-6"></div>');
            var apcInfo = $('<div class="apc_info card"></div>');
            cardWrap.append(apcInfo);
            carouselInner.children().last().find('.row').append(cardWrap);
            $('#apc_infos').append(carouselWrap);

            var apcName = $('<div class="card-body" apc_cd="'+el.value+'" apc_nm="'+el.name+'" style="display:flex;padding: 0.3rem!important;"></div>');
            var apcimg = $('<img src="/api/mobile/img/logo_btn_' + el.value + '.png" data-bs-toggle="modal" data-bs-target="#exampleModal" style="cursor: pointer!important;"/>');
            apcName.append(apcimg);
            apcimg.on('error', function() {
                let apcNm = apcName.attr('apc_nm');
                let apcCd = apcName.attr('apc_cd');
                // const $newChild = $(`<div>${apcNm}</div>`); // 새 자식 요소 생성
                const canvas = document.createElement('canvas');
                canvas.width = 130;
                canvas.height = 40;
                const ctx = canvas.getContext('2d');

                ctx.fillStyle = 'white';
                ctx.fillRect(0, 0, canvas.width, canvas.height);

                // 둥근 테두리 함수
                function roundRect(ctx, x, y, w, h, r) {
                    ctx.beginPath();
                    ctx.moveTo(x + r, y);
                    ctx.lineTo(x + w - r, y);
                    ctx.quadraticCurveTo(x + w, y, x + w, y + r);
                    ctx.lineTo(x + w, y + h - r);
                    ctx.quadraticCurveTo(x + w, y + h, x + w - r, y + h);
                    ctx.lineTo(x + r, y + h);
                    ctx.quadraticCurveTo(x, y + h, x, y + h - r);
                    ctx.lineTo(x, y + r);
                    ctx.quadraticCurveTo(x, y, x + r, y);
                    ctx.closePath();
                    ctx.fillStyle = 'white';
                    ctx.fill();
                    ctx.strokeStyle = '#e5e7eb';
                    ctx.stroke();
                }
                // 테두리
                roundRect(ctx, 0.5, 0.5, canvas.width - 1, canvas.height - 1, 5);

                // 폰트 크기 조절
                let fontSize = 16;
                ctx.font = `bold ${fontSize}px sans-serif`;
                while (ctx.measureText(apcNm).width > canvas.width - 20 && fontSize > 8) {
                    fontSize -= 1;
                    ctx.font = `bold ${fontSize}px sans-serif`;
                }

                // 텍스트 중앙 정렬
                ctx.fillStyle = 'black';
                ctx.textAlign = 'center';
                ctx.textBaseline = 'middle';
                ctx.fillText(apcNm, canvas.width / 2, canvas.height / 2);

                const img = new Image();
                img.src = canvas.toDataURL('image/png');
                img.style.cursor = "pointer";  // !important는 JS에서 직접 지정 불가

                img.setAttribute('data-bs-toggle', 'modal');
                img.setAttribute('data-bs-target', '#exampleModal');

                apcName.children().first().replaceWith(img);
                apcName.children().first().on('click', function(e){
                    const apcCd = $(this).closest('div.card-body').attr('apc_cd');
                    openPopApcLinkInfo(apcCd);
                });
            });

            apcInfo.append(apcName);
            $(apcName).children().first().on('click', function(e) {
                const apcCd = $(this).closest('div.card-body').attr('apc_cd');
                openPopApcLinkInfo(apcCd);
            });

            $('#linkInfoApc').on('click', function () {
                let linkInfoTbody = $("#linkInfoTable tbody");
                linkInfoTbody.empty();

                let apcCd = el.value;
                openPopApcLinkInfo(apcCd);
            });

            /** 최근사용일자 하단 추가 **/
            let lastUseDate = $('<div class="card-body" style="padding: 0!important;"><div class="card" style="border: 0!important;padding-left: 0.5rem">최근사용일자 :'+el.rcntData +'</div></div>');
            apcInfo.append(lastUseDate);

            var apcKinds = $('<div class="col-lg-2 apc_status_wrapper" style="display: flex;gap:0.2rem;padding: 0 0.1rem;flex-direction: column;"></div>');

            $.each(el.kinds, function(index, kindsEl) {
                let activeFlag = kindsEl.value === ''? false:true;
                var kindDiv = $('<button class="btn position-relative" onclick="fn_selectAgentStat(this)" style="padding: 0!important;cursor: initial!important;">'+ kindsEl.name +'</button>');
                let active = $('<span class="badge bg-blue badge-notification badge-blink"></span>');
                if(activeFlag){
                    kindDiv.append(active);
                }else{
                    kindDiv.addClass('disabled');
                }

                apcKinds.append(kindDiv);
            });
            apcName.append(apcKinds);

            var apcStatus = $('<div class="apc_status_wrapper" style="flex: 1;display: grid;grid-template-rows:repeat(2,1fr); grid-template-columns: repeat(3,1fr); gap: 0.2rem;"></div>');
            // var apcStatus = $('<button class="btn position-relative" style="display: flex;flex-wrap: wrap;"><span class="badge bg-blue badge-notification badge-blink"></span></button>');

            $.each(el.status, function (index, el) {
                // apcStatus.append($('<div class="col-lg-4 apc_item apc_status no-padding ' + el.value + '">' + el.name + '</div>'));
                const badgeClass = el.value !== '' ? 'bg-teal' : 'bg-dark-lt';
                apcStatus.append($(`<span class="badge ${badgeClass} text-teal-fg">${el.name}</span>`));
            });
            apcName.append(apcStatus);
        });
        /* APC 현황 끝 */
    }
});


