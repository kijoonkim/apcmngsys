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

                // 3. 기존 input 요소의 style 속성이 변경될 때
                if (mutation.type === 'attributes' && mutation.attributeName === 'style' && mutation.target.tagName.toLowerCase() === 'input') {
                    const targetElement = mutation.target;
                    const classList = targetElement.classList;

                    // 특정 클래스 집합만 체크
                    if (classList.contains('sbgrid_input_text') && classList.contains('sbgrid_input_text_st') && classList.contains('sbgrid_common')) {
                        console.log('특정 클래스 집합을 가진 input의 style 속성이 변경되었습니다:', targetElement);

                        // top과 left 값을 1.25배로 조정
                        adjustPosition(targetElement);
                    }
                }
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
        /*
        // 더블클릭 이벤트를 감지하는 함수
        function handleTdDoubleClick(event) {
            const targetElement = event.target;

            // 특정 클래스 집합을 가진 td 요소가 더블클릭되었는지 확인
            if (
                targetElement.tagName.toLowerCase() === 'td' &&
                targetElement.classList.contains('sbgrid_cell') &&
                targetElement.classList.contains('sbgrid_cell_border_st') &&
                targetElement.classList.contains('sbgrid_cell_st') &&
                targetElement.classList.contains('sbgrid_data_cell_st') &&
                targetElement.classList.contains('sbgrid_bandgvwDetail_col_col_10_style') &&
                targetElement.classList.contains('sbgrid_input_data_col_st') &&
                targetElement.classList.contains('sbgrid_ellipsis') &&
                targetElement.classList.contains('sbgrid_common') &&
                targetElement.classList.contains('sbgrid_focus_st')
            ) {
                console.log('특정 클래스 집합을 가진 td가 더블클릭되었습니다:', targetElement);

                // td의 data-colindex 속성 값으로 input 위치 배치
                const colIndex = targetElement.getAttribute('data-colindex');
                console.log(colIndex);
                if (colIndex) {
                    const inputId = "SBHE_col_"+colIndex+"_input_bandgvwDetail";
                    console.log(inputId)
                    const inputElement = document.getElementById(inputId);

                    if (inputElement) {
                        // 스타일 변경 감지 후 위치 배치 함수 호출
                        observeInputStyleChange(inputElement, targetElement);
                    }
                }
            }
        }

        // input 요소의 스타일이 변경된 후 위치를 조정하는 함수
        function observeInputStyleChange(inputElement, tdElement) {
            const inputObserver = new MutationObserver(function(mutationsList) {
                for (let mutation of mutationsList) {
                    if (mutation.type === 'attributes' && mutation.attributeName === 'style') {
                        console.log('input의 style 속성이 변경되었습니다:', inputElement);
                        // 스타일 변경 후 위치 조정
                        positionInputAboveTd(tdElement, inputElement);

                        // 감시 종료
                        inputObserver.disconnect();
                        break;
                    }
                }
            });

            // style 속성 변경 감시 시작
            inputObserver.observe(inputElement, { attributes: true, attributeFilter: ['style'] });
        }

        // td 요소의 위치를 기반으로 input 요소를 배치하는 함수
        function positionInputAboveTd(tdElement, inputElement) {
            const tdRect = tdElement.getBoundingClientRect();

            // input의 스타일을 td와 맞추어 설정
            inputElement.style.position = 'absolute';
            inputElement.style.top = tdRect.top+'px';
            inputElement.style.left = (window.scrollX+tdRect.left)+'px';
            inputElement.style.width = tdRect.width+'px';
            inputElement.style.height = tdRect.height+'px';
            inputElement.style.zIndex = 1000; // 필요에 따라 z-index를 조정하여 td 위에 보이도록 설정
        }

        // 전체 문서에서 더블클릭 이벤트를 감지하고 특정 td 요소에서만 실행
        document.addEventListener('dblclick', handleTdDoubleClick);*/

        // MutationObserver 인스턴스 생성 및 콜백 함수 등록
        const observer = new MutationObserver(callback);

        // 대상 노드에 대해 감시 시작
        observer.observe(targetNode, config);
    });
</script>
