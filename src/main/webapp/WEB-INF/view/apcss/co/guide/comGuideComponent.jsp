<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <style>
        /*해당 레이아웃 템플릿 페이지를 표현하기위한 임의의 스타일 CSS 입니다.
        실작업시, 해당 프로젝트의 CSS 네이밍에 맞추어 재작업이 필요합니다.*/
        .sbt-A-wrap {min-width:1024px; margin:0 auto; border:1px solid #333;}
        .sbt-A-wrap .main {display:table;  width:100%; height:500px;}
        .sbt-A-wrap .left {display:table-cell; vertical-align: top; width:200px; }
        .sbt-A-wrap .left .sbt-all-left {height: 100%;}
        .sbt-A-wrap .content {display:table-cell;}
        .sbux-sidemeu {position: relative; z-index: 1;}
        .footer {
            display: flex; align-items: center; justify-content: center; font-size: 16px;
            background:rgb(42, 48, 65); height:150px; padding:10px; box-sizing: border-box;  color:#dddddd;
        }
        /** table css */
        table{border-collapse: collapse;border-spacing: 0;}
        table,th{text-align:center;}
        table,td{padding:5px;}
        .tbl{width: 100%;border-top: 2px solid #888;border-bottom: 1px solid #ddd;text-align: left;}
    </style>
</head>
<body oncontextmenu="return false">
    <div class="sbt-A-wrap">
        <div class="main">
            <!--main content-->
            <div class="content">
                <div class="sbt-con-wrap">
                    <div class="sbt-grid-wrap">
                        <div class="sbt-wrap-header">
                            <span>icon</span>
                            <h3>Ex) Component</h3>
                        </div>
                        <div class="sbt-wrap-body">
                        	<div class="sbt-col-left">
								<sbux-label id="srchLabel_1" name="label_norm" uitype="normal" text="INPUT" wrap-class="sbt-label"></sbux-label>
							</div>
                            <table class="tbl">
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:30%">
                                    <col style="width:50%">
                                </colgroup>
                                <tr>
                                    <th>input</th>
                                    <td>
                                        <sbux-input id="inputName1" name="inputName1" uitype="text" style="width:100%"
                                        			placeholder = "기본 INPUT"
                                        			></sbux-input>
                                    </td>
                                    <th>기본INPUT BOX이며 HTML INPUT 과 동일한 속성 사용합니다. </th>
                                </tr>
                                <tr>
                                	<th>permit-keycodes-set</th>
                                    <td>
                                        <sbux-input id="inputName2" name="inputName2" uitype="text" style="width:100%"
                                        			placeholder="한글 및 숫자만 입력 가능합니다."
                                        			permit-keycodes-set="num,kr"
                                        			></sbux-input>
                                    </td>
                                    <th>정규식 표현 중 한글, 영문, 숫자, 특수문자 중 선택하여 입력 가능 한 속성 입니다. (num, kr, en, special, custom)</th>
                                </tr>
                                <tr>
                                    <th>mask</th>
                                    <td>
                                        <sbux-input id="inputName3" name="inputName3" uitype="text" style="width:100%"
                                        			mask = "{ 'alias': 'currency', 'suffix': '원' , 'prefix': '이번 달 총액은 ', 'digits': 0 }"
                                        			></sbux-input>
                                    </td>
                                    <th>특정한 포맷으로 만들기 위해 사용하는 속성입니다.</th>
                                </tr>
                                <tr>
                                    <th>auto-fill-phone-dashes</th>
                                    <td>
                                        <sbux-input id="inputName4" name="inputName4" uitype="text" style="width:100%"
                                        			placeholder="(-) 제외하고 전화번호를 입력해주세요."
                                        			auto-fill-phone-dashes="true"
                                        			maxlength="13"
                                        			></sbux-input>
                                    </td>
                                    <th>전화번호에 따른 자동으로 '-' 을 넣을 수 있는 속성입니다. <br>(unmask-phone-dash) 속성은 입력된 전화번호에서 dash('-') 가 붙은 형태의 데이터로 가져올 수 있는 속성입니다. </th>
                                </tr>
							</table>
                        	<div class="sbt-col-left">
								<sbux-label id="srchLabel_2" name="label_norm" uitype="normal" text="COMBO" wrap-class="sbt-label"></sbux-label>
							</div>
							<table class="tbl">
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:30%">
                                    <col style="width:50%">
                                </colgroup>
                                <tr>
                                	<th>combo</th>
                                    <td>
                                        <sbux-select id="comBoType1" name="comBoType1" uitype="single"
                                        			 jsondata-ref="jsonComboType1"
                                        			 onChange="selectChange(comBoType)"
                                        			 unselected-text="선택" style="width:100%"
                                        			 ></sbux-select>
                                    </td>
                                    <th>option-item 태그형태로 사용 가능하며, JSON 형태로 대입하여 사용 할 수 있습니다.</th>
                                </tr>
                                <tr>
                                	<th>filter-source-name</th>
                                    <td>
                                        <sbux-select id="comBoType2" name="comBoType2" uitype="single"
                                        			 jsondata-ref="jsonComboType2"
                                        			 filter-source-name="comBoType1"
                                        			 jsondata-filter="mastervalue"
                                        			 style="width:100%"
                                        			 ></sbux-select>
                                    </td>
                                    <th>master-detail 인 두개의 select 컴포넌트에서 detail 인 select 컴포넌트에서 master 인 <br>select 컴포넌트를 참조할 수 있도록 master 인 select 컴포넌트의 이름을 설정하는 속성입니다.</th>
                                </tr>
                            </table>
                        	<div class="sbt-col-left">
								<sbux-label id="srchLabel_3" name="label_norm" uitype="normal" text="RADIO CHECKBOX" wrap-class="sbt-label"></sbux-label>
							</div>
							<table class="tbl">
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:30%">
                                    <col style="width:50%">
                                </colgroup>
                                <tr>
                                	<th>radio</th>
                                    <td>
                                        <sbux-radio id="radioName" name="radioName" uitype="normal"  jsondata-ref="jsonRadioData" text-right-padding="10px"></sbux-radio>
                                    </td>
                                    <th>태그형태로 사용하거나, JSON 형태로 대입하여 사용 할 수 있습니다.</th>
                                </tr>
                                <tr>
                                	<th>checkbox</th>
                                    <td>
                                        <sbux-checkbox id="checkboxName" name="checkboxName" uitype="normal" jsondata-ref="jsonCheckboxData" text-right-padding="10px"></sbux-checkbox>
                                    </td>
                                    <th>태그형태로 사용하거나, JSON 형태로 대입하여 사용 할 수 있습니다.</th>
                                </tr>
                            </table>
                        	<div class="sbt-col-left">
								<sbux-label id="srchLabel_4" name="label_norm" uitype="normal" text="BUTTON" wrap-class="sbt-label"></sbux-label>
							</div>
							<table class="tbl">
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:30%">
                                    <col style="width:50%">
                                </colgroup>
                                <tr>
                                	<th>button</th>
                                    <td>
                                        <sbux-button id="buttonName1" name="buttonName1" uitype="normal" text="버튼" value="button" onclick="gfn_comAlert('E0000', buttonName1)"></sbux-button>
                                    </td>
                                    <th>기본 버튼 입니다.</th>
                                </tr>
                                <tr>
                                	<th>modal</th>
                                    <td>
                                        <sbux-button id="buttonName2" name="buttonName2" uitype="modal" text="모탈 호출 버튼" target-id="modal_normal"></sbux-button>
                                    </td>
                                    <th>modal 호출 버튼 입니다.</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <sbux-modal id="modal_normal" name="modal_normal" uitype="normal" header-title="modal 타이틀 입니다." body-html-id="modalBody" footer-is-close-button="false" style="width:500px"></sbux-modal>
    <div id="modalBody">
    	<sbux-label id="modalLabel" name="modalLabel" uitype="normal" text="modal 영역입니다."></sbux-label>
    </div>

<script type="text/javascript">
	var jsonComboType1 = [
				{'text': '정보지원시스템', 'value': 'AM'},
				{'text': '생산관리', 'value': 'FM'},
				{'text': '시스템관리', 'value': 'CO'}
	]
	var jsonComboType2 = [
		{'text': '알림톡', 'value': 'AM_001_001', 'mastervalue' : 'AM'},
		{'text': '생산정보 관리', 'value': 'AM_001_002', 'mastervalue' : 'AM'},
		{'text': '약정서 관리', 'value': 'AM_001_003', 'mastervalue' : 'AM'},
		{'text': '메뉴관리', 'value': 'CO_001', 'mastervalue' : 'CO'},
		{'text': '화면관리', 'value': 'CO_002', 'mastervalue' : 'CO'},
		{'text': '권한관리', 'value': 'CO_003', 'mastervalue' : 'CO'},
		{'text': '권한그룹관리', 'value': 'CO_003_001', 'mastervalue' : 'CO'}
	];
	var jsonRadioData = [
		{'text': '정보지원시스템', 'value': 'AM'},
		{'text': '생산관리', 'value': 'FM'},
		{'text': '시스템관리', 'value': 'CO'}
	]
	var jsonCheckboxData = [
		{'text': '정보지원시스템', 'value': 'AM'},
		{'text': '생산관리', 'value': 'FM'},
		{'text': '시스템관리', 'value': 'CO', 'checked': "checked"}
	]
</script>
</body>
</html>