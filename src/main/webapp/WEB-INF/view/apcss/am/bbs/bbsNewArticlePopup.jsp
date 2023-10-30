<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<sbux-button id="btnsaveNewArticle" name="btnsaveNewArticle" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_ArticleCreate"></sbux-button>
					<sbux-button id="btnEndNewArticle" name="btnEndNewArticle" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-bbsNewArticlePopup','fn_search')"></sbux-button>

				</div>
			</div>
			<div class="box-body">
				<div class="sbt-con-wrap">
                	<ul>
	                    <li style="display:inline-block;float:right;width: 100%;vertical-align:top;">
		                    <div class="sbt-grid-wrap">

		                        <div class="sbt-wrap-body">
		                            <form id="frm1" name="frm1" method="post">
		                            <sbux-input id="dtl-input-orngBbsNo" name="dtl-input-orngBbsNo" uitype="hidden"></sbux-input>
		                            <sbux-input id="dtl-input-orngChildCmntNo" name="dtl-input-orngChildCmntNo" uitype="hidden"></sbux-input>
		                            <div class ="sbt-wrap-body">
			                            <table class="table table-bordered tbl_fixed">
			                            <colgroup>
												<col style="width: 10%">
												<col style="width: 15%">
												<col style="width: 10%">
												<col style="width: 15%">
												<col style="width: 10%">
												<col style="width: 15%">
												<col style="width: 10%">
												<col style="width: 15%">

										</colgroup>

			                                <tr>
			                                    <th scope="row">구분</th>
			                                    <td colspan="8">
			                                    	<sbux-select id="dtl-select-bbsSeCd" name="dtl-select-bbsSeCd" uitype="single"
			                                    		jsondata-ref="jsonComBbsSeCd"
			                                    		unselected-text="선택"
		                                    		></sbux-select>
			                                    </td>
			                                </tr>
			                                <tr>
			                                    <th scope="row">제목</th>
			                                    <td colspan="8">
			                                        <sbux-input id="dtl-input-bbsTitle" name="dtl-input-bbsTitle" uitype="text" required style="width:100%"></sbux-input>
			                                    </td>
			                                </tr>
			                                <tr>
			                                    <th scope="row">내용</th>
			                                    <td colspan="8">
			                                        <sbux-textarea  rows="10" cols="110"  id="dtl-input-bbsSubject" name="dtl-input-bbsSubject"  uitype="normal"></sbux-textarea>
			                                    </td>
			                                </tr>

			                              </table>
									</div>
		                            </form>
		                        </div>
		                    </div>
	                    </li>
                    </ul>
                </div>

    		</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	//창고 등록
	var jsonWarehouse = []; // 그리드의 참조 데이터 주소 선언
	async function fn_bbsJsp() {
		fn_selectWarehouseList();
	}

	function newArticle_clear(){
		SBUxMethod.set("dtl-input-bbsTitle","");
		SBUxMethod.set("dtl-input-bbsSubject","");
	}
	async function fn_ArticleCreate(){
		let bbsSeCd = SBUxMethod.get("dtl-select-bbsSeCd");
		let bbsTitle = SBUxMethod.get("dtl-input-bbsTitle");
		let bbsSubject = SBUxMethod.get("dtl-input-bbsSubject");
		if (!SBUxMethod.get("dtl-select-bbsSeCd")) {
            alert("구분코드를 선택하세요.");
            return;
        }
		if (!SBUxMethod.get("dtl-input-bbsTitle")) {
            alert("제목을 입력하세요.");
            return;
        }

        if (!SBUxMethod.get("dtl-input-bbsSubject")) {
            alert("내용을 입력하세요.");
            return;
        }
		const postJsonPromise = gfn_postJSON("/am/bbs/insertBbs.do", {
			bbsSeCd : bbsSeCd
			, bbsTitle : bbsTitle
			, bbsSubject : bbsSubject
		});
		newArticle_clear();
		gfn_closeModal('modal-bbsNewArticlePopup','fn_search');



	}


</script>
</html>