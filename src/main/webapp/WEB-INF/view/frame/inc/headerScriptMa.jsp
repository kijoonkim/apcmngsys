<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 파일첨부 팝업 Modal -->
<div>
    <sbux-modal style="width:1300px" id="modal-comPopFileMng" name="modal-comPopFileMng" uitype="middle" header-title="파일첨부관리" body-html-id="body-modal-comPopFileMng" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-comPopFileMng">
	<jsp:include page="../../../com/popup/comPopFileMng.jsp"></jsp:include>
</div>

<!-- 파일 미리보기  -->
<div>
    <sbux-modal style="width:100%" id="modal-fileView" name="modal-fileView" uitype="middle" header-title="파일 미리보기" body-html-id="body-modal-fileView" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-fileView">
	<jsp:include page="../../../com/popup/comPopFileView2.jsp"></jsp:include>
</div>

<!-- 파일 다운로드   -->
<iframe id="downloadFrame" style="display:none;"></iframe>

<!-- 결재관리 팝업 Modal -->
<div>
    <sbux-modal style="width:1300px" id="modal-comPopAppvMng" name="modal-comPopAppvMng" uitype="middle" header-title="결재관리" body-html-id="body-modal-comPopAppvMng" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-comPopAppvMng">
	<jsp:include page="../../../com/popup/comPopAppvMng.jsp"></jsp:include>
</div>
<script>
    window.addEventListener('keydown', function(event) {
        if (event.altKey && (event.key === 'F' || event.key === 'f' || event.key === 'ㄹ')) {
            event.preventDefault();
            cfn_search();
        }
    });
</script>
