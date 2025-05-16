/*
 * Author: Abdullah A Almsaeed
 * Date: 4 Jan 2014
 * Description:
 *      This is a demo file used only for the main dashboard (index.html)
 **/

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
        type : 'post',
        url: './authenticate.do',
        data: JSON.stringify({
            'id': $('#userId').val(),
            'password': $('#password').val(),
        }),
        beforeSend : function(xhr){
            xhr.setRequestHeader("Content-type","application/json");
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

$(function () {
    "use strict";

    $('.login_btn').on('click', function(e) {
        login();
    });

    const userInfo = localStorage.getItem('userInfo') !== undefined && localStorage.getItem('userInfo') != null
        ? JSON.parse(localStorage.getItem('userInfo'))
        : {};

    console.log('userInfo', userInfo);

    var apcInfo;

    $.ajax({
        type : 'get',
        url: './getApcInfoList.do',
        async: false,
        beforeSend : function(xhr){
            xhr.setRequestHeader("Content-type","application/json");

            if(userInfo.accessToken !== undefined && userInfo.accessToken != null)
                xhr.setRequestHeader("Authorization", "Bearer " + userInfo.accessToken);
        },
        success: function(data, textStatus, xhr) {
            console.log(xhr.status);

            showLoginForm(false);

            /* APC 현황 시작 */
            apcInfo = {
                apcLists: [
                    {
                        name: '신미네',
                        nh: false,
                        cx: '550',
                        cy: '250',
                        kinds: [
                            {name: '계량', value: 'active'},
                            {name: '선별', value: ''}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: 'active'},
                            {name: '출고', value: 'active'},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: 'active'},
                            {name: '정산', value: 'active'}
                        ]
                    },
                    {
                        name: '영흥농산',
                        nh: false,
                        cx: '270',
                        cy: '300',
                        kinds: [
                            {name: '계량', value: 'active'},
                            {name: '선별', value: ''}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: ''},
                            {name: '출고', value: ''},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: 'active'},
                            {name: '정산', value: ''}
                        ]
                    },
                    {
                        name: '해도지',
                        nh: false,
                        cx: '300',
                        cy: '400',
                        kinds: [
                            {name: '발주', value: 'active'},
                            {name: '선별', value: ''}
                        ],
                        status: [
                            {name: '입고', value: ''},
                            {name: '선별', value: ''},
                            {name: '출고', value: 'active'},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: ''}
                        ]
                    },
                    {
                        name: '지우',
                        nh: false,
                        cx: '450',
                        cy: '600',
                        kinds: [
                            {name: '계량', value: ''},
                            {name: '선별', value: ''}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: 'active'},
                            {name: '출고', value: 'active'},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: ''}
                        ]
                    },
                    {
                        name: '상주원예영농',
                        nh: false,
                        cx: '550',
                        cy: '450',
                        kinds: [
                            {name: '계량', value: ''},
                            {name: '선별', value: ''}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: 'active'},
                            {name: '출고', value: 'active'},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: 'active'}
                        ]
                    },
                    {
                        name: '모두유통',
                        nh: false,
                        cx: '350',
                        cy: '300',
                        kinds: [
                            {name: '계량', value: ''},
                            {name: '선별', value: 'active'}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: 'active'},
                            {name: '출고', value: 'active'},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: ''}
                        ]
                    },
                    {
                        name: '로즈피아',
                        nh: false,
                        cx: '270',
                        cy: '750',
                        kinds: [
                            {name: '계량', value: ''},
                            {name: '선별', value: ''}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: 'active'},
                            {name: '출고', value: 'active'},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: ''}
                        ]
                    },
                    {
                        name: '참영농',
                        nh: false,
                        cx: '550',
                        cy: '750',
                        kinds: [
                            {name: '발주', value: 'active'},
                            {name: '선별', value: 'active'}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: 'active'},
                            {name: '출고', value: 'active'},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: ''}
                        ]
                    },
                    {
                        name: '부안마케팅',
                        nh: false,
                        cx: '220',
                        cy: '650',
                        kinds: [
                            {name: '계량', value: 'active'},
                            {name: '선별', value: 'active'}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: 'active'},
                            {name: '출고', value: 'active'},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: ''}
                        ]
                    },
                    {
                        name: '청일농산',
                        nh: false,
                        cx: '350',
                        cy: '550',
                        kinds: [
                            {name: '계량', value: 'active'},
                            {name: '선별', value: ''}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: ''},
                            {name: '출고', value: ''},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: ''}
                        ]
                    },
                    {
                        name: '거산(여주)',
                        nh: false,
                        cx: '450',
                        cy: '250',
                        kinds: [
                            {name: '계량', value: 'active'},
                            {name: '선별', value: ''}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: ''},
                            {name: '출고', value: ''},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: ''}
                        ]
                    },
                    {
                        name: '버들농산',
                        nh: false,
                        cx: '600',
                        cy: '250',
                        kinds: [
                            {name: '계량', value: 'active'},
                            {name: '선별', value: ''}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: ''},
                            {name: '출고', value: ''},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: ''}
                        ]
                    },
                    {
                        name: '거산(태안)',
                        nh: false,
                        cx: '150',
                        cy: '450',
                        kinds: [
                            {name: '계량', value: 'active'},
                            {name: '선별', value: ''}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: ''},
                            {name: '출고', value: ''},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: ''}
                        ]
                    },
                    {
                        name: '월항농협',
                        nh: true,
                        cx: '600',
                        cy: '580',
                        kinds: [
                            {name: '계량', value: ''},
                            {name: '선별', value: 'active'}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: 'active'},
                            {name: '출고', value: 'active'},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: 'active'}
                        ]
                    },
                    {
                        name: '거산(영암)',
                        nh: false,
                        cx: '200',
                        cy: '820',
                        kinds: [
                            {name: '계량', value: 'active'},
                            {name: '선별', value: ''}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: ''},
                            {name: '출고', value: ''},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: ''}
                        ]
                    },
                    {
                        name: '성주참외농협',
                        nh: true,
                        cx: '600',
                        cy: '550',
                        kinds: [
                            {name: '계량', value: ''},
                            {name: '선별', value: 'active'}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: 'active'},
                            {name: '출고', value: ''},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: ''}
                        ]
                    },
                    {
                        name: '한우리',
                        nh: false,
                        cx: '500',
                        cy: '500',
                        kinds: [
                            {name: '계량', value: 'active'},
                            {name: '선별', value: ''}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: ''},
                            {name: '출고', value: 'active'},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: ''}
                        ]
                    },
                    {
                        name: '신선미세상',
                        nh: false,
                        cx: '350',
                        cy: '400',
                        kinds: [
                            {name: '계량', value: ''},
                            {name: '선별', value: ''}
                        ],
                        status: [
                            {name: '입고', value: 'active'},
                            {name: '선별', value: 'active'},
                            {name: '출고', value: 'active'},
                            {name: '재고', value: 'active'},
                            {name: '영농', value: ''},
                            {name: '정산', value: ''}
                        ]
                    }
                ]
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

        $.each(apcInfo.apcLists, function (index, el) {
            console.log('element', index, el);
            console.log(el.name);
            console.log(el.kinds);
            console.log(el.status);

            var apcInfo = $('<div class="col-lg-6 apc_info"></div>');
            $('#apc_infos').append(apcInfo);

            var apcName = $('<div class="col-lg-4 apc_status_wrapper apc_item apc_name no-padding">'+el.name+'</div>');
            if(el.nh)apcName.addClass('nh');
            apcInfo.append(apcName);

            var apcKinds = $('<div class="col-lg-2 apc_status_wrapper"></div>');
            $.each(el.kinds, function (index, el) {
                apcKinds.append($('<div class="apc_item apc_kind no-padding '+el.value+'">'+el.name+'</div>'));
            });
            apcInfo.append(apcKinds);

            var apcStatus = $('<div class="col-lg-6 apc_status_wrapper"></div>');
            $.each(el.status, function (index, el) {
                apcStatus.append($('<div class="col-lg-4 apc_item apc_status no-padding '+el.value+'">'+el.name+'</div>'));
            });
            apcInfo.append(apcStatus);
        });
        /* APC 현황 끝 */
    }

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
    }, function (start, end) {
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
        onRegionLabelShow: function (e, el, code) {
            if(typeof visitorsData[code] != "undefined")
                el.html(el.html() + ': ' + visitorsData[code] + ' new visitors');
        }
    });

    //The Calender
    $("#calendar").datepicker();


    /* 일일데이터 수집 현황 차트 시작 */
    var area = new Morris.Area({
        element: 'revenue-chart',
        resize: true,
        data: [
            {y: '2025-04-27', store: 2666, selection: 2666},
            {y: '2025-04-28', store: 2778, selection: 2294},
            {y: '2025-04-29', store: 4912, selection: 1969},
            {y: '2025-04-30', store: 3767, selection: 3597},
            {y: '2025-05-01', store: 6810, selection: 1914},
            {y: '2025-05-02', store: 5670, selection: 4293},
            {y: '2025-05-03', store: 4820, selection: 3795},
            {y: '2025-05-04', store: 6073, selection: 3967},
            {y: '2025-05-05', store: 9087, selection: 6460},
            {y: '2025-05-06', store: 8432, selection: 5713},
            {y: '2025-05-07', store: 4820, selection: 3795},
            {y: '2025-05-08', store: 12073, selection: 4567},
            {y: '2025-05-09', store: 10687, selection: 4460},
            {y: '2025-05-10', store: 8432, selection: 5713},
            {y: '2025-05-11', store: 4820, selection: 3795},
            {y: '2025-05-12', store: 15073, selection: 5967},
            {y: '2025-05-13', store: 10687, selection: 4460},
        ],
        xkey: 'y',
        ykeys: ['store', 'selection'],
        labels: ['입고', '선별'],
        lineColors: ['#a0d0e0', '#3c8dbc'],
        hideHover: 'auto'
    });
    /* 일일데이터 수집 현황 차트 끝 */

});
