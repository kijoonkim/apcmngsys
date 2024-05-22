<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="tab-content">
    <div id="tpgMasterSub" style="height: 596px;">
        <table class="table table-bordered tbl_fixed">
            <caption>기본인적</caption>
            <colgroup>
                <col style="width: 11%">
                <col style="width: 11%">
                <col style="width: 11%">
                <col style="width: 11%">
                <col style="width: 11%">
                <col style="width: 11%">
                <col style="width: 11%">
                <col style="width: 11%">
                <col style="width: 11%">
                <col style="width: 11%">
                <col style="width: 11%">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row" class="th_bg">국적</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-select id="NATION_CODE" uitype="single" jsondata-ref="jsonNationCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                </td>
                <td colspan="2" class="td_input" style="border-right:hidden;">
                    <sbux-checkbox
                            uitype="normal"
                            id="FOREIGNER_YN"
                            name="FOREIGNER_YN"
                            uitype="normal"
                            class="form-control input-sm check"
                            text="외국인"
                    />
                </td>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-checkbox
                            uitype="normal"
                            id="FAMILY_OWNER_YN"
                            name="FAMILY_OWNER_YN"
                            uitype="normal"
                            class="form-control input-sm check"
                            text="세대주"
                    />
                </td>
                <th scope="row" class="th_bg">본관</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="FAMILY_CLAN" class="form-control input-sm input-sm-ast inpt_data_reqed" uitype="text" required style="width:100%"></sbux-input>
                </td>
                <th rowspan="2" scope="row" class="th_bg">서명</th>
                <td rowspan="2" class="td_input" style="border-right:hidden;">
                    이미지 자리
                </td>
                <th scope="row" class="th_bg">상여수습종료일</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="BONUS_APPLY_START_DATE"
                            name="BONUS_APPLY_START_DATE"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">본적주소</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="FAMILY_REGISTER_ZIP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-button id="btnZip1" name="btnUserEnd" uitype="normal" text="검색" class="btn btn-sm btn-outline-danger"></sbux-button>
                </td>
                <td colspan="4" class="td_input" style="border-right:hidden;">
                    <sbux-input id="FAMILY_REGISTER_ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <th scope="row" class="th_bg">노조가입일</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="UNION_JOIN_START_DATE"
                            name="UNION_JOIN_START_DATE"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">주민등록지</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="REGISTER_ZIP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-button id="btnZip2" name="btnUserEnd" uitype="normal" text="검색" class="btn btn-sm btn-outline-danger"></sbux-button>
                </td>
                <td colspan="4" class="td_input" style="border-right:hidden;">
                    <sbux-input id="REGISTER_ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <th scope="row" class="th_bg">휴대폰번호</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="CELLPHONE_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <th scope="row" class="th_bg">노조탈퇴일</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="UNION_JOIN_END_DATE"
                            name="UNION_JOIN_END_DATE"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">비상연락처</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="EMERGENCY_ZIP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-button id="btnZip3" name="btnUserEnd" uitype="normal" text="검색" class="btn btn-sm btn-outline-danger"></sbux-button>
                </td>
                <td colspan="4" class="td_input" style="border-right:hidden;">
                    <sbux-input id="EMERGENCY_ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <th scope="row" class="th_bg">비상연락전화</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="EMERGENCY_TEL_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">현거주주소</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="RESIDENCE_ZIP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-button id="btnZip4" name="btnUserEnd" uitype="normal" text="검색" class="btn btn-sm btn-outline-danger"></sbux-button>
                </td>
                <td colspan="4" class="td_input" style="border-right:hidden;">
                    <sbux-input id="RESIDENCE_ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <th scope="row" class="th_bg">자택전화번호</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="HOME_TEL_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">회사전화번호</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="OFFICE_TEL_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <th scope="row" class="th_bg">FAX번호</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="FAX_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <th scope="row" class="th_bg">내선번호</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="INTER_PHONE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-checkbox
                            uitype="normal"
                            id="UNION_JOIN_YN"
                            name="UNION_JOIN_YN"
                            uitype="normal"
                            class="form-control input-sm check"
                            text="노조가입"
                    />
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">사내이메일</th>
                <td colspan="3" class="td_input" style="border-right:hidden;">
                    <sbux-input id="IN_EMAIL" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <th scope="row" class="th_bg">사외이메일</th>
                <td colspan="3" class="td_input" style="border-right:hidden;">
                    <sbux-input id="OUT_EMAIL" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">급여수습종료일</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="TEMP_END_DATE"
                            name="TEMP_END_DATE"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
                <th scope="row" class="th_bg">그룹입사일</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="GROUP_ENTER_DATE"
                            name="GROUP_ENTER_DATE"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
                <th scope="row" class="th_bg">당사입사일</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="COMP_ENTER_DATE"
                            name="COMP_ENTER_DATE"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
                <th scope="row" class="th_bg">승진기준일</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="PROMOTION_BASE_DATE"
                            name="PROMOTION_BASE_DATE"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">퇴사일(최종근무일)</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="RETIRE_DATE"
                            name="RETIRE_DATE"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
                <th scope="row" class="th_bg">퇴사사유</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-select id="RETIRE_REASON" uitype="single" jsondata-ref="jsonRetireReason" unselected-text="선택" class="form-control input-sm"></sbux-select>
                </td>
                <th scope="row" class="th_bg">퇴사사내사유</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-select id="RETIRE_IN_REASON" uitype="single" jsondata-ref="jsonRetireInReason" unselected-text="선택" class="form-control input-sm"></sbux-select>
                </td>
                <th scope="row" class="th_bg">퇴직기산일</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="RETIRE_BASE_DATE"
                            name="RETIRE_BASE_DATE"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">중간정산일</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="PREMATURE_DATE"
                            name="PREMATURE_DATE"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
                <td colspan="2" class="td_input" style="border-right:hidden;">
                    <sbux-checkbox
                            uitype="normal"
                            id="RETIRE_PENSION_JOIN_YN"
                            name="RETIRE_PENSION_JOIN_YN"
                            uitype="normal"
                            class="form-control input-sm check"
                            text="퇴직연금(DC형)가입"
                    />
                </td>
                <th scope="row" class="th_bg">퇴직연금최종불입일</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="RETIRE_INITIAL_DATE"
                            name="RETIRE_INITIAL_DATE"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
                <th scope="row" class="th_bg">퇴직연금(DB형)가입일</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="RET_RENS_ST_DAT"
                            name="RET_RENS_ST_DAT"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">자택근무</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-checkbox
                            uitype="normal"
                            id="TELEWORKING_YN"
                            name="TELEWORKING_YN"
                            uitype="normal"
                            class="form-control input-sm check"
                            text="예"
                    />
                </td>
                <th scope="row" class="th_bg">자택근무주소</th>
                <td colspan="6" class="td_input" style="border-right:hidden;">
                    <sbux-input id="TELEWORKING_ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">승급일</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="PROMOTION_DATA"
                            name="PROMOTION_DATA"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
                <th scope="row" class="th_bg">비고</th>
                <td colspan="6" class="td_input" style="border-right:hidden;">
                    <sbux-input id="EMP_MEMO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">개인정보동의일</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="AGREE_DATE"
                            name="AGREE_DATE"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-checkbox
                            uitype="normal"
                            id="AGREE_YN"
                            name="AGREE_YN"
                            uitype="normal"
                            class="form-control input-sm check"
                            text="개인정보동의"
                    />
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div id="tpgMasterSubDetail" style="height: 596px;">
        <div class="col-sm-4">
            <div class="ad_tbl_top2">
                <ul class="ad_tbl_count">
                    <li>
                        <span>신체</span>
                    </li>
                </ul>
            </div>
            <div>
                <table class="table table-bordered tbl_fixed">
                    <caption>신체</caption>
                    <colgroup>
                        <col style="width: 25%">
                        <col style="width: 25%">
                        <col style="width: 25%">
                        <col style="width: 25%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg">RH</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-select id="BLOOD_TYPE_RH" uitype="single" jsondata-ref="jsonBloodTypeRh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <th scope="row" class="th_bg">ABO</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-select id="BLOOD_TYPE_ABO" uitype="single" jsondata-ref="jsonBloodTypeAbo" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">체중</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-input id="WEIGHT" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">키</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-input id="HEIGHT" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">좌안</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-input id="LEFT_EYE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">우안</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-input id="RIGHT_EYE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">색맹여부</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-select id="COLOR_BLIND_YN" uitype="single" jsondata-ref="jsonUseYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">상의 치수</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-input id="JACKET_SIZE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">하의 치수</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-input id="PANTS_SIZE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">신발 치수</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-input id="SHOE_SIZE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-sm-4">
            <div>
                <div class="ad_tbl_top2">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>취미/특기/종교</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <table class="table table-bordered tbl_fixed">
                        <caption>취미/특기/종교</caption>
                        <colgroup>
                            <col style="width: 50%">
                            <col style="width: 50%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_bg">취미</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-select id="HOBBY" uitype="single" jsondata-ref="jsonBloodTypeRh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">특기</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="SPECIAL_ABILITY" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">종교</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-select id="RELIGION_CODE" uitype="single" jsondata-ref="jsonReligionCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div>
                <div class="ad_tbl_top2">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>주거</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <table class="table table-bordered tbl_fixed">
                        <caption>주거</caption>
                        <colgroup>
                            <col style="width: 50%">
                            <col style="width: 50%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_bg">주택소유여부</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-select id="HOUSE_OWN_YN" uitype="single" jsondata-ref="jsonUseYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">주거구분</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-select id="HOUSE_TYPE" uitype="single" jsondata-ref="jsonHouseType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">주택유형</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-select id="HOUSE_KIND" uitype="single" jsondata-ref="jsonHouseKind" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div>
                <div class="ad_tbl_top2">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>결혼</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <table class="table table-bordered tbl_fixed">
                        <caption>결혼</caption>
                        <colgroup>
                            <col style="width: 50%">
                            <col style="width: 50%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_bg">결혼여부</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-select id="MARRIAGE_YN" uitype="single" jsondata-ref="jsonMarriageYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">결혼기념일</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="MARRIAGE_DATE"
                                        name="MARRIAGE_DATE"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                        style="width:100%;"
                                />
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div>
                <div class="ad_tbl_top2">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>차량</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <table class="table table-bordered tbl_fixed">
                        <caption>차량</caption>
                        <colgroup>
                            <col style="width: 50%">
                            <col style="width: 50%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_bg">차량소유여부</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-select id="CAR_OWN_YN" uitype="single" jsondata-ref="jsonUseYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">차량번호</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="CAR_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">차종</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="CAR_KIND" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div id="tpgFAMILY">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>가족사항</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwFamily" name="btn_addRowForGvwFamily" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwFamily" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwFamily" name="btn_delRowForGvwFamily" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwFamily"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwFamily" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgSCHOOL">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>학력사항</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwSchool" name="btn_addRowForGvwSchool" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwSchool" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwSchool" name="btn_delRowForGvwSchool" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwSchool"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwSchool" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgCAREER">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>경력사항</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwCareer" name="btn_addRowForGvwCareer" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwCareer" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwCareer" name="btn_delRowForGvwCareer" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwCareer"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwCareer" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgLICENSE">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>경력사항</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwLicense" name="btn_addRowForGvwLicense" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwLicense" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwLicense" name="btn_delRowForGvwLicense" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwLicense"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwLicense" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgLANGUAGE">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>어학</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwLanguage" name="btn_addRowForGvwLanguage" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwLanguage" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwLanguage" name="btn_delRowForGvwLanguage" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwLanguage"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwLanguage" style="height:200px;"></div>
        </div>
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>컴퓨터활용능력</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwComputerSkill" name="btn_addRowForGvwComputerSkill" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwComputerSkill" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwComputerSkill" name="btn_delRowForGvwComputerSkill" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwComputerSkill"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwComputerSkill" style="height:320px;"></div>
        </div>
    </div>
    <div id="tpgFILE">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>파일정보</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwFile" name="btn_addRowForGvwFile" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwFile" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwFile" name="btn_delRowForGvwFile" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwFile"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwFile" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgEducation">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>교육사항</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwEducation" name="btn_addRowForGvwEducation" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwEducation" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwEducation" name="btn_delRowForGvwEducation" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwEducation"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwEducation" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgMasterSubDetail2" style="height: 596px;">
        <div class="table-responsive tbl_scroll_xs">
            <table class="table table-bordered tbl_fixed">
                <caption>병역사항</caption>
                <colgroup>
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">병역구분</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="ARMY_TYPE" uitype="single" jsondata-ref="jsonArmyType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-checkbox
                                uitype="normal"
                                id="ARMY_INDUSTRY_YN"
                                name="ARMY_INDUSTRY_YN"
                                uitype="normal"
                                class="form-control input-sm check"
                                text="병역특례"
                        />
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>병역사항</span></li>
            </ul>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <table class="table table-bordered tbl_fixed">
                <caption>신체</caption>
                <colgroup>
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">병역병과</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="ARMY_PART" uitype="single" jsondata-ref="jsonArmyPart" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">병역군별</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="ARMY_KIND" uitype="single" jsondata-ref="jsonArmyKind" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">전역구분</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="ARMY_DISCHARGE_TYPE" uitype="single" jsondata-ref="jsonArmyDischargeType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">병역계급</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="ARMY_GRADE" uitype="single" jsondata-ref="jsonArmyGrade" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">복무시작일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="ARMY_START_DATE"
                                name="ARMY_START_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <th scope="row" class="th_bg">복무종료일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="ARMY_END_DATE"
                                name="ARMY_END_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">면제사유</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-input id="ARMY_EXEMPTION_DESCR" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">병역사항</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-input id="ARMY_DESCR" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div id="tpgMasterSubDetail3" style="height: 596px;">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>보훈</span></li>
            </ul>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <table class="table table-bordered tbl_fixed">
                <caption>보훈</caption>
                <colgroup>
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">보훈대상여부</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="VETERANS_YN" uitype="single" jsondata-ref="jsonUseYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">보훈등급</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="VETERANS_GRADE" uitype="single" jsondata-ref="jsonVeteransGrade" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">보훈내용</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-input id="VETERANS_MEMO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">유공자와의관계</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="VETERANS_RELATION" uitype="single" jsondata-ref="jsonRelation" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">보훈번호</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="VETERANS_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">고용명령여부</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="VETERANS_ORDER_YN" uitype="single" jsondata-ref="jsonUseYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">고용명령일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="VETERANS_ORDER_DATE"
                                name="VETERANS_ORDER_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>장애</span></li>
            </ul>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <table class="table table-bordered tbl_fixed">
                <caption>장애</caption>
                <colgroup>
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">장애등급</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="HANDICAP_GRADE" uitype="single" jsondata-ref="jsonHandicapGrade" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">장애유형</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="HANDICAP_TYPE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">장애내역</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="HANDICAP_REASON" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">장애등록일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="HANDICAP_ISSUE_DATE"
                                name="HANDICAP_ISSUE_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>여권/비자</span></li>
            </ul>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <table class="table table-bordered tbl_fixed">
                <caption>여권/비자</caption>
                <colgroup>
                    <col style="width: 16%">
                    <col style="width: 16%">
                    <col style="width: 16%">
                    <col style="width: 16%">
                    <col style="width: 16%">
                    <col style="width: 16%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">여권번호</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="PASSPORT_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">여권발급일자</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="PASSPORT_ISSUE_DATE"
                                name="PASSPORT_ISSUE_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <th scope="row" class="th_bg">여권만료일자</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="PASSPORT_EXPIRE_DATE"
                                name="PASSPORT_EXPIRE_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">비자번호</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="VISA_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">비자발급일자</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="VISA_ISSUE_DATE"
                                name="VISA_ISSUE_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <th scope="row" class="th_bg">비자만료일자</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="VISA_EXPIRE_DATE"
                                name="VISA_EXPIRE_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div id="tpgMasterSubDetail4" style="height: 596px;">
        <div class="table-responsive tbl_scroll_xs">
            <table class="table table-bordered tbl_fixed">
                <caption>보증구분</caption>
                <colgroup>
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">보증구분</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="GUARANTEE_TYPE" uitype="single" jsondata-ref="jsonGuaranteeType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>보증보험</span></li>
            </ul>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <table class="table table-bordered tbl_fixed">
                <caption>보증보험</caption>
                <colgroup>
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">보험사</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="INSURE_COMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">보험명</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="INSURE_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">보험번호</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="INSURE_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">보험액</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="INSURE_AMOUNT" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">보험가액</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="INSURE_VALUE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">보험시작일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="INSURE_START_DATE"
                                name="INSURE_START_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <th scope="row" class="th_bg">보험종료일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="INSURE_END_DATE"
                                name="INSURE_END_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>인보증1</span></li>
            </ul>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <table class="table table-bordered tbl_fixed">
                <caption>인보증1</caption>
                <colgroup>
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">성명</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="GUARANTOR1_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">거민신분번호</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="GUARANTOR1_SOCIAL_NO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">관계</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="GUARANTOR1_RELATION" uitype="single" jsondata-ref="jsonRelation" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">전화번호</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="GUARANTOR1_COMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">비고</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="GUARANTOR1_POSITION" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">시작일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="GUARANTOR1_START_DATE"
                                name="GUARANTOR1_START_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <th scope="row" class="th_bg">종료일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="GUARANTOR1_END_DATE"
                                name="GUARANTOR1_END_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">우편번호</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="GUARANTOR1_ZIP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">주소</th>
                    <td colspan="5" class="td_input" style="border-right:hidden;">
                        <sbux-input id="GUARANTOR1_ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>인보증2</span></li>
            </ul>
        </div>
        <table class="table table-bordered tbl_fixed">
            <caption>인보증2</caption>
            <colgroup>
                <col style="width: 12.5%">
                <col style="width: 12.5%">
                <col style="width: 12.5%">
                <col style="width: 12.5%">
                <col style="width: 12.5%">
                <col style="width: 12.5%">
                <col style="width: 12.5%">
                <col style="width: 12.5%">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row" class="th_bg">성명</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="GUARANTOR2_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <th scope="row" class="th_bg">거민신분번호</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="GUARANTOR2_SOCIAL_NO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <th scope="row" class="th_bg">관계</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-select id="GUARANTOR2_RELATION" uitype="single" jsondata-ref="jsonRelation" unselected-text="선택" class="form-control input-sm"></sbux-select>
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">전화번호</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="GUARANTOR2_COMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <th scope="row" class="th_bg">비고</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="GUARANTOR2_POSITION" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <th scope="row" class="th_bg">시작일</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="GUARANTOR2_START_DATE"
                            name="GUARANTOR2_START_DATE"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
                <th scope="row" class="th_bg">종료일</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-datepicker
                            uitype="popup"
                            id="GUARANTOR2_END_DATE"
                            name="GUARANTOR2_END_DATE"
                            date-format="yyyy-mm-dd"
                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                            style="width:100%;"
                    />
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">우편번호</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="GUARANTOR2_ZIP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
                <th scope="row" class="th_bg">주소</th>
                <td colspan="5" class="td_input" style="border-right:hidden;">
                    <sbux-input id="GUARANTOR2_ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div id="tpgPrize">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>상벌사항</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwPrize" name="btn_addRowForGvwPrize" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwPrize" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwPrize" name="btn_delRowForGvwPrize" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwPrize"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwPrize" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgHealth">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>건강검진내역</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwHealth" name="btn_addRowForGvwHealth" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwHealth" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwHealth" name="btn_delRowForGvwHealth" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwHealth"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwHealth" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgAppointment">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>발령사항</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwAppointment" name="btn_addRowForGvwAppointment" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwAppointment" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwAppointment" name="btn_delRowForGvwAppointment" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwAppointment"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwAppointment" style="height:560px;"></div>
        </div>
    </div>
    <div id="tabPageEx1">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>겸직부서</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwAddJob" name="btn_addRowForGvwAddJob" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwAddJob" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwAddJob" name="btn_delRowForGvwAddJob" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwAddJob"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwAddJob" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgTimeOffHistory">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>휴직이력</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwTimeOffHistory" name="btn_addRowForGvwTimeOffHistory" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwTimeOffHistory" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwTimeOffHistory" name="btn_delRowForGvwTimeOffHistory" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwTimeOffHistory"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwTimeOffHistory" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgGroupInsurance">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>단체보험</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwGroupInsurance" name="btn_addRowForGvwGroupInsurance" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwGroupInsurance" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwGroupInsurance" name="btn_delRowForGvwGroupInsurance" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwGroupInsurance"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwGroupInsurance" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgDisease">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>상해/질병</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwDisease" name="btn_addRowForGvwDisease" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwDisease" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwDisease" name="btn_delRowForGvwDisease" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwDisease"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwDisease" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgPersonnelEvaluation">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>평가</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwPersonnelEvaluation" name="btn_addRowForGvwPersonnelEvaluation" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwPersonnelEvaluation" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwPersonnelEvaluation" name="btn_delRowForGvwPersonnelEvaluation" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwPersonnelEvaluation"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwPersonnelEvaluation" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgOfficialInjury">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>공상발생</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwOfficialInjury" name="btn_addRowForGvwOfficialInjury" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwOfficialInjury" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwOfficialInjury" name="btn_delRowForGvwOfficialInjury" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwOfficialInjury"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwOfficialInjury" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgContractDeg">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>계약차수</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwContractDeg" name="btn_addRowForGvwContractDeg" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwContractDeg" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwContractDeg" name="btn_delRowForGvwContractDeg" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwContractDeg"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwContractDeg" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgWORKPLAN">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>근무계획</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwWorkPlan" name="btn_addRowForGvwWorkPlan" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwWorkPlan" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwWorkPlan" name="btn_delRowForGvwWorkPlan" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwWorkPlan"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwWorkPlan" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgEmp">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>근무조</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwEmp" name="btn_addRowForGvwEmp" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwEmp" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwEmp" name="btn_delRowForGvwEmp" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwEmp"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwEmp" style="height:560px;"></div>
        </div>
    </div>
    <div id="tpgExpenditurewelfare">
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li><span>경조사비내역</span></li>
            </ul>
            <div class="ad_tbl_toplist">
                <sbux-button id="btn_addRowForGvwExpenditurewelfare" name="btn_addRowForGvwExpenditurewelfare" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwExpenditurewelfare" ></sbux-button>&nbsp;
                <sbux-button id="btn_delRowForGvwExpenditurewelfare" name="btn_delRowForGvwExpenditurewelfare" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwExpenditurewelfare"></sbux-button>
            </div>
        </div>
        <div class="table-responsive tbl_scroll_xs">
            <div id="sb-area-gvwExpenditurewelfare" style="height:560px;"></div>
        </div>
    </div>
</div>

<script>
    function clearTabContents() {
        // 기본인적
        SBUxMethod.set("NATION_CODE", "");
        SBUxMethod.set("FOREIGNER_YN", "");
        SBUxMethod.set("FAMILY_OWNER_YN", "");
        SBUxMethod.set("FAMILY_CLAN", "");
        SBUxMethod.set("BONUS_APPLY_START_DATE", "");
        SBUxMethod.set("FAMILY_REGISTER_ZIP_CODE", "");
        SBUxMethod.set("btnZip1", "");
        SBUxMethod.set("FAMILY_REGISTER_ADDRESS", "");
        SBUxMethod.set("UNION_JOIN_START_DATE", "");
        SBUxMethod.set("REGISTER_ZIP_CODE", "");
        SBUxMethod.set("btnZip2", "");
        SBUxMethod.set("REGISTER_ADDRESS", "");
        SBUxMethod.set("CELLPHONE_NUM", "");
        SBUxMethod.set("UNION_JOIN_END_DATE", "");
        SBUxMethod.set("EMERGENCY_ZIP_CODE", "");
        SBUxMethod.set("btnZip3", "");
        SBUxMethod.set("EMERGENCY_ADDRESS", "");
        SBUxMethod.set("EMERGENCY_TEL_NUM", "");
        SBUxMethod.set("RESIDENCE_ZIP_CODE", "");
        SBUxMethod.set("btnZip4", "");
        SBUxMethod.set("RESIDENCE_ADDRESS", "");
        SBUxMethod.set("HOME_TEL_NUM", "");
        SBUxMethod.set("OFFICE_TEL_NUM", "");
        SBUxMethod.set("FAX_NUM", "");
        SBUxMethod.set("INTER_PHONE", "");
        SBUxMethod.set("UNION_JOIN_YN", "");
        SBUxMethod.set("IN_EMAIL", "");
        SBUxMethod.set("OUT_EMAIL", "");
        SBUxMethod.set("TEMP_END_DATE", "");
        SBUxMethod.set("GROUP_ENTER_DATE", "");
        SBUxMethod.set("COMP_ENTER_DATE", "");
        SBUxMethod.set("PROMOTION_BASE_DATE", "");
        SBUxMethod.set("RETIRE_DATE", "");
        SBUxMethod.set("RETIRE_REASON", "");
        SBUxMethod.set("RETIRE_IN_REASON", "");
        SBUxMethod.set("RETIRE_BASE_DATE", "");
        SBUxMethod.set("PREMATURE_DATE", "");
        SBUxMethod.set("RETIRE_PENSION_JOIN_YN", "");
        SBUxMethod.set("RETIRE_INITIAL_DATE", "");
        SBUxMethod.set("RET_RENS_ST_DAT", "");
        SBUxMethod.set("TELEWORKING_YN", "");
        SBUxMethod.set("TELEWORKING_ADDRESS", "");
        SBUxMethod.set("PROMOTION_DATA", "");
        SBUxMethod.set("EMP_MEMO", "");
        SBUxMethod.set("AGREE_DATE", "");
        SBUxMethod.set("AGREE_YN", "");

        // 주거/생활/신체
        SBUxMethod.set("BLOOD_TYPE_RH", "");
        SBUxMethod.set("BLOOD_TYPE_ABO", "");
        SBUxMethod.set("WEIGHT", "");
        SBUxMethod.set("HEIGHT", "");
        SBUxMethod.set("LEFT_EYE", "");
        SBUxMethod.set("RIGHT_EYE", "");
        SBUxMethod.set("COLOR_BLIND_YN", "");
        SBUxMethod.set("JACKET_SIZE", "");
        SBUxMethod.set("PANTS_SIZE", "");
        SBUxMethod.set("SHOE_SIZE", "");
        SBUxMethod.set("HOBBY", "");
        SBUxMethod.set("SPECIAL_ABILITY", "");
        SBUxMethod.set("RELIGION_CODE", "");
        SBUxMethod.set("HOUSE_OWN_YN", "");
        SBUxMethod.set("HOUSE_TYPE", "");
        SBUxMethod.set("HOUSE_KIND", "");
        SBUxMethod.set("MARRIAGE_YN", "");
        SBUxMethod.set("MARRIAGE_DATE", "");
        SBUxMethod.set("CAR_OWN_YN", "");
        SBUxMethod.set("CAR_NUM", "");
        SBUxMethod.set("CAR_KIND", "");

        // 병역사항
        SBUxMethod.set("ARMY_TYPE", "");
        SBUxMethod.set("ARMY_INDUSTRY_YN", "");
        SBUxMethod.set("ARMY_PART", "");
        SBUxMethod.set("ARMY_KIND", "");
        SBUxMethod.set("ARMY_DISCHARGE_TYPE", "");
        SBUxMethod.set("ARMY_GRADE", "");
        SBUxMethod.set("ARMY_START_DATE", "");
        SBUxMethod.set("ARMY_END_DATE", "");
        SBUxMethod.set("ARMY_EXEMPTION_DESCR", "");
        SBUxMethod.set("ARMY_DESCR", "");

        // 보훈/장애/여권/비자
        SBUxMethod.set("VETERANS_YN", "");
        SBUxMethod.set("VETERANS_GRADE", "");
        SBUxMethod.set("VETERANS_MEMO", "");
        SBUxMethod.set("VETERANS_RELATION", "");
        SBUxMethod.set("VETERANS_NUM", "");
        SBUxMethod.set("VETERANS_ORDER_YN", "");
        SBUxMethod.set("VETERANS_ORDER_DATE", "");
        SBUxMethod.set("HANDICAP_GRADE", "");
        SBUxMethod.set("HANDICAP_TYPE", "");
        SBUxMethod.set("HANDICAP_REASON", "");
        SBUxMethod.set("HANDICAP_ISSUE_DATE", "");
        SBUxMethod.set("PASSPORT_NUM", "");
        SBUxMethod.set("PASSPORT_ISSUE_DATE", "");
        SBUxMethod.set("PASSPORT_EXPIRE_DATE", "");
        SBUxMethod.set("VISA_NUM", "");
        SBUxMethod.set("VISA_ISSUE_DATE", "");
        SBUxMethod.set("VISA_EXPIRE_DATE", "");

        // 보증보험
        SBUxMethod.set("GUARANTEE_TYPE", "");
        SBUxMethod.set("INSURE_COMP_NAME", "");
        SBUxMethod.set("INSURE_NAME", "");
        SBUxMethod.set("INSURE_NUM", "");
        SBUxMethod.set("INSURE_AMOUNT", "");
        SBUxMethod.set("INSURE_VALUE", "");
        SBUxMethod.set("INSURE_START_DATE", "");
        SBUxMethod.set("INSURE_END_DATE", "");
        SBUxMethod.set("GUARANTOR1_NAME", "");
        SBUxMethod.set("GUARANTOR1_SOCIAL_NO", "");
        SBUxMethod.set("GUARANTOR1_RELATION", "");
        SBUxMethod.set("GUARANTOR1_COMP_NAME", "");
        SBUxMethod.set("GUARANTOR1_POSITION", "");
        SBUxMethod.set("GUARANTOR1_START_DATE", "");
        SBUxMethod.set("GUARANTOR1_END_DATE", "");
        SBUxMethod.set("GUARANTOR1_ZIP_CODE", "");
        SBUxMethod.set("GUARANTOR1_ADDRESS", "");
        SBUxMethod.set("GUARANTOR2_NAME", "");
        SBUxMethod.set("GUARANTOR2_SOCIAL_NO", "");
        SBUxMethod.set("GUARANTOR2_RELATION", "");
        SBUxMethod.set("GUARANTOR2_COMP_NAME", "");
        SBUxMethod.set("GUARANTOR2_POSITION", "");
        SBUxMethod.set("GUARANTOR2_START_DATE", "");
        SBUxMethod.set("GUARANTOR2_END_DATE", "");
        SBUxMethod.set("GUARANTOR2_ZIP_CODE", "");
        SBUxMethod.set("GUARANTOR2_ADDRESS", "");

        jsonFamilyList.length = 0;
        jsonSchoolList.length = 0;
        jsonCareerList.length = 0;
        jsonLicenseList.length = 0;
        jsonLanguageList.length = 0;
        jsonComputerSkillList.length = 0;
        jsonFileList.length = 0;
        jsonEducationList.length = 0;
        jsonPrizeList.length = 0;
        jsonHealthList.length = 0;
        jsonAppointmentList.length = 0;
        jsonAddJobList.length = 0;
        jsonTimeOffHistoryList.length = 0;
        jsonGroupInsuranceList.length = 0;
        jsonDiseaseList.length = 0;
        jsonPersonnelEvaluationList.length = 0;
        jsonOfficialInjuryList.length = 0;
        jsonContractDegList.length = 0;
        jsonWorkPlanList.length = 0;
        jsonEmpList.length = 0;
        jsonExpenditurewelfareList.length = 0;

        gvwFamily.rebuild();
        gvwSchool.rebuild();
        gvwCareer.rebuild();
        gvwLicense.rebuild();
        gvwLanguage.rebuild();
        gvwComputerSkill.rebuild();
        gvwFile.rebuild();
        gvwEducation.rebuild();
        gvwPrize.rebuild();
        gvwHealth.rebuild();
        gvwAppointment.rebuild();
        gvwAddJob.rebuild();
        gvwTimeOffHistory.rebuild();
        gvwGroupInsurance.rebuild();
        gvwDisease.rebuild();
        gvwPersonnelEvaluation.rebuild();
        gvwOfficialInjury.rebuild();
        gvwContractDeg.rebuild();
        gvwWorkPlan.rebuild();
        gvwEmp.rebuild();
        gvwExpenditurewelfare.rebuild();

        SBUxMethod.selectTab('idxTab_norm','tpgMasterSub');
    }

    function fn_createGvwFamilyGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwFamily';
        SBGridProperties.id 				= 'gvwFamily';
        SBGridProperties.jsonref 			= 'jsonFamilyList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["가족성명"], 	        ref: 'NAME',    	        type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["가족관계"],  		ref: 'RELATION',    			type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonRelation',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["가족주민등록번호"],       ref: 'SOCIAL_NO_REAL', 		type:'output',  	width:'135px',  	style:'text-align:left'},
            {caption: ["가족주민등록번호2"],          ref: 'SOCIAL_NO', 		        type:'output',  	width:'140px',  style:'text-align:left'},
            {caption: ["생년월일"],          ref: 'BIRTHDAY', 		    type:'datepicker',  	width:'100px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["음양구분"],      	ref: 'BIRTHDAY_TYPE', 		        type:'output',  	width:'70px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonBirthdayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["시작일자"],     	ref: 'START_DATE', 		         type:'datepicker',  	width:'75px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["종료일자"],     	ref: 'END_DATE', 		         type:'datepicker',  	width:'75px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["부양가족"],        ref: 'SUPPORT_YN', 		         type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["연말정산"],        ref: 'YEARTAX_YN', 		     type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["연말정산부양관계"],  		ref: 'YEARTAX_RELATION',    			type:'output',  	width:'120px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonYeartaxRelation',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["외국인"],        ref: 'FOREIGNER_YN', 		     type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["장애"],        ref: 'HANDICAP_YN', 		     type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["동거"],        ref: 'LIVE_TOGETHER_YN', 		     type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["생존여부"],        ref: 'LIFE_YN', 		     type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["건강보험피부양자"],        ref: 'HEALTH_INSURE_YN', 		     type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["직업"],        ref: 'JOB', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["원천징수공제"],        ref: 'WH_TAX_YN', 		     type:'output',  	width:'79px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["우편번호"],        ref: 'ZIP_CODE', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["주소"],        ref: 'ADDRESS', 		     type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["연락처"],        ref: 'TEL', 		     type:'output',  	width:'130px',  	style:'text-align:left'},
            {caption: ["최종학력"],        ref: 'SCHOOL_TYPE', 		     type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonSchoolType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
        ];

        gvwFamily = _SBGrid.create(SBGridProperties);
        //gvwFamily.bind('beforepagechanged', 'fn_pagingFamilyList');
    }

    function fn_createGvwSchoolGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwSchool';
        SBGridProperties.id 				= 'gvwSchool';
        SBGridProperties.jsonref 			= 'jsonSchoolList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["학위구분"], 	        ref: 'SCHOOL_TYPE',    	        type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDegreeType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["소재지"],  		ref: 'MANAGE_CODE',    			type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonManageCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["본교구분"],       ref: 'CAMPUS_BRANCH_TYPE', 		type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonCampusBranchType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["학교명"],          ref: 'SCHOOL_NAME', 		        type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["주야간구분"],          ref: 'DAY_NIGHT_TYPE', 		    type:'output',  	width:'80px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDayNightType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["전공명"],      	ref: 'MAJOR', 		        type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["졸업구분"],     	ref: 'GRADUATE_TYPE', 		         type:'output',  	width:'80px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonGraduateType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["최종학력"],     	ref: 'LAST_SCHOOL_YN', 		         type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["이수학점"],        ref: 'COMPLE_POINT', 		         type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["평점"],        ref: 'GPA_POINT', 		     type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["입학일"],  		ref: 'INTO_DATE',    			type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["졸업일"],        ref: 'GRADUATE_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["입사후"],        ref: 'AFTER_ENTER_YN', 		     type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'200px',  	style:'text-align:left'}
        ];

        gvwSchool = _SBGrid.create(SBGridProperties);
        //gvwSchool.bind('beforepagechanged', 'fn_pagingSchoolList');
    }

    function fn_createGvwCareerGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwCareer';
        SBGridProperties.id 				= 'gvwCareer';
        SBGridProperties.jsonref 			= 'jsonCareerList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["경력구분"], 	        ref: 'CAREER_TYPE',    	        type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonCareerType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근무시작일"],  		ref: 'START_DATE',    			type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["근무종료일"],       ref: 'END_DATE', 		type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["경력년수"],          ref: 'CAREER_YEAR', 		        type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["경력개월"],          ref: 'CAREER_MONTH', 		        type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["회사명"],          ref: 'COMP_NAME', 		        type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["부서명"],          ref: 'DEPT_NAME', 		    type:'output',  	width:'120px',  style:'text-align:left'}, // TODO: P_ORG001 팝업 적용 필요
            {caption: ["직위"],      	ref: 'POSITION', 		        type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["직종"],     	ref: 'JOB', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["담당업무"],     	ref: 'WORK', 		         type:'output',  	width:'180px',  style:'text-align:left'},
            {caption: ["소재지"],        ref: 'REGION_CODE', 		         type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonManageCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["연봉수준"],        ref: 'SALARY_LEVEL', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["퇴직사유"],  		ref: 'RETIRE_MEMO',    			type:'datepicker',  	width:'200px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwCareer = _SBGrid.create(SBGridProperties);
        //gvwCareer.bind('beforepagechanged', 'fn_pagingCareerList');
    }

    function fn_createGvwLicenseGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwLicense';
        SBGridProperties.id 				= 'gvwLicense';
        SBGridProperties.jsonref 			= 'jsonLicenseList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["종별"], 	        ref: 'LICENSE_CATEGORY',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonLicenseCategory',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["자격증코드"],  		ref: 'LICENSE_CODE',    			type:'output',  	width:'104px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonLicenseCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["자격등급"],     	ref: 'LICENSE_GRADE', 		         type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["자격번호"],     	ref: 'LICENSE_NUM', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["면허명(자격명)"],     	ref: 'LICENSE_NAME', 		         type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["발행기관"],     	ref: 'ISSUE_INSTITUTE', 		         type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["취득일"],       ref: 'ISSUE_DATE', 		type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["갱신일"],       ref: 'RENEW_DATE', 		type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["자격수당금액"],     	ref: 'LICENSE_WAGES_AMT', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["급여지급"],          ref: 'PAY_YN', 		        type:'output',  	width:'75px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonUseYn',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["법정선임여부"],          ref: 'APPOINT_YN', 		        type:'output',  	width:'100px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonUseYn',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["법정선임부서"],          ref: 'APPOINT_DEPT_CODE', 		        type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["법정선임시작일"],       ref: 'APPOINT_START_DATE', 		type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["법정선임종료일"],       ref: 'APPOINT_END_DATE', 		type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwLicense = _SBGrid.create(SBGridProperties);
        //gvwLicense.bind('beforepagechanged', 'fn_pagingLicenseList');
    }

    function fn_createGvwLanguageGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwLanguage';
        SBGridProperties.id 				= 'gvwLanguage';
        SBGridProperties.jsonref 			= 'jsonLanguageList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["시험구분"], 	        ref: 'TEST_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonTestType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["시험일"],       ref: 'TEST_DATE', 		type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["유효일"],       ref: 'AVAILABLE_DATE', 		type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["발행기관"],     	ref: 'ISSUE_INSTITUTION', 		         type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["총점수"],     	ref: 'TOTAL_SCORE', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["점수1"],     	ref: 'SCORE1', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["점수2"],     	ref: 'SCORE2', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["점수3"],     	ref: 'SCORE3', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["점수4"],     	ref: 'SCORE4', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["수준"],  		ref: 'TEST_LEVEL',    			type:'output',  	width:'104px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonLevelCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwLanguage = _SBGrid.create(SBGridProperties);
        //gvwLanguage.bind('beforepagechanged', 'fn_pagingLanguageList');
    }

    function fn_createGvwComputerSkillGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwComputerSkill';
        SBGridProperties.id 				= 'gvwComputerSkill';
        SBGridProperties.jsonref 			= 'jsonComputerSkillList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["사용가능OA명"], 	        ref: 'OA_NAME',    	        type:'output',  	width:'190px',  	style:'text-align:left'},
            {caption: ["활용수준"],  		ref: 'OA_SKILL_LEVEL',    			type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonLevelCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwComputerSkill = _SBGrid.create(SBGridProperties);
        //gvwComputerSkill.bind('beforepagechanged', 'fn_pagingComputerSkillList');
    }

    function fn_createGvwFileGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwFile';
        SBGridProperties.id 				= 'gvwFile';
        SBGridProperties.jsonref 			= 'jsonFileList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["파일명"], 	        ref: 'FILE_NAME',    	        type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["파일서버경로"],        ref: 'FILE_SERVER_PATH', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["구분"],  		ref: 'FILE_TYPE',    			type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonFileType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["생성일시"],        ref: 'CREATE_TIME', 		     type:'output',  	width:'140px',  	style:'text-align:left'},
            {caption: ["생성자"],        ref: 'CREATE_USER', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwFile = _SBGrid.create(SBGridProperties);
        //gvwFile.bind('beforepagechanged', 'fn_pagingFileList');
    }

    function fn_createGvwEducationGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwEducation';
        SBGridProperties.id 				= 'gvwEducation';
        SBGridProperties.jsonref 			= 'jsonEducationList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["교육과정명"], 	        ref: 'EDU_NAME',    	        type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["교육구분"],        ref: 'EDU_METHOD', 		     type:'output',  	width:'92px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonEduMethod',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["교육방법"],  		ref: 'EDU_TYPE',    			type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonEduType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["교육기관"],        ref: 'EDU_INSTITUTE', 		     type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["교육시작일"],        ref: 'EDU_START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["교육종료일"],        ref: 'EDU_END_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["교육점수"],        ref: 'EDU_SCORE', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["교육비용"],        ref: 'EDU_TOTAL_EXPENSE', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["고용보험환급액"],        ref: 'RETURN_EXPENSE', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["실지급액"],        ref: 'PAYMENT_EXPENSE', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["이수여부"],  		ref: 'EDU_PASS_YN',    			type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonUseYn',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwEducation = _SBGrid.create(SBGridProperties);
        //gvwEducation.bind('beforepagechanged', 'fn_pagingEducationList');
    }

    function fn_createGvwPrizeGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwPrize';
        SBGridProperties.id 				= 'gvwPrize';
        SBGridProperties.jsonref 			= 'jsonPrizeList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["상벌구분"], 	        ref: 'PRIZE_TYPE',    	        type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPrizeType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }},
            {caption: ["상벌일자"],        ref: 'PRIZE_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["상벌유형"],  		ref: 'PRIZE_CATEGORY',    			type:'output',  	width:'120px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPrizeCategory',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["사내외구분"],        ref: 'PRIZE_INOUT_TYPE', 		     type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPrizeInoutType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["대상구분"],        ref: 'PRIZE_TARGET', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPrizeTarget',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["상벌명"],        ref: 'PRIZE_NAME', 		     type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["상벌사유"],        ref: 'PRIZE_REASON', 		     type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["상벌내용"],        ref: 'PRIZE_DETAIL', 		     type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["시행기관"],        ref: 'PRIZE_MAKER', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["징계시작일"],        ref: 'PUNISH_START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["징계종료일"],        ref: 'PUNISH_END_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["급여반영여부"],  		ref: 'APPLY_PAY_YN',    			type:'output',  	width:'90px',  	style:'text-align:left'},
            {caption: ["급여감봉율"],  		ref: 'BASE_PAY_DOWN_RATE',    			type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["상여감봉율"],        ref: 'BONUS_PAY_DOWN_RATE', 		     type:'output',  	width:'80px',  	style:'text-align:left'}
        ];

        gvwPrize = _SBGrid.create(SBGridProperties);
        //gvwPrize.bind('beforepagechanged', 'fn_pagingPrizeList');
    }

    function fn_createGvwHealthGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwHealth';
        SBGridProperties.id 				= 'gvwHealth';
        SBGridProperties.jsonref 			= 'jsonHealthList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["검진구분"], 	        ref: 'CHECK_TYPE',    	        type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonCheckType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["검진일자"],        ref: 'CHECK_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["검진기관"],  		ref: 'CHECK_INSTITUTE',    			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["검진결과"],        ref: 'RESULT', 		     type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["회사조치사항"],        ref: 'COMPANY_RESULT', 		     type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'200px',  	style:'text-align:left'}
        ];

        gvwHealth = _SBGrid.create(SBGridProperties);
        //gvwHealth.bind('beforepagechanged', 'fn_pagingHealthList');
    }

    function fn_createGvwAppointmentGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwAppointment';
        SBGridProperties.id 				= 'gvwAppointment';
        SBGridProperties.jsonref 			= 'jsonAppointmentList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["발령일자"], 	        ref: 'APPOINT_DATE',    	 type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["시작일자"],        ref: 'START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["종료일자"],        ref: 'END_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["발령구분"],  		ref: 'APPOINT_TYPE',    			type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["발령명칭"],        ref: 'APPOINT_TITLE', 		     type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["발령부서"],        ref: 'DEPT_CODE2', 		     type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["발령직위"],        ref: 'POSITION_CODE2', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["발령직책"],        ref: 'DUTY_CODE2', 		     type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["발령직급"],        ref: 'JOB_RANK2', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["발령직군"],        ref: 'JOB_GROUP2', 		     type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["발령직무"],        ref: 'JOB_CODE2', 		     type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["발령근무지"],  		ref: 'REGION_CODE2',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["발령사유"],  		ref: 'APPOINT_REASON',    			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwAppointment = _SBGrid.create(SBGridProperties);
        //gvwAppointment.bind('beforepagechanged', 'fn_pagingAppointmentList');
    }

    function fn_createGvwAddJobGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwAddJob';
        SBGridProperties.id 				= 'gvwAddJob';
        SBGridProperties.jsonref 			= 'jsonAddJobList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["겸직발령일자"], 	        ref: 'START_DATE',    	        type:'output',  	width:'104px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["겸직해제일자"],        ref: 'END_DATE', 		     type:'output',  	width:'119px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["겸직부서"],  		ref: 'DEPT_CODE',    			type:'output',  	width:'126px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAddJobDeptCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["겸직직위"],        ref: 'POSITION_CODE', 		     type:'output',  	width:'113px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["겸직직책"],        ref: 'DUTY_CODE', 		     type:'output',  	width:'115px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["겸직직급"],        ref: 'JOB_RANK', 		     type:'output',  	width:'163px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonJobRank',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            }
        ];

        gvwAddJob = _SBGrid.create(SBGridProperties);
        //gvwAddJob.bind('beforepagechanged', 'fn_pagingAddJobList');
    }

    function fn_createGvwTimeOffHistoryGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwTimeOffHistory';
        SBGridProperties.id 				= 'gvwTimeOffHistory';
        SBGridProperties.jsonref 			= 'jsonTimeOffHistoryList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["휴직유형"], 	        ref: 'TIME_OFF_TYPE',    	        type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonTimeOffType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["적용시작일"],        ref: 'START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["적용종료일"],        ref: 'END_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["휴직일수"],        ref: 'TIME_OFF_CNT', 		     type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["소속사업장"],        ref: 'SITE_CODE', 		     type:'output',  	width:'120px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["소속부서코드"],  		ref: 'DEPT_CODE',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["소속부서"],        ref: 'DEPT_NAME', 		     type:'output',  	width:'150px',  	style:'text-align:left'}, // TODO: P_ORG001 팝업 적용 필요
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwTimeOffHistory = _SBGrid.create(SBGridProperties);
        //gvwTimeOffHistory.bind('beforepagechanged', 'fn_pagingTimeOffHistoryList');
    }

    function fn_createGvwGroupInsuranceGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwGroupInsurance';
        SBGridProperties.id 				= 'gvwGroupInsurance';
        SBGridProperties.jsonref 			= 'jsonGroupInsuranceList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["보험상품"], 	        ref: 'GROUP_INSURE_CODE',    	        type:'output',  	width:'150px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonGroupInsureCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["증권번호"],        ref: 'INSURE_NUM', 		     type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["보험가입일"],        ref: 'INSURE_START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["보험만기일"],        ref: 'INSURE_DUE_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["보험해지일"],        ref: 'INSURE_END_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["불입금액"],        ref: 'GROUP_INSURE_AMT', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'200px',  	style:'text-align:left'}
        ];

        gvwGroupInsurance = _SBGrid.create(SBGridProperties);
        //gvwGroupInsurance.bind('beforepagechanged', 'fn_pagingGroupInsuranceList');
    }

    function fn_createGvwDiseaseGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwDisease';
        SBGridProperties.id 				= 'gvwDisease';
        SBGridProperties.jsonref 			= 'jsonDiseaseList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["구분"], 	        ref: 'DISEASE_TYPE',    	        type:'output',  	width:'120px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDiseaseType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["발생사유"],        ref: 'DISEASE_REASON', 		     type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["사고발생일"],        ref: 'DISEASE_START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["병가신청여부"],        ref: 'SICK_LEAVE_REQUEST_YN', 		     type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["병가일자(유료) 시작일"],        ref: 'SICK_LEAVE_CHARGE_DATE_FR', 		     type:'output',  	width:'130px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["병가일자(유료) 종료일"],        ref: 'SICK_LEAVE_CHARGE_DATE_TO', 		     type:'output',  	width:'130px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["병가일자(무료) 시작일"],        ref: 'SICK_LEAVE_FREE_DATE_FR', 		     type:'output',  	width:'130px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["병가일자(무료) 종료일"],        ref: 'SICK_LEAVE_FREE_DATE_TO', 		     type:'output',  	width:'130px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["단체근로자보험신청여부"],        ref: 'GROUP_INSURE_REQUEST_YN', 		     type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'200px',  	style:'text-align:left'}
        ];

        gvwDisease = _SBGrid.create(SBGridProperties);
        //gvwDisease.bind('beforepagechanged', 'fn_pagingDiseaseList');
    }

    function fn_createGvwPersonnelEvaluationGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwPersonnelEvaluation';
        SBGridProperties.id 				= 'gvwPersonnelEvaluation';
        SBGridProperties.jsonref 			= 'jsonPersonnelEvaluationList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["평가년도"], 	        ref: 'EVAL_YEAR',    	        type:'output',  	width:'70px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy'},
                format : {type:'year', rule:'yyyy', origin:'YYYY'}
            },
            {caption: ["평가차수"],        ref: 'POSITION_CODE', 		     type:'output',  	width:'120px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonEvalPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["성과평가"],        ref: 'EVAL_KPI_GRADE', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["역량평가"],        ref: 'EVAL_KBI_GRADE', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'200px',  	style:'text-align:left'}
        ];

        gvwPersonnelEvaluation = _SBGrid.create(SBGridProperties);
        //gvwPersonnelEvaluation.bind('beforepagechanged', 'fn_pagingPersonnelEvaluationList');
    }

    function fn_createGvwOfficialInjuryGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwOfficialInjury';
        SBGridProperties.id 				= 'gvwOfficialInjury';
        SBGridProperties.jsonref 			= 'jsonOfficialInjuryList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["사고발생일"],        ref: 'OFFICIAL_INJURY_START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["사고내용"], 	        ref: 'OFFICIAL_INJURY_DESCR',    	        type:'output',  	width:'300px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'200px',  	style:'text-align:left'}
        ];

        gvwOfficialInjury = _SBGrid.create(SBGridProperties);
        //gvwOfficialInjury.bind('beforepagechanged', 'fn_pagingOfficialInjuryList');
    }

    function fn_createGvwContractDegGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwContractDeg';
        SBGridProperties.id 				= 'gvwContractDeg';
        SBGridProperties.jsonref 			= 'jsonContractDegList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["계약차수"], 	        ref: 'CONTRACT_DEGREE',    	        type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonContractDegree',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["계약시작일"],        ref: 'CONTRACT_START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["계약종료일"],        ref: 'CONTRACT_END_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["계약기간"],        ref: 'CONTRACT_DAY', 		     type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["계약변경사항"],        ref: 'CONTRACT_CHANGE_MEMO', 		     type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'250px',  	style:'text-align:left'}
        ];

        gvwContractDeg = _SBGrid.create(SBGridProperties);
        //gvwContractDeg.bind('beforepagechanged', 'fn_pagingContractDegList');
    }

    function fn_createGvwWorkPlanGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwWorkPlan';
        SBGridProperties.id 				= 'gvwWorkPlan';
        SBGridProperties.jsonref 			= 'jsonWorkPlanList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["근무계획"], 	        ref: 'WORKPLAN_TYPE',    	        type:'output',  	width:'167px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonWorkplanType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["적용시작일"],        ref: 'START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["적용종료일"],        ref: 'END_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
        ];

        gvwWorkPlan = _SBGrid.create(SBGridProperties);
        //gvwWorkPlan.bind('beforepagechanged', 'fn_pagingWorkPlanList');
    }

    function fn_createGvwEmpGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwEmp';
        SBGridProperties.id 				= 'gvwEmp';
        SBGridProperties.jsonref 			= 'jsonEmpList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: [""], 	        ref: 'CHK_YN',    	        type:'checkbox',  	width:'45px',  	style:'text-align:left', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }}},
            {caption: ["부서코드"],        ref: 'DEPT_CODE', 		     type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서"],  		ref: 'DEPT_NAME',    			type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["사번"],        ref: 'EMP_CODE', 		     type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["이름"],        ref: 'EMP_NAME', 		     type:'output',  	width:'94px',  	style:'text-align:left'},
            {caption: ["입사일"],        ref: 'ENTER_DATE', 		     type:'output',  	width:'95px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'218px',  	style:'text-align:left'},
            {caption: ["시작일자"],        ref: 'START_DATE', 		     type:'output',  	width:'122px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["종료일자"],        ref: 'END_DATE', 		     type:'output',  	width:'108px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["순번"],        ref: 'TXN_ID', 		     type:'output',  	width:'54px',  	style:'text-align:left'},
            {caption: ["사원별적용"],        ref: 'EMP_BASE_FLAG', 		     type:'checkbox',  	width:'82px',  	style:'text-align:left'},
            {caption: ["근무패턴코드"],  		ref: 'WORK_PATTERN_CODE',    			type:'output',  	width:'116px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonWorkPatternCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["퇴사일"],        ref: 'RETIRE_DATE', 		     type:'output',  	width:'106px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["재직구분"],  		ref: 'EMP_STATE',    			type:'output',  	width:'85px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonEmpState',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["직위"],  		ref: 'POSITION_CODE',    			type:'output',  	width:'75px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["직책"],  		ref: 'DUTY_CODE',    			type:'output',  	width:'75px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["직급"],  		ref: 'JOB_RANK',    			type:'output',  	width:'75px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonJobRank',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            }
        ];

        gvwEmp = _SBGrid.create(SBGridProperties);
        //gvwEmp.bind('beforepagechanged', 'fn_pagingEmpList');
    }

    function fn_createGvwExpenditurewelfareGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwExpenditurewelfare';
        SBGridProperties.id 				= 'gvwExpenditurewelfare';
        SBGridProperties.jsonref 			= 'jsonExpenditurewelfareList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= ['seq','update'];
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["경조일자"], 	        ref: 'WELFARE_DATE',    	        type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["신청년월"],        ref: 'REQUEST_YM', 		     type:'output',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm'},
                format : {type:'month', rule:'yyyy-mm', origin:'YYYYMM'}
            },
            {caption: ["경조구분"],        ref: 'WELFARE_CODE', 		     type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["경조사유"],        ref: 'WELFARE_TYPE', 		     type:'output',  	width:'150px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonWelfareType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["가족관계"],  		ref: 'RELATION',    			type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonRelation',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["경조대상자 이름"],        ref: 'NAME', 		     type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["경조금액"],        ref: 'WELFARE_AMOUNT', 		     type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'DESCRIPTION', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwExpenditurewelfare = _SBGrid.create(SBGridProperties);
        //gvwExpenditurewelfare.bind('beforepagechanged', 'fn_pagingExpenditurewelfareList');
    }

    // 행 추가
    const fn_addRowForGvwFamily = function() {
        let rowVal = gvwFamily.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwFamily.addRow(true);
        }else{
            gvwFamily.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwSchool = function() {
        let rowVal = gvwSchool.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwSchool.addRow(true);
        }else{
            gvwSchool.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwCareer = function() {
        let rowVal = gvwCareer.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwCareer.addRow(true);
        }else{
            gvwCareer.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwLicense = function() {
        let rowVal = gvwLicense.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwLicense.addRow(true);
        }else{
            gvwLicense.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwLanguage = function() {
        let rowVal = gvwLanguage.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwLanguage.addRow(true);
        }else{
            gvwLanguage.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwComputerSkill = function() {
        let rowVal = gvwComputerSkill.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwComputerSkill.addRow(true);
        }else{
            gvwComputerSkill.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwFile = function() {
        let rowVal = gvwFile.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwFile.addRow(true);
        }else{
            gvwFile.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwEducation = function() {
        let rowVal = gvwEducation.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwEducation.addRow(true);
        }else{
            gvwEducation.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwPrize = function() {
        let rowVal = gvwPrize.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwPrize.addRow(true);
        }else{
            gvwPrize.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwHealth = function() {
        let rowVal = gvwHealth.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwHealth.addRow(true);
        }else{
            gvwHealth.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwAppointment = function() {
        let rowVal = gvwAppointment.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwAppointment.addRow(true);
        }else{
            gvwAppointment.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwAddJob = function() {
        let rowVal = gvwAddJob.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwAddJob.addRow(true);
        }else{
            gvwAddJob.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwTimeOffHistory = function() {
        let rowVal = gvwTimeOffHistory.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwTimeOffHistory.addRow(true);
        }else{
            gvwTimeOffHistory.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwGroupInsurance = function() {
        let rowVal = gvwGroupInsurance.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwGroupInsurance.addRow(true);
        }else{
            gvwGroupInsurance.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwDisease = function() {
        let rowVal = gvwDisease.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwDisease.addRow(true);
        }else{
            gvwDisease.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwPersonnelEvaluation = function() {
        let rowVal = gvwPersonnelEvaluation.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwPersonnelEvaluation.addRow(true);
        }else{
            gvwPersonnelEvaluation.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwOfficialInjury = function() {
        let rowVal = gvwOfficialInjury.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwOfficialInjury.addRow(true);
        }else{
            gvwOfficialInjury.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwContractDeg = function() {
        let rowVal = gvwContractDeg.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwContractDeg.addRow(true);
        }else{
            gvwContractDeg.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwWorkPlan = function() {
        let rowVal = gvwWorkPlan.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwWorkPlan.addRow(true);
        }else{
            gvwWorkPlan.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwEmp = function() {
        let rowVal = gvwEmp.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwEmp.addRow(true);
        }else{
            gvwEmp.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwExpenditurewelfare = function() {
        let rowVal = gvwExpenditurewelfare.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwExpenditurewelfare.addRow(true);
        }else{
            gvwExpenditurewelfare.insertRow(rowVal);
        }
    }

    //선택된 행 삭제
    const fn_deleteRowForGvwFamily = function() {
        let rowVal = gvwFamily.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwFamily.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwSchool = function() {
        let rowVal = gvwSchool.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwSchool.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwCareer = function() {
        let rowVal = gvwCareer.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwCareer.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwLicense = function() {
        let rowVal = gvwLicense.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwLicense.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwLanguage = function() {
        let rowVal = gvwLanguage.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwLanguage.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwComputerSkill = function() {
        let rowVal = gvwComputerSkill.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwComputerSkill.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwFile = function() {
        let rowVal = gvwFile.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwFile.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwEducation = function() {
        let rowVal = gvwEducation.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwEducation.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwPrize = function() {
        let rowVal = gvwPrize.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwPrize.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwHealth = function() {
        let rowVal = gvwHealth.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwHealth.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwAppointment = function() {
        let rowVal = gvwAppointment.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwAppointment.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwAddJob = function() {
        let rowVal = gvwAddJob.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwAddJob.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwTimeOffHistory = function() {
        let rowVal = gvwTimeOffHistory.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwTimeOffHistory.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwGroupInsurance = function() {
        let rowVal = gvwGroupInsurance.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwGroupInsurance.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwDisease = function() {
        let rowVal = gvwDisease.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwDisease.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwPersonnelEvaluation = function() {
        let rowVal = gvwPersonnelEvaluation.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwPersonnelEvaluation.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwOfficialInjury = function() {
        let rowVal = gvwOfficialInjury.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwOfficialInjury.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwContractDeg = function() {
        let rowVal = gvwContractDeg.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwContractDeg.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwWorkPlan = function() {
        let rowVal = gvwWorkPlan.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwWorkPlan.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwEmp = function() {
        let rowVal = gvwEmp.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwEmp.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForGvwExpenditurewelfare = function() {
        let rowVal = gvwExpenditurewelfare.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwExpenditurewelfare.deleteRow(rowVal);
        }
    }

    const getParamForHri1000S1 = async function() {
        let WORK_TYPE = gfnma_nvl(SBUxMethod.get("WORK_TYPE"));
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE"));
        let BLOOD_TYPE_RH = gfnma_nvl(SBUxMethod.get("BLOOD_TYPE_RH"));
        let BLOOD_TYPE_ABO = gfnma_nvl(SBUxMethod.get("BLOOD_TYPE_ABO"));
        let HEIGHT = gfnma_nvl(SBUxMethod.get("HEIGHT"));
        let WEIGHT = gfnma_nvl(SBUxMethod.get("WEIGHT"));
        let LEFT_EYE = gfnma_nvl(SBUxMethod.get("LEFT_EYE"));
        let RIGHT_EYE = gfnma_nvl(SBUxMethod.get("RIGHT_EYE"));
        let COLOR_BLIND_YN = gfnma_nvl(SBUxMethod.get("COLOR_BLIND_YN"));
        let JACKET_SIZE = gfnma_nvl(SBUxMethod.get("JACKET_SIZE"));
        let PANTS_SIZE = gfnma_nvl(SBUxMethod.get("PANTS_SIZE"));
        let SHOE_SIZE = gfnma_nvl(SBUxMethod.get("SHOE_SIZE"));
        let MARRIAGE_YN = gfnma_nvl(SBUxMethod.get("MARRIAGE_YN"));
        let MARRIAGE_DATE = gfnma_nvl(SBUxMethod.get("MARRIAGE_DATE"));
        let HOBBY = gfnma_nvl(SBUxMethod.get("HOBBY"));
        let SPECIAL_ABILITY = gfnma_nvl(SBUxMethod.get("SPECIAL_ABILITY"));
        let RELIGION_CODE = gfnma_nvl(SBUxMethod.get("RELIGION_CODE"));
        let HOUSE_OWN_YN = gfnma_nvl(SBUxMethod.get("HOUSE_OWN_YN"));
        let HOUSE_TYPE = gfnma_nvl(SBUxMethod.get("HOUSE_TYPE"));
        let HOUSE_KIND = gfnma_nvl(SBUxMethod.get("HOUSE_KIND"));
        let CAR_OWN_YN = gfnma_nvl(SBUxMethod.get("CAR_OWN_YN"));
        let CAR_KIND = gfnma_nvl(SBUxMethod.get("CAR_KIND"));
        let CAR_NUM = gfnma_nvl(SBUxMethod.get("CAR_NUM"));
        let ARMY_TYPE = gfnma_nvl(SBUxMethod.get("ARMY_TYPE"));
        let ARMY_INDUSTRY_YN = gfnma_nvl(SBUxMethod.get("ARMY_INDUSTRY_YN"));
        let ARMY_KIND = gfnma_nvl(SBUxMethod.get("ARMY_KIND"));
        let ARMY_PART = gfnma_nvl(SBUxMethod.get("ARMY_PART"));
        let ARMY_GRADE = gfnma_nvl(SBUxMethod.get("ARMY_GRADE"));
        let ARMY_DISCHARGE_TYPE = gfnma_nvl(SBUxMethod.get("ARMY_DISCHARGE_TYPE"));
        let ARMY_START_DATE = gfnma_nvl(SBUxMethod.get("ARMY_START_DATE"));
        let ARMY_END_DATE = gfnma_nvl(SBUxMethod.get("ARMY_END_DATE"));
        let ARMY_DESCR = gfnma_nvl(SBUxMethod.get("ARMY_DESCR"));
        let ARMY_EXEMPTION_DESCR = gfnma_nvl(SBUxMethod.get("ARMY_EXEMPTION_DESCR"));
        let GUARANTEE_TYPE = gfnma_nvl(SBUxMethod.get("GUARANTEE_TYPE"));
        let INSURE_COMP_NAME = gfnma_nvl(SBUxMethod.get("INSURE_COMP_NAME"));
        let INSURE_NAME = gfnma_nvl(SBUxMethod.get("INSURE_NAME"));
        let INSURE_AMOUNT = gfnma_nvl(SBUxMethod.get("INSURE_AMOUNT"));
        let INSURE_NUM = gfnma_nvl(SBUxMethod.get("INSURE_NUM"));
        let INSURE_VALUE = gfnma_nvl(SBUxMethod.get("INSURE_VALUE"));
        let INSURE_START_DATE = gfnma_nvl(SBUxMethod.get("INSURE_START_DATE"));
        let INSURE_END_DATE = gfnma_nvl(SBUxMethod.get("INSURE_END_DATE"));
        let GUARANTOR1_NAME = gfnma_nvl(SBUxMethod.get("GUARANTOR1_NAME"));
        let GUARANTOR1_SOCIAL_NO = gfnma_nvl(SBUxMethod.get("GUARANTOR1_SOCIAL_NO"));
        let GUARANTOR1_RELATION = gfnma_nvl(SBUxMethod.get("GUARANTOR1_RELATION"));
        let GUARANTOR1_COMP_NAME = gfnma_nvl(SBUxMethod.get("GUARANTOR1_COMP_NAME"));
        let GUARANTOR1_POSITION = gfnma_nvl(SBUxMethod.get("GUARANTOR1_POSITION"));
        let GUARANTOR1_ZIP_CODE = gfnma_nvl(SBUxMethod.get("GUARANTOR1_ZIP_CODE"));
        let GUARANTOR1_ADDRESS = gfnma_nvl(SBUxMethod.get("GUARANTOR1_ADDRESS"));
        let GUARANTOR1_START_DATE = gfnma_nvl(SBUxMethod.get("GUARANTOR1_START_DATE"));
        let GUARANTOR1_END_DATE = gfnma_nvl(SBUxMethod.get("GUARANTOR1_END_DATE"));
        let GUARANTOR2_NAME = gfnma_nvl(SBUxMethod.get("GUARANTOR2_NAME"));
        let GUARANTOR2_SOCIAL_NO = gfnma_nvl(SBUxMethod.get("GUARANTOR2_SOCIAL_NO"));
        let GUARANTOR2_RELATION = gfnma_nvl(SBUxMethod.get("GUARANTOR2_RELATION"));
        let GUARANTOR2_COMP_NAME = gfnma_nvl(SBUxMethod.get("GUARANTOR2_COMP_NAME"));
        let GUARANTOR2_POSITION = gfnma_nvl(SBUxMethod.get("GUARANTOR2_POSITION"));
        let GUARANTOR2_ZIP_CODE = gfnma_nvl(SBUxMethod.get("GUARANTOR2_ZIP_CODE"));
        let GUARANTOR2_ADDRESS = gfnma_nvl(SBUxMethod.get("GUARANTOR2_ADDRESS"));
        let GUARANTOR2_START_DATE = gfnma_nvl(SBUxMethod.get("GUARANTOR2_START_DATE"));
        let GUARANTOR2_END_DATE = gfnma_nvl(SBUxMethod.get("GUARANTOR2_END_DATE"));
        let VETERANS_YN = gfnma_nvl(SBUxMethod.get("VETERANS_YN"));
        let VETERANS_GRADE = gfnma_nvl(SBUxMethod.get("VETERANS_GRADE"));
        let VETERANS_MEMO = gfnma_nvl(SBUxMethod.get("VETERANS_MEMO"));
        let VETERANS_RELATION = gfnma_nvl(SBUxMethod.get("VETERANS_RELATION"));
        let VETERANS_NUM = gfnma_nvl(SBUxMethod.get("VETERANS_NUM"));
        let VETERANS_ORDER_YN = gfnma_nvl(SBUxMethod.get("VETERANS_ORDER_YN"));
        let VETERANS_ORDER_DATE = gfnma_nvl(SBUxMethod.get("VETERANS_ORDER_DATE"));
        let PASSPORT_NUM = gfnma_nvl(SBUxMethod.get("PASSPORT_NUM"));
        let PASSPORT_ISSUE_DATE = gfnma_nvl(SBUxMethod.get("PASSPORT_ISSUE_DATE"));
        let PASSPORT_EXPIRE_DATE = gfnma_nvl(SBUxMethod.get("PASSPORT_EXPIRE_DATE"));
        let VISA_NUM = gfnma_nvl(SBUxMethod.get("VISA_NUM"));
        let VISA_ISSUE_DATE = gfnma_nvl(SBUxMethod.get("VISA_ISSUE_DATE"));
        let VISA_EXPIRE_DATE = gfnma_nvl(SBUxMethod.get("VISA_EXPIRE_DATE"));
        let HANDICAP_TYPE = gfnma_nvl(SBUxMethod.get("HANDICAP_TYPE"));
        let HANDICAP_GRADE = gfnma_nvl(SBUxMethod.get("HANDICAP_GRADE"));
        let HANDICAP_ISSUE_DATE = gfnma_nvl(SBUxMethod.get("HANDICAP_ISSUE_DATE"));
        let HANDICAP_REASON = gfnma_nvl(SBUxMethod.get("HANDICAP_REASON"));

        return {
            V_P_WORK_TYPE : WORK_TYPE,
            V_P_DEBUG_MODE_YN : 'N',
            V_P_LANG_ID	: 'KOR',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_EMP_CODE : EMP_CODE,
            V_P_BLOOD_TYPE_RH : BLOOD_TYPE_RH,
            V_P_BLOOD_TYPE_ABO : BLOOD_TYPE_ABO,
            V_P_HEIGHT : HEIGHT,
            V_P_WEIGHT : WEIGHT,
            V_P_LEFT_EYE : LEFT_EYE,
            V_P_RIGHT_EYE : RIGHT_EYE,
            V_P_COLOR_BLIND_YN : COLOR_BLIND_YN,
            V_P_JACKET_SIZE : JACKET_SIZE,
            V_P_PANTS_SIZE : PANTS_SIZE,
            V_P_SHOE_SIZE : SHOE_SIZE,
            V_P_MARRIAGE_YN : MARRIAGE_YN,
            V_P_MARRIAGE_DATE : MARRIAGE_DATE,
            V_P_HOBBY : HOBBY,
            V_P_SPECIAL_ABILITY : SPECIAL_ABILITY,
            V_P_RELIGION_CODE : RELIGION_CODE,
            V_P_HOUSE_OWN_YN : HOUSE_OWN_YN,
            V_P_HOUSE_TYPE : HOUSE_TYPE,
            V_P_HOUSE_KIND : HOUSE_KIND,
            V_P_CAR_OWN_YN : CAR_OWN_YN,
            V_P_CAR_KIND : CAR_KIND,
            V_P_CAR_NUM : CAR_NUM,
            V_P_ARMY_TYPE : ARMY_TYPE,
            V_P_ARMY_INDUSTRY_YN : ARMY_INDUSTRY_YN,
            V_P_ARMY_KIND : ARMY_KIND,
            V_P_ARMY_PART : ARMY_PART,
            V_P_ARMY_GRADE : ARMY_GRADE,
            V_P_ARMY_DISCHARGE_TYPE : ARMY_DISCHARGE_TYPE,
            V_P_ARMY_START_DATE : ARMY_START_DATE,
            V_P_ARMY_END_DATE : ARMY_END_DATE,
            V_P_ARMY_DESCR : ARMY_DESCR,
            V_P_ARMY_EXEMPTION_DESCR : ARMY_EXEMPTION_DESCR,
            V_P_GUARANTEE_TYPE : GUARANTEE_TYPE,
            V_P_INSURE_COMP_NAME : INSURE_COMP_NAME,
            V_P_INSURE_NAME : INSURE_NAME,
            V_P_INSURE_AMOUNT : INSURE_AMOUNT,
            V_P_INSURE_NUM : INSURE_NUM,
            V_P_INSURE_VALUE : INSURE_VALUE,
            V_P_INSURE_START_DATE : INSURE_START_DATE,
            V_P_INSURE_END_DATE : INSURE_END_DATE,
            V_P_GUARANTOR1_NAME : GUARANTOR1_NAME,
            V_P_GUARANTOR1_SOCIAL_NO : GUARANTOR1_SOCIAL_NO,
            V_P_GUARANTOR1_RELATION : GUARANTOR1_RELATION,
            V_P_GUARANTOR1_COMP_NAME : GUARANTOR1_COMP_NAME,
            V_P_GUARANTOR1_POSITION : GUARANTOR1_POSITION,
            V_P_GUARANTOR1_ZIP_CODE : GUARANTOR1_ZIP_CODE,
            V_P_GUARANTOR1_ADDRESS : GUARANTOR1_ADDRESS,
            V_P_GUARANTOR1_START_DATE : GUARANTOR1_START_DATE,
            V_P_GUARANTOR1_END_DATE : GUARANTOR1_END_DATE,
            V_P_GUARANTOR2_NAME : GUARANTOR2_NAME,
            V_P_GUARANTOR2_SOCIAL_NO : GUARANTOR2_SOCIAL_NO,
            V_P_GUARANTOR2_RELATION : GUARANTOR2_RELATION,
            V_P_GUARANTOR2_COMP_NAME : GUARANTOR2_COMP_NAME,
            V_P_GUARANTOR2_POSITION : GUARANTOR2_POSITION,
            V_P_GUARANTOR2_ZIP_CODE : GUARANTOR2_ZIP_CODE,
            V_P_GUARANTOR2_ADDRESS : GUARANTOR2_ADDRESS,
            V_P_GUARANTOR2_START_DATE : GUARANTOR2_START_DATE,
            V_P_GUARANTOR2_END_DATE : GUARANTOR2_END_DATE,
            V_P_VETERANS_YN : VETERANS_YN,
            V_P_VETERANS_GRADE : VETERANS_GRADE,
            V_P_VETERANS_MEMO : VETERANS_MEMO,
            V_P_VETERANS_RELATION : VETERANS_RELATION,
            V_P_VETERANS_NUM : VETERANS_NUM,
            V_P_VETERANS_ORDER_YN : VETERANS_ORDER_YN,
            V_P_VETERANS_ORDER_DATE : VETERANS_ORDER_DATE,
            V_P_PASSPORT_NUM : PASSPORT_NUM,
            V_P_PASSPORT_ISSUE_DATE : PASSPORT_ISSUE_DATE,
            V_P_PASSPORT_EXPIRE_DATE : PASSPORT_EXPIRE_DATE,
            V_P_VISA_NUM : VISA_NUM,
            V_P_VISA_ISSUE_DATE : VISA_ISSUE_DATE,
            V_P_VISA_EXPIRE_DATE : VISA_EXPIRE_DATE,
            V_P_HANDICAP_TYPE : HANDICAP_TYPE,
            V_P_HANDICAP_GRADE : HANDICAP_GRADE,
            V_P_HANDICAP_ISSUE_DATE : HANDICAP_ISSUE_DATE,
            V_P_HANDICAP_REASON : HANDICAP_REASON,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        }
    }

    const getParamForHri1000S2 = async function() {
        let updatedData = gvwFile.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_FILE_NAME : item.FILE_NAME,
                V_P_FILE_SERVER_PATH : item.FILE_SERVER_PATH,
                V_P_FILE_TYPE : item.FILE_TYPE,
                V_P_CREATE_USER : item.CREATE_USER,
                V_P_MEMO : item.MEMO,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S3 = async function() {
        // TODO: 사원사진, 서명사진 프로세스 확인
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE"));
        let EMP_PHOTO = gfnma_nvl(SBUxMethod.get("EMP_PHOTO"));
        let SIGN_IMG = gfnma_nvl(SBUxMethod.get("SIGN_IMG"));
        return {
            V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
            V_P_DEBUG_MODE_YN : 'N',
            V_P_LANG_ID	: 'KOR',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_PHOTO : EMP_PHOTO, // blob
            V_P_SIGN_IMG : SIGN_IMG, // blob
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        };
    }

    const getParamForHri1000S4 = async function() {
        let updatedData = gvwFamily.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_NAME : item.NAME,
                V_P_RELATION : item.RELATION,
                V_P_SOCIAL_NO : item.SOCIAL_NO,
                V_P_BIRTHDAY : item.BIRTHDAY,
                V_P_BIRTHDAY_TYPE : item.BIRTHDAY_TYPE,
                V_P_LEAP_MONTH_YN : item.LEAP_MONTH_YN,
                V_P_SCHOOL_TYPE : item.SCHOOL_TYPE,
                V_P_SUPPORT_YN : item.SUPPORT_YN,
                V_P_WH_TAX_YN : item.WH_TAX_YN,
                V_P_YEARTAX_YN : item.YEARTAX_YN,
                V_P_YEARTAX_RELATION : item.YEARTAX_RELATION,
                V_P_FOREIGNER_YN : item.FOREIGNER_YN,
                V_P_HANDICAP_YN : item.HANDICAP_YN,
                V_P_LIVE_TOGETHER_YN : item.LIVE_TOGETHER_YN,
                V_P_HEALTH_INSURE_YN : item.HEALTH_INSURE_YN,
                V_P_LIFE_YN : item.LIFE_YN,
                V_P_ZIP_CODE : item.ZIP_CODE,
                V_P_ADDRESS : item.ADDRESS,
                V_P_JOB : item.JOB,
                V_P_TEL : item.TEL,
                V_P_MEMO : item.MEMO,
                V_P_SOCIAL_NUM_DATE : item.SOCIAL_NUM_DATE,
                V_P_START_DATE : item.START_DATE,
                V_P_END_DATE : item.END_DATE,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S5 = async function() {
        let updatedData = gvwSchool.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_SCHOOL_TYPE : item.SCHOOL_TYPE,
                V_P_MANAGE_CODE : item.MANAGE_CODE,
                V_P_SCHOOL_NAME : item.SCHOOL_NAME,
                V_P_CAMPUS_BRANCH_TYPE : item.CAMPUS_BRANCH_TYPE,
                V_P_DAY_NIGHT_TYPE : item.DAY_NIGHT_TYPE,
                V_P_MAJOR : item.MAJOR,
                V_P_GRADUATE_TYPE : item.GRADUATE_TYPE,
                V_P_LAST_SCHOOL_YN : item.LAST_SCHOOL_YN,
                V_P_COMPLE_POINT : item.COMPLE_POINT,
                V_P_GPA_POINT : item.GPA_POINT,
                V_P_INTO_DATE : item.INTO_DATE,
                V_P_GRADUATE_DATE : item.GRADUATE_DATE,
                V_P_AFTER_ENTER_YN : item.AFTER_ENTER_YN,
                V_P_MEMO : item.MEMO,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S6 = async function() {
        let updatedData = gvwLicense.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_LICENSE_CODE : item.LICENSE_CODE,
                V_P_LICENSE_GRADE : item.LICENSE_GRADE,
                V_P_LICENSE_NUM : item.LICENSE_NUM,
                V_P_LICENSE_NAME : item.LICENSE_NAME,
                V_P_ISSUE_INSTITUTE : item.ISSUE_INSTITUTE,
                V_P_ISSUE_DATE : item.ISSUE_DATE,
                V_P_RENEW_DATE : item.RENEW_DATE,
                V_P_LICENSE_WAGES_AMT : item.LICENSE_WAGES_AMT,
                V_P_APPOINT_YN : item.APPOINT_YN,
                V_P_APPOINT_DEPT_CODE : item.APPOINT_DEPT_CODE,
                V_P_APPOINT_START_DATE : item.APPOINT_START_DATE,
                V_P_APPOINT_END_DATE : item.APPOINT_END_DATE,
                V_P_MEMO : item.MEMO,
                V_P_LICENSE_CATEGORY : item.LICENSE_CATEGORY,
                V_P_PAY_YN : item.PAY_YN,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S7 = async function() {
        let updatedData = gvwCareer.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_CAREER_TYPE : item.CAREER_TYPE,
                V_P_START_DATE : item.START_DATE,
                V_P_END_DATE : item.END_DATE,
                V_P_CAREER_YEAR : item.CAREER_YEAR,
                V_P_CAREER_MONTH : item.CAREER_MONTH,
                V_P_COMP_NAME : item.COMP_NAME,
                V_P_DEPT_NAME : item.DEPT_NAME,
                V_P_POSITION : item.POSITION,
                V_P_JOB : item.JOB,
                V_P_WORK : item.WORK,
                V_P_REGION_CODE : item.REGION_CODE,
                V_P_RETIRE_MEMO : item.RETIRE_MEMO,
                V_P_SALARY_LEVEL : item.SALARY_LEVEL,
                V_P_MEMO : item.MEMO,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S8 = async function() {
        let updatedData = gvwLanguage.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_TEST_TYPE : item.TEST_TYPE,
                V_P_TEST_DATE : item.TEST_DATE,
                V_P_AVAILABLE_DATE : item.AVAILABLE_DATE,
                V_P_ISSUE_INSTITUTION : item.ISSUE_INSTITUTION,
                V_P_TOTAL_SCORE : item.TOTAL_SCORE,
                V_P_SCORE1 : item.SCORE1,
                V_P_SCORE2 : item.SCORE2,
                V_P_SCORE3 : item.SCORE3,
                V_P_SCORE4 : item.SCORE4,
                V_P_TEST_LEVEL : item.TEST_LEVEL,
                V_P_MEMO : item.MEMO,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S9 = async function() {
        let updatedData = gvwEducation.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_EDU_NAME : item.EDU_NAME,
                V_P_FOREIGN_YN : item.FOREIGN_YN,
                V_P_EDU_METHOD : item.EDU_METHOD,
                V_P_EDU_INSTITUTE : item.EDU_INSTITUTE,
                V_P_EDU_TYPE : item.EDU_TYPE,
                V_P_EDU_START_DATE : item.EDU_START_DATE,
                V_P_EDU_END_DATE : item.EDU_END_DATE,
                V_P_EDU_SCORE : item.EDU_SCORE,
                V_P_EDU_TOTAL_EXPENSE : item.EDU_TOTAL_EXPENSE,
                V_P_RETURN_EXPENSE : item.RETURN_EXPENSE,
                V_P_PAYMENT_EXPENSE : item.PAYMENT_EXPENSE,
                V_P_EDU_PASS_YN : item.EDU_PASS_YN,
                V_P_MEMO : item.MEMO,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S10 = async function() {
        let updatedData = gvwPrize.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_PRIZE_TYPE : item.PRIZE_TYPE,
                V_P_PRIZE_CATEGORY : item.PRIZE_CATEGORY,
                V_P_PRIZE_DATE : item.PRIZE_DATE,
                V_P_PRIZE_INOUT_TYPE : item.PRIZE_INOUT_TYPE,
                V_P_PRIZE_TARGET : item.PRIZE_TARGET,
                V_P_PRIZE_NAME : item.PRIZE_NAME,
                V_P_PRIZE_REASON : item.PRIZE_REASON,
                V_P_PRIZE_DETAIL : item.PRIZE_DETAIL,
                V_P_PRIZE_MAKER : item.PRIZE_MAKER,
                V_P_PUNISH_START_DATE : item.PUNISH_START_DATE,
                V_P_PUNISH_END_DATE : item.PUNISH_END_DATE,
                V_P_APPLY_PAY_YN : item.APPLY_PAY_YN,
                V_P_BASE_PAY_DOWN_RATE : item.BASE_PAY_DOWN_RATE,
                V_P_BONUS_PAY_DOWN_RATE : item.BONUS_PAY_DOWN_RATE,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S11 = async function() {
        let updatedData = gvwHealth.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_CHECK_TYPE : item.CHECK_TYPE,
                V_P_CHECK_DATE : item.CHECK_DATE,
                V_P_CHECK_INSTITUTE : item.CHECK_INSTITUTE,
                V_P_RESULT : item.RESULT,
                V_P_COMPANY_RESULT : item.COMPANY_RESULT,
                V_P_MEMO : item.MEMO,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S12 = async function() {
        let updatedData = gvwAppointment.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_APPOINT_NUM : item.APPOINT_NUM,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_DEPT_NAME2 : item.DEPT_NAME2,
                V_P_POSITION_NAME2 : item.POSITION_NAME2,
                V_P_DUTY_NAME2 : item.DUTY_NAME2,
                V_P_JOB_RANK_NAME2 : item.JOB_RANK_NAME2,
                V_P_JOB_FAMILY_NAME2 : item.JOB_FAMILY_NAME2,
                V_P_JOB_NAME2 : item.JOB_NAME2,
                V_P_REGION_NAME2 : item.REGION_NAME2,
                V_P_APPOINT_REASON : item.APPOINT_REASON,
                V_P_MEMO : item.MEMO,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S13 = async function() {
        let updatedData = gvwTimeOffHistory.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_TIME_OFF_TYPE : item.TIME_OFF_TYPE,
                V_P_START_DATE : item.START_DATE,
                V_P_END_DATE : item.END_DATE,
                V_P_TIME_OFF_CNT : item.TIME_OFF_CNT,
                V_P_SITE_CODE : item.SITE_CODE,
                V_P_DEPT_CODE : item.DEPT_CODE,
                V_P_MEMO : item.MEMO,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S14 = async function() {
        let updatedData = gvwComputerSkill.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_OA_NAME : item.OA_NAME,
                V_P_OA_SKILL_LEVEL : item.OA_SKILL_LEVEL,
                V_P_MEMO : item.MEMO,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S15 = async function() {
        let updatedData = gvwGroupInsurance.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_GROUP_INSURE_CODE : item.GROUP_INSURE_CODE,
                V_P_INSURE_NUM : item.INSURE_NUM,
                V_P_INSURE_START_DATE : item.INSURE_START_DATE,
                V_P_INSURE_DUE_DATE : item.INSURE_DUE_DATE,
                V_P_INSURE_END_DATE : item.INSURE_END_DATE,
                V_P_GROUP_INSURE_AMT : item.GROUP_INSURE_AMT,
                V_P_MEMO : item.MEMO,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S16 = async function() {
        let updatedData = gvwDisease.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_DISEASE_TYPE : item.DISEASE_TYPE,
                V_P_DISEASE_REASON : item.DISEASE_REASON,
                V_P_DISEASE_START_DATE : item.DISEASE_START_DATE,
                V_P_SICK_LEAVE_REQUEST_YN : item.SICK_LEAVE_REQUEST_YN,
                V_P_SICK_LEAVE_CHARGE_DATE_FR : item.SICK_LEAVE_CHARGE_DATE_FR,
                V_P_SICK_LEAVE_CHARGE_DATE_TO : item.SICK_LEAVE_CHARGE_DATE_TO,
                V_P_SICK_LEAVE_FREE_DATE_FR : item.SICK_LEAVE_FREE_DATE_FR,
                V_P_SICK_LEAVE_FREE_DATE_TO : item.SICK_LEAVE_FREE_DATE_TO,
                V_P_GROUP_INSURE_REQUEST_YN : item.GROUP_INSURE_REQUEST_YN,
                V_P_MEMO : item.MEMO,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S17 = async function() {
        let updatedData = gvwPersonnelEvaluation.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_EVAL_YEAR : item.EVAL_YEAR,
                V_P_POSITION_CODE : item.POSITION_CODE,
                V_P_EVAL_KPI_GRADE : item.EVAL_KPI_GRADE,
                V_P_EVAL_KBI_GRADE : item.EVAL_KBI_GRADE,
                V_P_MEMO : item.MEMO,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S18 = async function() {
        let updatedData = gvwOfficialInjury.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_OFFICIAL_INJURY_START_DATE : item.OFFICIAL_INJURY_START_DATE,
                V_P_OFFICIAL_INJURY_DESCR : item.OFFICIAL_INJURY_DESCR,
                V_P_MEMO : item.MEMO,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S19 = async function() {
        let updatedData = gvwContractDeg.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_CONTRACT_DEGREE : item.CONTRACT_DEGREE,
                V_P_CONTRACT_START_DATE : item.CONTRACT_START_DATE,
                V_P_CONTRACT_END_DATE : item.CONTRACT_END_DATE,
                V_P_CONTRACT_CHANGE_MEMO : item.CONTRACT_CHANGE_MEMO,
                V_P_MEMO : item.MEMO,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    // TODO : P_Hri1000_S20 확인필요

    const getParamForHri1000S21 = async function() {
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE"));
        let RESIDENCE_ZIP_CODE = gfnma_nvl(SBUxMethod.get("RESIDENCE_ZIP_CODE"));
        let RESIDENCE_ADDRESS = gfnma_nvl(SBUxMethod.get("RESIDENCE_ADDRESS"));
        let FAMILY_REGISTER_ZIP_CODE = gfnma_nvl(SBUxMethod.get("FAMILY_REGISTER_ZIP_CODE"));
        let FAMILY_REGISTER_ADDRESS = gfnma_nvl(SBUxMethod.get("FAMILY_REGISTER_ADDRESS"));
        let EMERGENCY_ZIP_CODE = gfnma_nvl(SBUxMethod.get("EMERGENCY_ZIP_CODE"));
        let EMERGENCY_ADDRESS = gfnma_nvl(SBUxMethod.get("EMERGENCY_ADDRESS"));
        let HOME_TEL_NUM = gfnma_nvl(SBUxMethod.get("HOME_TEL_NUM"));
        let OFFICE_TEL_NUM = gfnma_nvl(SBUxMethod.get("OFFICE_TEL_NUM"));
        let CELLPHONE_NUM = gfnma_nvl(SBUxMethod.get("CELLPHONE_NUM"));

        return {
            V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
            V_P_DEBUG_MODE_YN : 'N',
            V_P_LANG_ID	: 'KOR',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_EMP_CODE : EMP_CODE,
            V_P_RESIDENCE_ZIP_CODE : RESIDENCE_ZIP_CODE,
            V_P_RESIDENCE_ADDRESS : RESIDENCE_ADDRESS,
            V_P_FAMILY_REGISTER_ZIP_CODE : FAMILY_REGISTER_ZIP_CODE,
            V_P_FAMILY_REGISTER_ADDRESS : FAMILY_REGISTER_ADDRESS,
            V_P_EMERGENCY_ZIP_CODE : EMERGENCY_ZIP_CODE,
            V_P_EMERGENCY_ADDRESS : EMERGENCY_ADDRESS,
            V_P_HOME_TEL_NUM : HOME_TEL_NUM,
            V_P_OFFICE_TEL_NUM : OFFICE_TEL_NUM,
            V_P_CELLPHONE_NUM : CELLPHONE_NUM,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        };
    }

    const getParamForHri1000S22 = async function() {
        let updatedData = gvwWorkPlan.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_WORKPLAN_TYPE : item.WORKPLAN_TYPE,
                V_P_START_DATE : item.START_DATE,
                V_P_END_DATE : item.END_DATE,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }

    const getParamForHri1000S23 = async function() {
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE"));
        let AGREE_YN = gfnma_nvl(SBUxMethod.get("AGREE_YN"));
        let AGREE_DATE = gfnma_nvl(SBUxMethod.get("AGREE_DATE"));
        return {
            V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
            V_P_DEBUG_MODE_YN : 'N',
            V_P_LANG_ID	: 'KOR',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_EMP_CODE : EMP_CODE,
            V_P_AGREE_YN : AGREE_YN,
            V_P_AGREE_DATE : AGREE_DATE,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        };
    }

    const getParamForHri1000S24 = async function() {
        let updatedData = gvwExpenditurewelfare.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                V_P_WORK_TYPE : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                V_P_DEBUG_MODE_YN : 'N',
                V_P_LANG_ID	: 'KOR',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_EMP_CODE : item.EMP_CODE,
                V_P_SEQ : item.SEQ,
                V_P_NAME : item.NAME,
                V_P_RELATION : item.RELATION,
                V_P_WELFARE_CODE : item.WELFARE_CODE,
                V_P_WELFARE_TYPE : item.WELFARE_TYPE,
                V_P_WELFARE_DATE : item.WELFARE_DATE,
                V_P_WELFARE_AMOUNT : item.WELFARE_AMOUNT,
                V_P_DESCRIPTION : item.DESCRIPTION,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            }
            returnData.push(param);
        });

        return returnData;
    }
</script>