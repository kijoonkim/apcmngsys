<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<h3 class="box-title" style="line-height: 30px;"> ▶ 시설설치보완</h3>
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<tbody>
						<tr>
							<th scope="row" style="border-bottom:1px solid white " >APC명</th>
							<td colspan= "3" class="td_input" style="border-right:hidden;">
								<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
								<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td>
								<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-apcSelect" onclick="fn_modalApcSelect" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<th scope="row">대상연도</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-input id="srch-inp-trgtYr" name="srch-inp-trgtYr" uitype="text" placeholder="" class="form-control pull-right input-sm"></sbux-input>
							</td>
							<td colspan="5"></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="table-responsive tbl_scroll_sm">
				<div id="sb-area-spmtDsctn" style="height:0px;"></div>
			</div>
			<br>
			<table class="table table-bordered tbl_row tbl_fixed">
					<caption>2.시설 설치·보완</caption>
					<tbody><tr>
                        <th rowspan="2">사업연도</th>
                        <th rowspan="2">지원유형</th>
                        <th rowspan="2">사업내용</th>
                        <th colspan="4">투자 사업비(백만원)</th>
                    </tr>
                    <tr>
                        <th>계</th>
                        <th>국고</th>
                        <th>지자체</th>
                        <th>자부담</th>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_11" data-year="0" maxlength="4" onkeyup="extractNumbers(this.name)" placeholder="예) 2015"></td>
                        <td>
                            <sbux-select name="q2_12" id="q2_12">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_13" placeholder="(APC 지원사업) 신축, 집출하, 선별기, 저온저장 등"></td>
                        <td><sbux-input type="text" name="q2_14" placeholder="자동" data-idx="1" readonly=""></td>
                        <td><sbux-input type="text" name="q2_15" placeholder="금액" onkeyup="sum('q2_15',1)"></td>
                        <td><sbux-input type="text" name="q2_16" placeholder="금액" onkeyup="sum('q2_16',1)"></td>
                        <td><sbux-input type="text" name="q2_17" placeholder="금액" onkeyup="sum('q2_17',1)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_21" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_22" id="q2_22">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_23"></td>
                        <td><sbux-input type="text" name="q2_24" placeholder="자동" data-idx="2" readonly=""></td>
                        <td><sbux-input type="text" name="q2_25" onkeyup="sum('q2_25',2)"></td>
                        <td><sbux-input type="text" name="q2_26" onkeyup="sum('q2_26',2)"></td>
                        <td><sbux-input type="text" name="q2_27" onkeyup="sum('q2_27',2)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_31" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_32" id="q2_32">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_33"></td>
                        <td><sbux-input type="text" name="q2_34" placeholder="자동" data-idx="3" readonly=""></td>
                        <td><sbux-input type="text" name="q2_35" onkeyup="sum('q2_35',3)"></td>
                        <td><sbux-input type="text" name="q2_36" onkeyup="sum('q2_36',3)"></td>
                        <td><sbux-input type="text" name="q2_37" onkeyup="sum('q2_37',3)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_41" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_42" id="q2_42">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_43"></td>
                        <td><sbux-input type="text" name="q2_44" placeholder="자동" data-idx="4" readonly=""></td>
                        <td><sbux-input type="text" name="q2_45" onkeyup="sum('q2_45',4)"></td>
                        <td><sbux-input type="text" name="q2_46" onkeyup="sum('q2_46',4)"></td>
                        <td><sbux-input type="text" name="q2_47" onkeyup="sum('q2_47',4)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_51" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_52" id="q2_52">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_53"></td>
                        <td><sbux-input type="text" name="q2_54" placeholder="자동" data-idx="5" readonly=""></td>
                        <td><sbux-input type="text" name="q2_55" onkeyup="sum('q2_55',5)"></td>
                        <td><sbux-input type="text" name="q2_56" onkeyup="sum('q2_56',5)"></td>
                        <td><sbux-input type="text" name="q2_57" onkeyup="sum('q2_57',5)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_61" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_62" id="q2_62">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_63"></td>
                        <td><sbux-input type="text" name="q2_64" placeholder="자동" data-idx="6" readonly=""></td>
                        <td><sbux-input type="text" name="q2_65" onkeyup="sum('q2_65',6)"></td>
                        <td><sbux-input type="text" name="q2_66" onkeyup="sum('q2_66',6)"></td>
                        <td><sbux-input type="text" name="q2_67" onkeyup="sum('q2_67',6)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_71" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_72" id="q2_72">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_73"></td>
                        <td><sbux-input type="text" name="q2_74" placeholder="자동" data-idx="7" readonly=""></td>
                        <td><sbux-input type="text" name="q2_75" onkeyup="sum('q2_75',7)"></td>
                        <td><sbux-input type="text" name="q2_76" onkeyup="sum('q2_76',7)"></td>
                        <td><sbux-input type="text" name="q2_77" onkeyup="sum('q2_77',7)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_81" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_82" id="q2_82">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_83"></td>
                        <td><sbux-input type="text" name="q2_84" placeholder="자동" data-idx="8" readonly=""></td>
                        <td><sbux-input type="text" name="q2_85" onkeyup="sum('q2_85',8)"></td>
                        <td><sbux-input type="text" name="q2_86" onkeyup="sum('q2_86',8)"></td>
                        <td><sbux-input type="text" name="q2_87" onkeyup="sum('q2_87',8)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_91" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_92" id="q2_92">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_93"></td>
                        <td><sbux-input type="text" name="q2_94" placeholder="자동" data-idx="9" readonly=""></td>
                        <td><sbux-input type="text" name="q2_95" onkeyup="sum('q2_95',9)"></td>
                        <td><sbux-input type="text" name="q2_96" onkeyup="sum('q2_96',9)"></td>
                        <td><sbux-input type="text" name="q2_97" onkeyup="sum('q2_97',9)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_101" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_102" id="q2_102">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_103"></td>
                        <td><sbux-input type="text" name="q2_104" placeholder="자동" data-idx="10" readonly=""></td>
                        <td><sbux-input type="text" name="q2_105" onkeyup="sum('q2_105',10)"></td>
                        <td><sbux-input type="text" name="q2_106" onkeyup="sum('q2_106',10)"></td>
                        <td><sbux-input type="text" name="q2_107" onkeyup="sum('q2_107',10)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_111" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_112" id="q2_112">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_113"></td>
                        <td><sbux-input type="text" name="q2_114" placeholder="자동" data-idx="11" readonly=""></td>
                        <td><sbux-input type="text" name="q2_115" onkeyup="sum('q2_115',11)"></td>
                        <td><sbux-input type="text" name="q2_116" onkeyup="sum('q2_116',11)"></td>
                        <td><sbux-input type="text" name="q2_117" onkeyup="sum('q2_117',11)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_121" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_122" id="q2_122">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_123"></td>
                        <td><sbux-input type="text" name="q2_124" placeholder="자동" data-idx="12" readonly=""></td>
                        <td><sbux-input type="text" name="q2_125" onkeyup="sum('q2_125',12)"></td>
                        <td><sbux-input type="text" name="q2_126" onkeyup="sum('q2_126',12)"></td>
                        <td><sbux-input type="text" name="q2_127" onkeyup="sum('q2_127',12)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_131" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_132" id="q2_132">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_133"></td>
                        <td><sbux-input type="text" name="q2_134" placeholder="자동" data-idx="13" readonly=""></td>
                        <td><sbux-input type="text" name="q2_135" onkeyup="sum('q2_135',13)"></td>
                        <td><sbux-input type="text" name="q2_136" onkeyup="sum('q2_136',13)"></td>
                        <td><sbux-input type="text" name="q2_137" onkeyup="sum('q2_137',13)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_141" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_142" id="q2_142">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_143"></td>
                        <td><sbux-input type="text" name="q2_144" placeholder="자동" data-idx="14" readonly=""></td>
                        <td><sbux-input type="text" name="q2_145" onkeyup="sum('q2_145',14)"></td>
                        <td><sbux-input type="text" name="q2_146" onkeyup="sum('q2_146',14)"></td>
                        <td><sbux-input type="text" name="q2_147" onkeyup="sum('q2_147',14)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_151" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_152" id="q2_152">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_153"></td>
                        <td><sbux-input type="text" name="q2_154" placeholder="자동" data-idx="15" readonly=""></td>
                        <td><sbux-input type="text" name="q2_155" onkeyup="sum('q2_155',15)"></td>
                        <td><sbux-input type="text" name="q2_156" onkeyup="sum('q2_156',15)"></td>
                        <td><sbux-input type="text" name="q2_157" onkeyup="sum('q2_157',15)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_161" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_162" id="q2_162">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_163"></td>
                        <td><sbux-input type="text" name="q2_164" placeholder="자동" data-idx="16" readonly=""></td>
                        <td><sbux-input type="text" name="q2_165" onkeyup="sum('q2_165',16)"></td>
                        <td><sbux-input type="text" name="q2_166" onkeyup="sum('q2_166',16)"></td>
                        <td><sbux-input type="text" name="q2_167" onkeyup="sum('q2_167',16)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_171" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_172" id="q2_172">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_173"></td>
                        <td><sbux-input type="text" name="q2_174" placeholder="자동" data-idx="17" readonly=""></td>
                        <td><sbux-input type="text" name="q2_175" onkeyup="sum('q2_175',17)"></td>
                        <td><sbux-input type="text" name="q2_176" onkeyup="sum('q2_176',17)"></td>
                        <td><sbux-input type="text" name="q2_177" onkeyup="sum('q2_177',17)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_181" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_182" id="q2_182">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_183"></td>
                        <td><sbux-input type="text" name="q2_184" placeholder="자동" data-idx="18" readonly=""></td>
                        <td><sbux-input type="text" name="q2_185" onkeyup="sum('q2_185',18)"></td>
                        <td><sbux-input type="text" name="q2_186" onkeyup="sum('q2_186',18)"></td>
                        <td><sbux-input type="text" name="q2_187" onkeyup="sum('q2_187',18)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_191" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_192" id="q2_192">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_193"></td>
                        <td><sbux-input type="text" name="q2_194" placeholder="자동" data-idx="19" readonly=""></td>
                        <td><sbux-input type="text" name="q2_195" onkeyup="sum('q2_195',19)"></td>
                        <td><sbux-input type="text" name="q2_196" onkeyup="sum('q2_196',19)"></td>
                        <td><sbux-input type="text" name="q2_197" onkeyup="sum('q2_197',19)"></td>
                    </tr>
                    <tr>
                        <td><sbux-input type="text" name="q2_201" maxlength="4" data-year="0" onkeyup="extractNumbers(this.name)"></td>
                        <td>
                            <sbux-select name="q2_202" id="q2_202">
                                <option value="0">(선택)</option>
                                <option value="1">정부사업</option>
                                <option value="2">시도사업</option>
                                <option value="3">시군사업</option>
                                <option value="4">자부담</option>
                            </sbux-select>
                        </td>
                        <td><sbux-input type="text" name="q2_203"></td>
                        <td><sbux-input type="text" name="q2_204" placeholder="자동" data-idx="20" readonly=""></td>
                        <td><sbux-input type="text" name="q2_205" onkeyup="sum('q2_205',20)"></td>
                        <td><sbux-input type="text" name="q2_206" onkeyup="sum('q2_206',20)"></td>
                        <td><sbux-input type="text" name="q2_207" onkeyup="sum('q2_207',20)"></td>
                    </tr>
                </tbody>
			</table>
		</div>
	</section>
		<!-- apc 선택 Modal -->
    <div>
        <sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-apcSelect">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/apcSelectPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		let date = new Date();
		let year  = date.getFullYear();
		SBUxMethod.set("srch-inp-trgtYr", year);
	})
	//등록
	const fn_save = async function() {
    	console.log("******************fn_save**********************************");

		let yearArr = document.querySelectorAll("input[data-year='0']");
		yearArr.forEach(e => {
			if(e.value != "" && e.value.length != 4){
				alert("사업연도는 네자리로 작성해주세요. 예) 2023");
				result++;
				return e.focus();
			}
		});
		//alert('준비중');
    	fn_subInsert(confirm("등록 하시겠습니까?"));
    }


	//신규 등록
    const fn_subInsert = async function (isConfirmed){
    	 console.log("******************fn_subInsert**********************************");
    	 if (!isConfirmed) return;

    	 const arraySize = 20;

    	 // 크기가 20인 배열을 생성하고 초기값은 모두 null로 설정
    	 const myArray = new Array(arraySize).fill(null);

    	 // 7개의 인풋 값을 배열에 넣는 반복문
    	 for (let i = 0; i < myArray.length; i++) {
    	 	let inputValues = {
    	 		trgtYr : SBUxMethod.get('srch-inp-trgtYr')
    	    	,apcCd : SBUxMethod.get('srch-inp-apcCd')
    	 		,bizYr : SBUxMethod.get('q2_'+(i+1)+'1')
    	 		,bizSprtCd : SBUxMethod.get('q2_'+(i+1)+'2')
    	    	,bizCn : SBUxMethod.get('q2_'+(i+1)+'3')
    	    	,bizAmt : SBUxMethod.get('q2_'+(i+1)+'5')
    	    	,bizAmt2 : SBUxMethod.get('q2_'+(i+1)+'6')
    	    	,bizAmt3 : SBUxMethod.get('q2_'+(i+1)+'7')
      	 	}; // 7개의 인풋 값
    	 	myArray[i]=inputValues;
    	 };

		console.log(JSON.stringify(myArray));

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltInstlInfoList.do", myArray);

        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		//fn_search();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }
        // 결과 확인 후 재조회
        console.log("insert result", data);
    }


	//국고 지자체 자부담 합계
    function sum(name, idx){
    	//console.log("=======sum==========");
    	extractNumbers2('q2_'+idx+'5');
    	extractNumbers2('q2_'+idx+'6');
    	extractNumbers2('q2_'+idx+'7');
    	let sum = convertToNumberOrZero(SBUxMethod.get('q2_'+idx+'5'))
    				+convertToNumberOrZero(SBUxMethod.get('q2_'+idx+'6'))
    				+convertToNumberOrZero(SBUxMethod.get('q2_'+idx+'7'));
    	//console.log(sum);
    	SBUxMethod.set('q2_'+idx+'4',sum);
    }

	// 숫자(소숫점 가능)만 입력
	function extractNumbers2(input) {
		//console.log("=======extractNumbers2==========");
		let inputValue = SBUxMethod.get(input);
		if(!inputValue === null || !inputValue === undefined || !inputValue === ''){
			SBUxMethod.set(input,inputValue.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));
		}
	}
    // 숫자만 입력
	function extractNumbers(input) {
		//console.log("=======extractNumbers==========");
		//document.querySelector("sbux-input[name='"+input+"']").value = document.querySelector("sbux-input[name='"+input+"']").value.replace(/\D/g, "");
		let inputValue = SBUxMethod.get(input);
		SBUxMethod.set(input,inputValue.replace(/\D/g, ""));
	}

	//값이 없는 경우 0 있는 경우 숫자로 반환
	function convertToNumberOrZero(value) {
		//console.log("=======convertToNumberOrZeroA==========");
		// 값이 없는 경우 0으로 설정
		//console.log(value);
		if (value === undefined || value === null || value === '' || value === NaN) {
		  return 0;
		}

		// 값이 있는 경우 숫자로 변환하고 반환
		const numericValue = Number(value);
		if (isNaN(numericValue)) {
		  return 0; // 변환 실패 시 0 반환
		} else {
		  return numericValue;
		}
	}

	// apc 선택 팝업 호출
	const fn_modalApcSelect = function() {
		popApcSelect.init(fn_setApc);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setApc = function(apc) {
		//console.log("======fn_setApc=======");
		//console.log(apc);
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
		//console.log("======fn_setApc====end===");
	}
</script>
</html>