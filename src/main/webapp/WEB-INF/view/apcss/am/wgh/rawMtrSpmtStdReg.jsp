<%
  /**
   * @Class Name : rawMtrSpmtStdReg.jsp
   * @Description : 원물입고등록 - 출하등록 화면
   * @author SI개발부
   * @since 2025.04.25
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일       	수정자      	수정내용
   * @ ----------	----------	---------------------------
   * @ 2025.04.25   	김은총			최초 생성
   * @see
   *
   */
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>title : 출하등록</title>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-body">
      <table id="rawMtrPckgTable" class="table table-bordered tbl_fixed">
        <caption>출하 등록 조건 설정</caption>
        <colgroup>
          <col style="width: 11%">
          <col style="width: 22%">
          <col style="width: 11%">
          <col style="width: 22%">
          <col style="width: 11%">
          <col style="width: 22%">
        </colgroup>
        <tbody>
        <tr>
          <th scope="row" class="th_bg">출하일자</th>
          <td class="td_input" style="border-right: hidden;">
            <div class="displayFlex">
              <sbux-datepicker uitype="popup" id="srch-dtp-spmtYmd" name="srch-dtp-spmtYmd" date-format="yyyy-mm-dd" class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"></sbux-datepicker>
            </div>
          </td>
          <th scope="row" class="th_bg">거래처</th>
          <td class="td_input" style="border-right: hidden">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-cnptCd"
                      name="srch-slt-cnptCd"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      jsondata-ref=""
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">배송처</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-input
                      style="flex-grow: 1"
                      uitype="text"
                      id="srch-inp-dlvrPl"
                      name="srch-inp-dlvrPl"
                      class="form-control input-sm"
                      autocomplete="off"
              ></sbux-input>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">차량번호</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      style="flex:0 40%"
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-vhRNo"
                      name="srch-slt-vhRNo"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
                      onchange="">
              </sbux-select>
              <sbux-input
                      style="flex:0 30%"
                      uitype="text"
                      id="srch-inp-vhRNo"
                      name="srch-inp-vhRNo"
                      class="form-control input-sm"
                      autocomplete="off"
              ></sbux-input>
            </div>
          </td>
          <th scope="row" class="th_bg">운송사</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-trsprtCoCd"
                      name="srch-slt-trsprtCoCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">운임비용</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-input
                      style="flex-grow:1"
                      uitype="text"
                      id="srch-inp-fareCst"
                      name="srch-inp-fareCst"
                      class="form-control input-sm"
                      autocomplete="off"
              ></sbux-input>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">상품명</th>
          <td class="td_input"style="border-right: hidden;">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-gdsNm"
                      name="srch-slt-gdsNm"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">상품정보</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-input
                      style="flex-grow:1"
                      uitype="text"
                      id="srch-inp-gdsInfo"
                      name="srch-inp-gdsInfo"
                      class="form-control input-sm"
                      autocomplete="off"
              ></sbux-input>
            </div>
          </td>
          <th scope="row" class="th_bg">상품등급</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-gdsGrd"
                      name="srch-slt-gdsGrd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
                      onchange="">
              </sbux-select>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">출하량</th>
          <td class="td_input"style="border-right: hidden;">
            <div class="displayFlex">
              <sbux-input
                      uitype="text"
                      id="srch-inp-spmtQntt"
                      name="srch-inp-spmtQntt"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      autocomplete="off"
                      mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange=""
              ></sbux-input>
              <sbux-input
                      uitype="text"
                      id="srch-inp-spmtAvg"
                      name="srch-inp-spmtAvg"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      autocomplete="off"
                      mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange=""
              ></sbux-input>
            </div>
          </td>
          <th scope="row" class="th_bg">저장창고</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-strgWrhus"
                      name="srch-slt-strgWrhus"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">비고</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-input
                      style="flex-grow: 1"
                      uitype="text"
                      id="srch-inp-rmrk"
                      name="srch-inp-rmrk"
                      class="form-control input-sm"
                      autocomplete="off"
              ></sbux-input>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">거래형태</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-dlngShp"
                      name="srch-slt-strgWrhus"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">매매방법</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-trdMthd"
                      name="srch-slt-trdMthd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">팔레트불출</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      style="flex: 0 40%"
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-pltKnd"
                      name="srch-slt-pltKnd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
                      onchange="">
              </sbux-select>
              <sbux-input
                      style="flex: 0 30%"
                      uitype="text"
                      id="srch-inp-pltNo"
                      name="srch-inp-pltNo"
                      class="form-control input-sm"
                      autocomplete="off"
              ></sbux-input>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">생산자</th>
          <td class="td_input" style="border-right: hidden;">
            <div class="displayFlex">
              <div style="flex: 1 0 8em">
                <sbux-input
                        uitype="text"
                        id="srch-inp-prdcrNm"
                        name="srch-inp-prdcrNm"
                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                        placeholder="초성검색 가능"
                        autocomplete-ref="jsonPrdcrAutocomplete"
                        autocomplete-text="name"
                        autocomplete-height="270px"
                        oninput="fn_onInputPrdcrNm(event)"
                        autocomplete-select-callback="fn_onSelectPrdcrNm"
                ></sbux-input>
              </div>
              <div style="flex: 1 0 8em">
                <sbux-input
                        uitype="text"
                        id="srch-inp-prdcrIdentno"
                        name="srch-inp-prdcrIdentno"
                        class="form-control input-sm"
                        maxlength="2"
                        autocomplete="off"
                        onchange="fn_onChangeSrchPrdcrIdentno(this)"
                ></sbux-input>
              </div>
              <div style="flex: 0">
                <sbux-button
                        id="btn-srch-prdcr"
                        name="btn-srch-prdcr"
                        class="btn btn-xs btn-outline-dark"
                        text="찾기" uitype="modal"
                        target-id="modal-prdcr"
                        onclick=""
                ></sbux-button>
              </div>
            </div>
          </td>
          <th scope="row" class="th_bg">입고구분</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-wrhsSeCd"
                      name="srch-slt-wrhsSeCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">상품구분</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-gdsSeCd"
                      name="srch-slt-gdsSeCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
                      onchange="">
              </sbux-select>
            </div>
          </td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</section>
</body>
</html>
