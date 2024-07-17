<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 사진 띄우기</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<sbux-button id="btnEndIamege" name="btnEndIamege" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-image')"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<div >
					<img id="modalImage" src="" alt="Image" style="width:1028px;height:400px;">
				</div>
			</div>
		</div>
	</section>
</body>
<script >


	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popImage = {
		modalId: 'modal-iamge',
		init: async function(_atchflNo, _prntsTblNo, _prntsTblSeCd) {

			const modalImage = document.getElementById('modalImage');

			const param = {
					atchflNo 	: _atchflNo
				  , prntsTblNo 	: _prntsTblNo
				  , prntsTblSeCd : _prntsTblSeCd
			}
			// POST 요청을 보내는 부분
            const response = await fetch('/am/cmns/getImage.do', {
                method: 'POST',
                headers: {
                	'Content-Type': 'application/json'
                },
                body: JSON.stringify(param)
            });

            if (response.ok) {
                const blob = await response.blob();
                modalImage.src = URL.createObjectURL(blob); // Blob을 URL로 변환하여 이미지 소스로 설정
            } else {
                alert('이미지를 가져오는 데 실패했습니다.');
            }
		},
		close: function() {
			gfn_closeModal(this.modalId);
		},
	}

</script>
</html>