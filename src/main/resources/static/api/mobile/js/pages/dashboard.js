function showLoginForm(isShow) {
    if(isShow) {
        $('#dashboard').css('display', 'none');
        $('#login_form').css('display', 'block');
    } else {
        $('#dashboard').css('display', 'block');
        $('#login_form').css('display', 'none');
    }
}

function login() {
    $.ajax({
        type: 'post',
        url: './authenticate.do',
        data: JSON.stringify({
            'id': $('#userId').val(),
            'password': $('#password').val(),
        }),
        beforeSend: function(xhr){
            xhr.setRequestHeader("Content-type", "application/json");
        },
        success: function(data, textStatus, xhr) {
            console.log(xhr.status);
            console.log('login', data);
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

function openPopApcInfo(apcCd) {
    $.ajax({
        type: 'post',
        url: '/api/mobile/am/apc/selectApcEvrmntStng.do',
        data: JSON.stringify({
            'apcCd': apcCd
        }),
        beforeSend: function(xhr){
            xhr.setRequestHeader("Content-type", "application/json");

            if(userInfo.accessToken !== undefined && userInfo.accessToken != null) {
                xhr.setRequestHeader("Authorization", "Bearer " + userInfo.accessToken);
            }
        },
        success: function(data, textStatus, xhr) {
            console.log(xhr.status);
            console.log('apc info=', data);

            if(data!=null && data.resultStatus == 'S' && data.resultMap != null) {
                // 팝업 열기
                $('#apcPopup').fadeIn(300);

                var result = data.resultMap;
                var apcimg = $('<img src="./img/logo_btn_' + result.apcCd + '.png"/>');
                $('#apcLogo').empty();
                $('#apcLogo').append(apcimg);
                apcimg.error(function(){
                    $('#apcLogo').text(result.apcNm);
                });

                $('#apcNm').text(result.apcNm);
                $('#cls').text(result.cls);
                $('#apcRprsvNm').text(result.apcRprsvNm);
                $('#brno').text(result.brno);
                $('#telno').text(result.telno);
                $('#fxno').text(result.fxno);
                $('#addr').text(result.addr);
                $('#brno').text(result.brno);
                $('#itemNm').text(result.itemNm);
            } else {
                alert('해당 정보가 없습니다. 시스템 관리자에게 문의하세요!');
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

function openPopApcLinkInfo(apcCd, linkKnd) {
    $.ajax({
        type: 'post',
        url: '/api/mobile/am/apc/selectApcLinkTrsmMatSttsList.do',
        data: JSON.stringify({
            'apcCd': apcCd,
            'linkKnd': linkKnd
        }),
        beforeSend: function(xhr){
            xhr.setRequestHeader("Content-type", "application/json");

            if(userInfo.accessToken !== undefined && userInfo.accessToken != null) {
                xhr.setRequestHeader("Authorization", "Bearer " + userInfo.accessToken);
            }
        },
        success: function(data, textStatus, xhr) {
            console.log(xhr.status);
            console.log('apc link info=', data);

            if(data != null && data.resultStatus == 'S' && data.resultList != null) {
                // 팝업 열기
                $('#apcLinkPopup').fadeIn(300);

                $('#cnt-apcLinkPop').text(data.resultList.length);

                $('#apcLinkInfoBody').empty();

                $.each(data.resultList, function(index, result) {
                    var row = '<tr>';
                    row += '<td>' + (result.trsmMatId || '') + '</td>';
                    row += '<td>' + (result.trsmMatNm || '') + '</td>';
                    row += '<td style="color: ' + (result.trsmMatSttsColor || '#808080') + ';">' + (result.trsmMatSttsNm || '') + '</td>';
                    row += '<td>' + (result.linkKndNm || '') + '</td>';
                    row += '<td>' + (result.reqDt || '') + '</td>';
                    row += '<td>' + (result.prcsCmptnDt || '') + '</td>';
                    row += '<td style="color: ' + (result.linkSttsNmColor || '#808080') + ';">' + (result.linkSttsNm || '') + '</td>';
                    row += '<td>';
                    switch(result.linkStts) {
                        case "P0":
                            row += '<button type="button" id="btnReq" class="btn btn-outline-danger">요청</button>';
                            break;
                        case "R0":
                            row += '<button type="button" id="btnReqCncl" class="btn btn-outline-danger">취소</button>';
                            break;
                        default:
                            row += '';
                    }
                    row += '</td>';
                    row += '<td style="display: none;">' + (result.apcCd || '') + '</td>';
                    row += '<td style="display: none;">' + (result.linkKnd || '') + '</td>';
                    row += '</tr>';
                    $('#apcLinkInfoBody').append(row);
                });
            } else {
                alert('해당 정보가 없습니다. 시스템 관리자에게 문의하세요!');
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

function req(apcCd, trsmMatId, linkKnd) {
    $.ajax({
        type: 'post',
        url: '/api/mobile/am/apc/updateLinkTrsmReq.do',
        data: JSON.stringify({
            'apcCd': apcCd,
            'trsmMatId': trsmMatId,
            'linkKnd': linkKnd,
            'sysLastChgUserId': userInfo.userId,
            'sysLastChgPrgrmId': 'apcLinkPop',
            'linkUseYn': 'Y'
        }),
        beforeSend: function(xhr){
            xhr.setRequestHeader("Content-type", "application/json");

            if(userInfo.accessToken !== undefined && userInfo.accessToken != null) {
                xhr.setRequestHeader("Authorization", "Bearer " + userInfo.accessToken);
            }
        },
        success: function(data, textStatus, xhr) {
            console.log(xhr.status);
            console.log('apc link info=', data);

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

function reqCncl(apcCd, trsmMatId, linkKnd) {
    $.ajax({
        type: 'post',
        url: '/api/mobile/am/apc/updateLinkTrsmReqCncl.do',
        data: JSON.stringify({
            'apcCd': apcCd,
            'trsmMatId': trsmMatId,
            'linkKnd': linkKnd,
            'sysLastChgUserId': userInfo.userId,
            'sysLastChgPrgrmId': 'apcLinkPop',
            'linkUseYn': 'Y'
        }),
        beforeSend: function(xhr){
            xhr.setRequestHeader("Content-type", "application/json");

            if(userInfo.accessToken !== undefined && userInfo.accessToken != null) {
                xhr.setRequestHeader("Authorization", "Bearer " + userInfo.accessToken);
            }
        },
        success: function(data, textStatus, xhr) {
            console.log(xhr.status);
            console.log('apc link info=', data);

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

const userInfo = localStorage.getItem('userInfo') !== undefined && localStorage.getItem('userInfo') != null
        ? JSON.parse(localStorage.getItem('userInfo'))
        : {};

$(function() {
    "use strict";

    // 팝업 닫기
    $('.closePopup').click(function() {
        $('#apcPopup').fadeOut(300);
        $('#apcLinkPopup').fadeOut(300);
    });

    // 팝업 외부 클릭시 닫기
    $(document).on('click', function(e) {
        if($(e.target).hasClass('popup')) {
            $('#apcPopup').fadeOut(300);
            $('#apcLinkPopup').fadeOut(300);
        }
    });

    $('#apcLinkInfoBody').on('click', '#btnReq', function() {
        var apcCd = $(this).closest('tr').find('td:eq(8)').text().trim();
        var trsmMatId = $(this).closest('tr').find('td:eq(0)').text().trim();
        var linkKnd = $(this).closest('tr').find('td:eq(9)').text().trim();

        req(apcCd, trsmMatId, linkKnd);
    });

    $('#apcLinkInfoBody').on('click', '#btnReqCncl', function() {
        var apcCd = $(this).closest('tr').find('td:eq(8)').text().trim();
        var trsmMatId = $(this).closest('tr').find('td:eq(0)').text().trim();
        var linkKnd = $(this).closest('tr').find('td:eq(9)').text().trim();

        reqCncl(apcCd, trsmMatId, linkKnd);
    });

    $('.login_btn').on('click', function(e) {
        login();
    });

    //console.log('userInfo', userInfo);

    //로그인 여부 체크
    if(userInfo.accessToken === undefined || userInfo.accessToken == null) {
        showLoginForm(true);
        return;
    } else {
        showLoginForm(false);
    }

    var apcInfo;

    $.ajax({
        type: 'get',
        url: './getApcAgtStats.do',
        async: false,
        beforeSend: function(xhr){
            xhr.setRequestHeader("Content-type", "application/json");

            if(userInfo.accessToken !== undefined && userInfo.accessToken != null) {
                xhr.setRequestHeader("Authorization", "Bearer " + userInfo.accessToken);
            }
        },
        success: function(data, textStatus, xhr) {
            console.log(xhr.status);

            /* APC 현황 시작 */
            apcInfo = {
                apcLists: data.result.resultLists.map(function(item) {
                    const kinds = [];

                    if(item.KINDS_WRHS != null) kinds.push({name: '계량', value: item.KINDS_WRHS === 'Y' ? 'active' : ''});
                    if(item.KINDS_SORT != null) kinds.push({name: '선별', value: item.KINDS_SORT === 'Y' ? 'active' : ''});
                    if(item.KINDS_SPMT != null) kinds.push({name: '발주', value: item.KINDS_SPMT === 'Y' ? 'active' : ''});

                    return {
                        name: item.APC_NM,
                        value: item.APC_CD,
                        nh: item.NH === 'Y' ? true : false,
                        cx: item.CX,
                        cy: item.CY,
                        kinds: kinds,
                        status: [
                            {name: '입고', value: item.STATUS_IN === 'Y' ? 'active' : ''},
                            {name: '선별', value: item.STATUS_SORT === 'Y' ? 'active' : ''},
                            {name: '출고', value: item.STATUS_OUT === 'Y' ? 'active' : ''},
                            {name: '재고', value: item.STATUS_STOCK === 'Y' ? 'active' : ''},
                            {name: '영농', value: item.STATUS_FARM === 'Y' ? 'active' : ''},
                            {name: '정산', value: item.STATUS_SETTLE === 'Y' ? 'active' : ''}
                        ],
                        delYn: item.DEL_YN
                    };
                })
            };
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
        $('#oprtngRate').html(oprtngRate + '<sup style="font-size: 20px;">%</sup>');

        $('#fcltLinkApc').text(apcCount);

        const svg = document.querySelector("#map");
        const locationPins = [];
        apcInfo.apcLists.forEach(apc => {
            if(apc.cx != null && apc.cy != null) {
                const text = document.createElementNS("http://www.w3.org/2000/svg", "text");
                text.setAttribute("x", apc.cx);
                text.setAttribute("y", parseInt(apc.cy) - 30);
                text.setAttribute("text-anchor", "middle");
                text.setAttribute("font-size", "15");
                text.setAttribute("fill", "black");
                text.textContent = apc.name;
                svg.appendChild(text);

                const dataKindActive = apc.kinds.some(kind => kind.value.trim() !== "");
                const locationPin = document.createElementNS("http://www.w3.org/2000/svg", "g");
                locationPin.setAttribute("transform", `translate(${parseInt(apc.cx) - 9.5}, ${parseInt(apc.cy) - 26}) scale(0.05)`);
                locationPin.setAttribute("fill", dataKindActive ? "blue" : "grey");

                const path = document.createElementNS("http://www.w3.org/2000/svg", "path");
                path.setAttribute("d", "M192 0C86 0 0 86 0 192c0 112 192 320 192 320s192-208 192-320C384 86 298 0 192 0zm0 272a80 80 0 1 1 0-160 80 80 0 0 1 0 160z");
                locationPin.appendChild(path);

                svg.appendChild(locationPin);
                if(dataKindActive) {
                    locationPins.push(locationPin);
                }
            }
        });

        let isRed = false;
        setInterval(() => {
            isRed = !isRed;
            locationPins.forEach(locationPin => {
                const currentFill = locationPin.getAttribute("fill");
                if(currentFill === "blue" || currentFill === "red") {
                    locationPin.setAttribute("fill", isRed ? "red" : "blue");
                }
            });
        }, 700);

        $.each(apcInfo.apcLists, function(index, el) {
            console.log('element', index, el);
            console.log(el.name);
            console.log(el.kinds);
            console.log(el.status);

            var apcInfo = $('<div class="col-lg-6 apc_info"></div>');
            $('#apc_infos').append(apcInfo);

            var apcName = $('<div class="col-lg-4 apc_status_wrapper apc_item apc_name no-padding" apc_cd="'+el.value+'"></div>');
            var apcimg = $('<img src="./img/logo_btn_' + el.value + '.png"/>');
            apcName.append(apcimg);
            apcimg.error(function(){
                apcName.text(el.name);
                if(el.nh)
                    apcName.addClass('nh');
                else
                    apcName.addClass('corp');
            });

            apcInfo.append(apcName);

            apcName.on('click', function(e) {
                openPopApcInfo($(this).attr('apc_cd'));
            });

            var apcKinds = $('<div class="col-lg-2 apc_status_wrapper"></div>');
            $.each(el.kinds, function(index, kindsEl) {
                var kindDiv = $('<div class="apc_item apc_kind no-padding ' + kindsEl.value + '">' + kindsEl.name + '</div>');

                kindDiv.on("click", function() {
                    console.log('클릭된 항목:', kindsEl.name, '| APC_CD:', el.value);
                    if(kindsEl.name == "계량") {
                        openPopApcLinkInfo(el.value, "W");
                    } else if(kindsEl.name == "선별") {
                        openPopApcLinkInfo(el.value, "S");
                    } else if(kindsEl.name == "발주") {
                        openPopApcLinkInfo(el.value, "R");
                    }
                });

                apcKinds.append(kindDiv);
            });
            apcInfo.append(apcKinds);

            var apcStatus = $('<div class="col-lg-6 apc_status_wrapper"></div>');
            $.each(el.status, function (index, el) {
                apcStatus.append($('<div class="col-lg-4 apc_item apc_status no-padding ' + el.value + '">' + el.name + '</div>'));
            });
            apcInfo.append(apcStatus);
        });
        /* APC 현황 끝 */
    }

    /* 생산자 현황 조회 시작 */
    $.ajax({
        type: 'get',
        url: './getCountAllPrdcr.do',
        beforeSend: function(xhr){
            xhr.setRequestHeader("Content-type", "application/json");

            if(userInfo.accessToken !== undefined && userInfo.accessToken != null) {
                xhr.setRequestHeader("Authorization", "Bearer " + userInfo.accessToken);
            }
        },
        success: function(data, textStatus, xhr) {
            console.log(xhr.status);
            console.log('stats', data);

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
    /* 생산자 현황 조회 끝 */

    //Make the dashboard widgets sortable Using jquery UI
    $(".connectedSortable").sortable({
        placeholder: "sort-highlight",
        connectWith: ".connectedSortable",
        handle: ".box-header, .nav-tabs",
        forcePlaceholderSize: true,
        zIndex: 999999
    });
    $(".connectedSortable .box-header, .connectedSortable .nav-tabs-custom").css("cursor", "move");

    //jQuery UI sortable for the todo list
    $(".todo-list").sortable({
        placeholder: "sort-highlight",
        handle: ".handle",
        forcePlaceholderSize: true,
        zIndex: 999999
    });

    //bootstrap WYSIHTML5 - text editor
    $(".textarea").wysihtml5();

    $('.daterange').daterangepicker({
        ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate: moment()
    }, function(start, end) {
        window.alert("You chose: " + start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
    });

    /* jQueryKnob */
    $(".knob").knob();

    //jvectormap data
    var visitorsData = {
        "US": 398, //USA
        "SA": 400, //Saudi Arabia
        "CA": 1000, //Canada
        "DE": 500, //Germany
        "FR": 760, //France
        "CN": 300, //China
        "AU": 700, //Australia
        "BR": 600, //Brazil
        "IN": 800, //India
        "GB": 320, //Great Britain
        "RU": 3000 //Russia
    };

    //World map by jvectormap
    $('#world-map').vectorMap({
        map: 'world_mill_en',
        backgroundColor: "transparent",
        regionStyle: {
            initial: {
                fill: '#e4e4e4',
                "fill-opacity": 1,
                stroke: 'none',
                "stroke-width": 0,
                "stroke-opacity": 1
            }
        },
        series: {
            regions: [{
                values: visitorsData,
                scale: ["#92c1dc", "#ebf4f9"],
                normalizeFunction: 'polynomial'
            }]
        },
        onRegionLabelShow: function(e, el, code) {
            if(typeof visitorsData[code] != "undefined") {
                el.html(el.html() + ': ' + visitorsData[code] + ' new visitors');
            }
        }
    });

    /* 일일데이터 수집 현황 차트 시작 */
    $.ajax({
        type: 'get',
        url: './getStatsForOneYearBySearchYmd.do',
        beforeSend: function(xhr){
            xhr.setRequestHeader("Content-type", "application/json");

            if(userInfo.accessToken !== undefined && userInfo.accessToken != null) {
                xhr.setRequestHeader("Authorization", "Bearer " + userInfo.accessToken);
            }
        },
        success: function(data, textStatus, xhr) {
            console.log(xhr.status);
            console.log('stats', data);

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
                console.log('element', index, el);

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

            var area = new Morris.Area({
                element: 'revenue-chart',
                resize: true,
                data: values,
                xkey: 'y',
                ykeys: ['wrhs', 'sort', 'wgh'],
                labels: ['입고', '선별', '계량'],
                lineColors: ['#A0D0E0', '#3C8DBC', '#047630'],
                hideHover: 'auto'
            });

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
    /* 일일데이터 수집 현황 차트 끝 */
});