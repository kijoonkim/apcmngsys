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

/*
 * 화면 비율을 줄였을 때 그리드내에 있는 셀렉트, 인풋등등 위치를 찾지못할때
 
    const bodyTransform = window.getComputedStyle(document.body).transform;
    let scaleX = 1;
    let scaleY = 1;

    if (bodyTransform !== 'none') {
        // matrix 또는 matrix3d로부터 scale 값을 추출
        const values = bodyTransform.match(/matrix.*\((.+)\)/)[1].split(', ');

        // 2D 변환인 경우 (matrix)
        if (values.length === 6) {
            scaleX = (1 / parseFloat(values[0]));
            scaleY = (1 /parseFloat(values[3]));
        }

        document.body.style.setProperty('width', Math.trunc(scaleX * 100) + '%', 'important');
        document.body.style.setProperty('height', Math.trunc(scaleY * 100) + '%', 'important');
    }


    window.addEventListener('keydown', function(event) {
        if (event.altKey && (event.key === 'F' || event.key === 'f' || event.key === 'ㄹ')) {
            event.preventDefault();
            cfn_search();
        }
    });

    document.addEventListener('DOMContentLoaded', function() {
        let isDragging = false;
        let clickDivName = null;

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

                    if(prop == 'top') {
                        // 값을 1.25배로 곱함
                        num *= scaleX;

                        // 새로운 값 설정
                        element.style[prop] = num + unit;
                    } else if (prop == 'left') {
                        // 값을 1.25배로 곱함
                        num *= scaleY;

                        // 새로운 값 설정
                        element.style[prop] = num + unit;
                    }
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

                const parentTable = targetElement.closest('table');
                let tableName = "";

                if(parentTable) {tableName = parentTable.id.substring("SBHE_DT_".length);}
                const targetTr = document.getElementById("SBHE_" + tableName);
                const rowNumTable = document.getElementById("SBHE_RHT_" + tableName);

                if (targetTr) {
                    const trRect = targetTr.getBoundingClientRect();
                    const tdRect = targetElement.getBoundingClientRect();

                    const trLeft = trRect.left;
                    const tdLeft = tdRect.left;
                    const trTop = trRect.top;
                    const tdTop = tdRect.top;

                    const leftDifference = tdLeft - trLeft;
                    const topDifference = tdTop - trTop;

                    const colIndex = targetElement.getAttribute('data-colindex');
                    if (colIndex) {
                        const inputId = "SBHE_col_"+colIndex+"_input_"+tableName;
                        const inputElement = document.getElementById(inputId);

                        if (inputElement) {
                            // input의 스타일을 td와 맞추어 설정
                            inputElement.style.left = (leftDifference * scaleX) + 'px';
                        }
                    }
                }
            }
        }

        document.addEventListener('mousedown', function(event) {
            const targetElement = event.target;
            const parentTable = targetElement.closest('div');
            let divName = parentTable.id.substring("SBHE_FHA_".length);
            const classList = [...targetElement.classList];
            // 비교할 클래스 목록
            const requiredClasses = ['sbgrid_ia', 'sbgrid_wca', 'sbgrid_common'];

            const classesMatch =
                classList.length === requiredClasses.length && // 길이가 같은지 확인
                requiredClasses.every(className => classList.includes(className)); // 모든 클래스가 포함되어 있는지 확인

            if (classesMatch) {
                isDragging = true; // 드래그 상태 시작
                clickDivName = divName;
                handleDivClickDrag(divName)
            }
        });

        document.addEventListener('mousemove', function(event) {
            if (isDragging) {
                if (event.target.tagName === 'TD') {
                    const parentTable = event.target.closest('table');
                    let tableName = parentTable.id.substring("SBHE_FHT_".length);
                    handleDivClickDrag(tableName)
                }
            }
        });

        document.addEventListener('mouseup', function() {
            isDragging = false;
            clickDivName = null;
        });

        function handleDivClickDrag(tableName) {
            const inputElement = document.getElementById("SBHE_VL_" + tableName);
            if (inputElement) {
                const rowNumTable = document.getElementById("SBHE_RHT_" + tableName);
                const tableRect = document.getElementById("SBHE_DT_" + tableName).getBoundingClientRect();
                const line = inputElement.getBoundingClientRect();
                let rowNumTableWidth = 0;

                const tableLeft = tableRect.left;
                const lineLeft = line.left;

                const leftDifference = lineLeft - tableLeft;

                if(rowNumTable) {
                    rowNumTableWidth = rowNumTable.offsetWidth;
                }

                console.log(tableRect.left)

                inputElement.style.left = (parseFloat(leftDifference * scaleX) + rowNumTableWidth) + 'px';
            }
        }

        // 전체 문서에서 더블클릭 이벤트를 감지하고 특정 td 요소에서만 실행
        document.addEventListener('dblclick', handleTdDoubleClick);

        // MutationObserver 인스턴스 생성 및 콜백 함수 등록
        const observer = new MutationObserver(callback);

        // 대상 노드에 대해 감시 시작
        observer.observe(targetNode, config);
    });
*/
</script>
