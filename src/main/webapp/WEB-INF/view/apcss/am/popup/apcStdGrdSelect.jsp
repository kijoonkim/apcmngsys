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
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : APC표준등급 부여</title>
    <style>
    	.ul_stdgrd {
    		list-style:none;
    		padding-left: 3px;
    		/* height: 24px; */
    		vertical-align: middle
    	}
    	.ul_stdgrd li {
    		float: left;
    		margin: 0px 3px;
			vertical-align: middle
    	}
    	.ul_stdgrd li label {
    		padding: 6px 0px 4px 0px;
    		max-width: 100px;
    	}
    	.ul_stdgrd li select {
    		/*
    		padding: 0px;
    		height: 20px;
    		max-width: 100px;
    		*/
    	}
    	.ul_stdgrd li input {
    		/*padding: 0px;
    		height: 18px;
    		max-width: 80px;*/
    	}
    	.ul_stdgrd .sb__li__select {
    		/*
    		padding: 0px;
    		height: 20px;
    		max-width: 100px;
    		*/
    	}
    	.ul_stdgrd .sb__li__input {
    		max-width: 80px;
    	}

    </style>
</head>
<body>
	<ul class="ul_stdgrd">
		<li class="li__label">
			<!-- <span id="stdGrdSlt-spn-grdNm-1" style="margin-right: 5px;">등급1 : </span> -->
			<sbux-label id="stdGrdSlt-lbl-knd-1" name="stdGrdSlt-lbl-knd-1" uitype="normal" style="font-weight: bold;font-size: 12px;" text="등급1">
			</sbux-label>
		</li>
		<li class="li__select">
			<sbux-select
				uitype="single"
				id="stdGrdSlt-slt-knd-1"
				name="stdGrdSlt-slt-knd-1"
				class="form-control input-sm input-sm-ast inpt_data_reqed"
				jsondata-ref="gjsonStdGrdObj_1"
				jsondata-text="grdNm"
				jsondata-value="grdCd"
				onchange="stdGrdSelect.setGrdJgmt"
			/>
		</li>
		<li class="li__input">
			<sbux-input
				uitype="text"
				id="stdGrdSlt-inp-knd-1"
				name="stdGrdSlt-inp-knd-1"
				class="form-control input-sm input-sm-ast sb__li__input"
				maxlength="5"
				autocomplete="off"
				mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
				onchange="stdGrdSelect.setGrdNvSum"
			></sbux-input>
		</li>
		<li class="li__label">
			<sbux-label id="stdGrdSlt-lbl-knd-2" name="stdGrdSlt-lbl-knd-2" uitype="normal" style="font-weight: bold;font-size: 12px;" text="등급2">
			</sbux-label>
		</li>
		<li class="li__select">
			<sbux-select
				uitype="single"
				id="stdGrdSlt-slt-knd-2"
				name="stdGrdSlt-slt-knd-2"
				class="form-control input-sm input-sm-ast inpt_data_reqed"
				jsondata-ref="gjsonStdGrdObj_2"
				jsondata-text="grdNm"
				jsondata-value="grdCd"
				onchange="stdGrdSelect.setGrdJgmt"
			/>
		</li>
		<li class="li__input">
			<sbux-input
				uitype="text"
				id="stdGrdSlt-inp-knd-2"
				name="stdGrdSlt-inp-knd-2"
				class="form-control input-sm input-sm-ast sb__li__input"
				maxlength="5"
				autocomplete="off"
				mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
				onchange="stdGrdSelect.setGrdNvSum"
			></sbux-input>
		</li>
		<li class="li__label">
			<sbux-label id="stdGrdSlt-lbl-knd-3" name="stdGrdSlt-lbl-knd-3" uitype="normal" style="font-weight: bold;font-size: 12px;" text="등급3">
			</sbux-label>
		</li>
		<li class="li__select">
			<sbux-select
				uitype="single"
				id="stdGrdSlt-slt-knd-3"
				name="stdGrdSlt-slt-knd-3"
				class="form-control input-sm input-sm-ast inpt_data_reqed"
				jsondata-ref="gjsonStdGrdObj_3"
				jsondata-text="grdNm"
				jsondata-value="grdCd"
				onchange="stdGrdSelect.setGrdJgmt"
			/>
		</li>
		<li class="li__input">
			<sbux-input
				uitype="text"
				id="stdGrdSlt-inp-knd-3"
				name="stdGrdSlt-inp-knd-3"
				class="form-control input-sm input-sm-ast sb__li__input"
				maxlength="5"
				autocomplete="off"
				mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
				onchange="stdGrdSelect.setGrdNvSum"
			></sbux-input>
		</li>
		<li class="li__label">
			<sbux-label id="stdGrdSlt-lbl-knd-4" name="stdGrdSlt-lbl-knd-4" uitype="normal" style="font-weight: bold;font-size: 12px;" text="등급4">
			</sbux-label>
		</li>
		<li class="li__select">
			<sbux-select
				uitype="single"
				id="stdGrdSlt-slt-knd-4"
				name="stdGrdSlt-slt-knd-4"
				class="form-control input-sm input-sm-ast inpt_data_reqed"
				jsondata-ref="gjsonStdGrdObj_4"
				jsondata-text="grdNm"
				jsondata-value="grdCd"
				onchange="stdGrdSelect.setGrdJgmt"
			/>
		</li>
		<li class="li__input">
			<sbux-input
				uitype="text"
				id="stdGrdSlt-inp-knd-4"
				name="stdGrdSlt-inp-knd-4"
				class="form-control input-sm input-sm-ast sb__li__input"
				maxlength="5"
				autocomplete="off"
				mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
				onchange="stdGrdSelect.setGrdNvSum"
			></sbux-input>
		</li>
		<li class="li__label">
			<sbux-label id="stdGrdSlt-lbl-knd-5" name="stdGrdSlt-lbl-knd-5" uitype="normal" style="font-weight: bold;font-size: 12px;" text="등급5">
			</sbux-label>
		</li>
		<li class="li__select">
			<sbux-select
				uitype="single"
				id="stdGrdSlt-slt-knd-5"
				name="stdGrdSlt-slt-knd-5"
				class="form-control input-sm input-sm-ast inpt_data_reqed"
				jsondata-ref="gjsonStdGrdObj_5"
				jsondata-text="grdNm"
				jsondata-value="grdCd"
				onchange="stdGrdSelect.setGrdJgmt"
			/>
		</li>
		<li class="li__input">
			<sbux-input
				uitype="text"
				id="stdGrdSlt-inp-knd-5"
				name="stdGrdSlt-inp-knd-5"
				class="form-control input-sm input-sm-ast sb__li__input"
				maxlength="5"
				autocomplete="off"
				mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
				onchange="stdGrdSelect.setGrdNvSum"
			></sbux-input>
		</li>
		<li class="li_label_sum">
			<sbux-label id="stdGrdSlt-lbl-sumTitle" name="stdGrdSlt-lbl-sumTitle" uitype="normal" style="color: #3c6dbc;font-weight: bold;font-size: 12px;" text="합산">
			</sbux-label>
		</li>
		<li class="li_label_sum">
			<sbux-label 
				id="stdGrdSlt-lbl-sum" 
				name="stdGrdSlt-lbl-sum" 
				uitype="normal"
				class="stdGrdSlt__sum sb__li__input" 
				style="font-weight: bold;font-size: 12px;"
				mask = "{'alias': 'currency', 'suffix': ' %', 'prefix': '', 'digits': 0}" 
				text="">
			</sbux-label>
		</li>
		<li class="li_label_wght">
			<sbux-label id="stdGrdSlt-lbl-wghtTitle" name="stdGrdSlt-lbl-wghtTitle" uitype="normal" style="color: #3c6dbc;font-weight: bold;font-size: 12px;" text="합계">
			</sbux-label>
		</li>
		<li class="li_label_wght">
			<sbux-label 
				id="stdGrdSlt-lbl-wght" 
				name="stdGrdSlt-lbl-wght" 
				uitype="normal"
				class="stdGrdSlt__sum sb__li__input" 
				style="font-weight: bold;font-size: 12px;"
				mask = "{'alias': 'currency', 'suffix': ' Kg', 'prefix': '', 'digits': 0}" 
				text="">
			</sbux-label>
		</li>
		<li class="li_label">
			<sbux-label id="stdGrdSlt-lbl-jgmt" name="stdGrdSlt-lbl-jgmt" uitype="normal" style="color: #3c6dbc;font-weight: bold;font-size: 12px;" text="판정등급 : ">
			</sbux-label>
		</li>
		<li class="li__select">
			<sbux-select
				uitype="single"
				id="stdGrdSlt-slt-jgmt"
				name="stdGrdSlt-slt-jgmt"
				class="form-control input-sm"
				readonly
				jsondata-ref="gjsonStdGrdObjJgmt"
				jsondata-text="grdNm"
				jsondata-value="grdCd"
			/>
		</li>
	</ul>
</body>

<script type="text/javascript">

/** 등급 SBSelect */
const stdGrdSelect = {
	param: {
		apcCd: null,
		grdSeCd: null,
		itemCd: null,
		isWght: null
	},
	hide: function() {
		SBUxMethod.hide("stdGrdSlt-lbl-jgmt");
		SBUxMethod.hide("stdGrdSlt-slt-jgmt");
		SBUxMethod.hide("stdGrdSlt-lbl-sumTitle");
		SBUxMethod.hide("stdGrdSlt-lbl-wghtTitle");
		SBUxMethod.hide("stdGrdSlt-lbl-sum");
		SBUxMethod.hide("stdGrdSlt-lbl-wght");
		
		document.querySelector('.li_label_sum').style.display = "none";
		document.querySelector('.li_label_wght').style.display = "none";
		
		gStdGrdObj.idList.forEach((id) => {
			SBUxMethod.hide('stdGrdSlt-lbl-knd-' + id);
			SBUxMethod.hide('stdGrdSlt-slt-knd-' + id);
			SBUxMethod.hide('stdGrdSlt-inp-knd-' + id);
			let jsonObj = gStdGrdObj.getGrdJson(id);
			jsonObj.length = 0;
		});
	},
	init: function() {
		this.hide();
	},
	setStdGrd: async function(_apcCd, _grdSeCd, _itemCd, _stdGrdObj, _isWght) {
		
		this.hide();
		this.param.apcCd = _apcCd;
		this.param.grdSeCd = _grdSeCd;
		this.param.itemCd = _itemCd;
		this.param.isWght = _isWght;
		
		gjsonStdGrdObjKnd.length = 0;

		if (gfn_isEmpty(_apcCd)
				|| gfn_isEmpty(_grdSeCd)
				|| gfn_isEmpty(_itemCd)) {
			return;
		}
		await gStdGrdObj.init(_apcCd, _grdSeCd, _itemCd);

		if (gjsonStdGrdObjKnd.length === 0) {
			return;
		}
		
		let cntRt = 0;
		let cntWt = 0;
		gjsonStdGrdObjKnd.forEach((item, index) => {
			const id = gStdGrdObj.idList[index];
			SBUxMethod.set('stdGrdSlt-lbl-knd-' + id, item.grdKndNm + " : ");	// 등급종류명
			SBUxMethod.show('stdGrdSlt-lbl-knd-' + id);
			
			if (_.isEqual(item.stdGrdType, "RT")) {
				if (_isWght) {
					cntWt++;					
				} else {
					cntRt++;
				}
				SBUxMethod.show('stdGrdSlt-inp-knd-' + id);
			} else {
				SBUxMethod.show('stdGrdSlt-slt-knd-' + id);
				SBUxMethod.refresh('stdGrdSlt-slt-knd-' + id);
			}
		});
		
		if (cntWt > 0) {
			document.querySelector('.li_label_wght').style.display = "";
			SBUxMethod.show("stdGrdSlt-lbl-wghtTitle");
			SBUxMethod.show("stdGrdSlt-lbl-wght");
		}
		if (cntRt > 0) {
			document.querySelector('.li_label_sum').style.display = "";
			SBUxMethod.show("stdGrdSlt-lbl-sumTitle");
			SBUxMethod.show("stdGrdSlt-lbl-sum");
		}
		
		if (gjsonStdGrdObjKnd.length > 1 && gjsonStdGrdObjJgmt.length > 0) {
			SBUxMethod.show('stdGrdSlt-lbl-jgmt');
			SBUxMethod.show('stdGrdSlt-slt-jgmt');
			SBUxMethod.refresh('stdGrdSlt-slt-jgmt');
		}
		
		SBUxMethod.set("stdGrdSlt-lbl-wght", "");
		SBUxMethod.set("stdGrdSlt-lbl-sum", "");
		if (!gfn_isEmpty(_stdGrdObj)) {

			// set stdGrd
			if (gjsonStdGrdObjJgmt.length > 0) {
				SBUxMethod.set('stdGrdSlt-slt-jgmt', _stdGrdObj.grdJgmt.grdCd);
			}

			gjsonStdGrdObjKnd.forEach((item, index) => {
				const id = gStdGrdObj.idList[index];
				SBUxMethod.set('stdGrdSlt-slt-knd-' + id, "");
				SBUxMethod.set('stdGrdSlt-inp-knd-' + id, "");
			});

			let grdNvSum = 0;
			let grdWghtSum = 0;
			_stdGrdObj.stdGrdList.forEach((stdGrd) => {
				gjsonStdGrdObjKnd.forEach((item, index) => {
					if (stdGrd.grdKnd === item.grdKnd) {
						const id = gStdGrdObj.idList[index];						
						if (_.isEqual(item.stdGrdType, "RT")) {
							if (_isWght) {
								SBUxMethod.set('stdGrdSlt-inp-knd-' + id, stdGrd.grdWght);
								grdWghtSum += parseFloat(stdGrd.grdWght) || 0;
							} else {
								SBUxMethod.set('stdGrdSlt-inp-knd-' + id, stdGrd.grdNv);
								grdNvSum += parseFloat(stdGrd.grdNv) || 0;
							}
						} else {
							SBUxMethod.refresh('stdGrdSlt-slt-knd-' + id);
							SBUxMethod.set('stdGrdSlt-slt-knd-' + id, stdGrd.grdCd, { isTriggerExt : true } );
						}
						return false;
					}
				});

				if (grdNvSum > 0) {
					SBUxMethod.set("stdGrdSlt-lbl-sum", grdNvSum);
				}
				console.log("grdWghtSum", grdWghtSum);
				if (grdWghtSum > 0) {
					SBUxMethod.set("stdGrdSlt-lbl-wght", grdWghtSum);
				}
			});
		} else {
			gjsonStdGrdObjKnd.forEach((item, index) => {
				const id = gStdGrdObj.idList[index];
				if (_.isEqual(item.stdGrdType, "RT")) {
					SBUxMethod.set('stdGrdSlt-inp-knd-' + id, "");
				} else {
					let jsonObj = gStdGrdObj.getGrdJson(id);
					if (jsonObj.length == 0) {
						return;
					}
					SBUxMethod.refresh('stdGrdSlt-slt-knd-' + id);
					SBUxMethod.set('stdGrdSlt-slt-knd-' + id, jsonObj[0].grdCd, { isTriggerExt : true } );
				}
			});
			/*
			gStdGrdObj.idList.forEach((id) => {
				let jsonObj = gStdGrdObj.getGrdJson(id);
				if (jsonObj.length == 0) {
					return;
				}
				SBUxMethod.refresh('stdGrdSlt-slt-knd-' + id);
				SBUxMethod.set('stdGrdSlt-slt-knd-' + id, jsonObj[0].grdCd, { isTriggerExt : true } );
			});
			 */
		}
	},
	getJgmtGrdCd: function(_grdList) {
		
		return gStdGrdObj.getJgmtGrdCd(_grdList);
		
		/*
		if (gjsonStdGrdObjJgmt.length == 0) {
			return "";
		}

		let jgmtGrdVl = 0;

		gjsonStdGrdObjKnd.forEach((item, index) => {
			const id = gStdGrdObj.idList[index];
			let grdCd = _grdList[index];

			let jsonObj = gStdGrdObj.getGrdJson(id);

			let grdDtlInfo = _.find(jsonObj, {grdCd: grdCd});

			if (!gfn_isEmpty(grdDtlInfo)) {
				jgmtGrdVl += parseInt(grdDtlInfo.grdVl) || 0;
			}
		});

		let jgmtGrdCd = "";
		let jgmtGrdNm = "";

		gjsonStdGrdObjJgmt.forEach((item, index) => {

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
		
		return jgmtGrdCd;
		*/
	},
	setGrdNvSum: function() {
		let sumGrdNv = 0;
		gjsonStdGrdObjKnd.forEach((item, index) => {
			if (_.isEqual(item.stdGrdType, "RT")) {
				const id = gStdGrdObj.idList[index];
				let grdNv = parseFloat(SBUxMethod.get('stdGrdSlt-inp-knd-' + id)) || 0;
				sumGrdNv += grdNv;
			}
		});
		
		if (this.param.isWght) {
			SBUxMethod.set('stdGrdSlt-lbl-wght', sumGrdNv);
		} else {
			if (sumGrdNv > 100) {
				document.querySelector('.stdGrdSlt__sum').style.color = "blue";
			} else if (sumGrdNv < 100) {
				document.querySelector('.stdGrdSlt__sum').style.color = "red";
			} else {
				document.querySelector('.stdGrdSlt__sum').style.color = "green";
			}
			SBUxMethod.set('stdGrdSlt-lbl-sum', sumGrdNv);
		}
	},
	setGrdJgmt: function() {

		if (gjsonStdGrdObjJgmt.length == 0) {
			return;
		}

		let jgmtGrdVl = 0;

		gjsonStdGrdObjKnd.forEach((item, index) => {
			const id = gStdGrdObj.idList[index];
			let grdCd = SBUxMethod.get('stdGrdSlt-slt-knd-' + id);

			let jsonObj = gStdGrdObj.getGrdJson(id);

			let grdDtlInfo = _.find(jsonObj, {grdCd: grdCd});

			if (!gfn_isEmpty(grdDtlInfo)) {
				jgmtGrdVl += parseInt(grdDtlInfo.grdVl) || 0;
			}
		});

		let jgmtGrdCd = "";
		let jgmtGrdNm = "";

		gjsonStdGrdObjJgmt.forEach((item, index) => {

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
				isWght: this.param.isWght,
				grdWght: 0,
				stdGrdList: [],
				grdJgmt: {grdCd: null, grdNm: null, grdVl: null},
				isOmit: false
			}
		
		let jgmtGrdCd = "";
		let jgmtGrdNm = "";
		
		let cntRt = 0;
		let cntWt = 0;
		let grdWghtSum = 0;
		let sumGrdNv = 0;
		gjsonStdGrdObjKnd.forEach((item, index) => {
			const _id = gStdGrdObj.idList[index];

			let grdCd = SBUxMethod.get('stdGrdSlt-slt-knd-' + _id);
			let grdNv = parseFloat(SBUxMethod.get('stdGrdSlt-inp-knd-' + _id)) || 0;
			if (_.isEqual(item.stdGrdType, "RT")) {
				if (this.param.isWght) {
					cntWt++;
				} else {
					cntRt++;
				}
				grdCd = "";
				sumGrdNv += grdNv;
			} else {
				if (gfn_isEmpty(grdCd)) {
					result.isOmit = true;
				}
			}
						
			const stdGrd = {
					apcCd: this.param.apcCd,
					grdSeCd: this.param.grdSeCd,
					itemCd: this.param.itemCd,
					grdKnd: item.grdKnd,
					grdKndNm: item.grdKndNm,
					stdGrdType: item.stdGrdType,
					grdCd: grdCd,
					grdNv: grdNv,
					grdWght: null
				}
			
			if (this.param.isWght) {
				stdGrd.grdWght = stdGrd.grdNv;
				stdGrd.grdNv = null;
				stdGrd.stdGrdType = "WT";
			}
			
			result.stdGrdList.push(stdGrd);

			if (gfn_isEmpty(jgmtGrdCd) || _.isEqual(jgmtGrdCd, "*")) {
				
				if (_.isEqual(item.stdGrdType, "RT")) {
					jgmtGrdCd = "*";
				} else {
					jgmtGrdCd = grdCd;
				}
				
				jgmtGrdNm = item.grdKndNm;
			}
		});

		if (cntRt > 0 && (sumGrdNv > 100 || sumGrdNv < 100)) {
			result.isOmit = true;
		}
		
		if (result.stdGrdList.length == 0) {
			result.isOmit = true;
		}
		
		if (cntWt > 0) {
			result.grdWght = sumGrdNv;
		}

		if (gjsonStdGrdObjJgmt.length > 0) {
			jgmtGrdCd = SBUxMethod.get('stdGrdSlt-slt-jgmt');
			jgmtGrdNm = SBUxMethod.getText('stdGrdSlt-slt-jgmt');
		}
		
		result.grdJgmt = {
				grdCd: jgmtGrdCd,
				grdNm: jgmtGrdNm,
				grdVl: null
			}

		return result;
	},
}
</script>
</html>