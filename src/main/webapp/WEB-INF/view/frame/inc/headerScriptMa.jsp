<%@ include file="./headerScript.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    body{
        transform: scale(0.8) !important; /* 80% 배율 */
        transform-origin: top left !important; /* 시작 지점을 왼쪽 위로 고정 */
        background-color: #FFFFFF !important;
        width: 125% !important;
        height: 125% !important;
        margin: 0 !important;
        display: flex !important;
        flex-direction: column !important;
    }

    body > section {
        flex: 1;
    }
</style>

<link rel="stylesheet" href="../../../css/admin/dl_apcma_custom.css">
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
    <sbux-modal style="width:1300px" id="modal-comPopAppvMng" name="modal-comPopAppvMng" uitype="middle" header-title="결재관리" body-html-id="body-modal-comPopAppvMng" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
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

   /* // 감시할 부모 요소를 선택합니다
    const targetNode = document.body; // 동적 요소가 생성될 부모 요소 ID

    // 감시할 클래스 목록
    const requiredClasses = ['sbgrid_common', 'sbgrid_child'];

    // 감시할 ID 설정
    const targetId = 'sbgrid-ui-datepicker-div';

    // 감시할 앵커 ID 설정
    const anchorId = 'sbgrid-ui-datepicker-div';

    // sbgrid-ui-datepicker-div 요소를 가져옴
    const anchorElement = document.getElementById(anchorId);
    const parentElement = anchorElement ? anchorElement.parentElement : null;

    // MutationObserver 설정
    if (targetNode) {
        // MutationObserver 설정
        const observer = new MutationObserver((mutationsList) => {
            mutationsList.forEach((mutation) => {
                if (mutation.type === 'attributes' && mutation.attributeName === 'class') {
                    const targetElement = mutation.target;

                    // 대상 요소가 특정 클래스를 포함하게 되었는지 확인
                    if (targetElement.classList.contains('sbgrid-ui-selectmenu-open')) {
                        console.log("test")
                        // 기존 top과 left 값 가져오기 (기본값이 없으면 0px로 설정)
                        const originalTop = parseInt(window.getComputedStyle(targetElement).top) || 0;
                        const originalLeft = parseInt(window.getComputedStyle(targetElement).left) || 0;

                        // 새로운 위치 계산 (예: 20px씩 더하기)
                        const newTop = originalTop * 1.25;
                        const newLeft = originalLeft * 1.25;

                        targetElement.style.top = newTop+'px';
                        targetElement.style.left = newLeft + 'px';
                    }
                }

                if (mutation.type === 'childList') {

                    mutation.addedNodes.forEach((node) => {
                        // sbgrid-ui-datepicker-div가 동적으로 생성되었는지 확인
                        if (node.nodeName === 'DIV' && node.id === anchorId) {
                            // sbgrid-ui-datepicker-div의 부모 요소 가져오기
                            const parentElement = node.parentElement;

                            // 형제 노드 생성/삭제 감시를 위한 MutationObserver 설정
                            const siblingObserver = new MutationObserver((siblingMutations) => {
                                siblingMutations.forEach((siblingMutation) => {
                                    if (siblingMutation.type === 'childList') {
                                        siblingMutation.addedNodes.forEach((siblingNode) => {
                                            if (siblingNode.nodeName === 'DIV' && siblingNode !== node) {
                                                if (siblingNode.classList.contains('sbgrid-ui-selectmenu-open')) {
                                                    console.log("test")
                                                    // 기존 top과 left 값 가져오기 (기본값이 없으면 0px로 설정)
                                                    const originalTop = parseInt(window.getComputedStyle(siblingNode).top) || 0;
                                                    const originalLeft = parseInt(window.getComputedStyle(siblingNode).left) || 0;

                                                    // 새로운 위치 계산 (예: 20px씩 더하기)
                                                    const newTop = originalTop * 1.25;
                                                    const newLeft = originalLeft * 1.25;

                                                    siblingNode.style.top = newTop+'px';
                                                    siblingNode.style.left = newLeft + 'px';
                                                }

                                                if (siblingNode.classList.contains('hasDatepicker')) {
                                                    console.log("test2")
                                                    // 기존 top과 left 값 가져오기 (기본값이 없으면 0px로 설정)
                                                    const originalTop = parseInt(window.getComputedStyle(siblingNode).top) || 0;
                                                    const originalLeft = parseInt(window.getComputedStyle(siblingNode).left) || 0;

                                                    // 새로운 위치 계산 (예: 20px씩 더하기)
                                                    const newTop = originalTop * 1.25;
                                                    const newLeft = originalLeft * 1.25;

                                                    siblingNode.style.top = newTop+'px';
                                                    siblingNode.style.left = newLeft + 'px';
                                                }
                                            }
                                        });
                                    }
                                });
                            });

                            // 부모 요소에서 자식 노드 추가 및 제거 감지
                            siblingObserver.observe(parentElement, { childList: true });

                            // sbgrid-ui-datepicker-div가 발견되었으므로 body 감시는 종료
                            observer.disconnect();
                        }
                    });
                }
            });
        });

        // observer가 감시할 설정 옵션 (속성 변경 감지 + 하위 요소 포함)
        const config = { attributes: true, attributeFilter: ['class'], childList: true, subtree: true };

        // observer 시작
        observer.observe(document.body, config);
    }*/
</script>
