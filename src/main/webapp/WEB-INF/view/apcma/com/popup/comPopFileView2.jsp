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
	<section id="compopfileview2">
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

function compopfileview2(type, fkey, comp_code, client_code) {
	
	//id 선언
	var modalId  		= '#compopfileview2';
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
		
		var url =  '/com/getFileImage.do';
		url		+= '?fkey=' + fkey;
		url		+= '&comp_code=' + comp_code;
		url		+= '&client_code=' + client_code;
    	$('#file_preview_img').attr("src", url);
	    
	} else if(type=='pdf') {
		
		var htm = '<div id="pdfViewer" style="width:100%;height:550px;"></div>';
		$('#preview-div').html(htm);
		
		var url = '/com/getPdfFileDown.do';
		url		+= '?fkey=' + fkey;
		url		+= '&comp_code=' + comp_code;
		url		+= '&client_code=' + client_code;
		
console.log('url:', url);

// let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1200, height=800, top=0,left=0";
// window.open(url,"_blank", options);

	    pdfjsLib.getDocument(url).promise.then(function(pdf) {
	        // Get the first page
	        pdf.getPage(1).then(function(page) {
	            var pdfViewer = document.getElementById('pdfViewer');

	            // Set up canvas for rendering
	            var canvas = document.createElement('canvas');
	            pdfViewer.appendChild(canvas);

	            // Set canvas dimensions to match the PDF page
	            var viewport = page.getViewport({ scale: 1.5 });
	            canvas.width = viewport.width;
	            canvas.height = viewport.height;

	            // Render PDF page into canvas context
	            var context = canvas.getContext('2d');
	            var renderContext = {
	                canvasContext: context,
	                viewport: viewport
	            };
	            page.render(renderContext);
	        });
	    });		
	}
	
}

 
</script>
</html>