<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="scrnsWrap">
		<div style="text-align: right;">
			<span style="margin-right: 5px">저장 완료 : <span id="prgrsCnt">0</span>/14</span>
			<sbux-input uitype="hidden" id="dtl-inp-prgrsCnt" name="dtl-inp-prgrsCnt"></sbux-input>
			<sbux-input uitype="hidden" id="dtl-inp-prgrsLast" name="dtl-inp-prgrsLast"></sbux-input>
			<sbux-button
				id="prgrs-btnPrint"
				name="prgrs-btnPrint"
				uitype="normal"
				text="출력"
				class="btn btn-sm btn-primary"
				onclick="cfn_report"
			></sbux-button>
			<sbux-button
				id="prgrs-btnLastSave"
				name="prgrs-btnLastSave"
				uitype="normal"
				text="최종제출"
				class="btn btn-sm btn-primary"
				onclick="cfn_lastSave"
				disabled
			></sbux-button>
		</div>
		<div class="prgrs-bar-background">
			<div class="prgrs-bar" id="prgrsbar"></div>
		</div>
		<div id="scrns">
			<div class ="scrnWrap">
				<span class="scrn" id="scrn1" data-saved="false" data-draft="false" onclick="cfn_reqTab('CS_005_001')">
					<span class="prgrs"></span>
					<span class="chk saved" aria-label="저장"></span>
					<span class="chk draft" aria-label="임시 저장">임시</span>
				</span>
				<label for="scrn1"><p>1.운영자 개요</p></label>
			</div>
			<div class ="scrnWrap">
				<span class="scrn" id="scrn2" data-saved="false" data-draft="false" onclick="cfn_reqTab('CS_005_002')">
					<span class="prgrs"></span>
					<span class="chk saved" aria-label="저장"></span>
					<span class="chk draft" aria-label="임시 저장">임시</span>
				</span>
				<label for="scrn2"><p>2.시설설치보완</p></label>
			</div>
			<div class ="scrnWrap">
				<span class="scrn" id="scrn3" data-saved="false" data-draft="false" onclick="cfn_reqTab('CS_005_017_001')">
					<span class="prgrs"></span>
					<span class="chk saved" aria-label="저장"></span>
					<span class="chk draft" aria-label="임시 저장">임시</span>
				</span>
				<label for="scrn3"><p>3.1&nbsp;시설 현황</p></label>
			</div>
			<div class ="scrnWrap">
				<span class="scrn" id="scrn4" data-saved="false" data-draft="false" onclick="cfn_reqTab('CS_005_017_002')">
					<span class="prgrs"></span>
					<span class="chk saved" aria-label="저장"></span>
					<span class="chk draft" aria-label="임시 저장">임시</span>
				</span>
				<label for="scrn4"><p>3.2&nbsp;상품화설비현황</p></label>
			</div>
			<div class ="scrnWrap">
				<span class="scrn" id="scrn5" data-saved="false" data-draft="false" onclick="cfn_reqTab('CS_005_017_003')">
					<span class="prgrs"></span>
					<span class="chk saved" aria-label="저장"></span>
					<span class="chk draft" aria-label="임시 저장">임시</span>
				</span>
				<label for="scrn5"><p>3.3&nbsp;선별기운영</p></label>
			</div>
			<div class ="scrnWrap">
				<span class="scrn" id="scrn6" data-saved="false" data-draft="false" onclick="cfn_reqTab('CS_005_017_004')">
					<span class="prgrs"></span>
					<span class="chk saved" aria-label="저장"></span>
					<span class="chk draft" aria-label="임시 저장">임시</span>
				</span>
				<label for="scrn6"><p>3.4&nbsp;선별기운영기간</p></label>
			</div>
			<div class ="scrnWrap">
				<span class="scrn" id="scrn7" data-saved="false" data-draft="false" onclick="cfn_reqTab('CS_005_017_005')">
					<span class="prgrs"></span>
					<span class="chk saved" aria-label="저장"></span>
					<span class="chk draft" aria-label="임시 저장">임시</span>
				</span>
				<label for="scrn7"><p>3.5&nbsp;저온저장고운영</p></label>
			</div>
			<div class ="scrnWrap">
				<span class="scrn" id="scrn8" data-saved="false" data-draft="false" onclick="cfn_reqTab('CS_005_017_006')">
					<span class="prgrs"></span>
					<span class="chk saved" aria-label="저장"></span>
					<span class="chk draft" aria-label="임시 저장">임시</span>
				</span>
				<label for="scrn8"><p>3.6&nbsp;고용인력</p></label>
			</div>
			<div class ="scrnWrap">
				<span class="scrn" id="scrn9" data-saved="false" data-draft="false" onclick="cfn_reqTab('CS_005_018_001')">
					<span class="prgrs"></span>
					<span class="chk saved" aria-label="저장"></span>
					<span class="chk draft" aria-label="임시 저장">임시</span>
				</span>
				<label for="scrn9"><p>4.1&nbsp;스마트자동화 현황</p></label>
			</div>
			<div class ="scrnWrap">
				<span class="scrn" id="scrn10" data-saved="false" data-draft="false" onclick="cfn_reqTab('CS_005_018_002')">
					<span class="prgrs"></span>
					<span class="chk saved" aria-label="저장"></span>
					<span class="chk draft" aria-label="임시 저장">임시</span>
				</span>
				<label for="scrn10"><p>4.2&nbsp;작업단계별 농가 데이터현황</p></label>
			</div>
			<div class ="scrnWrap">
				<span class="scrn" id="scrn11" data-saved="false" data-draft="false" onclick="cfn_reqTab('CS_005_018_003')">
					<span class="prgrs"></span>
					<span class="chk saved" aria-label="저장"></span>
					<span class="chk draft" aria-label="임시 저장">임시</span>
				</span>
				<label for="scrn11"><p>4.3&nbsp;통합관리시스템 활용현황</p></label>
			</div>
			<div class ="scrnWrap">
				<span class="scrn" id="scrn12" data-saved="false" data-draft="false" onclick="cfn_reqTab('CS_005_019_001')">
					<span class="prgrs"></span>
					<span class="chk saved" aria-label="저장"></span>
					<span class="chk draft" aria-label="임시 저장">임시</span>
				</span>
				<label for="scrn12"><p>5.1&nbsp;유통조직 처리실적</p></label>
			</div>
			<div class ="scrnWrap">
				<span class="scrn" id="scrn13" data-saved="false" data-draft="false" onclick="cfn_reqTab('CS_005_019_002')">
					<span class="prgrs"></span>
					<span class="chk saved" aria-label="저장"></span>
					<span class="chk draft" aria-label="임시 저장">임시</span>
				</span>
				<label for="scrn13"><p>5.2&nbsp;APC 처리실적</p></label>
			</div>
			<div class ="scrnWrap">
				<span class="scrn" id="scrn14" data-saved="false" data-draft="false" onclick="cfn_reqTab('CS_005_019_003')">
					<span class="prgrs"></span>
					<span class="chk saved" aria-label="저장"></span>
					<span class="chk draft" aria-label="임시 저장">임시</span>
				</span>
				<label for="scrn14"><p>5.3&nbsp;APC 처리상품 주요판매처</p></label>
			</div>
		</div>
	</div>
	<style type="text/css">

		.scrnsWrap{

		}

		#scrns {
		  display: flex;
		  flex-wrap: wrap;
		  justify-content: space-between;
		}

		.prgrs-bar-background {
		  width: 94%;
		  height: 5px;
		  background-color: #ddd;
		  position: relative;
		  top: 20px;
		  border-radius: 5px;
		  margin-left: 3%;
		  z-index: 0;
		}
		.prgrs-bar {
		  width: 0;
		  height: 10px;
		  background-color: #4caf50;
		  border-radius: 5px;
		  transition: width 0.4s ease;
		}

		.scrnWrap {
		  width: 7.14%;
		  height: auto;
		  padding:0 2px 0 2px;
		  text-align: center;
		}

		.scrnWrap p{
		  text-align: center;
		  font-size: 12px;
		  word-break: auto-phrase;
		  cursor: pointer;
		}

		.scrn {
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  width: 36px; /* 원형 크기 조정 */
		  height: 36px;
		  border-radius: 50%;
		  margin-bottom: 5px;
		  border: 2px solid #ccc; /* 원형 테두리 */
		  left: 50%;
		  position: relative;
		  transform: translate(-18px, 0);
		  cursor: pointer;
		}

		.prgrs {
		  position: absolute;
		  width: 34px; /* 진행률 원형 크기 조정 */
		  height: 34px;
		  border-radius: 50%;
		  background-color:#ffffff;
		  clip-path: circle(50% at 50% 50%); /* 진행률 표시 */
		  transition: all 0.5s ease;
		  z-index: 2;
		}

		.scrn[data-saved="true"] .prgrs {
		  background-color: #007bff; /* 저장된 화면 진행률 색상 */
		}

		.scrn[data-draft="true"] .prgrs {
		  background-color: #ffc107; /* 임시 저장된 화면 진행률 색상 */
		}

		.saved{
		  width: 10px;
		  height: 20px;
		  display: block;
		  position: absolute;
		  z-index:3;
		}
		.draft{
		  width: 23px;
		  height: 16px;
		  display: block;
		  position: absolute;
		  z-index: 3;
		  font-size: 12px;
		  color: black;
		}

		.saved::after {
		  content: '';
		  display: block;
		  width: 9px;
		  height: 15px;
		  border: solid #fff;
		  border-width: 0 3px 3px 0;
		  transform: rotate(45deg);
		}

		.scrn[data-saved="false"] .saved {
		  display: none; /* 저장되지 않은 화면 체크 표시 숨김 */
		}

		.scrn[data-draft="false"] .draft {
		  display: none; /* 임시 저장되지 않은 화면 체크 표시 숨김 */
		}
	</style>
	<script type="text/javascript">
		/*
		#	MENU_ID	MENU_NM
		1	CS_005_001	1. 운영자 개요
		2	CS_005_002	2. 시설설치보완
		3	CS_005_017_001	3.1 시설 현황
		4	CS_005_017_002	3.2 상품화설비현황
		5	CS_005_017_003	3.3 선별기운영
		6	CS_005_017_004	3.4 선별기운영기간
		7	CS_005_017_005	3.5 저온저장고운영
		8	CS_005_017_006	3.6 고용인력
		9	CS_005_018_001	4.1 스마트자동화 현황
		10	CS_005_018_002	4.2 작업단계별 농가 데이터 현황
		11	CS_005_018_003	4.3 통합관리시스템 활용현황
		12	CS_005_019_001	5.1 유통조직 처리실적
		13	CS_005_019_003	5.2 APC 처리실적
		14	CS_005_019_005	5.3 APC 처리상품 주요판매처
		*/
		let cfn_reqTab = function(menuId){

			let data ={
				target : menuId
			};
			/** 전달하고자하는 TAB의 아이디를 객체 필드에 담아서 전달 **/
			//console.log(data);
			let json = JSON.stringify(data);
			/** main에 선언되어있는 fn **/
			window.parent.cfn_openTabSearch(json);
		}

		const cfn_selectPrgrs = async function(){
			console.log("*******cfn_selectPrgrs******");
			let apcCd = SBUxMethod.get("srch-inp-apcCd");
			let crtrYr  =  SBUxMethod.get("srch-inp-crtrYr");

			let postJsonPromise = gfn_postJSON("/fm/fclt/selectPrgrs.do", {
				apcCd : apcCd
				,crtrYr : crtrYr
			});

			let data = await postJsonPromise;
			try{
				if(data.resultMap != null){
					let resultVo = data.resultMap;
					cfn_setPrgrs(resultVo.prgrs1,'1');
					cfn_setPrgrs(resultVo.prgrs2,'2');
					cfn_setPrgrs(resultVo.prgrs3,'3');
					cfn_setPrgrs(resultVo.prgrs4,'4');
					cfn_setPrgrs(resultVo.prgrs5,'5');
					cfn_setPrgrs(resultVo.prgrs6,'6');
					cfn_setPrgrs(resultVo.prgrs7,'7');
					cfn_setPrgrs(resultVo.prgrs8,'8');
					cfn_setPrgrs(resultVo.prgrs9,'9');
					cfn_setPrgrs(resultVo.prgrs10,'10');
					cfn_setPrgrs(resultVo.prgrs11,'11');
					cfn_setPrgrs(resultVo.prgrs12,'12');
					cfn_setPrgrs(resultVo.prgrs13,'13');
					cfn_setPrgrs(resultVo.prgrs14,'14');

					SBUxMethod.set("dtl-inp-prgrsCnt", resultVo.cnt);
					SBUxMethod.set("dtl-inp-prgrsLast", resultVo.prgrsLast);

					if(!gfn_isEmpty(resultVo.cnt)){
						$('#prgrsCnt').text(resultVo.cnt);

						let prgrsLast = gfn_nvl(resultVo.prgrsLast);
						//테스트
						//prgrsLast = 'Y';
						//SBUxMethod.set("dtl-inp-prgrsLast", prgrsLast);

						if(resultVo.cnt == '14' && prgrsLast != 'Y'){
							//최종 제출 활성화
							SBUxMethod.attr('prgrs-btnLastSave','disabled','false');
						}else{
							SBUxMethod.attr('prgrs-btnLastSave','disabled','true');
						}
						//최종체출시 버튼 비활성화 처리
						if(typeof fn_prgrsLastChk === 'function'){
							fn_prgrsLastChk();
						}
					}
				}else{
					for (var i = 1; i < 15; i++) {
						cfn_setPrgrs(null,i);
					}
					$('#prgrsCnt').text("0");
					SBUxMethod.set("dtl-inp-prgrsCnt", 0);
					SBUxMethod.attr('btnLastSave','disabled','true');
				}
			}catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		}

		const cfn_setPrgrs = async function(prgrsVal,num){
			if (prgrsVal == 'Y') {
				$("#scrn"+num).attr("data-saved","true");
				$("#scrn"+num).attr("data-draft","false");
			}else if (prgrsVal == 'T') { //T 임시저장
				$("#scrn"+num).attr("data-saved","false");
				$("#scrn"+num).attr("data-draft","true");
			}else{
				$("#scrn"+num).attr("data-saved","false");
				$("#scrn"+num).attr("data-draft","false");
			}
		}
		const cfn_lastSave = async function(prgrsVal,num){
			//저장 확인
			let saveCnt = SBUxMethod.get("dtl-inp-prgrsCnt");
			console.log(saveCnt);
			if(saveCnt != '14') return;

			let mngStr = "최종 제출 하시겠습니까?";
			if (!confirm(mngStr)) return;

			let apcCd = SBUxMethod.get("srch-inp-apcCd");
			let crtrYr = SBUxMethod.get("srch-inp-crtrYr");
			console.log(apcCd,crtrYr);

			let postJsonPromise = gfn_postJSON("/fm/fclt/updatePrgrsLast.do", {
				apcCd : apcCd
				,crtrYr : crtrYr
				,prgrsLast : 'Y'//최종 제출
			});
			const data = await postJsonPromise;

			try {
				if (_.isEqual("S", data.resultStatus)) {
					alert("처리 되었습니다.");
					cfn_allTabPrgrsRefrash();
				} else {
					alert(data.resultMessage);
				}
			} catch(e) {

			}

		}
		//열려있는 탭 중 apc전수조사인 경우 진척도 갱신
		const cfn_allTabPrgrsRefrash = async function(){
			console.log('cfn_allTabPrgrsRefrash');
			let targetTab = 'TAB_CS_005';
			for (var i = 0; i < parent.length; i++) {
				let tabNm = parent[i].window.name.substring(8,18);
				if(tabNm == targetTab){
					if(typeof parent[i].window.cfn_prgrsRefrash === 'function'){
						parent[i].window.cfn_prgrsRefrash();
					}
				}
			}
		}
		//진척도 갱신
		function cfn_prgrsRefrash() {
			console.log("cfn_prgrsRefrash");
			//진척도 조회
			cfn_selectPrgrs();
		}

		const cfn_report = async function() {
			let apcCd = SBUxMethod.get("srch-inp-apcCd");
			let crtrYr  =  SBUxMethod.get("srch-inp-crtrYr");
			console.log(apcCd,crtrYr);
			if(apcCd == null || apcCd == "" || apcCd === undefined){
				return;
			}
			//comReport.js
			gfn_popClipReport("APC전수조사", "fm/fcltReport.crf", {
				apcCd 		: gfn_nvl(apcCd)
				, crtrYr 	: gfn_nvl(crtrYr)
			});
		}

	</script>