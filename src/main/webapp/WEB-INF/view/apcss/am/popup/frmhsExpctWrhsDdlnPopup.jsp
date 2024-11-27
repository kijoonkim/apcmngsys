<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 입고예상마감설정</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">연도별 입고 마감일 설정합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;"></span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSaveDdln" name="btnSaveDdln" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popDdln.save"></sbux-button>
					<sbux-button id="btnSearchDdln" name="btnSearchDdln" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popDdln.search"></sbux-button>
					<sbux-button id="btnEndDdln" name="btnEndDdln" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-ddln')"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 12%">
						<col style="width: 24%">
						<col style="width: 12%">
						<col style="width: 24%">
						<col style="width: 12%">
						<col style="width: 24%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">연도</th>
							<th class="td_input">
								<sbux-datepicker
									id="ddln-dtp-yr"
									name="ddln-dtp-yr"
									uitype="popup"
									datepicker-mode="year"
									onchange="fn_yrDdlnChange(sddln-dtp-yr)"
									class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc"
								></sbux-datepicker>
							</th>
							<th scope="row">마감일</th>
							<th>
								<sbux-spinner
									id="ddln-inp-ymd"
									name="ddln-inp-ymd"
									uitype="normal"
									class="form-control input-sm"
									number-min-value="0"
									number-max-value="31"
								></sbux-spinner>
							</th>
							<th scope="row">사용유무</th>
							<th>
								<sbux-select
									id="ddln-slt-useYn"
									name="ddln-slt-useYn"
									uitype="single"
									jsondata-ref="jsonUseYn"
									class="form-control input-sm"
									style="background-color:#ffffff;"
								 ></sbux-select>
							</th>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
<script >


	/**
	 * @description 권한 사용자 선택 팝업
	 */
	var jsonUseYn = [
		{"text" : "사용", "value" : "Y"},
		{"text" : "미사용", "value" : "N"},
	];
	const popDdln = {
		modalId: 'modal-ddln',
		prvApcCd : "",
		init: async function(_apcCd, _yr) {
			prvApcCd = _apcCd;
			SBUxMethod.set("ddln-dtp-yr", _yr);
			this.search();

		},
		search : async function () {
			let postJsonPromise = gfn_postJSON("/am/wrhs/selectFrmhsExpctWrhsDdln.do", {
				apcCd 	: prvApcCd,
				yr 		: SBUxMethod.get("ddln-dtp-yr")
	 		});
		    let data = await postJsonPromise;

		    try{
		    	let resultJson = data.resultJson;

		    	if (gfn_isEmpty(resultJson)) {
		    		SBUxMethod.set("ddln-inp-ymd", 0);
			    	SBUxMethod.set("ddln-slt-useYn", "N");
		    	} else {

			    	let useYn = resultJson.useYn;
			    	let ymd = resultJson.ymd;

			    	SBUxMethod.set("ddln-inp-ymd", ymd);
			    	SBUxMethod.set("ddln-slt-useYn", useYn);
		    	}

		    } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		    }
		},
		close: function () {
			gfn_closeModal(this.modalId);
		},
		save : async function () {
			let postJsonPromise = gfn_postJSON("/am/wrhs/updateFrmhsExpctWrhsDdln.do", {
				apcCd 		: prvApcCd,
				yr 			: SBUxMethod.get("ddln-dtp-yr"),
				ymd 		: SBUxMethod.get("ddln-inp-ymd"),
				useYn	 	: SBUxMethod.get("ddln-slt-useYn")
	 		});
		    let data = await postJsonPromise;

		    try{
		    	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        	} else {
	        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        	}

		    } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		    }
		},
	}

</script>
</html>