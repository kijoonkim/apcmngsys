<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title></title>
    
    <script src="/resource/pdfjs/build/pdf.js"></script>
    <link 	href="/resource/pdfjs/web/viewer.css" rel="stylesheet" type="text/css">
    <script src="/resource/pdfjs/web/viewer.js"></script>
    
</head>
<body oncontextmenu="return false">
	<section id="compopfileview1">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start; padding-top: 0px" >
				<div style="width:100%">
					<div style="display:flex;float: right; padding-bottom:5px">
						<sbux-button uitype="normal" text="종료" 		style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-close" ></sbux-button>
					</div>
				</div>
			</div>
 
			<div class="box-body" style="padding-top: 0px">
				<div id="preview-div" class="card" style="height:550px;border:1px solid #f4f4f4;overflow:auto;">
				</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script>
 
function compopfileview1(type, event) {
	
	//id 선언
	var modalId  		= '#compopfileview1';
	var modalDivId 		= 'modal-fileView';
	
	//open modal
	SBUxMethod.openModal(modalDivId);	
	
	//close event
	$(modalId).find('.cu-btn-close').off('click');
	$(modalId).find('.cu-btn-close').click(function(){
	 	SBUxMethod.closeModal(modalDivId);
	});		
	
	var renderPDF = function(data) {
	    pdfjsLib.getDocument(data).promise.then(function(pdf) {
	        pdf.getPage(1).then(function(page) {
	            const canvas 	= document.createElement('canvas');
	            const context 	= canvas.getContext('2d');
	            const viewport 	= page.getViewport({
	                scale: 1.5
	            });
	            canvas.height = viewport.height;
	            canvas.width = viewport.width;
 
	            const renderContext = {
	                canvasContext: context,
	                viewport: viewport
	            };
 
	            page.render(renderContext).promise.then(function() {
	                document.getElementById('preview-div').innerHTML = '';
	                document.getElementById('preview-div').appendChild(canvas);
	            });
	        });
	    });
	}
    
	//preview
	if(type=='image'){
		
		var htm = '<img id="file_preview_img" />';
		$('#preview-div').html(htm);
		var file 	= event.target.files[0];
		var reader 	= new FileReader();
	    reader.onload = function(e) {
	    	$('#file_preview_img').attr("src", e.target.result);
	    };	
	    reader.readAsDataURL(file);
	    
	} else if(type=='pdf') {
		
		$('#preview-div').html('');
		var file 	= event.target.files[0];
		var reader 	= new FileReader();
	    reader.onload = function() {
	        var typedArray = new Uint8Array(event.result);
	        renderPDF(typedArray);
	    };	
	    reader.readAsArrayBuffer(file);
	}
	
}
 
 
</script>
</html>
