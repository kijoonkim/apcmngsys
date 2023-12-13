<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title : SBUx2.6</title>
</head>
<body>
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;" >
                <div style="margin-left: auto;">
                    <sbux-button id="btnChildCmntQuit" name="btnChildCmntQuit" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-bbsChildCmntModal')"></sbux-button>
                </div>
            </div>
            <div class="box-body">
                <div class="sbt-con-wrap">
                    <ul>
                        <li style="display:inline-block;float:right;width: 100%;vertical-align:top;">
                            <div class="sbt-grid-wrap">

                                <div class="sbt-wrap-body">




                                    <div class ="sbt-wrap-body">
                                          <table class="cmntTbl" id="cmntList" >
                                              <colgroup>
                                                <col style="width:20%">
                                                <col style="width:50%">
                                                <col style="width:20%">
                                              </colgroup>
                                            <tr>
                                                <th >답글작성</th>
                                                <td>
                                                    <sbux-input id="dtl-input-cmntChildCn" name="dtl-input-cmntChildCn" uitype="text"></sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-button id="btnInsertChildCmnt" name="btnInsertChildCmnt" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_regChildComment"></sbux-button>
                                                </td>
                                            </tr>
                                          </table>
                                      </div>
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
    function fn_regChildComment(){
        fn_callregChildComment();
    }

	function fn_childCmntInit(cmntNo){
		SBUxMethod.set("dtl-input-orngChildCmntNo",cmntNo);
	}

    async function fn_callregChildComment(){
        const bbsNo = SBUxMethod.get("dtl-input-orngBbsNo");
        const cmntNo = SBUxMethod.get("dtl-input-orngCmntNo");
        const cmntChildCn = SBUxMethod.get("dtl-input-cmntChildCn");
        const cmntChildNo = SBUxMethod.get("dtl-input-orngChildCmntNo");
        const apcCd = gv_apcCd;
        const postJsonPromise = gfn_postJSON("/am/bbs/insertBbsChildCmnt.do", {
        	apcCd : apcCd
            , bbsNo: bbsNo
            , cmntCn : cmntChildCn
            , cmntNo : cmntNo
            , cmntChildNo : cmntChildNo
        });
        const data = await postJsonPromise;
        SBUxMethod.set("dtl-input-orngChildCmntNo", "");
        gfn_closeModal('modal-bbsChildCmntModal',fn_callBackSelectComment,bbsNo);



}




</script>
</html>