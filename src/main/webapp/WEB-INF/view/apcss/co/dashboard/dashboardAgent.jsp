<%--
  Created by IntelliJ IDEA.
  User: sonminseong
  Date: 6/30/25
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko" style="margin: 0!important;">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style>
        #map > div.leaflet-control-container > div.leaflet-bottom.leaflet-right{
            display: none !important;
        }
        .h2{
            margin: 0!important;
        }
        .h1{
            font-size: 2.5rem !important;
            margin-top: 0.5rem!important;
        }
        .row > * {
            margin-bottom: 0.5rem!important;
        }
        #apc_infos div{
            margin-top: 0!important;
        }
        .card-body{
            padding: 0.5rem 1rem!important;
        }
        .btn{
            padding: 2px!important;
        }
        .text-teal-fg{
            font-weight: bold!important;
        }
        .apc_info.card{
            border: 0!important;
        }
        #apc_infos > div > div > div > img{
            cursor: pointer;
        }
        #modalInputPoint > * {
            margin-bottom: 0!important;
        }
        #agentTable tbody td{
            padding: 0.25rem!important;
        }
        #agentTable thead th{
            padding: 0.75rem 0.25rem!important;
        }
        .datagrid-title{
            font-size: 1.2rem!important;
        }
        .datagrid-content{
            font-size: 0.8rem!important;
        }
        .modal-content>.btn-close, .modal-header>.btn-close{
            height: 2.5rem!important;
        }
        .modal-header{
            min-height: 2.5rem!important;
        }
        .blinking-icon {
            animation: blink 1.5s infinite;
        }
        @keyframes blink {
            0%, 100% { opacity: 1; }
            50%      { opacity: 0; }
        }
        .card-title{
            margin: 0!important;
        }

        #linkInfoApc {
            font-size: 0.95rem;
            margin-right: 0.5rem;
            font-weight: bold;
            cursor: pointer!important;
        }

        #linkInfoModal .modal-dialog {
            max-width: 75vw;
            width: 75vw;
        }
    </style>
</head>
<body>
<div class="page" style="max-height: 100%">
    <div class="container-xl">
        <div class="page-header">
            <div class="row align-items-center justify-content-between" style="height: auto;">
                <div class="col d-flex flex-column">
                    <div class="page-title" style="width: initial;">
                        APC 에이전트 상황판
                        <div class="page-pretitle" style="width: initial; line-height: 1.5; margin-left: 5px">APC Agent Status Dashboard</div>
                    </div>
                </div>

                <div class="col-auto">
                    <svg  onclick="window.location.reload()" style="width: 1.5rem;height: 1.5rem;padding: 0 !important;margin-left: 0.5rem;cursor: pointer;"xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-rotate-clockwise">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4.05 11a8 8 0 1 1 .5 4m-.5 5v-5h5" />
                    </svg>
                    <span id="linkInfoApc" class="text-secondary" data-bs-toggle="modal" data-bs-target="#linkInfoModal">연계이력</span>
                </div>
            </div>
        </div>
        <div class="page-body" style="margin: 0!important;">
            <div class="container-xl" style="padding: 0">
                <div class="row row-deck row-cards">
                    <!-- 상단 start-->
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <div id="wholInstlStts" class="font-weight-medium h1"></div>
                                        <div class="text-secondary h2">전체 설치 현황</div>
                                    </div>
                                    <div class="col-auto">
                                        <span class="bg-azure text-white avatar"><!-- Download SVG icon from http://tabler.io/icons/icon/currency-dollar -->
                                       <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-adjustments-alt"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 8h4v4h-4z" /><path d="M6 4l0 4" /><path d="M6 12l0 8" /><path d="M10 14h4v4h-4z" /><path d="M12 4l0 10" /><path d="M12 18l0 2" /><path d="M16 5h4v4h-4z" /><path d="M18 4l0 1" /><path d="M18 9l0 11" /></svg>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <div id="oprtngRate" class="font-weight-medium h1"></div>
                                        <div class="text-secondary h2">가동률</div>
                                    </div>
                                    <div class="col-auto">
                                        <span class="bg-teal text-white avatar"><!-- Download SVG icon from http://tabler.io/icons/icon/currency-dollar -->
                                        <svg xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-chart-histogram"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M3 3v18h18" /><path d="M20 18v3" /><path d="M16 16v5" /><path d="M12 13v8" /><path d="M8 16v5" /><path d="M3 11c6 0 5 -5 9 -5s3 5 9 5" /></svg>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <div id="prdcrCount" class="font-weight-medium h1"></div>
                                        <div class="text-secondary h2">생산자수</div>
                                    </div>
                                    <div class="col-auto">
                                        <span class="bg-orange text-white avatar"><!-- Download SVG icon from http://tabler.io/icons/icon/currency-dollar -->
                                        <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-user-plus"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0" /><path d="M16 19h6" /><path d="M19 16v6" /><path d="M6 21v-2a4 4 0 0 1 4 -4h4" /></svg>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <div id="fcltLinkApc" class="font-weight-medium h1"></div>
                                        <div class="text-secondary h2">설비연계</div>
                                    </div>
                                    <div class="col-auto">
                                        <span class="bg-red text-white avatar"><!-- Download SVG icon from http://tabler.io/icons/icon/currency-dollar -->
                                        <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="currentColor"  class="icon icon-tabler icons-tabler-filled icon-tabler-chart-pie"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M9.883 2.207a1.9 1.9 0 0 1 2.087 1.522l.025 .167l.005 .104v7a1 1 0 0 0 .883 .993l.117 .007h6.8a2 2 0 0 1 2 2a1 1 0 0 1 -.026 .226a10 10 0 1 1 -12.27 -11.933l.27 -.067l.11 -.02z" /><path d="M14 3.5v5.5a1 1 0 0 0 1 1h5.5a1 1 0 0 0 .943 -1.332a10 10 0 0 0 -6.11 -6.111a1 1 0 0 0 -1.333 .943z" /></svg>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 상단 end -->
                    <div class="col-lg-5">
                        <div class="row row-cards">
                            <div class="col-12">
                                <div class="card h-full">
                                    <div class="card-body">
                                        <h3 class="card-title">설치 현황 지도</h3>
                                        <div id="map" style="height: 700px;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="row row-cards">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h3 class="card-title">APC 현황</h3>
                                        <div id="apc_infos" style="height: 100%;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h3 class="card-title">월별 데이터 수집 현황</h3>
                                        <div id="revenue-chart"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">APC 에이전트 현황</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="padding: 0.5rem">
                        <div class="col-md-12">
                            <div class="row row-cards">
                                <div class="col-12" style="display: flex; flex-direction: column; justify-content: center;gap: 0.5rem">
                                    <div class="card">
                                        <div class="card-body" style="padding: 1.5rem!important;">
                                            <div class="datagrid" style="grid-template-columns: 1fr 1fr 1.5fr; grid-gap: 1.3rem">
                                                <div class="datagrid-item">
                                                    <div class="datagrid-title">APC명</div>
                                                    <div id="apcNm" class="datagrid-content"></div>
                                                </div>
                                                <div class="datagrid-item">
                                                    <div class="datagrid-title">대표자명</div>
                                                    <div id="apcRprsvNm" class="datagrid-content"></div>
                                                </div>
                                                <div class="datagrid-item">
                                                    <div class="datagrid-title">사업자번호</div>
                                                    <div id="brno" class="datagrid-content"></div>
                                                </div>
                                                <div class="datagrid-item">
                                                    <div class="datagrid-title">전화번호</div>
                                                    <div id="telno" class="datagrid-content"></div>
                                                </div>
                                                <div class="datagrid-item">
                                                    <div class="datagrid-title">팩스번호</div>
                                                    <div id="fxno" class="datagrid-content"></div>
                                                </div>
                                                <div class="datagrid-item">
                                                    <div class="datagrid-title">주소</div>
                                                    <div id="addr" class="datagrid-content"></div>
                                                </div>
                                                <div class="datagrid-item">
                                                    <div class="datagrid-title">계량최근사용일자</div>
                                                    <div id="wgh" class="datagrid-content"></div>
                                                </div>
                                                <div class="datagrid-item">
                                                    <div class="datagrid-title">입고최근사용일자</div>
                                                    <div id="wrhs" class="datagrid-content"></div>
                                                </div>
                                                <div class="datagrid-item">
                                                    <div class="datagrid-title">선별최근사용일자</div>
                                                    <div id="sort" class="datagrid-content"></div>
                                                </div>
                                                <div class="datagrid-item">
                                                    <div class="datagrid-title">포장최근사용일자</div>
                                                    <div id="pckg" class="datagrid-content"></div>
                                                </div>
                                                <div class="datagrid-item">
                                                    <div class="datagrid-title">출고최근사용일자</div>
                                                    <div id="spmt" class="datagrid-content"></div>
                                                </div>
                                                <div class="datagrid-item">
                                                    <div class="datagrid-title">발주최근사용일자</div>
                                                    <div id="ordr" class="datagrid-content"></div>
                                                </div>
                                                <div class="datagrid-item">
                                                    <div class="datagrid-title">정산최근사용일자</div>
                                                    <div id="clcln" class="datagrid-content"></div>
                                                </div>
                                                <div class="datagrid-item">
                                                    <div class="datagrid-title">영농최근사용일자</div>
                                                    <div id="agrc" class="datagrid-content"></div>
                                                </div>
                                                <div class="datagrid-item">
                                                    <div class="datagrid-title">재고최근사용일자</div>
                                                    <div id="invntr" class="datagrid-content"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--                                    <span class="badge bg-red"></span>-->
                                    <div class="card">
                                        <table id="agentTable" class="table table-vcenter card-table">
                                            <colgroup>
                                                <col style="width: 7%">
                                                <col style="width: 12%">
                                                <col style="width: 12%">
                                                <col style="width: 10%">
                                                <col style="width: 21%">
                                                <col style="width: 21%">
                                                <col style="width: 10%">
                                                <col style="width: 7%">
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th>기기ID</th>
                                                <th>기기명</th>
                                                <th>통신상태</th>
                                                <th>구분</th>
                                                <th>요청일시</th>
                                                <th>완료일시</th>
                                                <th>진행상태</th>
                                                <th>처리</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="linkInfoModal" tabindex="-1" aria-labelledby="linkInfoModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="linkInfoModalLabel">연계이력 목록</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="padding: 0.5rem">
                        <div class="col-md-12">
                            <div class="row row-cards">
                                <div class="col-12" style="display: flex; flex-direction: column; justify-content: center; gap: 0.5rem;">
                                    <div class="card">
                                        <table id="linkInfoTable" class="table table-vcenter card-table">
                                            <colgroup>
                                                <col style="width: 15%;">
                                                <col style="width: 7%;">
                                                <col style="width: 12%;">
                                                <col style="width: 12%;">
                                                <col style="width: 10%;">
                                                <col style="width: 15%;">
                                                <col style="width: 15%;">
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th>APC</th>
                                                <th>기기ID</th>
                                                <th>기기명</th>
                                                <th>통신상태</th>
                                                <th>구분</th>
                                                <th>요청일시</th>
                                                <th>완료일시</th>
                                            </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/out/dashboard.bundle.js"></script>
<script src="/api/mobile/js/pages/dashboard.js"></script>
</body>
</html>

