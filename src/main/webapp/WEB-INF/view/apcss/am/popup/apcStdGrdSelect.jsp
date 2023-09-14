<%
 /**
  * @Class Name : apcStdSelect.jsp
  * @Description : APC표준등급 SBSelect 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	신정철			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<ul style="list-style:none;padding-left: 5px;">
	<li style="float: left;margin: 0px 5px;padding-left: 5px;">
		<!-- <span id="stdGrdSlt-spn-grdNm-1" style="margin-right: 5px;">등급1 : </span> -->
		<sbux-label id="stdGrdSlt-lbl-knd-1" name="stdGrdSlt-lbl-knd-1" uitype="normal" style="font-weight: bold;font-size: 12px;" text="등급1">
		</sbux-label>
		<sbux-select
			unselected-text="선택"
			uitype="single"
			id="stdGrdSlt-slt-knd-1"
			name="stdGrdSlt-slt-knd-1"
			class="input-sm input-sm-ast inpt_data_reqed"
			jsondata-ref="jsonStdGrdPop_1"
			jsondata-text="grdNm"
			jsondata-value="grdCd"
			onchange="stdGrdSelect.setGrdJgmt"
		/>
	</li>
	<li style="float: left;margin: 0px 5px;padding-left: 5px;">
		<sbux-label id="stdGrdSlt-lbl-knd-2" name="stdGrdSlt-lbl-knd-2" uitype="normal" style="font-weight: bold;font-size: 12px;" text="등급2">
		</sbux-label>
		<sbux-select
			unselected-text="선택"
			uitype="single"
			id="stdGrdSlt-slt-knd-2"
			name="stdGrdSlt-slt-knd-2"
			class="input-sm input-sm-ast inpt_data_reqed"
			jsondata-ref="jsonStdGrdPop_2"
			jsondata-text="grdNm"
			jsondata-value="grdCd"
			onchange="stdGrdSelect.setGrdJgmt"
		/>
	</li>
	<li style="float: left;margin: 0px 5px;padding-left: 5px;">
		<sbux-label id="stdGrdSlt-lbl-knd-3" name="stdGrdSlt-lbl-knd-3" uitype="normal" style="font-weight: bold;font-size: 12px;" text="등급3">
		</sbux-label>
		<sbux-select
			unselected-text="선택"
			uitype="single"
			id="stdGrdSlt-slt-knd-3"
			name="stdGrdSlt-slt-knd-3"
			class="input-sm input-sm-ast inpt_data_reqed"
			jsondata-ref="jsonStdGrdPop_3"
			jsondata-text="grdNm"
			jsondata-value="grdCd"
			onchange="stdGrdSelect.setGrdJgmt"
		/>
	</li>
	<li style="float: left;margin: 0px 5px;padding-left: 5px;">
		<sbux-label id="stdGrdSlt-lbl-knd-4" name="stdGrdSlt-lbl-knd-4" uitype="normal" style="font-weight: bold;font-size: 12px;" text="등급4">
		</sbux-label>
		<sbux-select
			unselected-text="선택"
			uitype="single"
			id="stdGrdSlt-slt-knd-4"
			name="stdGrdSlt-slt-knd-4"
			class="input-sm input-sm-ast inpt_data_reqed"
			jsondata-ref="jsonStdGrdPop_4"
			jsondata-text="grdNm"
			jsondata-value="grdCd"
			onchange="stdGrdSelect.setGrdJgmt"
		/>
	</li>
	<li style="float: left;margin: 0px 5px;padding-left: 5px;">
		<sbux-label id="stdGrdSlt-lbl-knd-5" name="stdGrdSlt-lbl-knd-5" uitype="normal" style="font-weight: bold;font-size: 12px;" text="등급5">
		</sbux-label>
		<sbux-select
			unselected-text="선택"
			uitype="single"
			id="stdGrdSlt-slt-knd-5"
			name="stdGrdSlt-slt-knd-5"
			class="input-sm input-sm-ast inpt_data_reqed"
			jsondata-ref="jsonStdGrdPop_5"
			jsondata-text="grdNm"
			jsondata-value="grdCd"
			onchange="stdGrdSelect.setGrdJgmt"
		/>
	</li>
	<li style="float: left;margin: 0px 5px;padding-left: 5px;">
		<sbux-label id="stdGrdSlt-lbl-jgmt" name="stdGrdSlt-lbl-jgmt" uitype="normal" style="color: #3c6dbc;font-weight: bold;font-size: 12px;" text="판정등급 : ">
		</sbux-label>
		<sbux-select
			unselected-text="선택"
			uitype="single"
			id="stdGrdSlt-slt-jgmt"
			name="stdGrdSlt-slt-jgmt"
			class="input-sm input-sm-ast"
			readonly
			jsondata-ref="jsonStdGrdJgmtPop"
			jsondata-text="grdNm"
			jsondata-value="grdCd"
		/>
	</li>
</ul>

<script type="text/javascript">

/** 등급 json */
var jsonStdGrdKndPop = [];
var jsonStdGrdJgmtPop = [];
var jsonStdGrdDtlPop = [];
var jsonStdGrdPop_1 = [];
var jsonStdGrdPop_2 = [];
var jsonStdGrdPop_3 = [];
var jsonStdGrdPop_4 = [];
var jsonStdGrdPop_5 = [];

/** 등급 SBSelect */
const stdGrdSelect = {
	idList: ['1', '2', '3', '4', '5'],
	param: {
		apcCd: null,
		grdSeCd: null,
		itemCd: null
	},
	hide: function() {
		SBUxMethod.hide("stdGrdSlt-lbl-jgmt");
		SBUxMethod.hide("stdGrdSlt-slt-jgmt");

		this.idList.forEach((id) => {
			SBUxMethod.hide('stdGrdSlt-lbl-knd-' + id);
			SBUxMethod.hide('stdGrdSlt-slt-knd-' + id);

			let jsonObj = this.getGrdJson(id);
			jsonObj.length = 0;
		});
	},
	init: function() {
		this.hide();
	},
	setStdGrd: async function(_apcCd, _grdSeCd, _itemCd, _stdGrdObj) {

		if (this.param.apcCd !== _apcCd
				|| this.param.grdSeCd !== _grdSeCd
				|| this.param.itemCd !== _itemCd ) {

			this.hide();
			this.param.apcCd = _apcCd;
			this.param.grdSeCd = _grdSeCd;
			this.param.itemCd = _itemCd;

			jsonStdGrdKndPop.length = 0;

			let rslt = await Promise.all([
				gfn_getStdGrds(_apcCd, _grdSeCd, _itemCd),
				gfn_getStdGrdJgmts(_apcCd, _grdSeCd, _itemCd),
				gfn_getStdGrdDtls(_apcCd, _grdSeCd, _itemCd)
		 	]);

			const jsonTempKnds = rslt[0];
			jsonStdGrdJgmtPop = rslt[1];
			jsonStdGrdDtlPop = rslt[2];

			if (jsonTempKnds.length > 0) {
				jsonTempKnds.forEach((item, index) => {
					if (index >= 5) return false;

					const knd = {
							grdKnd: item.grdKnd,
							grdKndNm: item.grdKndNm,
							adtnRt: item.adtnRt
						}
					jsonStdGrdKndPop.push(knd);

					const id = this.idList[index];

					SBUxMethod.set('stdGrdSlt-lbl-knd-' + id, item.grdKndNm + " : ");	// 등급종류명
					let jsonObj = this.getGrdJson(id);

					const dtls = gfn_getJsonFilter(jsonStdGrdDtlPop, "grdKnd", item.grdKnd);
					dtls.forEach((item) => {
						jsonObj.push(item);
					});

					SBUxMethod.show('stdGrdSlt-lbl-knd-' + id);
					SBUxMethod.show('stdGrdSlt-slt-knd-' + id);

					SBUxMethod.refresh('stdGrdSlt-slt-knd-' + id);
				});
			}

			if (jsonStdGrdKndPop.length > 1 && jsonStdGrdJgmtPop.length > 0) {
				SBUxMethod.show('stdGrdSlt-lbl-jgmt');
				SBUxMethod.show('stdGrdSlt-slt-jgmt');
				SBUxMethod.refresh('stdGrdSlt-slt-jgmt');
			}
		}

		if (!gfn_isEmpty(_stdGrdObj)) {

			// set stdGrd
			if (jsonStdGrdJgmtPop.length > 0) {
				SBUxMethod.set('stdGrdSlt-slt-jgmt', _stdGrdObj.grdJgmt.grdCd);
			}

			jsonStdGrdKndPop.forEach((item, index) => {
				const id = this.idList[index];
				SBUxMethod.set('stdGrdSlt-slt-knd-' + id, "");
			});

			_stdGrdObj.stdGrdList.forEach((stdGrd) => {
				jsonStdGrdKndPop.forEach((item, index) => {
					if (stdGrd.grdKnd === item.grdKnd) {
						const id = this.idList[index];
						SBUxMethod.set('stdGrdSlt-slt-knd-' + id, stdGrd.grdCd);
						return false;
					}
				});
			});
		}
	},
	getGrdJson: function(id) {
		switch (id) {
			case '1': return jsonStdGrdPop_1;
			case '2': return jsonStdGrdPop_2;
			case '3': return jsonStdGrdPop_3;
			case '4': return jsonStdGrdPop_4;
			case '5': return jsonStdGrdPop_5;
			default: return null;
		}
	},
	setGrdJgmt: function() {

		if (jsonStdGrdJgmtPop.length == 0) {
			return;
		}

		let jgmtGrdVl = 0;

		jsonStdGrdKndPop.forEach((item, index) => {
			const id = this.idList[index];
			let grdCd = SBUxMethod.get('stdGrdSlt-slt-knd-' + id);

			let jsonObj = this.getGrdJson(id);

			let grdDtlInfo = _.find(jsonObj, {grdCd: grdCd});

			if (!gfn_isEmpty(grdDtlInfo)) {
				jgmtGrdVl += parseInt(grdDtlInfo.grdVl) || 0;
			}
		});

		let jgmtGrdCd = "";
		let jgmtGrdNm = "";

		jsonStdGrdJgmtPop.forEach((item, index) => {

			let jgmtMinVl = parseInt(item.jgmtMinVl) || 0;
			let jgmtMaxVl = parseInt(item.jgmtMaxVl) || 9999999999;

			switch (item.jgmtType) {
				case _JGMT_TYPE_VAL:	// 값
					if (jgmtGrdVl === jgmtMinVl) {
						jgmtGrdCd = item.grdCd;
						jgmtGrdNm = item.grdNm;
					}
					return false;
				case _JGMT_TYPE_UEL:	// 이상 미만
					if (jgmtGrdVl >= jgmtMinVl && jgmtGrdVl < jgmtMaxVl) {
						jgmtGrdCd = item.grdCd;
						jgmtGrdNm = item.grdNm;
					}
					return false;
				case _JGMT_TYPE_ULE:	// 초과 이하
					if (jgmtGrdVl > jgmtMinVl && jgmtGrdVl <= jgmtMaxVl) {
						jgmtGrdCd = item.grdCd;
						jgmtGrdNm = item.grdNm;
					}
					return false;
				case _JGMT_TYPE_UELE:	// 이상 이하
					if (jgmtGrdVl >= jgmtMinVl && jgmtGrdVl <= jgmtMaxVl) {
						jgmtGrdCd = item.grdCd;
						jgmtGrdNm = item.grdNm;
					}
					return false;
				case _JGMT_TYPE_UL:		// 초과 미만
					if (jgmtGrdVl > jgmtMinVl && jgmtGrdVl < jgmtMaxVl) {
						jgmtGrdCd = item.grdCd;
						jgmtGrdNm = item.grdNm;
					}
					return false;
				default:
					break;
			}
		});

		SBUxMethod.set('stdGrdSlt-slt-jgmt', jgmtGrdCd);
		//SBUxMethod.refresh('stdGrdSlt-slt-jgmt');
	},
	getStdGrd: function() {
		const result = {
				apcCd: this.param.apcCd,
				grdSeCd: this.param.grdSeCd,
				itemCd: this.param.itemCd,
				stdGrdList: [],
				grdJgmt: {grdCd: null, grdNm: null, grdVl: null},
				isOmit: false
			}
		jsonStdGrdKndPop.forEach((item, index) => {
			let grdCd = SBUxMethod.get('stdGrdSlt-slt-knd-' + this.idList[index])
			const stdGrd = {
					apcCd: this.param.apcCd,
					grdSeCd: this.param.grdSeCd,
					itemCd: this.param.itemCd,
					grdKnd: item.grdKnd,
					grdKndNm: item.grdKndNm,
					grdCd: grdCd
				}
			result.stdGrdList.push(stdGrd);

			if (gfn_isEmpty(grdCd)) {
				result.isOmit = true;
			}

			if (index === 0) {
				let jgmtGrdCd = "";
				let jgmtGrdNm = "";
				if (jsonStdGrdJgmtPop.length > 0) {
					jgmtGrdCd = SBUxMethod.get('stdGrdSlt-slt-jgmt');
					jgmtGrdNm = SBUxMethod.getText('stdGrdSlt-slt-jgmt');
				} else {
					jgmtGrdCd = item.grdKnd;
					jgmtGrdNm = item.grdKndNm;
				}

				result.grdJgmt = {
					grdCd: jgmtGrdCd,
					grdNm: jgmtGrdNm,
					grdVl: null
				}
			}
		});

		if (result.stdGrdList.length == 0) {
			result.isOmit = true;
		}

		return result;
	},
}

</script>



