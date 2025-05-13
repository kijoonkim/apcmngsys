/*
 * Author: Abdullah A Almsaeed
 * Date: 4 Jan 2014
 * Description:
 *      This is a demo file used only for the main dashboard (index.html)
 **/

$(function () {
    "use strict";

    var apcInfo = {
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
                cy: '550',
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
                cx: '350',
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
                cy: '1120',
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
                cx: '550',
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
                name: '월항농협',
                nh: true,
                cx: '600',
                cy: '780',
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
                cx: '150',
                cy: '800',
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
                cy: '800',
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
                cx: '650',
                cy: '900',
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

    const svg = document.querySelector("#map");
    const circles = [];
    apcInfo.apcLists.forEach(apc => {
        const text = document.createElementNS("http://www.w3.org/2000/svg", "text");
        text.setAttribute("x", apc.cx);
        text.setAttribute("y", parseInt(apc.cy) - 15);
        text.setAttribute("text-anchor", "middle");
        text.setAttribute("font-size", "15");
        text.setAttribute("fill", "black");
        text.textContent = apc.name;
        svg.appendChild(text);

        const circle = document.createElementNS("http://www.w3.org/2000/svg", "circle");
        circle.setAttribute("cx", apc.cx);
        circle.setAttribute("cy", apc.cy);
        circle.setAttribute("r", "10");
        circle.setAttribute("stroke-width", "1");
        circle.setAttribute("fill", "blue");
        svg.appendChild(circle);
        circles.push(circle);
    });

    let isRed = false;
    setInterval(() => {
        isRed = !isRed;
        circles.forEach(circle => {
            const currentFill = circle.getAttribute("fill");
            if(currentFill === "blue" || currentFill === "red") {
                circle.setAttribute("fill", isRed ? "red" : "blue");
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

    //Sparkline charts
    var myvalues = [1000, 1200, 920, 927, 931, 1027, 819, 930, 1021];
    $('#sparkline-1').sparkline(myvalues, {
        type: 'line',
        lineColor: '#92c1dc',
        fillColor: "#ebf4f9",
        height: '50',
        width: '80'
    });

    myvalues = [515, 519, 520, 522, 652, 810, 370, 627, 319, 630, 921];
    $('#sparkline-2').sparkline(myvalues, {
        type: 'line',
        lineColor: '#92c1dc',
        fillColor: "#ebf4f9",
        height: '50',
        width: '80'
    });

    myvalues = [15, 19, 20, 22, 33, 27, 31, 27, 19, 30, 21];
    $('#sparkline-3').sparkline(myvalues, {
        type: 'line',
        lineColor: '#92c1dc',
        fillColor: "#ebf4f9",
        height: '50',
        width: '80'
    });

    //The Calender
    $("#calendar").datepicker();

    //SLIMSCROLL FOR CHAT WIDGET
    $('#chat-box').slimScroll({
        height: '250px'
    });

    /* Morris.js Charts */
    // Sales chart
    var area = new Morris.Area({
        element: 'revenue-chart',
        resize: true,
        data: [
            {y: '2021 Q1', store: 2666, selection: 2666},
            {y: '2021 Q2', store: 2778, selection: 2294},
            {y: '2021 Q3', store: 4912, selection: 1969},
            {y: '2021 Q4', store: 3767, selection: 3597},
            {y: '2022 Q1', store: 6810, selection: 1914},
            {y: '2022 Q2', store: 5670, selection: 4293},
            {y: '2022 Q3', store: 4820, selection: 3795},
            {y: '2022 Q4', store: 6073, selection: 3967},
            {y: '2023 Q1', store: 9087, selection: 6460},
            {y: '2023 Q2', store: 8432, selection: 5713},
            {y: '2023 Q3', store: 4820, selection: 3795},
            {y: '2023 Q4', store: 12073, selection: 4567},
            {y: '2024 Q1', store: 10687, selection: 4460},
            {y: '2024 Q2', store: 8432, selection: 5713},
            {y: '2024 Q3', store: 4820, selection: 3795},
            {y: '2024 Q4', store: 15073, selection: 5967},
            {y: '2025 Q1', store: 10687, selection: 4460}
        ],
        xkey: 'y',
        ykeys: ['store', 'selection'],
        labels: ['입고', '선별'],
        lineColors: ['#a0d0e0', '#3c8dbc'],
        hideHover: 'auto'
    });
});