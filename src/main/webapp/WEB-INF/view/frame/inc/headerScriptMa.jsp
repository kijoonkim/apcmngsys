<%@ include file="./headerScript.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    document.addEventListener('DOMContentLoaded', function() {
        const targetNode = document.body;

        const config = {
            childList: true,            // 자식 노드의 추가/삭제 감지
            subtree: true,              // 모든 하위 노드의 변경사항 감지
            attributes: true,           // 속성 변화 감지
            attributeFilter: ['class', 'style'], // class와 style 속성 변화만 감지
            attributeOldValue: true     // 이전 속성 값 저장
        };

        function setupMouseMoveEvent(targetDiv) {
            targetDiv.style.position = 'absolute';

            document.addEventListener('mousemove', function(event) {
                targetDiv.style.left = event.pageX + 'px';
            });
        }

        const callback = function(mutationsList, observer) {
            for (let mutation of mutationsList) {

                // 1. datepicker 열때
                if (mutation.type === 'childList') {
                    mutation.addedNodes.forEach(function(node) {
                        if (node.nodeType === Node.ELEMENT_NODE && node.tagName.toLowerCase() === 'div') {
                            const classList = node.classList;
                            if (classList.contains('sbgrid_common') && classList.contains('sbgrid_child') && classList.contains('hasDatepicker')) {
                                adjustPosition(node);
                            }
                        }

                    });
                }

                // 2. combo 열때
                if (mutation.type === 'attributes' && mutation.attributeName === 'class' && mutation.target.tagName.toLowerCase() === 'div') {
                    const targetElement = mutation.target;
                    const classList = targetElement.classList;

                    if (classList.contains('sbgrid-ui-selectmenu-menu') && classList.contains('sbgrid-ui-front') && classList.contains('sbgrid-ui-selectmenu-open')) {
                        adjustPosition(targetElement);
                    }
                }

               /* if (mutation.type === 'attributes' && mutation.attributeName === 'style') {
                    const targetElement = mutation.target;

                    if (targetElement.id === "SBHE_VL_bandgvwDetail") {
                        // position이 static이면 relative로 변경
                        if (window.getComputedStyle(targetElement).position === 'static') {
                            targetElement.style.position = 'relative';
                        }

                        const leftValue = window.getComputedStyle(targetElement).left;

                        // left 값이 auto가 아닐 때만 실행
                        if (leftValue !== 'auto') {
                            console.log('left 값이 auto에서 다른 값으로 변경되었습니다:', leftValue);

                            // leftValue에서 숫자 부분만 추출하고 1.25를 곱함
                            const numericLeftValue = parseFloat(leftValue);
                            const newLeftValue = numericLeftValue * 1.25;

                            // 새로운 left 값을 설정 (단위 px 추가)
                            targetElement.style.left = newLeftValue + 'px';
                        }
                    }
                }*/
            }
        };

        // top과 left 값을 조정하는 함수
        function adjustPosition(element) {
            const style = window.getComputedStyle(element);
            const position = style.position;

            // 요소의 위치가 설정되어 있지 않으면 상대 위치로 변경
            if (position === 'static') {
                element.style.position = 'relative';
            }

            // 현재 top과 left 값을 가져와서 1.25배로 조정
            ['top', 'left'].forEach(function(prop) {
                let value = style[prop];

                // 값이 없거나 auto인 경우 0으로 설정
                if (!value || value === 'auto') {
                    value = '0px';
                }

                // 단위와 함께 숫자 추출 (예: '10px'에서 숫자 부분 추출)
                const matches = value.match(/^([-+]?[0-9]*\.?[0-9]+)([a-z%]*)$/);
                if (matches) {
                    let num = parseFloat(matches[1]);
                    const unit = matches[2];

                    // 값을 1.25배로 곱함
                    num *= 1.25;

                    // 새로운 값 설정
                    element.style[prop] = num + unit;
                }
            });
        }

        // 더블클릭 이벤트를 감지하는 함수
        function handleTdDoubleClick(event) {
            const targetElement = event.target;

            // 특정 클래스 집합을 가진 td 요소가 더블클릭되었는지 확인
            if (targetElement.tagName.toLowerCase() === 'td' &&
                targetElement.classList.contains('sbgrid_focus_st')
            ) {
                const targetTr = targetElement.closest('tr');
                if (targetTr) {
                    const trRect = targetTr.getBoundingClientRect();
                    const tdRect = targetElement.getBoundingClientRect();

                    const trLeft = trRect.left;
                    const tdLeft = tdRect.left;

                    const leftDifference = tdLeft - trLeft;

                    const colIndex = targetElement.getAttribute('data-colindex');
                    if (colIndex) {
                        const inputId = "SBHE_col_"+colIndex+"_input_bandgvwDetail";
                        const inputElement = document.getElementById(inputId);

                        if (inputElement) {
                            // input의 스타일을 td와 맞추어 설정
                            inputElement.style.left = (leftDifference * 1.25) + 'px';
                        }
                    }
                }
            }
        }

        // 전체 문서에서 더블클릭 이벤트를 감지하고 특정 td 요소에서만 실행
        document.addEventListener('dblclick', handleTdDoubleClick);

        // MutationObserver 인스턴스 생성 및 콜백 함수 등록
        const observer = new MutationObserver(callback);

        // 대상 노드에 대해 감시 시작
        observer.observe(targetNode, config);
    });
</script>
