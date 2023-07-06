<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
    <link href="/resource/css/template_com.css" rel="stylesheet" type="text/css">
    <script>
        var SBUxConfig = {
            Path: '/resource/sbux/',
            SBGrid: {
                Version2_5: true
            },
            SBChart: {
                Version2_0: true
            }
        }
    </script>
    <script src="/resource/sbux/SBUx.js"></script>
    <!------------------ 컴포넌트 테마 CSS ------------------>
	<link href="/resource/css/blue_comp_style.css" rel="stylesheet" type="text/css">
    <!------------------ 스타일 테마 CSS ------------------>
	<link href="/resource/css/blue_style.css" rel="stylesheet" type="text/css">
<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드 CSS 영역 시작-->
    <!-- favicon -->
	<link rel="apple-touch-icon" href="/resource/images/favicon.png">
	<link rel="shortcut icon" href="/resource/images/favicon.ico">
	<!-- //favicon -->

	<!-- [pp] icon -->
	<link rel="stylesheet" href="/resource/src/font-awesome/css/font-awesome.min.css">
	<!-- [pp] font-awesome 파이어폭스 미출력 에러 대응 -->
	<link rel="stylesheet" href="/resource/css/font-awesome/4.7.0/css/font-awesome.css">
	<!-- [pp] //font-awesome 파이어폭스 미출력 에러 대응 -->
	<link rel="stylesheet" href="/resource/src/remixicon/fonts/remixicon.css">
	<!-- [pp] //icon -->

	<!-- css -->
	<link rel="stylesheet" href="/resource/src/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resource/src/bootstrap-adminLTE/css/AdminLTE.css">
	<link rel="stylesheet" href="/resource/src/bootstrap-adminLTE/css/_all-skins.min.css">
	<link rel="stylesheet" href="/resource/src/bootstrap-datepicker/css/bootstrap-datepicker.min.css">
	<link rel="stylesheet" href="/resource/src/dataTables/css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="/resource/src/dataTables/css/select.dataTables.min.css">
	<link rel="stylesheet" href="/resource/src/mCustomScrollbar/css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="/resource/src/select2/css/select2.css">
	<link rel="stylesheet" href="/resource/src/apexchart/css/apexcharts.css">
	<link rel="stylesheet" href="/resource/css/dl_global.css">
	<link rel="stylesheet" href="/resource/css/admin/dl_common.css">
	<link rel="stylesheet" href="/resource/css/admin/dl_custom.css">
	<link rel="stylesheet" href="/resource/css/admin/dl_table.css">
	<link rel="stylesheet" href="/resource/css/admin/dl_ui.css">
	<link rel="stylesheet" href="/resource/css/admin/dl_popup.css">
	<!-- //css -->

	<!-- js -->
	<script src="/resource/src/jquery/js/jquery-3.5.1.min.js"></script>
	<script src="/resource/src/jquery/js/jquery.mousewheel.min.js"></script>
	<script src="/resource/src/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resource/src/bootstrap-adminLTE/js/adminlte.js"></script>
	<script src="/resource/src/bootstrap-adminLTE/js/demo.js"></script>
	<script src="/resource/src/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
	<script src="/resource/src/dataTables/js/jquery.dataTables.min.js"></script>
	<script src="/resource/src/dataTables/js/dataTables.bootstrap.min.js"></script>
	<script src="/resource/src/dataTables/js/dataTables.buttons.min.js"></script>
	<script src="/resource/src/dataTables/js/dataTables.select.min.js"></script>
	<script src="/resource/src/dataTables/js/jszip.min.js"></script>
	<script src="/resource/src/dataTables/js/pdfmake.min.js"></script>
	<script src="/resource/src/mCustomScrollbar/js/jquery.mCustomScrollbar.min.js"></script>
	<script src="/resource/src/select2/js/select2.min.js"></script>
	<script src="/resource/src/apexchart/js/apexcharts.js"></script>
	<script src="/resource/js/admin/pp_ui.js"></script>
	<!-- //js -->

<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드 CSS 영역 완료-->
</head>
<body>
	<section class="content container-fluid">
          <div class="box box-solid">
            <div class="box-header">
              <h3 class="box-title">▶ 권한그룹별 사용자관리</h3>
              <div class="ad_tbl_top">
                <div class="ad_tbl_toplist">
                  <button type="button" class="btn btn-sm btn-outline-danger">
                    조회
                  </button>
                  <button type="button" class="btn btn-sm btn-outline-danger">
                    등록
                  </button>
                  <button type="button" class="btn btn-sm btn-outline-danger">
                    삭제
                  </button>
                </div>
              </div>
            </div>
            <div></div>
            <div class="box-body">
              <!--[pp] 검색 -->
              <table class="table table-bordered tbl_row tbl_fixed">
                <caption>
                  검색 조건 설정
                </caption>
                <colgroup>
                  <col style="width: 3%" />
                  <col style="width: 5%" />
                  <col style="width: 5%" />
                  <col style="width: 5%" />
                  <col style="width: 10%" />
                  <col style="width: 3%" />
                  <col style="width: 5%" />
                  <col style="width: 5%" />
                  <col style="width: 4%" />
                </colgroup>
                <tbody>
                  <tr>
                    <th class="ta_r">검색조건</th>
                    <th class="ta_r" colspan="2">
                      <select class="form-control input-sm">
                        <option>전체</option>
                      </select>
                    </th>
                    <th colspan="6">
                      <input
                        type="text"
                        class="form-control input-sm"
                        placeholder="입력"
                        style="width: 20%"
                      />
                    </th>
                  </tr>
                </tbody>
              </table>

              <!--[pp] //검색 -->
              <!--[pp] 검색결과 -->
              <br>
              <div>
                <div class="col-sm-3">
                  <b>권한그룹목록</b>
                  <div class="ad_tbl_top">
										<div class="ad_tbl_toplist" style="float: right;">
                      <br>
                    </div>
									</div>
                  <table class="table table-bordered table-hover tbl_col tbl_fixed asdasd"style="width: 100%">
                    <colgroup>
                      <col style="width: 20%" />
                      <col style="width: 80%" />
                    </colgroup>
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>권한명</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>A01</td>
                        <td>관리자</td>
                      </tr>
                      <tr>
                        <td>B01</td>
                        <td>테스트</td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="dataTables_paginate paging_simple_numbers ta_c">
                    <select
                      class="form-control input-sm"
                      style="width: 20%; float: left"
                    >
                      <option>100</option>
                    </select>
                    <ul class="pagination">
                      <li class="paginate_button first disabled">
                        <a href="javascript:void(0);" title="첫페이지 목록"
                          ><i class="fa fa-angle-double-left"></i
                        ></a>
                      </li>
                      <li class="paginate_button previous disabled">
                        <a href="javascript:void(0);" title="이전목록"
                          ><i class="fa fa-angle-left"></i
                        ></a>
                      </li>
                      <li class="paginate_button active">
                        <a href="javascript:void(0);">1</a>
                      </li>
                      <li class="paginate_button">
                        <a href="javascript:void(0);">2</a>
                      </li>
                      <li class="paginate_button">
                        <a href="javascript:void(0);">3</a>
                      </li>
                      <li class="paginate_button">
                        <a href="javascript:void(0);">4</a>
                      </li>
                      <li class="paginate_button">
                        <a href="javascript:void(0);">5</a>
                      </li>
                      <li class="paginate_button next">
                        <a href="javascript:void(0);" title="다음목록"
                          ><i class="fa fa-angle-right"></i
                        ></a>
                      </li>
                      <li class="paginate_button last">
                        <a href="javascript:void(0);" title="마지막페이지 목록"
                          ><i class="fa fa-angle-double-right"></i
                        ></a>
                      </li>
                    </ul>
                  </div>
                </div>

								<div class="col-sm-9">
									<b >사용자목록 </b>
									<div class="ad_tbl_top">
										<div class="ad_tbl_toplist" style="float: right;">
											<button type="button" class="btn btn-sm btn-outline-danger">행추가</button>
										</div>
									</div>

                  <table class="table table-bordered table-hover tbl_col tbl_fixed" style="line-height: 20px;">
                    <colgroup>
                      <col style="width: 10%" />
                      <col style="width: 10%" />
                      <col style="width: 15%" />
                      <col style="width: 10%" />
                      <col style="width: 15%" />
                      <col style="width: 15%" />
                      <col style="width: 10%" />
                      <col style="width: 10%" />
                      <col style="width: 10%" />
                      <col style="width: 10%" />
                    </colgroup>
                    <thead>
                      <tr>
                        <th></th>
                        <th>NO</th>
                        <th>ID</th>
                        <th>사용자명</th>
                        <th>센터명</th>
                        <th>유형</th>
                        <th>상태</th>
                        <th>등록자ID</th>
                        <th>프로그램ID</th>
                        <th>등록일시</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <p class="ad_input_row">
                            <input type="checkbox" class="check" id="check1" />
                            <label class="check_label ta_i" for="check1"
                              >선택</label
                            >
                          </p>
                        </td>
                        <td>1</td>
                        <td>TEST</td>
                        <td>테스트</td>
                        <td>통합</td>
                        <td>관리자</td>
                        <td>정상</td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>
                          <p class="ad_input_row">
                            <input type="checkbox" class="check" id="check1" />
                            <label class="check_label ta_i" for="check1"
                              >선택</label
                            >
                          </p>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>
                          <p class="ad_input_row">
                            <input type="checkbox" class="check" id="check1" />
                            <label class="check_label ta_i" for="check1"
                              >선택</label
                            >
                          </p>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>
                          <p class="ad_input_row">
                            <input type="checkbox" class="check" id="check1" />
                            <label class="check_label ta_i" for="check1"
                              >선택</label
                            >
                          </p>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>
                          <p class="ad_input_row">
                            <input type="checkbox" class="check" id="check1" />
                            <label class="check_label ta_i" for="check1"
                              >선택</label
                            >
                          </p>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>
                          <p class="ad_input_row">
                            <input type="checkbox" class="check" id="check1" />
                            <label class="check_label ta_i" for="check1"
                              >선택</label
                            >
                          </p>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>
                          <p class="ad_input_row">
                            <input type="checkbox" class="check" id="check1" />
                            <label class="check_label ta_i" for="check1"
                              >선택</label
                            >
                          </p>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>
                          <p class="ad_input_row">
                            <input type="checkbox" class="check" id="check1" />
                            <label class="check_label ta_i" for="check1"
                              >선택</label
                            >
                          </p>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>
                          <p class="ad_input_row">
                            <input type="checkbox" class="check" id="check1" />
                            <label class="check_label ta_i" for="check1"
                              >선택</label
                            >
                          </p>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>
                          <p class="ad_input_row">
                            <input type="checkbox" class="check" id="check1" />
                            <label class="check_label ta_i" for="check1"
                              >선택</label
                            >
                          </p>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>
                          <p class="ad_input_row">
                            <input type="checkbox" class="check" id="check1" />
                            <label class="check_label ta_i" for="check1"
                              >선택</label
                            >
                          </p>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>
                          <p class="ad_input_row">
                            <input type="checkbox" class="check" id="check1" />
                            <label class="check_label ta_i" for="check1"
                              >선택</label
                            >
                          </p>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>
                          <p class="ad_input_row">
                            <input type="checkbox" class="check" id="check1" />
                            <label class="check_label ta_i" for="check1"
                              >선택</label
                            >
                          </p>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>
                          <p class="ad_input_row">
                            <input type="checkbox" class="check" id="check1" />
                            <label class="check_label ta_i" for="check1"
                              >선택</label
                            >
                          </p>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>
                          <p class="ad_input_row">
                            <input type="checkbox" class="check" id="check1" />
                            <label class="check_label ta_i" for="check1"
                              >선택</label
                            >
                          </p>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <!--[pp] //검색결과 -->
            </div>
          </div>
        </section>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_createGrid();
        fn_createGrid2();
    });
    //조회조건
    var jsonSearchCombo = [
        {'text': '관리명1', 'value': 'value1'},
        {'text': '관리명2', 'value': 'value2'},
        {'text': '관리명3', 'value': 'value3'},
        {'text': '관리명4', 'value': 'value4'},
        {'text': '관리명5', 'value': 'value5'}
    ];
    //신규 작성
    function fn_create() {

    }
    //삭제
    function fn_delete() {
        var chkList = datagrid2.getCheckedRowData(0);
        if (chkList.length == 0) {
            alert("삭제 할 대상이 없습니다.");
            return;
        }
        var delList = new Array();
        for (var rowData of chkList) {
            var data = rowData.data;
            if (data.checked === "Y") {
                delList.push(data.userId);
            }
        }
        var delMsg = "삭제 하시겠습니까?";
        if (confirm(delMsg)) {
            var params = "authId=" + selAuthId + "&delUserId=" + delList.join(",");
            console.log("data ::::: " + params);
        }
    }
    //저장
    function fn_save() {
        var gridList = datagrid2.getGridDataAll();
        var userList = new Array();
        for (data of gridList) {
            userList.push(data.userId);
        }
        var params = "authId=" + selAuthId
            + "userIds=" + userList.join(",");
        console.log("save Params ::::: " + params);
    }
    //목록 조회
    function fn_search() {
        //시스템구분 확인
        var srchCombo = SBUxMethod.get("srchCombo");
        if (!srchCombo) {
            alert("시스템구분을 선택하세요.");
            return;
        }
        //권한그룹목록
        fn_setGridData();
        //사용자목록 init
        datagrid2.setTreeCheckboxAll(false);
    }
    //상세정보 보기
    var selAuthId;
    function fn_view() {
        var nRow = datagrid.getRow();
        if (nRow < 1) {
            return;
        }
        var rowData = datagrid.getRowData(nRow);
        selAuthId = rowData.authId;
        fn_setGridData2(selAuthId);
    }
    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
        var gridList = datagrid2.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
            datagrid2.setCellData(i+1, 0, checkedYn, true, false);
        }
    }
    //grid 초기화
    var grid; // 그리드를 담기위한 객체 선언
    var gridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'SBGridArea';
	    SBGridProperties.id = 'datagrid';
	    SBGridProperties.jsonref = 'gridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["권한ID"],   ref: 'authId',  type:'output',  width:'30%',    style:'text-align:center'},
            {caption: ["권한명"],   ref: 'authNm',  type:'output',  width:'70%',    style:'text-align:center'}
        ];
        datagrid = _SBGrid.create(SBGridProperties);
        datagrid.bind('click', 'fn_view');
    }
    function fn_setGridData() {
        var params = $('#frm').serialize();
        console.log("form data ::::: " + params);
        gridData = [
            {'authId': 'A01', 'authNm': '시스템관리자'},
            {'authId': 'A02', 'authNm': '전체관리자'},
            {'authId': 'A03', 'authNm': '업무관리자'},
            {'authId': 'A04', 'authNm': '개발자'},
            {'authId': 'A05', 'authNm': '테스트'}
        ];
        datagrid.refresh();
    }
    //grid2 초기화
    var grid2; // 그리드를 담기위한 객체 선언
    var gridData2 = []; // 그리드의 참조 데이터 주소 선언
    function fn_createGrid2() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'SBGridArea2';
	    SBGridProperties.id = 'datagrid2';
	    SBGridProperties.jsonref = 'gridData2';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
                ref: 'checked', type: 'checkbox', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["ID"],           ref: 'userId',      type: 'output', width: '12%',   style:'text-align:center'},
            {caption: ["사용자명"],     ref: 'userNm',      type: 'output', width: '12%',   style:'text-align:center'},
            {caption: ["센터명"],       ref: 'cntrNm',      type: 'output', width: '12%',   style:'text-align:center'},
            {caption: ["유형"],         ref: 'type',        type: 'output', width: '12%',   style:'text-align:center'},
            {caption: ["상태"],         ref: 'state',       type: 'output', width: '12%',   style:'text-align:center'},
            {caption: ["등록자ID"],     ref: 'creUserId',   type: 'output', width: '12%',   style:'text-align:center'},
            {caption: ["프로그램ID"],   ref: 'progmId',     type: 'output', width: '14%',   style:'text-align:center'},
            {caption: ["등록일시"],     ref: 'creDateTime', type: 'output', width: '14%',   style:'text-align:center'}
        ];
        datagrid2 = _SBGrid.create(SBGridProperties);
    }
    function fn_setGridData2(authId) {
        console.log("data ::::: " + authId);
        gridData2 = [
            {'userId': 'userId_01', 'userNm': '사용자_01', 'cntrNm': '통합', 'type': '관리자', 'state': '정상', 'creUserId': 'admin', 'progmId': 'PROGRAM_01', 'creDateTime': '2023-05-01 12:00:00'},
            {'userId': 'userId_02', 'userNm': '사용자_02', 'cntrNm': '통합', 'type': '관리자', 'state': '정상', 'creUserId': 'admin', 'progmId': 'PROGRAM_02', 'creDateTime': '2023-05-01 12:00:00'}
        ];
        document.getElementById("listCount").innerHTML = (gridData2.length).toString();
        datagrid2.refresh();
    }
</script>
</body>
</html>