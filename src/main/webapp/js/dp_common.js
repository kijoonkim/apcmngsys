var basePath = sessionStorage.getItem("contextRootPath");


/** 빈값 체크 */
$.fn.emptyCheck = function(type) {
	var value = $.trim(this.val() + "");
	if (!value) {
		alert($(this).attr("title") + "을(를) 입력해야 합니다.");
		// 20180621 문성훈 추가 페이지 포커스시 상단 헤드가 고정이어서 그부분에 커서가 포커스 되어서 보임
//		$(window).scrollTop($("input").offset().top - 100)
		$("html").scrollTop(0);

		if (type == 0) {
			$(this).select();
		} else {
			$(this).focus();
		}
		return false;
	}
	return true;
};

/*
 * 체크박스 전체 선택 fn
 */
fn_checkAll = function(obj, byName) {
	if ($(obj).is(":checked")) {
		$("input[name=" + byName + "]").prop("checked", true);
	} else {
		$("input[name=" + byName + "]").prop("checked", false);
	}
};

/*
 * 체크박스 체크 여부에 따라 대표 체크 박스 체크/해제 fn
 */
fn_checkbox = function(className, targetId) {
	var count = 0;

	$("." + className).each(function(idx) {
		if (!$(this).is(":checked")) count++;
	});

	if (count > 0) {
		$("#" + targetId).prop("checked", false);
	} else {
		$("#" + targetId).prop("checked", true);
	}
};

resetData = function(obj) {
	$(obj).siblings("input").val("");
};

$(document).on("click", ".resetBtn", function(e) {
	e.stopImmediatePropagation();
	resetData(this);
});

var rval = "";
var timer = null;
checker = function(obj, count, textlimitName) {
	if (rval != obj.value) {
		if (textlimitName && document.getElementById(textlimitName)) {
			document.getElementById(textlimitName).innerHTML = obj.value
					.bytes();
		}
		rval = obj.value;
	}
	if (obj.value.bytes() > count) {
		alert("최대 " + count + "byte이므로 초과된 글자수는 자동으로 삭제됩니다.");
		obj.value = obj.value.cut(count, '');
		stopchecker();
	}
	if (textlimitName) {
		timer = setTimeout(function() {
			checker(obj, count, textlimitName);
		}, 10);
	} else {
		timer = setTimeout(function() {
			checker(obj, count);
		}, 10);
	}
};

stopchecker = function() {
	clearTimeout(timer);
};

String.prototype.bytes = function() {
	var str = this;
	var l = 0;
	for (var i = 0; i < str.length; i++)
		l += (str.charCodeAt(i) > 128) ? 2 : 1;

	return l;
};

String.prototype.cut = function(len, tail) {
	if (tail == null) {
		tail = '...';
	}
	var str = this;
	var l = 0;
	for (var i = 0; i < str.length; i++) {
		l += (str.charCodeAt(i) > 128) ? 2 : 1;
		if (l > len)
			return str.substring(0, i) + tail;
	}
	return str;
};

// contents를 load후 팝업
loadPopup = function(popupDivId, popupUrl, popupParams) {
	if (popupUrl != null) {
		// 해당 영역을 지우고 ajax load를 이용하여 컨텐츠를 로딩한다.
		$(popupDivId).empty();
		$(popupDivId).load(popupUrl, popupParams, function() {
		});
	}
};

// 클라이언트 팝업
clientLoadPopup = function(popupDivId, popupUrl, popupParams) {
	if(popupUrl != null) {
		// 해당 영역을 지우고 ajax load를 이용하여 컨텐츠를 로딩한다.
		$(popupDivId).empty();

		$(popupDivId).load(popupUrl, popupParams, function() {
			$.magnificPopup.open({
				items: {
					src: popupDivId
				}
				, type: "inline"
				, enableEscapeKey : false
			});
		});
	}
};

// 팝업 닫기
closePopup = function() {
	$('#COMMON_POP_UP_CLOSE_BTN').trigger('click');
};
// 푸터 팝업 닫기
fooClosePopup = function(){
	$("#closePopup").trigger("click");
};

// 숫자만 입력 가능
fn_numberOnly = function($obj) {
	$obj.keyup(function(event) {
		if (event.which && (event.which <= 47 || event.which >= 58)
				&& event.which != 8) {
			event.preventDefault();
		}
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
	});
};

// ajax 공통 셋팅 ERROR 메시지
$.ajaxSetup({
	error : function(req, status, error) {
		$("#loading").hide();
		console.log("### code : " + req.status + "\n### error : " + error);
		if(req.status == 500) {
			alert("현재 서비스가 원활하지 않습니다.\n잠시후 다시 이용해 주십시오.");
			console.log("500!");
			location.href = "${basePath}/login/a/n/logOut.do?requestKind=1";
		}
		if(req.status == 10001) {
//			alert("세션이 만료 되어 로그아웃 됩니다.");
			window.location.reload();
		}
	}
	, beforeSend : function(req) {
		req.setRequestHeader("IS_AJAX", "isAjax");
	}
});

// 파일 선택 후 input창에 셋팅
$(document).on("change", ".filebox .hidden", function() {
	// 값이 변경되면
	if (window.FileReader) {
		// modern browser
		var filename = $(this)[0].files[0].name;
	} else {
		// old IE
		var filename = $(this).val().split("/").pop().split("\\").pop(); // 파일명만 추출
	}
	// 추출한 파일명 삽입
	$(this).parent("label").siblings(".upload_name").val(filename);
});

//파일 선택 후 input창에 셋팅 Client 교외활동
$(document).on("change", ".fileboxClient .hidden", function() {
	// 값이 변경되면
	if (window.FileReader) {
		// modern browser
		var filename = $(this)[0].files[0].name;
	} else {
		// old IE
		var filename = $(this).val().split("/").pop().split("\\").pop(); // 파일명만 추출
	}
	// 추출한 파일명 삽입
	$(".pp_file_linkbox .upload_name").text(filename);
});


// 파일 리셋 버튼

// 파일 x버튼에 onclick에 다음 함수를 걸어준다
// ex) fn_resetFile(this, '파일 태그의 아이디값');
fn_resetFile = function(obj, id) {
	var agent = navigator.userAgent.toLowerCase();
	// browser check
	if ((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1)
			|| (agent.indexOf("msie") != -1)) {
		// IE
		$("#" + id).replaceWith($("#" + id).clone(true));
	} else {
		// Other browser
		$("#" + id).val("");
	}

	// 리셋버튼 기능
	resetData(obj);
};

// datepicker 설정
function datePicker(id) {
	var dates = $("#" + id)
			.datepicker(
					{
						dateFormat : 'yy-mm-dd',
						showOn : "both",
						buttonText : "<a href='javascript:void(0);' class='ad_calendar_img'>달력열기</a>",
						closeText : '닫기',
						prevText : '이전달',
						nexttext : '다음달',
						currentText : '오늘',
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						changeMonth: true,
						changeYear: true,
					});

	function getStrMonth(Month) {
		Month = Month + "";
		if (Month.length == 1) {
			Month = "0" + Month;
		}
		return Month;
	}

	function getStrDay(Day) {
		Day = Day + "";
		if (Day.length == 1) {
			Day = "0" + Day;
		}
		return Day;
	}
}

//JqGrid search용
function datePickerSearch(id) {
	var dates = $("#" + id)
	.datepicker(
			{
				dateFormat : 'yy-mm-dd',
				showOn : "both",
				buttonText : "<a href='javascript:void(0);' class='ad_calendar_img'>달력열기</a>",
				closeText : '닫기',
				prevText : '이전달',
				nexttext : '다음달',
				currentText : '오늘',
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
				               '7월', '8월', '9월', '10월', '11월', '12월' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
				                    '7월', '8월', '9월', '10월', '11월', '12월' ],
				dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				changeMonth: true,
				changeYear: true,
				beforeShow: function() {
				        setTimeout(function(){
				            $('.ui-datepicker').css('z-index', 99999999999999);
				        }, 0);
					}
			});

	function getStrMonth(Month) {
		Month = Month + "";
		if (Month.length == 1) {
			Month = "0" + Month;
		}
		return Month;
	}

	function getStrDay(Day) {
		Day = Day + "";
		if (Day.length == 1) {
			Day = "0" + Day;
		}
		return Day;
	}
}

// datepicker client 설정
function datePickerClient(id) {
	var dates = $("#" + id)
			.datepicker(
					{
						dateFormat : 'yy-mm-dd',
						showOn : "both",
						buttonText : "<a href='javascript:void(0);' class='calendar_open'>달력열기11111</a>",
						closeText : '닫기',
						prevText : '이전달',
						nexttext : '다음달',
						currentText : '오늘',
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						changeMonth: true,
						changeYear: true,
					});

	function getStrMonth(Month) {
		Month = Month + "";
		if (Month.length == 1) {
			Month = "0" + Month;
		}
		return Month;
	}

	function getStrDay(Day) {
		Day = Day + "";
		if (Day.length == 1) {
			Day = "0" + Day;
		}
		return Day;
	}
}

// datepicker client 설정
function datePickerCns(id) {
	var dates = $("#" + id)
			.datepicker(
					{
						dateFormat : 'yy-mm-dd',
						showOn : "both",
						buttonText : "<a href='javascript:void(0);' class='cs_calendar_img'>달력열기22222</a>",
						closeText : '닫기',
						prevText : '이전달',
						nexttext : '다음달',
						currentText : '오늘',
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						changeMonth: true,
						changeYear: true,
					});

	function getStrMonth(Month) {
		Month = Month + "";
		if (Month.length == 1) {
			Month = "0" + Month;
		}
		return Month;
	}

	function getStrDay(Day) {
		Day = Day + "";
		if (Day.length == 1) {
			Day = "0" + Day;
		}
		return Day;
	}
}

// datePicker 특허전용
function datePickerPat(id) {
	var dates = $("#" + id)
			.datepicker(
					{
						dateFormat : 'yymmdd',
						showOn : "both",
						buttonText : "<a href='javascript:void(0);' class='ad_calendar_img'>달력열기33333</a>",
						closeText : '닫기',
						prevText : '이전달',
						nexttext : '다음달',
						currentText : '오늘',
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						changeMonth: true,
						changeYear: true,
					});

	function getStrMonth(Month) {
		Month = Month + "";
		if (Month.length == 1) {
			Month = "0" + Month;
		}
		return Month;
	}

	function getStrDay(Day) {
		Day = Day + "";
		if (Day.length == 1) {
			Day = "0" + Day;
		}
		return Day;
	}
}

// 체크박스 체크
$.fn.emptyCheckBox = function() {

	if (!$(this).is(":checked")) {
		alert($(this).attr("title") + " 값을 체크해 주세요.");
		//상단으로 올리기
		$("html").scrollTop(0);
		$(this).focus();
		return false;
	}
	return true;
};

// 바이트 체크
$.fn.byteCheck = function(maxByte) {
	var codeByte = 0;
	var objLength = $(this).val().length;
	var stsBool = true;

	for (var i = 0; i < objLength; i++) {
		var oneChar = escape($(this).val().charAt(i));
		if (oneChar.length == 1) {
			codeByte++;
		} else if (oneChar.indexOf("%u") != -1) {
			codeByte += 3;
		} else if (oneChar.indexOf("%") != -1) {
			codeByte++;
		}

		if (Number(codeByte) > Number(maxByte)) {
			alert($(this).attr("title") + "의 입력 가능한 바이트수를 초과하였습니다.\n(byte제한: "
					+ maxByte + " byte)");
			// 글자수 삭제
			var objText = $(this).val().substring(0, i);
			$(this).val(objText);
			$(this).focus();
			stsBool = false;
			break;
		}
	}

	return stsBool;
};

//소수점 입력 클래스로
$(document).on("keypress", ".decimalPNum", function(evt) {
	if(event.keyCode != 13){

		var charCode = (evt.which) ? evt.which : event.keyCode;

		if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
			alert("소수점 숫자로만 입력이 가능합니다.");
	//		this.value = this.value.replace(/[^0-9]/g, "");
			return false;
		}

		// Textbox value
		var _value = event.srcElement.value;


		// 소수점(.)이 두번 이상 나오지 못하게
		var _pattern0 = /^\d*[.]\d*$/; // 현재 value값에 소수점(.) 이 있으면 . 입력불가

		if (_pattern0.test(_value)) {

			if (charCode == 46) {
				alert("소수점은 하나만 입력이 가능합니다.");
				this.value = _value;
				return false;
			}
		}

		// 소수점 첫째자리까지만 입력가능
	    var _pattern2 = /^\d{2}[.]\d{2,3}$/; // 현재 value값이 소수점 둘째짜리 숫자이면 더이상 입력 불가

	    if (_pattern2.test(_value)) {

	        this.value = _value;
	        return false;
	    }

		this.value = _value;
	}
});

// 숫자만 입력 클래스로
$(document).on("keyup focusout", ".numberOnly", function(e) {
	this.value = this.value.replace(/[^0-9]/g, "");
});

function delHangle(evt){
	var objTarget = evt.srcElement || evt.target;
	var _value = event.srcElement.value;
	if(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g.test(_value)){
		objTarget.value = null;
	}
}

function isNumberKey(evt){
	var charCode = (evt.which) ? evt.which : event.keyCode;
	var _value = event.srcElement.value;

	if(event.keyCode < 48 || event.keyCode > 57){
		if(event.keyCode != 46){
			return false;
		}
	}
	var _pattern1 = /^\d*[.]\d{1}$/;
	if(_pattern1.test(_value)){
		alert("소수점 첫째자리까지만 입력가능합니다.");
		return false;
	}
	return true;
}

// 첨부파일 다운로드
fn_fileDownload = function(basePath, fileId, fileNo) {
	if(fileId != null){
		location.href = basePath + "/cmm/fms/fileDownload.do?fimFileId=" + fileId;
	}
//	if(fileId != null){
//		location.href = basePath + "/cmm/fms/fileDownload.do?fileId=" + fileId
//		+ "&fileNo=" + fileNo;
//	}
};

// 입력 문자 바이트 체크
// obj: 자바스크립트 object
// maxByte: 체크할 byte수 (DB Byte)
function chkByte(obj, maxByte) {
	var str = obj.value;
	var str_len = str.length;

	var rbyte = 0;
	var rlen = 0;
	var one_char = "";
	var str2 = "";

	for (var i = 0; i < str_len; i++) {
		one_char = str.charAt(i);
		if (escape(one_char).length > 4) {
			rbyte += 3; // 한글3Byte
		} else if (str.charCodeAt(i) == 10) {
			rbyte += 2; // 엔터는 2byte
		} else {
			rbyte++; // 영문 등 나머지 1Byte
		}

		if (rbyte <= maxByte) {
			rlen = i + 1; // return할 문자열 갯수
		}
	}

	if (rbyte > maxByte) {
		var max = Math.floor(maxByte / 3);
		alert("한글 " + max + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
		str2 = str.substr(0, rlen - 1); // 문자열 자르기
		obj.value = str2;
		chkByte(obj, maxByte);
	}
}

//콤마 찍기
function comma(str){
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

// 콤마 풀기
function uncomma(str){
	str = String(str);
	return str.replace(/[^\d]+/g, '');
}

//input 값 입력시 콤마 찍기 키업 이벤트로
function commaKeyUp(obj){
	obj.value = comma(uncomma(obj.value));
}

//가로스크롤
$(document).on("mousewheel", ".rowScrollEvent", function(e) {
	e.preventDefault();
	e.stopImmediatePropagation();
	var wheelDelta = e.originalEvent.wheelDelta;
	if(wheelDelta > 0){
		//console.log("up");
		$(this).scrollLeft(-wheelDelta*5 + $(this).scrollLeft());
	}else{
		//console.log("down");
		$(this).scrollLeft(-wheelDelta*5 + $(this).scrollLeft());
	}
});

//input[type=file] 초기화
fn_clearFileBox = function(id){
	var agent = navigator.userAgent.toLowerCase();
	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
		// ie 일때 input[type=file] init.
		$("#"+id).replaceWith( $("#"+id).clone(true) );
		$("#"+id+"Name").val("");
	} else {
		// other browser 일때 input[type=file] init.
		$("#"+id).val("");
		$("#"+id+"Name").val("");
	}
}

fn_check_reg_exp_tel = function(formId,tagId){
	var telChk = /^\d{2,3}-\d{3,4}-\d{4}$/;
	var flag = true;
	if(!telChk.test($('#'+formId+" "+'#'+tagId).val())){
		alert("전화번호 형식이 올바르지 않습니다.\n - 를 포함한 숫자만 입력하세요.");
		$('#'+formId+" "+'#'+tagId).focus();
		flag = false;
	}
	return flag;
};

fn_check_reg_exp_cel = function(formId, tagId){
	var celChk = /^\d{3}-\d{3,4}-\d{4}$/;
	var flag = true;
	if(!celChk.test($('#'+formId+" "+'#'+tagId).val())){
		alert("휴대전화 형식이 올바르지 않습니다.\n - 를 포함한 숫자만 입력하세요.");
		$('#'+formId+" "+'#'+tagId).focus();
		flag = false;
	}
	return flag;
};

fn_check_reg_exp_email = function(formId, tagId){
	var emailChk = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var flag = true;
	if(!emailChk.test($('#'+formId+" "+'#'+tagId).val())){
		alert("이메일 형식이 올바르지 않습니다.");
		$('#'+formId+" "+'#'+tagId).focus();
		flag = false;
	}
	return flag;
};

sessionInvalidate = function() {
	$.ajax({
		url : sessionStorage.getItem("contextRootPath") + "/login/a/n/sessionInvalidateForDevAjax.do"
		, success : function() {
			console.log("session invalidate success!");
		}
	});
};

//휴대폰 번호 자동으로 하이픈 넣기
function fnReplaceHpNumber(hPNumber) {
	var orHpNum = "";
	var regNumber = /^[0-9]*$/;
	var replaceHpNumber = "";
	orHpNum = hPNumber.replace(/\-/g,'');

	if(!regNumber.test(orHpNum)) {
	    console.log("휴대폰 양식이 올바르지 않습니다. 확인 부탁 드립니다.");
	    return;
	}
	replaceHpNumber = orHpNum.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3")
	return replaceHpNumber;
}


/**
 * Null Object 체크
 * @param el
 * @returns
 */
function isNullObject(el) {
	return (el == null || el == "undefined" || typeof el == "undefined") ? true : false;
}


/**
 * Null 체크
 * @param el
 * @returns
 */
function isEmpty(el) {
	return (el == null || el == "" || typeof el == "undefined") ? true : false;
}

/**
 * 공통코드 조회
 * @param comnCdPcodeId = 조회할 코드
 * @param viewId        = 보여질 셀렉트 박스 ID
 * @param selValue      = 선택될 코드값
 * @param allValue      = 기본 노출값
 * @param useAsync      = ture / false
 * @returns
 */
function fnSetComnCdCombo(comnCdPcodeId, viewId, selValue, allValue, useAsync, basePathClient)  {
	var basePath = sessionStorage.getItem("contextRootPath");

	if(typeof basePath == "undefined" && basePath(allValue) || basePath == null || basePath == 'null') {
		basePath = basePathClient;
	}
	var _url = basePath+"/cmm/fms/getCodeListAjax.do";
	var async = isNullObject(useAsync) ? true : useAsync;
	var targetView = $("#"+viewId);
	if(comnCdPcodeId == ""){return false;}
	if(typeof targetView == "undefined") {return;}

	if(typeof allValue != "undefined" && !isEmpty(allValue)) {
		targetView.children().remove().end().append('<option value="">'+allValue+'</option>') ;
	}

	jQuery.ajax({
		async: async,
		type: "POST",
		url: _url,
		dataType: "json",
		data : {
			comnCdPcodeId   : comnCdPcodeId
		},
		success: function(r) {
			if (r.beanlist.length > 0) {
				for(var idx=0; idx<r.beanlist.length; idx++) {
					var obj = r.beanlist[idx];
					if(typeof selValue != "undefined" && selValue == obj.cdId) {
						targetView.append("<option value='"+obj.cdId+"' selected>"+obj.cdNm+"</option>");
					} else {
						targetView.append("<option value='"+obj.cdId+"'>"+obj.cdNm+"</option>");
					}
				}
			}
		},
		error: function(r) {
			console.log("공통코드 조회중 오류가 발생하였습니다.("+comnCdPcodeId+")");
			//alert("공통코드 조회중 오류가 발생하였습니다.("+comnCdPcodeId+")");
		}
	}) ;
}


/**
 * 그룹코드 조회
 * @param comnCdPcodeId = 조회할 코드
 * @param viewId        = 보여질 셀렉트 박스 ID
 * @param selValue      = 선택될 코드값
 * @param allValue      = 기본 노출값
 * @param useAsync      = ture / false
 * @returns
 */
function fnSetGroupByCdCombo(tableName, selectCoulmnName, viewId, selValue, allValue, useAsync, whCoulmn, whValue)  {
	var basePath = sessionStorage.getItem("contextRootPath");
	var _url = basePath+"/cmm/fms/getGroupByCodeListAjax.do";
	var async = isNullObject(useAsync) ? true : useAsync;
	var targetView = $("#"+viewId);
	if(tableName == ""){return false;}
	if(selectCoulmnName == ""){return false;}
	if(typeof targetView == "undefined") {return;}

	if(typeof allValue != "undefined" && !isEmpty(allValue)) {
		targetView.children().remove().end().append('<option value="">'+allValue+'</option>') ;
	}

	jQuery.ajax({
		async: async,
		type: "POST",
		url: _url,
		dataType: "json",
		data : {
			tableName   : tableName,
			selectCoulmnName   : selectCoulmnName,
			whCoulmn   : JSON.stringify(whCoulmn),
			whValue   : JSON.stringify(whValue)
		},
		success: function(r) {
			if (r.beanlist.length > 0) {
				for(var idx=0; idx<r.beanlist.length; idx++) {
					var obj = r.beanlist[idx];
					if(typeof selValue != "undefined" && selValue == obj.CD_ID) {
						targetView.append("<option value='"+obj.CD_ID+"' selected>"+obj.CD_NM+"</option>");
					} else {
						targetView.append("<option value='"+obj.CD_ID+"'>"+obj.CD_NM+"</option>");
					}
				}
			}
		},
		error: function(r) {
			console.log("공통코드 조회중 오류가 발생하였습니다.("+tableName+")");
		}
	}) ;
}


/**
 * 담당자 조회
 * @param searchOpener = 담당자 이름
 * @returns
 */
function fnOpenStaffListPopUp(searchOpener, mngType, stfTagId) {
	var popupDivId = "#layerPopup"; // 팝업이 들어가는 div의 id
	var basePath = sessionStorage.getItem("contextRootPath");
	var popupUrl = basePath+"/cmm/fms/getStaffListPopUp.do"; // 팝업 내용을 호출하는 url
	var popupParams = {
				searchOpener : searchOpener
				, mngType : mngType
				, searchCondition : 'addKorNm'
				, stfTagId : stfTagId
			}; // 팝업 호출시의 파라미터
	loadPopup (popupDivId, popupUrl, popupParams);
}

/**
 * 학생 조회
 *
 * @returns
 */
function fnOpenStudentListPopUp(stfTagId) {

	$('#POPUP_OPEN_BTN').trigger('click');
	$.ajaxSetup({cache : false});
	var popupDivId = "#layerPopup"; // 팝업이 들어가는 div의 id
	var basePath = sessionStorage.getItem("contextRootPath");
	var popupUrl = basePath+"/cmm/fms/getStudentListPopUp.do"; // 팝업 내용을 호출하는 url
	var popupParams = {
			stfTagId : stfTagId
	}; // 팝업 호출시의 파라미터
	loadPopup (popupDivId, popupUrl, popupParams);
}

/**
 * 부서 조회
 * @param menuGubun = 부서검색 팝업 호출 메뉴
 * @returns
 */
function fnOpenDeptListPopup(_menuGubun, _inputVal, remarksA,_deptDiv) {
	var popupDivId = "#layerPopup"; // 팝업이 들어가는 div의 id
	var basePath = sessionStorage.getItem("contextRootPath");
	var popupUrl = basePath+"/cmm/fms/getDeptPopList.do"; // 팝업 내용을 호출하는 url
	var popupParams = {
			menuGubun : _menuGubun
		   ,deptKorNm : _inputVal
		   ,remarksA  : remarksA
		   ,deptDiv : _deptDiv
		}; // 팝업 호출시의 파라미터
	loadPopup (popupDivId, popupUrl, popupParams);
}

/**
 * 교직원 및 학생 조회 공통 팝업
 * @param searchKeyword = 기작성 데이터
 *
 * @param stfTagId = 값이 들어갈 태그의 아이디
 * comments :
 *  학생 고유 번호 : '${stfTagId}'+"No"
 *  학생 이름 : '${stfTagId}'+"Nm"
 *
* @param searchCondition = 검색 구분
 * comments :
 *  이름(addKorNm)_default, 교번/학번(addKeyNo)
 *
 *  @param searchFlag = 검색 후 조회 여부
 * comments :
 *  즉시 조회 : Y
 *  검색 후 조회 : N
 *
 *  @param selectFlag = 복수 값 선택 여부
 * comments :
 *  복수 값 선택 : STAFF
 *  단일 선택 : SREG
 */
function fnOpenUnionListPopUp(searchKeyword, stfTagId, searchFlag, selectFlag) {
	$('#POPUP_OPEN_BTN').trigger('click');

	var popupDivId = "#layerPopup";
	var popupUrl = basePath+"/cmm/fms/getUnionListPopUp.do";
	var popupParams = {
		// search params
		searchKeyword : searchKeyword
		, searchCondition : 'addKorNm'
		, searchFlag : searchFlag
		, selectFlag : selectFlag

		// data division params
		, stfTagId : stfTagId
	};

	loadPopup (popupDivId, popupUrl, popupParams);
}

/**
 * 학생 조회 체크박스
 *
 * @returns
 */
function fnOpenStudentListChkPopUp( _sustCdNm, _shyrCd) {

	$('#POPUP_OPEN_BTN').trigger('click');
	$.ajaxSetup({cache : false});

	var sustCdNm = _sustCdNm === undefined? '' : _sustCdNm;
	var shyrCd = _shyrCd === undefined? '' : _shyrCd;

	var popupDivId = "#layerPopup"; // 팝업이 들어가는 div의 id
	var basePath = sessionStorage.getItem("contextRootPath");
	var popupUrl = basePath+"/cmm/fms/getStudentListChkPopUp.do"; // 팝업 내용을 호출하는 url
	var popupParams = {
		sustCdNm : sustCdNm
		, shyrCd : shyrCd
	}; // 팝업 호출시의 파라미터
	loadPopup (popupDivId, popupUrl, popupParams);
}

/**
 * 인풋값 Null체크
 * @param id
 * comment :
 */

function fnChkIsNull(idName){
	 var msg = "";

	 for(var idx = 0; idx< idName.length; idx++){
		 if (document.getElementById(idName[idx]).value == "") {
			 var chkType = document.getElementById(idName[idx]).type;
			 var chkval = document.getElementById(idName[idx]).value;
			 var chkTitle = document.getElementById(idName[idx]).title;
			 console.log("chkType::"+chkType + "\n idName["+idx+"]::::"+idName[idx] +"\n:::\nchkval::"+chkval);
			 if(chkType =="select-one"){
				 msg = chkTitle+"(을)를 선택해 주세요.";
			 }else if(chkType =="hidden"){
				 msg = chkTitle+"(을)를 진행해 주세요";
			 }else if(chkType =="text"){
				 msg = chkTitle+"(을)를 입력해 주세요";
			 }else if(chkType =="password"){
				 msg = chkTitle+"(을)를 입력해 주세요";
			 }else if(chkType =="number"){
				 msg = chkTitle+"(을)를 입력해 주세요";
			 }else if(chkType =="textarea"){
				 msg = chkTitle+"(을)를 작성해 주세요";
			 }else if(chkType =="file"){
				 msg = chkTitle+" 파일을(을)를 첨부해 주세요";
			 }else {
				 alert("정의 되지 않은 체크 타입 입니다. \n chkType::"+chkType+"정의 후 사용해 주시기 바랍니다."  );
				 return false;
			 }
			 alert(msg);
			 document.getElementById(idName[idx]).focus();
			 return false;
		 }
	 }
	 return true;
}


/**
 * 날자 비교
 * @param _startDateId = 시작일 ID
 * @param _endDateId   = 종료일 ID
 * comment :
 */

function isCompareData(_startDateId , _endDateId) {
	var toDayDate = new Date(); // 시작일
	var startDate = new Date($("#"+_startDateId).val()); // 시작일
	var endDate = new Date($("#"+_endDateId).val());     // 종료일
	var startDateTitle =$("#"+_startDateId).attr("title");
	var endDateTitle =$("#"+_endDateId).attr("title");

	/*
		if((toDayDate <= startDate) == false ) {
			alert(startDateTitle+"은 금일 과 같은 날이거나 금일 보다 과거일 수 없습니다.");
			 document.getElementById(_startDateId).focus();
			return false;
		}
	*/


	if((startDate <= endDate) == false ) {
		alert(startDateTitle+"은 "+endDateTitle+" 보다 과거일 수 없습니다.");
		 document.getElementById(_startDateId).focus();
		return false;
	}
	return true;
}


/**
 * 날자 비교 - 모집기간 끝과 운영기간 시작 비교
 * @param _startDateId = 시작일 ID
 * @param _endDateId   = 종료일 ID
 * comment :
 */

function isCompareDataEach(_startDateId , _endDateId) {
	var toDayDate = new Date(); // 시작일
	var startDate = new Date($("#"+_startDateId).val()); // 시작일
	var endDate = new Date($("#"+_endDateId).val());     // 종료일
	var startDateTitle =$("#"+_startDateId).attr("title");
	var endDateTitle =$("#"+_endDateId).attr("title");

	if((startDate <= endDate) == false ) {
		alert(startDateTitle+"은 "+endDateTitle+" 보다 과거여야 합니다.");
		document.getElementById(_startDateId).focus();
		return false;
	}
	return true;
}


function cancleBackSpaceKey(e, type) {
	if(type == true){
		//input textarea 백스페이스 허용 그외의 구간 백스페이스 제한
	    if(e.target.nodeName != "INPUT" && e.target.nodeName != "TEXTAREA"){
	        if(e.keyCode === 8){
	        return false;
	        }
	    }
		//readonly 백스페이스  제한
	    if(e.target.readOnly){
	        if(e.keyCode === 8){
	        return false;
	        }
	    }
	}
}

function chkComma(obj){
	if(obj.value.indexOf(",") != -1){
		obj.value = obj.value.replace(",", " ");
		alert(" , 를 입력할 수 없습니다.");
	}
};


function create_chart_radar(chartData) {
	chart = new AmCharts.AmRadarChart();
	chart.dataProvider = chartData;
	chart.categoryField = "title";
	chart.fontFamily = "NanumGothic";

	chart.panEventsEnabled = false;

	AmCharts.checkEmptyData = function (chart) {
	    if ( 0 == chart.dataProvider.length ) {

	        // add dummy data point
	        var dataPoint = {
	            dummyValue: 0
	        };
	        dataPoint[chart.categoryField] = '';
	        chart.dataProvider = [dataPoint];

	        // add label
	        chart.addLabel(0, '50%', '차트 데이터가 없습니다.', 'center');

	        // set opacity of the chart div
	        chart.chartDiv.style.opacity = 0.5;

	        // redraw it
	        chart.validateNow();
	    }
	}

    return chart;
}

function get_valueAxis_radar(max) {
	// VALUE AXIS
	var valueAxis = new AmCharts.ValueAxis();
	valueAxis.gridType = "polygons";
	valueAxis.axisAlpha = 0.15;
	valueAxis.minimum = 0;
	valueAxis.maximum = max;
	valueAxis.autoGridCount = false;
	valueAxis.gridCount = 5;

	return valueAxis;
}

function get_graph_radar1(valueField) {
	var graph = new AmCharts.AmGraph();
	if (valueField !== undefined) graph.valueField = valueField;

	return graph;
}

function create_chart_bar(chartData) {
	var chart = new AmCharts.AmSerialChart();
	if(chartData !== undefined) chart.dataProvider = chartData;
    chart.categoryField = "title";
    chart.fontFamily = "NanumGothic";

    AmCharts.checkEmptyData = function (chart) {
	    if ( 0 == chart.dataProvider.length ) {

	        // add dummy data point
	        var dataPoint = {
	            dummyValue: 0
	        };
	        dataPoint[chart.categoryField] = '';
	        chart.dataProvider = [dataPoint];

	        // add label
	        //chart.addLabel(0, '50%', '차트 데이터가 없습니다.', 'center');

	        // set opacity of the chart div
	        chart.chartDiv.style.opacity = 0.5;

	        // redraw it
	        chart.validateNow();
	    }
	};

    return chart;
}

function get_graph_bar1(valueField) {
	var graph = new AmCharts.AmGraph();
	if(valueField !== undefined) graph.valueField = valueField;
    graph.type = "column";
    graph.lineAlpha = 0;
    graph.fillAlphas = 0.8;

    return graph;
}

function get_valueAxis_bar() {
	// VALUE AXIS
    var valueAxis = new AmCharts.ValueAxis();
    valueAxis.minimum = 0;
    valueAxis.maximum = 100;
    valueAxis.autoGridCount = false;
    valueAxis.gridCount = 5;
    valueAxis.autoWrap = true;

    return valueAxis;
}

// 비교과 다중 첨부파일 수정하였을때 값넣기
$(document).on("change", ".attachFileTag", function() {

	var fileNameTag = "";

	var tagId = "";

	var tagIdNo = "";

	// 값이 변경되면
	if (window.FileReader) {
		// modern browser
		var filename = $(this)[0].files[0].name;
	} else {
		// old IE
		var filename = $(this).val().split("/").pop().split("\\").pop(); // 파일명만 추출
	}
	// 추출한 파일명 삽입
	// $(this).parent("label").siblings(".upload_name").val(filename);

	tagId = $(this).attr("id");
	tagIdNo = tagId.substring(13);

	console.log("tagId: "+tagId);
	console.log("tagIdNo: "+tagIdNo);

	if(tagIdNo == '1') {
		fileNameTag = "<div class='filedown_row mg_t5'>"
	} else {
		fileNameTag = "<div class='filedown_row'>"
	}

	fileNameTag += "<a href='javascript:void(0);' class='ad_filelink'><i class='fa fa-file-o'></i>"+filename+"</a>"
			+"<button type='button' class='btn_reset' title='파일삭제'><i class='fa fa-times-circle'></i></button>"
		+"</div>"

	$(this).parent("td").append(fileNameTag);
});


function fnGoLoginPopUp(targetUrl) {
	var popupDivId = "#layerPopup";
	var basePath = sessionStorage.getItem("contextRootPath");
	var popupUrl = basePath+"/login/a/n/goOpenLoginPopUp.do";
	var popupParams = {targetUrl : targetUrl};
	$(popupDivId).load(popupUrl, popupParams, function(){
		$.magnificPopup.open({
			items: {
				src: popupDivId
			}
			, type: "inline"
			, enableEscapeKey : false
		});
	});
}

function IsAlphaNumeric(ee) {
	   var inputChar = String.fromCharCode(event.keyCode);
	   var ret = false;

	   if (inputChar == "" && inputChar == null) {
	      ret = false;
	   } else {
	      if (inputChar.search(/[a-z0-9]+$/gi) >= 0) { ret = true; } else { ret = false; }
	   }
	   // error message
	   if (!ret) {
	      alert("영어와 숫자만 입력 가능. \n char:" + String.fromCharCode(event.keyCode) + ", keycode: " + event.keyCode);
	   }
	   return ret;
	}

function fnDtpicker() {
	$(".dtpicker").each(function(){
		var datepicker = $(this).attr('id');
		datePickerSearch(datepicker);
	});
}


function fnOnChangeFileNm(obj, delYn, maxCnt, fileType, staffType) {
	var basePath = sessionStorage.getItem("contextRootPath");
	var imagePath = basePath+"/contents/images";

	if (obj.value != "") {
		var fileObjs = document.getElementsByName(obj.name);
		var pTagRowCnt = document.getElementsByName(obj.name+'_link_file_del');
		if(parseInt(maxCnt) < (parseInt(pTagRowCnt.length)+parseInt(1))){
			alert("파일첨부는 " +maxCnt+ "개 까지 가능 합니다.");
			obj.value = "" ;
			return false;
		}
		if(!fnChkUploadFileType(obj,fileType)){
			return false;
		}

		var tagIdx = $('#'+obj.name+'_idx').val();
		++tagIdx;
		var addFileInputHtml ="";
		var fileNm = "";
			fileNm =  obj.value.substring(obj.value.lastIndexOf("\\") + 1,  obj.value.length)
		var appendFileNameHtml = '';
		var delTagIdx = (tagIdx-1);

		//학생 파일이면
		if (staffType == "CLIENT") {
			addFileInputHtml += '<input type="file" name="'+obj.name+'" id="'+obj.name+'_'+tagIdx+'" class="hidden" onchange="fnOnChangeFileNm(this,'+"'"+delYn+"'"+",'"+maxCnt+"'"+",'"+fileType+"','"+staffType+"'"+')">';
			$('#'+obj.name+'_label').attr('for', obj.name+'_'+tagIdx);
			$('#'+obj.id).parent().append(addFileInputHtml);

			if(obj.id == obj.name){
				appendFileNameHtml += '<div class="file_thumbnail mg_r5" name="'+obj.name+'_link_file_del" id="'+obj.name+'_link_file_delDiv" >';
			}else{
				appendFileNameHtml += '<div class="file_thumbnail mg_r5" name="'+obj.name+'_link_file_del" id="'+obj.name+'_'+delTagIdx+'_link_file_delDiv">';
			}

			appendFileNameHtml += '<a href="javascript:void(0);" title="'+fileNm+'">';

			appendFileNameHtml += '<div class="thumbnail_img">';

			if (/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(obj.value)){
				appendFileNameHtml += 	'<img src="'+imagePath+'/client/sub/img_nopreview.jpg" id="imageSrc_'+obj.name+'_'+tagIdx+'" />';
			}else{
				appendFileNameHtml += 	'<img src="'+imagePath+'/client/sub/img_preview_file.jpg" id="imageSrc_'+obj.name+'_'+tagIdx+'" />';
			}

			appendFileNameHtml += '</div>';
			appendFileNameHtml += '<span class="thumbnail_tit">'+fileNm+'</span>';
			appendFileNameHtml += '</a>';

			if(delYn == 'Y'){
				if(obj.id == obj.name){
					appendFileNameHtml += '<button type="button" title="삭제" id="'+obj.name+'_del" class="btn btn_del" onclick="fnDelAddFileData(this.id,'+"'','"+staffType+"'"+')"><i class="fa fa-close"></i></button>';
				}else{
					appendFileNameHtml += '<button type="button" title="삭제" id="'+obj.name+'_'+delTagIdx+'_del" class="btn btn_del" onclick="fnDelAddFileData(this.id,'+"'','"+staffType+"'"+')"><i class="fa fa-close"></i></button>';
				}
			}

			if (/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(obj.value)){
				readURL(obj, obj.name, tagIdx );
			}

			appendFileNameHtml += '</div>';

			//$('#attach_file_box_Div').append(appendFileNameHtml);
			$(obj).parent().parent("div .attach_file_wrapper").append(appendFileNameHtml);
			/*
			$('#'+obj.name).parent().parent("div .attach_file_wrapper").append(appendFileNameHtml);
			$('#'+obj.name+'_label').parent().children("div .attach_file_wrapper").append(appendFileNameHtml);
			*/
			$('#'+obj.name+'_idx').val(tagIdx);


		//관리자 파일이면
		}else {
			addFileInputHtml += '<input type="file" name="'+obj.name+'" id="'+obj.name+'_'+tagIdx+'" class="hidden" onchange="fnOnChangeFileNm(this,'+"'"+delYn+"'"+",'"+maxCnt+"'"+",'"+fileType+"','"+staffType+"'"+')">';
			$('#'+obj.name+'_label').attr('for', obj.name+'_'+tagIdx);
			$('#'+obj.id).parents("p").append(addFileInputHtml);

			appendFileNameHtml += '<div class="file_thumbnail mg_r5" name="'+obj.name+'_link_file_del">';
			appendFileNameHtml += '	<a href="javascript:void(0);" title="'+fileNm+'">';
			appendFileNameHtml += '	<div class="thumbnail_img">';
				if (/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(obj.value)){
					appendFileNameHtml += 	'<img src="'+imagePath+'/client/sub/img_nopreview.jpg" id="imageSrc_'+obj.name+'_'+tagIdx+'" />';
				}else{
					appendFileNameHtml += 	'<img src="'+imagePath+'/client/sub/img_preview_file.jpg" id="imageSrc_'+obj.name+'_'+tagIdx+'" />';
				}
			appendFileNameHtml += '	</div>';
			appendFileNameHtml += '	<span class="thumbnail_tit">'+fileNm+'</span>';
			appendFileNameHtml += '	</a>';
			if(delYn == 'Y'){
				if(obj.id == obj.name){
					appendFileNameHtml += '<button type="button" title="삭제" id="'+obj.name+'_del" class="link_del" onclick="fnDelAddFileData(this.id,'+"'','"+staffType+"'"+')"><i class="fa fa-close"></i></button>';
				}else{
					appendFileNameHtml += '<button type="button" title="삭제" id="'+obj.name+'_'+delTagIdx+'_del" class="link_del" onclick="fnDelAddFileData(this.id,'+"'','"+staffType+"'"+')"><i class="fa fa-close"></i></button>';
				}
			}
			appendFileNameHtml += '</div>';
			if (/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(obj.value)){
				readURL(obj, obj.name, tagIdx );
			}

			/* 구버전
			appendFileNameHtml += '<p class="link_file_del file_box" name="'+obj.name+'_link_file_del">';
			appendFileNameHtml += '<a href="javascript:void(0);" class="link_file" title="'+fileNm+'">'+fileNm+'</a>';

			if(delYn == 'Y'){
				if(obj.id == obj.name){
					appendFileNameHtml += '<button type="button" title="삭제" id="'+obj.name+'_del" class="link_del" onclick="fnDelAddFileData(this.id,'+"'','"+staffType+"'"+')"><i class="fa fa-close"></i></button>';
				}else{
					appendFileNameHtml += '<button type="button" title="삭제" id="'+obj.name+'_'+delTagIdx+'_del" class="link_del" onclick="fnDelAddFileData(this.id,'+"'','"+staffType+"'"+')"><i class="fa fa-close"></i></button>';
				}
			}
			appendFileNameHtml += '</p>';
			*/

			$('#'+obj.name+'_label').parents("p").parents("td").append(appendFileNameHtml);
			$('#'+obj.name+'_idx').val(tagIdx);
		}

	}
}


function readURL(input, objName , tagIdx) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#imageSrc_'+objName+'_'+tagIdx).attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}


/**
 * 첨부파일 타입체크 조회
 * @param obj           = 파일 오브젝트
 * @param fileType      = 체크 첨부파일 타입
 * @comment : img       = 이미지만
 *            office    = 문서파일
 *            video     = 동영상파일
 *            zip       = 압축파일만
 *            공백      = 체크 없음
 * @returns
 */

function fnChkUploadFileType(obj,fileType) {
	if(fileType == "img"){
		if (!/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(obj.value)){
			alert("첨부 가능 파일 포멧이 아닙니다. \n"
				+"이미지 파일 확장자 : gif, jpg, png \n"
				+"만 업로드 가능합니다."
				);
			obj.value = "" ;
			return false ;
		}
	}else if(fileType =="office"){
		if (!/(\.doc|\.docx|\.xls|\.xlsx|\.ppt|\.pptx|\.pdf)$/i.test(obj.value)){
			alert("첨부 가능 파일 포멧이 아닙니다. \n"
					+"오피스문서 파일 확장자 : doc, docx, xls, xlsx, ppt, pptx, pdf \n"
					+"만 업로드 가능합니다."
					);
				obj.value = "" ;
				return false ;
			}
	}else if(fileType =="video"){
		if (!/(\.mp4)$/i.test(obj.value) ){
			alert("첨부 가능 파일 포멧이 아닙니다. \n"
				+"동영상 파일 확장자 : mp4 \n"
				+"만 업로드 가능합니다."
				);
				obj.value = "" ;
				return false ;
		}
	}else if(fileType =="zip"){
		if (!/(\.zip)$/i.test(obj.value)){
			alert("첨부 가능 파일 포멧이 아닙니다. \n"
				+"실행파일 파일 확장자 : zip (실행파일은 압축해서 올려주세요) \n"
				+"만 업로드 가능합니다."
				);
			obj.value = "" ;
			return false ;
		}
	}
return true;
}

function fnDelAddFileData(objId, fileSubId, staffType) {

	if(isEmpty(fileSubId) == false) {
		var basePath = sessionStorage.getItem("contextRootPath");
		var _url = basePath+"/cmm/fms/removeFileData.do";
		jQuery.ajax({
			type: "POST",
			url: _url,
			dataType: "json",
			data : {
				fileSubId : fileSubId
			},
			success: function(r) {
				if (r.rtnCode == '0') {
					if(staffType == 'CLIENT'){
						var delObjId = objId.replace('_del','');
						$("#"+delObjId+"_link_file_delDiv").remove();
						$("#"+delObjId).remove();
					}else{
						var delObjId = objId.replace('_del','');
						$("#"+objId).parent(".file_thumbnail").remove();
						$("#"+delObjId).remove();
					}
				} else {
				 alert("첨부파일 삭제에 실패 하였습니다.");
				 return false;
				}
			},error: function(r) {
			}
		});

	}else{
		if(staffType == 'CLIENT'){
			var delObjId = objId.replace('_del','');
			$("#"+delObjId+"_link_file_delDiv").remove();
			$("#"+delObjId).remove();
		}else{
			var delObjId = objId.replace('_del','');
			$("#"+objId).parent(".file_thumbnail").remove();
			$("#"+delObjId).remove();
		}
	}
}

/**
 * 공통코드 조회(부서정보 select박스)
 * @param typeDiv				= SREG : 학생정보테이블에서 가져온 학과코드/ DEPT : 부서정보테이블에서 가져온 부서코드/APPLY_STD : 학생시점테이블에서 가져온 학과코드
 * @param deptDiv 			= 대학 : C, 학과 : H, 전공 : M, 학과/전공 : MH
 * @param viewId				= 콤보박스가 append 될 태그의 부모 태그
 * @param selValue			= 선택될 코드값
 * @param allValue			= 기본 노출값
 * @param useAsync			= true / false
 * @param basePathClient
 * @returns
 */
function fnSetDeptCdCombo(typeDiv, deptDiv, viewId, selValue, allValue, useAsync, basePathClient, cdCol) {
	if(typeof basePath == "undefined" && basePath(allValue) || basePath == null || basePath == 'null') {
		basePath = basePathClient;
	}
	var _url = basePath+"/cmm/fms/getSelectDeptCodeAjax.do";

	var async = isNullObject(useAsync) ? true : useAsync;
	var targetView = $("#"+viewId);

	if(typeDiv == "" || typeof targetView == "undefined"){
		return false;
	}

	if(typeof allValue != "undefined" && !isEmpty(allValue)) {
		targetView.children().remove().end().append('<option value="">'+allValue+'</option>') ;
	}else {
		targetView.children().remove();
	}

	cdCol = (typeof cdCol !== 'undefined') ? cdCol : "deptCd"; // cdCol의 기본값 'cdId'

	jQuery.ajax({
		async: async,
		type: "POST",
		url: _url,
		dataType: "json",
		data : {
			typeDiv   : typeDiv
			, deptDiv : deptDiv
		},
		success: function(r) {
			if (r.sustMdCdList.length > 0) {
				for(var idx=0; idx<r.sustMdCdList.length; idx++) {
					var obj = r.sustMdCdList[idx];
					if(typeof selValue != "undefined" && selValue == obj[cdCol]) {
						targetView.append("<option value='"+obj[cdCol]+"' selected>"+obj.deptKorNm+"</option>");
					} else {
						targetView.append("<option value='"+obj[cdCol]+"'>"+obj.deptKorNm+"</option>");
					}
				}
			}
		},
		error: function(r) {
			console.log("공통코드 조회중 오류가 발생하였습니다.("+typeDiv+","+deptDiv+")");
		}
	}) ;
}

/**
 * 공통코드 조회(체크박스)
 * @param comnCdPcodeId = 조회할 코드
 * @param viewId        = 보여질 셀렉트 박스 ID
 * @param chkdValue      = 선택될 코드값
 * @param allValue      = 기본 노출값
 * @param useAsync      = ture / false
 * @returns
 */
function fnSetComnCdCheckBox(comnCdPcodeId, viewId, chkdValue, titleValue, valueName, userGubun,useAsync)  {
	var basePath = sessionStorage.getItem("contextRootPath");
	var _url = basePath+"/cmm/fms/getCodeListAjax.do";

	var async = isNullObject(useAsync) ? true : useAsync;
	var targetView = $("#td_"+viewId);

	if(comnCdPcodeId == ""){
		return false;
	}

	if(typeof targetView == "undefined") {
		return;
	}

	jQuery.ajax({
		async: async,
		type: "POST",
		url: _url,
		dataType: "json",
		data : {
			comnCdPcodeId   : comnCdPcodeId
		},
		success: function(r) {
			if (r.beanlist.length > 0) {
				for(var idx=0; idx<r.beanlist.length; idx++) {
					var obj = r.beanlist[idx];
					var checked = chkdValue.indexOf(obj.cdId) != -1 ? 'checked' : '';

					console.log("chkdValue = "+chkdValue+"\n"+"cdId = "+obj.cdId+"\n checked ="+checked+"\n\n");

					if (userGubun == "client") {

						targetView.append(
								'<p class="check_row">'
								+'<input name="'+valueName+'" class="check '+viewId+'Check hidden '+viewId+'All" id="'+viewId+idx+'" type="checkbox" value="'+obj.cdId+'" title="'+titleValue+'" '+checked+'>'
								+'<label for="'+viewId+idx+'">'+obj.cdNm+'</label>'
								+'</p>'
						);
					}else{
						targetView.append(
								'<p class="ad_input_row">'
								+'<input name="'+valueName+'" class="check '+viewId+'Check '+viewId+'All" id="'+viewId+idx+'" type="checkbox" value="'+obj.cdId+'" title="'+titleValue+'"onclick="fnCreateEtcInputBox('+"'"+obj.cdId+"'"+')" onchange="fn_checkbox('+"'"+viewId+'All'+"'"+", '"+viewId+'All'+"'"+');" '+checked+'>'
								+'<label class="check_label" for="'+viewId+idx+'">'+obj.cdNm+'</label>'
								+'</p>'
						);
					}
				}
			} else {
				alert("공통코드 조회중 오류가 발생하였습니다.("+comnCdPcodeId+")");
			}
		},
		error: function(r) {
			console.log("공통코드 조회중 오류가 발생하였습니다.("+comnCdPcodeId+")");
			//alert("공통코드 조회중 오류가 발생하였습니다.("+comnCdPcodeId+")");
		}
	}) ;

//	fnChkBoxCheck(valueName, chkdValue);
}


/**
 * 체크박스 값 체크
 * @param _chkBoxName = 체크박스 input name
 * @param _chkValue = 체크될 값
 * @returns
 */
fnChkBoxCheck = function(_chkBoxName, _chkValue) {

	var chkBoxNameValue = _chkValue.split(",");
	for(var i=0; i<chkBoxNameValue.length; i++) {
		$("input[name="+_chkBoxName+"]").each(function() {
			if( $(this).val() == chkBoxNameValue[i] ){
				$(this).prop("checked", true);
			}
		});
	}
}

/**
* 검색폼 초기화
* @param _fromId = 폼아이디
*/
function fnFormReset(_fromId){
	$("#" + _fromId)[0].reset();
	$('.select2').each(function() {
		$(this).val("").trigger('change');
	});
	$('.select_form').each(function() {
		var selectOpts = $(this).find("select").children("option");
		selectOpts.eq(0).prop("selected");
		$(this).find("label").text(selectOpts.eq(0).text());
	});


}

/**
*********************************************************
@ function :  validation empty check by class
@ comment  :
@ history  : 2019-05-17 (최초작성)
**********************************************************
**/
function fnEmptyCheckByClass(){
	var getClassDom = document.getElementsByClassName("emptyChkByClass");
	var flag = true;
	for(var i=0; i<getClassDom.length;i++){

		var domNodeName = getClassDom[i].nodeName;
		var domType = getClassDom[i].type;
		var domName = getClassDom[i].name;
		var domId = getClassDom[i].id;
		var domTitle = getClassDom[i].title;
		var domValue = getClassDom[i].value;

		if(domNodeName =="SELECT"){
			if (!domValue) {
				alert(domTitle+"을(를) 선택해야 합니다.");
				flag = false;
				$("#"+domId).selectedIndex=0;
				$("#"+domId).focus();
				return flag;
			}
		}else if(domNodeName =="INPUT"){
			if(domType == "checkbox"){
				if (!$("input[name="+domName+"]").is(":checked")) {
					alert(domTitle + " 값을 체크해 주세요.");
					flag = false;
					$("html").scrollTop(0);
					$("#"+domId).focus();
					return flag;
				}
			}else{
				if (!domValue) {
					alert(domTitle+"을(를) 입력해야 합니다.");
					flag = false;
					$("#"+domId).focus();
					return flag;
				}
			}

		}else if(domNodeName =="TEXTAREA"){
			if (!($.trim(CKEDITOR.instances[domName].getData()))) {
				alert(domTitle+" 을 입력하세요.");
				flag = false;
				return flag;
			}
		}
	}
	return flag;
}

function fnChkFavoriteData(falMenuId, falType, btnId, targetUrl) {
	var sessionUserId = sessionStorage.getItem("sessionUserId");
	var basePath = sessionStorage.getItem("contextRootPath");
	if(sessionUserId == ''){
		if (confirm("찜하기는 로그인이 필요한 기능 입니다. \n"+"로그인 하시겠습니까?")) {
			fnGoLoginPopUp(basePath+targetUrl);
			}
	}else{
		fnInsertFavoriteData(falMenuId, falType, btnId);
	}
}


function fnInsertFavoriteData(falMenuId, falType, btnId){
	var faluseYn = '';
//	if($("#"+btnId).hasClass('on')){
	if($("#"+btnId).is(":checked")){
		faluseYn = 'Y';
	}else{
		faluseYn = 'N';
	}

	var basePath = sessionStorage.getItem("contextRootPath");
	var _url = basePath+"/cmm/fms/createFavoriteData.do";

	jQuery.ajax({
		type: "POST",
		url: _url,
		dataType: "json",
		data : {
			falMenuId : falMenuId,
			falType : falType,
			faluseYn : faluseYn,
		},
		success: function(r) {
			if(r.rtnCode == '-1'){
				alert("찜하기에 실패하였습니다.");
				$("#"+btnId).removeClass("on");
				$("#"+btnId).prop("checked", false);
			}
		},
		error: function(r) {
			console.log("찜하기에 실패 하였습니다.");
			$("#"+btnId).removeClass("on");
			$("#"+btnId).prop("checked", false);
		}
	}) ;
}

/**
*********************************************************
@ function : 체크박스 체크된 value들 ,로 연결
@ param  : chkNm - 체크박스 name
@ comment  :
@ history  : 2019-05-10 (최초작성)
**********************************************************
 **/
function conComma(chkNm,type){
	var chkVal = "";
	if(type == "checkbox"){
		$("input:checkbox[name="+chkNm+"]:checked").each(function(){
			chkVal = chkVal+ ","+$(this).val();
		});
	}else if(type == "text"){
		$("input[name="+chkNm+"]").each(function () {
			chkVal = chkVal+ ","+$(this).val();
		});
	}
	chkVal = chkVal.substring(1);
	return chkVal;
}

/**
***************************************
@ function : SMS 발송
@ comment  :
@ param    : sendType
@ param    : userType
@ param    : stdNo
@ history  : 2019-02-20 (최초작성)
****************************************
 **/
function fnOponSendSmsMessageUserData(smsSendType, stdNo, smsUserType, sendMenu) {
	var infoObjArray = new Array();
	if (smsSendType == 'GRP') {
		var selData = tableObject.rows({selected : true	}).data();
		if (selData.length < 1) {
			alert("한명 이상의 학생을 선택해 주세요.");
			return false;
		}
		for (var i = 0; i < selData.length; i++) {
			infoObjArray.push(selData[i][stdNo]);
		}
	} else {
		infoObjArray.push(stdNo);
	}

	fnOponSendSmsMessagePopUp(smsSendType, smsUserType, infoObjArray ,sendMenu );
}
function fnOponSendSmsMessagePopUp(smsSendType, smsUserType, stdArry, sendMenu) {
	$('#POPUP_OPEN_BTN').trigger('click');
	$.ajaxSetup({cache : false});
	var basePath = sessionStorage.getItem("contextRootPath");
	var popupDivId = "#layerPopup"; // 팝업이 들어가는 div의 id
	var popupUrl = basePath+"/cmm/fms/openSendSmsmessagePopUp.do"; // 팝업 내용을 호출하는 url
	var popupParams = {
			smsSendType : smsSendType,
			smsUserType : smsUserType,
			stdArry :  JSON.stringify(stdArry),
 			sendMenu :  sendMenu
	}
	loadPopup(popupDivId, popupUrl, popupParams);
}
/**
*********************************************************
@ comment  : 서버에 sms 발송 요청
@ history  : 2022-02-15 (최초작성)
**********************************************************
 **/
function fnSendSmsMessage(resultObj){
	var basePath = sessionStorage.getItem("contextRootPath");
/*	alert(JSON.stringify(resultObj));*/
	$.ajax({
		  url : basePath+"/cmm/fms/sendSmsMessage.do"
		, type : "post"
		, contentType : 'application/json'
		, cache : false
		, async : false
		, dataType : "json"
		, data : JSON.stringify(resultObj)
		, success : function(res) {
			if (isEmpty(res.sendCode) == false) {
				fnSendSmsMessageForDaeJinJsp(res.sendCode);
			}else{
				alert("발송요청에 실패 하였습니다.");
			}
		}
	});
}


/**
***************************************
@ function : E-mail 발송
@ comment  :
@ param    : sendType
@ param    : userType
@ param    : stdNo
@ history  : 2019-02-20 (최초작성)
****************************************
 **/
function fnOponSendEmailMessageUserData(smsSendType, stdNo, smsUserType, sendMenu) {
	var infoObjArray = new Array();
	if (smsSendType == 'GRP') {
		var selData = tableObject.rows({selected : true	}).data();
		if (selData.length < 1) {
			alert("한명 이상의 학생을 선택해 주세요.");
			return false;
		}
		for (var i = 0; i < selData.length; i++) {
			infoObjArray.push(selData[i][stdNo]);
		}
	} else {
		infoObjArray.push(stdNo);
	}

	fnOponSendEmailMessagePopUp(smsSendType, smsUserType, infoObjArray ,sendMenu );
}
function fnOponSendEmailMessagePopUp(smsSendType, smsUserType, stdArry, sendMenu) {
	$('#POPUP_OPEN_BTN').trigger('click');
	$.ajaxSetup({cache : false});
	var basePath = sessionStorage.getItem("contextRootPath");
	var popupDivId = "#layerPopup"; // 팝업이 들어가는 div의 id
	var popupUrl = basePath+"/cmm/fms/openSendEmailmessagePopUp.do"; // 팝업 내용을 호출하는 url
	var popupParams = {
			smsSendType : smsSendType,
			smsUserType : smsUserType,
			stdArry :  JSON.stringify(stdArry),
 			sendMenu :  sendMenu
	}
	loadPopup(popupDivId, popupUrl, popupParams);
}
/**
*********************************************************
@ comment  : 서버에 이메일 발송 요청
@ history  : 2022-02-15 (최초작성)
**********************************************************
 **/
function fnSendEmailMessage(resultObj){
	var basePath = sessionStorage.getItem("contextRootPath");
	$.ajax({
		  url : basePath+"/cmm/fms/sendEmailMessage.do"
		, type : "post"
		, contentType : 'application/json'
		, cache : false
		, async : false
		, dataType : "json"
		, data : JSON.stringify(resultObj)
		, success : function(res) {
			if( res.isSuccess ){
				alert("이메일 발송 요청 하였습니다.");
			}else{
				alert("발송요청에 실패 하였습니다.");
			}
		}
	});
}

/**
*********************************************************
@ comment  :
@ history  : 2019-05-10 (최초작성)
**********************************************************
 **/

function fnSendSmsMessageForDaeJinJsp(sendCode){
	var basePath = sessionStorage.getItem("contextRootPath");
	var _url = basePath+"/cmm/fms/reqeustUrlCmd.do";
	var _encodingType = "UTF-8";
	var _pUrl = "https://sms.daejin.ac.kr/lms_sms.jsp?code="+sendCode+"&sUserEnroll=DAIN";
	$.ajax({
		type : 'POST',
		url : _url,
		contentType: 'application/x-www-form-urlencoded; charset='+_encodingType,
		data : {
			 param_url : _pUrl,
			 encodingType : _encodingType
		},
		dataType : 'json',
		success : function(result) {
			alert("SMS 발송 요청 하였습니다.");
		}
	});

}

/**
*********************************************************
@ function : ZERO 공백 채우기
@ comment  :
@ param    : str
@ history  : 2017-11-07 (최초작성)
**********************************************************
**/

function pad(n, width) {
  n = n + '';
  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}


/**
*********************************************************
@ function : 텍스트 AREA Br 변환
@ comment  :
@ param    : str
@ history  : 2017-11-07 (최초작성)
**********************************************************
**/
function replaceToBrTag(str) {
	 str = str.replace(/(?:\r\n|\r|\n)/g, '<br>');
	 return str
}

/**
***************************************
@ function : 엑셀업로드 실패시 실패사유 팝업
@ comment  :
@ param    : _totalCnt
@ param    : _failCnt
@ param    : _successCnt
@ history  : 2019-12-04 (최초작성)
****************************************
**/
function fnExcelFailPop(_totalCnt ,_failCnt, _successCnt) {
	var basePath = sessionStorage.getItem("contextRootPath");

	$('#POPUP_OPEN_BTN').trigger('click');

	setTimeout(function() {}, 4000);
	$.ajaxSetup({ cache : false });

	var popupDivId = "#layerPopup"; // 팝업이 들어가는 div의 id
	var popupUrl = basePath+"/cmm/fms/getUploadFailInfo.do";
	var popupParams = {
			totalCnt : _totalCnt
			,failCnt : _failCnt
			,successCnt : _successCnt
	}// 팝업 호출시의 파라미터
	loadPopup(popupDivId, popupUrl, popupParams);
}

/**
*****************************************
@ function : serializeFormDain
@ comment  :
*****************************************
**/
jQuery.fn.serializeFormDain = function( ) {
	if( this[0].enctype && this[0].enctype == 'multipart/form-data' ) {
		return this.serializeFormFile( );
	} else {
		return this.serializeForm( );
	}
}

/**
 * JQuery  - form Element를 Json형태로 생성( DataTable에서 사용)
 */
jQuery.fn.serializeForm = function( ) {

	var obj = null;

	var param = {};
	try {
		var ymdhmArr = new Array();

		if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
			var arr = this.serializeArray();

			if (arr) {
				obj = {};
				jQuery.each(arr, function() {

					var value = this.value;

					if( this.name.endsWith('Ymdhm') ) {
						ymdhmArr.push(this.name);
					}

					if( !jQuery.isEmptyObject(obj[this.name]) ) {

						var valueArr = new Array()
						if(  $.isArray(obj[this.name]) ) {
							valueArr = obj[this.name];
						} else {
							valueArr.push(obj[this.name]);
						}

						valueArr.push(value);
						obj[this.name] = valueArr;
					} else {
						obj[this.name] = value;
					}
				});

				for( var i=0;i<ymdhmArr.length; i++) {
					if( obj[ymdhmArr[i].replace(/Ymdhm/g, 'Ymd')] ) {
						obj[ymdhmArr[i]] = obj[ymdhmArr[i].replace(/Ymdhm/g, 'Ymd')]+obj[ymdhmArr[i].replace(/Ymdhm/g, 'Hh')]+obj[ymdhmArr[i].replace(/Ymdhm/g, 'Mi')];
					} else {
						obj[ymdhmArr[i]] = '';
					}
				}
			}
		}

	} catch (e) {
	} finally {
	}
	return obj;
};

/**
 * JQuery  - form(파일업로드용) Element를 Json형태로 생성( $.ajax() 에서 사용)
 */
jQuery.fn.serializeFormFile = function( ) {
	var formData = new FormData( );

	var jsonData = this.serializeForm(this);
	for( var x in jsonData ) {
		if( $.isArray(jsonData[x]) ) {
			for( var i=0;i< jsonData[x].length; i++ ) {
				if( x.endsWith('Ymd') ) {
					formData.append(x+"[]", jsonData[x][i].replace(/\-/ig, ''));
				} else {
					if( x.endsWith('[]')) {
						formData.append(x, jsonData[x][i]);
					} else {
						formData.append(x+"[]", jsonData[x][i]);
					}
				}
			}
		} else {
			if( x.endsWith('Ymd') ) {
				formData.append(x, jsonData[x].replace(/\-/ig, ''));
			} else {
				formData.append(x, jsonData[x]);
			}
		}
	}

	$("input[type='file']").each(function() {
		formData.append( this.name, $("#"+this.id)[0].files[0] );
	});

	return formData;
};

/**
*****************************************
@ function : checkValidation
@ comment  :
*****************************************
**/
jQuery.fn.checkValidation = function( callback ) {
	var rules = {}

	var formValidator = $('#'+ this[0].id).validate({
		ignore: '',
		ignoreTitle : true,
		errorElement: 'p',
		errorPlacement: function(error, element) {
			var elements = $("[name="+element[0].name+"]");

			for(var i = 0; i < elements.length; i++  ){
//				console.log( elements[i].tagName + " : " + elements[i].name );

				// input text, textarea, tel ...
				if( ( elements[i].tagName == 'INPUT' || elements[i].tagName == 'TEXTAREA' ) && elements[i].type != 'hidden' ) {

					// datePicker
					if( $(elements[i]).hasClass('btDtpicker') || $(elements[i]).hasClass('dtpicker') ) {
						if( $(elements[i]).parent().parent().get(0).tagName == 'TD' ) {
							if( $(elements[i]).parent().parent().children('p.error').length == 0 ) $(elements[i]).parent('.search_day').after( error[0].outerHTML ); // client
						} else if( $(elements[i]).parent().parent().parent().get(0).tagName == 'TD' ) {
							if( $(elements[i]).parent().parent().children('p.error').length == 0 ) $(elements[i]).parent('.input-group.date').after( error[0].outerHTML ); // staff
						}

					// input(text) with button or several input(radio, checkbox)
					} else if( $(elements[i]).parent('.ad_search_row').length == 1 || $(elements[i]).parent('.ad_input_row').length == 1 ) {
						if( $(elements[i]).parent().parent().children('p.error').length == 0 ) $(elements[i]).parent().parent().append( error[0].outerHTML )

					// textarea
					} else if( elements[i].tagName == 'TEXTAREA' ) {
						if( $(elements[i]).parent().children('p.error').length == 0 ) $(elements[i]).parent().append( error[0].outerHTML );

					// default
					} else {
						if( $(elements[i]).parent().children('p.error').length == 0 ) $(elements[i]).parent().append( error[0].outerHTML );
					}

				// select or select2
				} else if( elements[i].tagName == 'SELECT' ) {
					if( $(elements[i]).hasClass('select_custom') ) {
						if( $(elements[i]).parent().parent().children('p.error').length == 0 ) $(elements[i]).parent().parent().append( error[0].outerHTML ); // client
					} else {
						if( $(elements[i]).parent().children('p.error').length == 0 ) $(elements[i]).parent().append( error[0].outerHTML ); // staff
					}

				// file_validator
				} else if( elements[i].tagName == 'INPUT' && elements[i].name.endsWith('file_validator') && elements[i].type == 'hidden' ) {
					$(elements[i]).parent().append( error[0].outerHTML );

				// custom
				} else {

				}
			}
		}

		, invalidHandler : function(form, validator) {
			$('input, textarea, select').on('propertychange change keyup paste input focusout', function() {
				validator.element( $(this) );
			});

			alert('입력값을 확인하세요.');

			try {
				validator.errorList[0].element.scrollIntoView(true);
			} catch(e) {
				console.log(e);
			}
			for(var i=0; i<validator.errorList.length; i++ ) {
				if( validator.errorList[i].element.tagName == "INPUT" || validator.errorList[i].element.tagName == "TEXTAREA" || validator.errorList[i].element.tagName == 'SELECT' ) {
					validator.errorList[i].element.focus(); break;
				}
			}
		}
	});

	var elLoop = {};

	var form = this[0];

	for ( var i = 0, elements = this.find( "input, textarea, select, [contenteditable]" ).not( ":submit, :reset, :image, :disabled, [data-validation-disabled = true]" ); elements[i]; i++ ) {
		var hasValdatro = false;

		if( !elLoop[elements[i].name] && elements[i].name  ) {
			var els = findByName( elements[i].name );

			if ( els.length != undefined && els.length > 1) {

				for (var cnt = 0; cnt < els.length; cnt++) {
					if( els[cnt].dataset && els[cnt].dataset.validation ) {
						$(els[cnt]).rules("remove");
						$(els[cnt]).rules("add",  JSON.parse(els[cnt].dataset.validation));

						hasValdatro = true;
					}
				}

			} else {
				if( elements[i].dataset && elements[i].dataset.validation ) {
					$(elements[i]).rules("remove");
					$(elements[i]).rules("add", JSON.parse(elements[i].dataset.validation));

					hasValdatro = true;
				}
			}
		}

		if( hasValdatro ) {
			elLoop[elements[i].name] = elements[i].name;
		}
	}

	function findByName( name ) {
		return $(form).find( "[name='" + escapeCssMeta( name ) + "'][data-validation-disabled != true]"  );
	}

	function  escapeCssMeta( string ) {
		return string.replace( /([\\!"#$%&'()*+,./:;<=>?@\[\]^`{|}~])/g, "\\$1" );
	}

	if( $('#'+ this[0].id).valid() ) {
		if( callback ) {
			callback();
		}
	}
}

// 파일 압축 다운로드
function fileDownAll(fimReferKeyId, fileName){
	$.ajax({
		url : basePath + "/cmm/fms/fileDownloadAllList.do"
		, dataType : "json"
		, async : false
		, data : {
			fimReferKeyId : fimReferKeyId
		}
		, success : function ( res ){
			if(res.isSuccess){
				$("#allDownForm #path").val(res.path);
				$("#allDownForm #fileName").val(fileName);
				$("#allDownForm").attr("action", basePath + "/cmm/fms/fileDownloadAll.do").submit();

			}else if(!res.isSuccess) {
				alert("파일이 없습니다.");

			}else {
				alert("파일다운에 실패했습니다.");
			}
		}
	});
}

/**
*****************************************
@ function :  그리드 체크박스 전체선택
*****************************************
**/
function fnChkBoxAll() {
	$("#chkAll").click(function(){
		var chkAll = $('input:checkbox[name="chkAll"]').is(":checked") ==  true;

		if(chkAll == true){
			tableObject.rows().select();
		}else{
			tableObject.rows().deselect();
		}
	});
}

/**
*****************************************
@ function :  검색
*****************************************
**/
function searchBtn(){
	tableObject.destroy();
	callGrid();
}

/**
*****************************************
@ function :  엔터시 검색
*****************************************
**/
function fnKeyPressEnter(){
	$(document).keypress(function(event) {
		var keycode = event.keyCode || event.which;
		if(event.keyCode == 13) {
			searchBtn();
		}
	});
}

/****************************************
@ function :  Serialize Form data값 변경
formData=changeSerialize(formData, "변경 KEY", "변경 VALUE");
*****************************************/
function changeSerialize(values,k,v) {
	var found = false;

	for (i = 0; i < values.length && !found; i++) {
		if (values[i].name == k) {
			values[i].name = v;
			found = true;
		}
	}
	if(!found) {
		values.push(
			{
				name: k,
				value: v
			}
		);
	}
	return values;
}

//팝업창으로 실행시 clientSubTemplate가 다시 로드 되는게 아니라 기존것을 사용하여서 테이블 가로스클롤을 적용시키기 위해 추가
function ScrollReady() {
	if (navigator.platform) {

		// 모바일 기기 접속 여부 체크 후 PC일때만 스크롤 custom
		var filter = "win16|win32|win64|mac|macintel";

		if (filter.indexOf(navigator.platform.toLowerCase()) < 0) {
			//alert('모바일');

			//테이블 스크롤  커스터마이징 해제
			$(".pp_scrollx_tbl, .pp_scrollx_tbl_sm, .pp_scrollx_tbl_md , .pp_scrollx_tbl_lg, .pp_scrollx_tbl_xl").off(mCustomScrollbar);

		} else {
			//alert('PC');

			//테이블 스크롤  커스터마이징
			$(".pp_scrollx_tbl_lg, .pp_scrollx_tbl_xl").mCustomScrollbar({
				axis:"x",
				theme:"dark",
				advanced:{
					autoExpandHorizontalScroll:true
				}
			});
			$(".pp_scrollx_tbl, .pp_scrollx_tbl_sm, .pp_scrollx_tbl_md").mCustomScrollbar({
				axis:"x",
				theme:"dark",
				advanced:{
					autoExpandHorizontalScroll:false
				}
			});
		};
	};
}
