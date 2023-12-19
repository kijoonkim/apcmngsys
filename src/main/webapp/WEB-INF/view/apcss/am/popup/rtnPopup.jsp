<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 반품 등록</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popRtn.save"></sbux-button>
					<sbux-button id="btnEndGds" name="btnEndGds" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popRtn.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 80px">
						<col style="width: 180px">
						<col style="width: 80px">
						<col style="width: 180px">
						<col style="width: 80px">
						<col style="width: 180px">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">운송회사</th>
							<th>
								<sbux-select
									id="pop-slt-trsprtCoCd"
									name="pop-slt-trsprtCoCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="선택"
									jsondata-ref="jsonPopComTrsprtCoCd"
									style="background-color:#FFFFFF;"
								></sbux-select>
							</th>
							<th scope="row">차량번호</th>
							<th class="td_input">
								<sbux-input id="pop-inp-vhclno" name="pop-inp-vhclno" uitype="text" class="form-control input-sm" maxlength="8" ></sbux-input>
							</th>
							<th scope="row">운임비</th>
							<th class="td_input" style="border-right: hidden;">
								<sbux-input
									id="pop-inp-trsprtCst"
									name="pop-inp-trsprtCst"
									uitype="text"
									class="form-control input-sm"
									autocomplete="off"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
									maxlength="10"
								></sbux-input>
							</th>
						</tr>
						<tr>
							<th>반품일자</th>
							<th class="td_input">
								<sbux-datepicker
									id="pop-dtp-spmtYmd"
									name="pop-dtp-spmtYmd"
									uitype="popup"
									class="form-control input-sm sbux-pik-group-apc"
									onchange="fn_dtpChange(dtl-dtp-spmtYmd)">
								</sbux-datepicker>
							</th>
							<th scope="row">비고</th>
							<th class="td_input" colspan="3">
								<sbux-input id="pop-inp-rmrk" name="pop-inp-rmrk" uitype="text" class="form-control input-sm" maxlength="300" ></sbux-input>
							</th>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var popRtnList = [];
	var jsonPopComTrsprtCoCd = []; 		// 운송회사

	/**
	 * @description 차량 선택 팝업
	 */
	const popRtn = {
		prgrmId: 'rtnPopup',
		modalId: 'modal-rtn',
		init: async function(_rtnList) {
			jsonPopComTrsprtCoCd = jsonComTrsprtCoCd;
			SBUxMethod.set("pop-dtp-spmtYmd", gfn_dateToYmd(new Date()));
			SBUxMethod.refresh("pop-slt-trsprtCoCd");
			popRtnList = _rtnList;
		},
		close: function(_result) {
			gfn_closeModal(this.modalId);
		},
		save: async function(){
			let trsprtCoCd = SBUxMethod.get("pop-slt-trsprtCoCd");
			let vhclno = SBUxMethod.get("pop-inp-vhclno");
			let trsprtCst = SBUxMethod.get("pop-inp-trsprtCst");
			let rtnYmd = SBUxMethod.get("pop-dtp-spmtYmd");
			let rmrk = SBUxMethod.get("pop-inp-rmrk");

			if(!gfn_isEmpty(vhclno)){
	    		if(!(/^\d{2,3}[가-힣]\d{4}/.exec(vhclno))){
		    		gfn_comAlert("W0011", "차량번호");			//	W0001	{0}이/가 아닙니다.
	    			return;
	    		}
	    	}

			let dldtns = [];
			let sumDldtn = "";

			for(var i=0; i<popRtnList.length; i++){

				let spmtYmd = popRtnList[i].spmtYmd;
				let dldtn = popRtnList[i].dldtn;

				if(gfn_diffDate(spmtYmd, rtnYmd) < 0){
					gfn_comAlert("E0000", "반품일자는 출하일자보다 이전 일자입니다."); 		//E0001	{0}
					return;
				}

				popRtnList[i].trsprtCoCd = trsprtCoCd;
				popRtnList[i].vhclno = vhclno;
				popRtnList[i].trsprtCst = trsprtCst;
				popRtnList[i].spmtYmd = rtnYmd;
				popRtnList[i].rmrk = rmrk;
				popRtnList[i].rtnGdsYn = "Y";
				popRtnList[i].spmtQntt = popRtnList[i].rtnGdsQntt
				popRtnList[i].spmtWght = popRtnList[i].rtnGdsWght

				if(!gfn_isEmpty(dldtn)){
					dldtns.push(dldtn)
				}
			}

			for(var i=0; i<dldtns.length; i++){
				if(i==0){
					sumDldtn = sumDldtn + dldtns[i];
				}else{
					if(dldtns[i] != dldtns[i-1]){
						sumDldtn = sumDldtn + ", "+dldtns[i];
					}
				}
			}
			popRtnList[0].dldtn = sumDldtn;

			if(gfn_comConfirm("Q0001", "반품")){
				const postJsonPromise = gfn_postJSON("/am/spmt/insertRtnSpmtPrfmncList.do", popRtnList);
		    	const data = await postJsonPromise;

		    	try{
		    		if (_.isEqual("S", data.resultStatus)) {
		        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
		        		fn_search();
		        		popRtn.close("S");
		        	} else {
		        		gfn_comAlert("E0001");
		        	}
		        } catch (e) {
		    		if (!(e instanceof Error)) {
		    			e = new Error(e);
		    		}
		    		console.error("failed", e.message);
		        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
				}
			}

		}
	}

</script>
</html>