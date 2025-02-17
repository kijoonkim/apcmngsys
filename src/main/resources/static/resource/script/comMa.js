/**
 * 
 */

/**
 * @name 		gfnma_objectToString
 * @description Object 를 String(콤마)으로 변환
 * @function
 * @param 		{Object} 
 * @returns 	{string}
 */
const gfnma_objectToString = function (obj, log) {
	var res 	= '';
	var temp 	= '';
	var logstr	= '';
	if(log){
		logstr = '{\n';
	}
	for(key in obj){
		temp = obj[key] + '';
		// ∥ 파라미터 구분자로 변경함
		res += temp + '∥';
		//res += temp.replaceAll("\,", "&#44;") + ',';
		if(log){
			logstr += key + ' : "' + obj[key] + '",\n';
		}
	}
	res = res.slice(0, -1);
	if(log){
		logstr += '\n}';
		console.log(logstr);
	}
	return res;
}

/**
 * @name 		gfnma_getThreeComma
 * @description 값을 쓰리콤마로 변경
 * @function
 * @param 		{string} 
 * @returns 	{string}
 */
const gfnma_getThreeComma = function (val) {
    var str = String(val);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
};

/**
 * @name 		gfnma_date
 * @description 날짜를 yyyyMMddHHmmss 문자열로
 * @function
 * @returns 	{string}
 */
const gfnma_date = function (sdate) {
	var rstr = '';
	var pad = function(number, length) {
	  var str = '' + number;
	  while (str.length < length) {
	    str = '0' + str;
	  }
	  return str;
	}
	
	var nowDate = null;	
	if(sdate){
		nowDate = sdate;	
	} else {
		nowDate = new Date();	
	}
	var yyyy = nowDate.getFullYear().toString();
	var MM = pad(nowDate.getMonth() + 1,2);
	var dd = pad(nowDate.getDate(), 2);
	var hh = pad(nowDate.getHours(), 2);
	var mm = pad(nowDate.getMinutes(), 2)
	var ss = pad(nowDate.getSeconds(), 2)
	rstr = yyyy + MM + dd + hh + mm + ss;
	return rstr;
}

/**
 * @name 		gfnma_date1
 * @description 날짜를 yyyy-MM-dd HH:mm:ss 문자열로
 * @function
 * @returns 	{string}
 */
const gfnma_date1 = function () {
	var rstr = '';
	rstr += gfnma_date().substr(0,4) + '-' + gfnma_date().substr(4,2) + '-' + gfnma_date().substr(6,2); 
	rstr += ' ' + gfnma_date().substr(8,2) + ':' + gfnma_date().substr(10,2) + ':' + gfnma_date().substr(12,2);
	return rstr;
}

/**
 * @name 		gfnma_date2
 * @description 오늘 월의 마지막 일자
 * @function
 * @returns 	{string}
 */
const gfnma_date2 = function() {
	var rstr = '';
	let date = new Date(gfnma_date().substr(0,4) , gfnma_date().substr(4,2), 0);
	rstr = date.getDate();
	if(rstr.length==1){
		rstr = '0' + rstr;
	}
	rstr = gfnma_date().substr(0,4) + '-' + gfnma_date().substr(4,2) + '-' + rstr; 
	return rstr;
}

/**
 * @name 		gfnma_date3
 * @description 해당 월의 마지막 일자
 * @function
 * @param 		{string} year 	: 년 
 * @param 		{string} month 	: 월
 * @param 		{boolean} onlyDay 	: true(마지막일자만), false : 년-월-일
 * @returns 	{string}
 */
const gfnma_date3 = function(year, month, onlyDay) {
	var rstr 	= '';
	var p_month	= '';
	if(month){
		p_month = (month.length==1) ? '0' + month : month;
	}  
	var date = new Date(year, p_month, 0);
	rstr = date.getDate();
	if(onlyDay){
	} else {
		if(rstr.length==1){
			rstr = year + '-' + month + '-0' + rstr;
		} else {
			rstr = year + '-' + month + '-' + rstr;
		}
	}
	return rstr;
}

/**
 * @name 		gfnma_date4
 * @description 오늘날짜를 yyyy-MM-dd 형식으로 반환
 * @function
 * @param 		{string} str : 구분자 
 * @returns 	{string}
 */
const gfnma_date4 = function (str) {
	var rstr 	= '';
	var gubun	= (str) ? str : '-';
	rstr += gfnma_date().substr(0,4) + gubun + gfnma_date().substr(4,2) + gubun + gfnma_date().substr(6,2); 
	return rstr;
}

/**
 * @name 		gfnma_date5
 * @description 날짜를 yyyy-MM-dd 형식으로 반환
 * @function
 * @param 		{string} str1 : 날짜 
 * @param 		{string} str2 : 구분자 
 * @returns 	{string}
 */
const gfnma_date5 = function (str1, str2) {
	if(!str1) return '';
	var rstr 	= '';
	var gubun	= (str2) ? str2 : '-';
	var regex 	= /[^0-9]/g;
	str1 		= str1.replace(regex, "");
	rstr += str1.substr(0,4) + gubun + str1.substr(4,2) + gubun + str1.substr(6,2); 
	return rstr;
}

/**
 * @name 		gfnma_date6
 * @description 오늘날짜를 yyyyMMdd 혹은 yyyy-MM-dd 형식으로 반환
 * @function
 * @param 		{string} str : 구분자 
 * @returns 	{string}
 */
const gfnma_date6 = function (str) {
	var rstr 	= '';
	var gubun	= (str) ? str : '';
	var nday	= gfnma_date();
	rstr = nday.substr(0,4) + gubun + nday.substr(4,2) + gubun + nday.substr(6,2); 
	return rstr;
}

/**
 * @name 		gfnma_date7
 * @description 날짜에서 구분자 삭제
 * @function
 * @param 		{string} str : 날짜 
 * @returns 	{string}
 */
const gfnma_date7 = function (str) {
	var regex 	= /[^0-9]/g;
	var rstr 	= str.replace(regex, "");
	return rstr;
}

/**
 * @name 		gfnma_date8
 * @description 날짜에서 요일을 구한다.
 * @function
 * @param 		{string} str : 날짜(2024-05-01) 
 * @returns 	{string}
 */
const gfnma_date8 = function(str) {
    const week = ['일', '월', '화', '수', '목', '금', '토'];
    const dayOfWeek = week[new Date(str).getDay()];
    return dayOfWeek;
}

/**
 * @name 		gfnma_date9
 * @description 현재 날짜에서 달을 차감함.
 * @function
 * @param 		{string} val : 차감 달 
 * @returns 	{string}
 */
const gfnma_date9 = function(val) {
	
	// 1자리면 0 붙이기
	var pad = function(n) {
		return n < 10 ? '0' + n : '' + n
	}
	// 윤년인지여부
	var isLeapYear = function(year) { 
		return (((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0)); 
	}
	// 해당년월의 말일 구하기
	var getLastDate = function (year, month) {    
		return [31, (isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month];
	}
	
    var d = new Date();    
	var date = d.getDate();
	d.setDate(1); 					// 1일로 설정    
	d.setMonth(d.getMonth() + val); // 개월수 더하기(빼기)    
	return d.getFullYear() + '-' + pad(d.getMonth()+1) + '-' + pad(Math.min(date, getLastDate(d.getYear(), d.getMonth())));    
}

/**
 * @name 		gfnma_nvl
 * @description undefined 를 '' 로 변환
 * @function
 * @param 		{string} 
 * @returns 	{string}
 */
const gfnma_nvl = function (val) {
	var str = '';
	if(val=='' || val==null || val==undefined || val=='undefined'){
		str = '';
	} else {
		str = val + '';
	}
	str = str.trim();
	return str;
}

/**
 * @name 		gfnma_nvl2
 * @description undefined 를 '' 로 변환 / 숫자는 그대로 리턴
 * @function
 * @param 		{string} 
 * @returns 	{string}
 */
const gfnma_nvl2 = function (val) {
	var str = '';
	if(val==='' || val===null || val===undefined || val==='undefined' || val==='NaN'){
		str = '';
	} else {
		return val;
	}
	return str;
}

/**
 * @name 		gfnma_formIdStr
 * @description url 에서 formId 추출하기
 * @function
 * @param 		{string} 
 * @returns 	{string}
 */
const gfnma_formIdStr = function (val) {
	
	if(val == undefined || val == null || val == ''){
		return '';
	};	
	var rstr	= "";
	var flist 	= val.split('/');
	if(flist.length==0){
		return rstr;
	}
	var idx		= flist.length - 1;
	rstr		= flist[idx];
	return rstr;
}

/**
 * @name 		gfnma_setFileChangeEvent
 * @description url 에서 formId 추출하기
 * @function
 * @param 		{string} target			//파일 input tag (복수가능)
 * @param 		{string} accessFile		//파일 업로드 가능 확장자 : 업로드 가능, 제한은 2개중 한개의 리스트 목록만 있어야 함.
 * @param 		{string} limitFile		//파일 업로드 제한 확장자 : 업로드 가능, 제한은 2개중 한개의 리스트 목록만 있어야 함. 
 * @param 		{string} limitSizeMB	//파일 업로드 제한 용량(MB)
 */
const gfnma_setFileChangeEvent = function (obj) {
	
	// parameter setting ---------------------------
	var _accessFile		= obj.accessFile;
	var _limitFile		= obj.limitFile;
	var _limitSizeMB	= obj.limitSizeMB;
	// ----------------------------------------------

	// 기본셋팅 -------------------------------------
	var chkAccessFile 	= ['jpg','png','jpeg'];			//파일 업로드 가능 확장자 : 업로드 가능, 제한은 2개중 한개의 리스트 목록만 있어야 함.
	var chkLimitFile 	= [];							//파일 업로드 제한 확장자 : 업로드 가능, 제한은 2개중 한개의 리스트 목록만 있어야 함. 
	var chkLimitSizeMB 	= 20;							//파일 업로드 제한 용량(MB,KB)
	// ----------------------------------------------
	
	var target = null;	
    if (typeof obj.target == 'string') {
		target = $(obj.target);
	} else {
		target = obj.target;
	}
	if(_accessFile){
		if(_accessFile.length>0){
		} else {
			_accessFile = chkAccessFile.slice();
		}
	} else {
		_accessFile = chkAccessFile.slice();
	}
	if(_limitFile){
		if(_limitFile.length>0){
		} else {
			_limitFile = chkLimitFile.slice();
		}
	} else {
		_limitFile = chkLimitFile.slice();
	}
	if(!_limitSizeMB){
		_limitSizeMB = chkLimitSizeMB;
	}
	// -------------------------------------------------
	
	//alert
	var ltfileStr = "";
	if(_accessFile.length>0){
		for (var i = 0; i < _accessFile.length; i++) {
			ltfileStr += _accessFile[i] + ", ";
		}
		ltfileStr += "파일만 업로드 할 수 없습니다.";
	}
	if(_limitFile.length>0){
		for (var i = 0; i < _limitFile.length; i++) {
			ltfileStr += _limitFile[i] + ", ";
		}
		ltfileStr += "파일은 업로드 할 수 없습니다.";
	}
	
	target.change(function(event) {
		var ext = $(this).val().split('.').pop().toLowerCase();
		
		if(_accessFile.length>0){
			if($.inArray(ext,_accessFile)==-1){
				alert(ltfileStr);
				$(this).val('');
				return false;
			} else {
			}
		}	
		if(_limitFile.length>0){
			if($.inArray(ext,_limitFile)==-1){
			} else {
				alert(ltfileStr);
				$(this).val('');
				return false;
			}
		}	
		
		if(_limitSizeMB){
			var fsize = gfnma_getFileSize($(this), 'MB');
			if(fsize > Number(_limitSizeMB)){
				alert('파일 용량은 ' + _limitSizeMB + 'MB 를 초과할 수 없습니다.');
				$(this).val('');
				return false;
			}
		}
	});		
	
}

/**
 * @name 		gfnma_setComSelect
 * @description sbux-select 데이터 설정
 * @function
 * @param 		{(string|string[])} _targetIds
 * @param 		{any[]} _jsondataRef
 * @param 		{string} _bizcompid
 * @param 		{string} _whereclause
 * @param 		{string} _compcode
 * @param 		{string} _clientcode
 * @param 		{string} _subcode
 * @param 		{string} _codename
 * @param 		{string} _allyn
 * @param 		{string} _defaultvalue
 * @returns 	{void}
 */
async function gfnma_setComSelect(_targetIds, _jsondataRef, _bizcompid, _whereclause, _compcode, _clientcode, _subcode, _codename, _allyn, _defaultvalue) {

	if (gfn_isEmpty(_bizcompid)) {
		return;
	}

    var paramObj = { 
		V_P_DEBUG_MODE_YN	: ''
		,V_P_LANG_ID		: ''
		,V_P_COMP_CODE		: _compcode
		,V_P_CLIENT_CODE	: _clientcode
		,V_P_BIZCOMP_ID		: _bizcompid
		,V_P_WHERE_CLAUSE	: _whereclause
		,V_P_PARAM_LIST		: ''
		,V_P_FORM_ID		: ''
		,V_P_MENU_ID		: ''
		,V_P_PROC_ID		: ''
		,V_P_USERID			: ''
		,V_P_PC				: ''
    };		
	//console.log('paramObj:', paramObj);

    const postJsonPromise = gfn_postJSON("/com/comSelectList.do", {
    	getType				: 'json',
    	workType			: 'Q',
    	cv_count			: '1',
    	params				: gfnma_objectToString(paramObj)
	});

	const data = await postJsonPromise;
	console.log('select data ('+_bizcompid + '):', data);

	try {
		_jsondataRef.length = 0;
		data.cv_1.forEach((item) => {
			if(item){
				if(_defaultvalue){
					if(_defaultvalue==item[_subcode]){
						const cdVl = {
							text		: gfnma_nvl(item[_codename]),
							label		: gfnma_nvl(item[_codename]),
							value		: gfnma_nvl(item[_subcode]),
							selected	: "selected"
						}
						if(_allyn== "Y") Object.assign(cdVl, item);
						_jsondataRef.push(cdVl);
					} else {
						const cdVl = {
							text	: gfnma_nvl(item[_codename]),
							label	: gfnma_nvl(item[_codename]),
							value	: gfnma_nvl(item[_subcode])
						}
						if(_allyn== "Y") Object.assign(cdVl, item);
						_jsondataRef.push(cdVl);
					}
				} else {
					const cdVl = {
						text	: gfnma_nvl(item[_codename]),
						label	: gfnma_nvl(item[_codename]),
						value	: gfnma_nvl(item[_subcode])
					}
					if(_allyn== "Y") Object.assign(cdVl, item);
					_jsondataRef.push(cdVl);
				}
			}
		});
		//console.log('_jsondataRef:', _jsondataRef);

		if (Array.isArray(_targetIds)) {
	
			_targetIds.forEach((_targetId) => {
				SBUxMethod.refresh(_targetId);
			});
		} else {
			SBUxMethod.refresh(_targetIds);
		}

	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
		console.error("failed", e);
		console.error("failed", e.message);
	}
}

 /*
 * @name 		gfnma_setComSelect2
 * @description 화면에서 받은 데이터로 sbux-select 설정
 * @function
 * @param 		{(string|string[])} _targetIds
 * @param 		{any[]} _jsondataRef
 * @param 		{string} _bizcompid
 * @param 		{any[]} _bizCompDatas
 * @param 		{string} _whereclause
 * @param 		{string} _compcode
 * @param 		{string} _clientcode
 * @param 		{string} _subcode
 * @param 		{string} _codename
 * @param 		{string} _allyn
 * @param 		{string} _defaultvalue
 * @returns 	{void}
 */
async function gfnma_setComSelect2(_targetIds, _jsondataRef, _bizCompDatas, _bizcompid, _whereclause, _compcode, _clientcode, _subcode, _codename, _allyn, _defaultvalue) {

	let data = '';

	for(var i = 0; _bizCompDatas.length > i; i++){
		if(!gfn_isEmpty(_bizCompDatas[i][_bizcompid])){
			data = _bizCompDatas[i][_bizcompid];
			break;
		}
	}


	if (gfn_isEmpty(_bizcompid) || gfn_isEmpty(_bizCompDatas) || gfn_isEmpty(data)) {
		return;
	}

	try {
		_jsondataRef.length = 0;
		data.forEach((item) => {
			if(item){
				if(_defaultvalue){
					if(_defaultvalue==item[_subcode]){
						const cdVl = {
							text		: gfnma_nvl(item[_codename]),
							label		: gfnma_nvl(item[_codename]),
							value		: gfnma_nvl(item[_subcode]),
							selected	: "selected"
						}
						if(_allyn== "Y") Object.assign(cdVl, item);
						_jsondataRef.push(cdVl);
					} else {
						const cdVl = {
							text	: gfnma_nvl(item[_codename]),
							label	: gfnma_nvl(item[_codename]),
							value	: gfnma_nvl(item[_subcode])
						}
						if(_allyn== "Y") Object.assign(cdVl, item);
						_jsondataRef.push(cdVl);
					}
				} else {
					const cdVl = {
						text	: gfnma_nvl(item[_codename]),
						label	: gfnma_nvl(item[_codename]),
						value	: gfnma_nvl(item[_subcode])
					}
					if(_allyn== "Y") Object.assign(cdVl, item);
					_jsondataRef.push(cdVl);
				}
			}
		});

		if (Array.isArray(_targetIds)) {
			_targetIds.forEach((_targetId) => {
				SBUxMethod.refresh(_targetId);
			});
		} else {
			SBUxMethod.refresh(_targetIds);
		}

	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
		console.error("failed", e);
		console.error("failed", e.message);
	}
}


/**
 * @name 		gfnma_getComSelectList
 * @description sbux-select 데이터 가져오기
 * @function
 * @param 		{(string|string[])} _targetIds
 * @param 		{string} _bizcompid
 * @param 		{string} _whereclause
 * @param 		{string} _compcode
 * @param 		{string} _clientcode
 * @param 		{string} _subcode
 * @param 		{string} _codename
 * @returns 	{Array}
 */
async function gfnma_getComSelectList(_bizcompid, _whereclause, _compcode, _clientcode, _subcode, _codename, _callbackFn) {

	if (gfn_isEmpty(_bizcompid)) {
		return;
	}

    var paramObj = { 
		V_P_DEBUG_MODE_YN	: ''
		,V_P_LANG_ID		: ''
		,V_P_COMP_CODE		: _compcode
		,V_P_CLIENT_CODE	: _clientcode
		,V_P_BIZCOMP_ID		: _bizcompid
		,V_P_WHERE_CLAUSE	: _whereclause
		,V_P_PARAM_LIST		: ''
		,V_P_FORM_ID		: ''
		,V_P_MENU_ID		: ''
		,V_P_PROC_ID		: ''
		,V_P_USERID			: ''
		,V_P_PC				: ''
    };		

    const postJsonPromise = gfn_postJSON("/com/comSelectList.do", {
    	getType				: 'json',
    	workType			: 'Q',
    	cv_count			: '1',
    	params				: gfnma_objectToString(paramObj)
	});

	const data = await postJsonPromise;
	console.log('gfnma_getComSelectList get data:', data);

	const rlist = [];
	try {
		data.cv_1.forEach((item) => {
			const cdVl = {
				text	: item[_codename],
				label	: item[_codename],
				value	: item[_subcode]
			}
			rlist.push(cdVl);
		});
		//console.log('rlist:', rlist);

	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
		console.error("failed", e);
		console.error("failed", e.message);
	}	
	if(_callbackFn){
		_callbackFn(rlist);
	}
	return rlist;
}
/**
 * @name 		gfnma_getComList
 * @description sbux-select 데이터 가져오기
 * @function
 * @param 		{(string|string[])} _targetIds
 * @param 		{string} _bizcompid
 * @param 		{string} _whereclause
 * @param 		{string} _compcode
 * @param 		{string} _clientcode
 * @param 		{string} _subcode
 * @param 		{string} _codename
 * @returns 	{Array}
 */
async function gfnma_getComList(_bizcompid, _whereclause, _compcode, _clientcode, _subcode, _codename, _callbackFn) {

	if (gfn_isEmpty(_bizcompid)) {
		return;
	}

	var paramObj = {
		V_P_DEBUG_MODE_YN	: ''
		,V_P_LANG_ID		: ''
		,V_P_COMP_CODE		: _compcode
		,V_P_CLIENT_CODE	: _clientcode
		,V_P_BIZCOMP_ID		: _bizcompid
		,V_P_WHERE_CLAUSE	: _whereclause
		,V_P_PARAM_LIST		: ''
		,V_P_FORM_ID		: ''
		,V_P_MENU_ID		: ''
		,V_P_PROC_ID		: ''
		,V_P_USERID			: ''
		,V_P_PC				: ''
	};

	const postJsonPromise = gfn_postJSON("/com/comSelectList.do", {
		getType				: 'json',
		workType			: 'Q',
		cv_count			: '1',
		params				: gfnma_objectToString(paramObj)
	});

	const data = await postJsonPromise;
	console.log('gfnma_getComList get data:', data);
	return data;
}

/**
 * @name 		gfnma_multiSelectInit
 * @description 멀티 컬럼 select
 * @function
 * @param 		{string} target
 * @param 		{string} compCode
 * @param 		{string} clientCode
 * @param 		{string} bizcompId
 * @param 		{string} whereClause
 * @param 		{string} formId
 * @param 		{string} menuId
 * @param 		{string} selectValue
 * @param 		{string} colValue
 * @param 		{string} colLabel
 * @param 		{string} columns
 * @returns 	{void}
 */
async function gfnma_multiSelectInit(obj) {

	var _target			= obj.target;
	var _compCode		= obj.compCode;
	var _clientCode		= obj.clientCode;
	var _bizcompId		= obj.bizcompId;
	var _whereClause	= obj.whereClause;
	var _formId			= obj.formId;
	var _menuId			= obj.menuId;
	var _selectValue	= obj.selectValue;
	var _dropType		= obj.dropType;
	var _dropAlign		= obj.dropAlign;
	var _colValue		= obj.colValue;
	var _colLabel		= obj.colLabel;
	var _columns		= obj.columns;
	var _callback		= obj.callback;
	var _returnData		= obj.returnData;

    var paramObj = {
		V_P_DEBUG_MODE_YN	: ''
		,V_P_LANG_ID		: 'KOR'
		,V_P_COMP_CODE		: _compCode
		,V_P_CLIENT_CODE	: _clientCode
		,V_P_BIZCOMP_ID		: _bizcompId
		,V_P_WHERE_CLAUSE	: _whereClause
		,V_P_PARAM_LIST		: ''
		,V_P_FORM_ID		: _formId
		,V_P_MENU_ID		: _menuId
		,V_P_PROC_ID		: ''
		,V_P_USERID			: ''
		,V_P_PC				: ''
    };		

    const postJsonPromise = gfn_postJSON("/com/comSelectList.do", {
    	getType				: 'json',
    	workType			: 'Q',
    	cv_count			: '1',
    	params				: gfnma_objectToString(paramObj)
	});

	const data = await postJsonPromise;
	console.log('multi select data ('+_bizcompId + '):', data);
	
	const innerCreat = function (tarId, data) {
		
		//중간에 버튼 삽입 -----------------------
		var bchk = $(tarId).closest('div').find('button').length;
		if(bchk==1){
			$(tarId).closest('div').find('button').removeClass('btn-light').addClass('btn-outline-secondary');
			$(tarId).closest('div').find('button').find('i').remove();
			$(tarId).closest('div').find('button').css('border-right', 'none').css('border-radius', '0px');
			
			var tmpBtn = '';
			tmpBtn += '<button type="button" style="width:25px;min-width:25px;padding-left:0px;padding-right:0px" class="btn btn-sm btn-outline-secondary dropdown-toggle">';
			tmpBtn += '	<span class="visually-hidden">';
			tmpBtn += '		<i class="sbux-sidemeu-ico fas fa-angle-down" style="font-size: 14px;color:#9b9ea1"></i>';        
			tmpBtn += '	</span>';
			tmpBtn += '</button>';
			$(tarId).closest('div').find('button').after(tmpBtn);
			$(tarId).closest('div').find('button').eq(1).click(function(event){
				event.stopPropagation();
				if($(this).closest('div').hasClass('open')===true){
					$(this).closest('div').removeClass('open');
					$(this).closest('div').find('button').eq(0).attr('aria-expanded', 'false');
				} else {
					//console.log($(this).closest('div'));
					$(this).closest('div').addClass('open');
					$(this).closest('div').find('button').eq(0).attr('aria-expanded', 'true');
				}
			});
			
			//console.log('id:', $(tarId).attr('id'));
			var tmpWidth1 = $(tarId).closest('div').find('button').eq(0).width();
			var tmpWidth2 = $(tarId).closest('div').find('button').eq(1).width();
			var tmpWidth3 = tmpWidth1 + tmpWidth2;
			//console.log('tmpWidth3:', tmpWidth3);
			$(tarId).closest('div').css('min-width', tmpWidth3);
			tmpWidth3 = tmpWidth1 - tmpWidth2;
			//console.log('tmpWidth3:', tmpWidth3);
			$(tarId).closest('div').find('button').eq(0).width(tmpWidth3);
		}
		//------------------------------------------
		
		//style set
		if(_dropType=='down'){
			$(tarId).closest('div').addClass('dropdown');
		} else {
			$(tarId).closest('div').addClass('dropup');
		}
		if(_dropAlign=='right'){
			$(tarId).closest('div').find('.dropdown-menu').addClass('dropdown-menu-right');
		}
		
		var htm 	= '';		
		var tcss 	= 'padding-top:4px;padding-bottom:4px;font-weight:bold;';
		htm += '<table class="table table-sm table-bordered table-hover" style="width:100%;display:inline-block">';
		htm += '<thead style="position:sticky;top:0">';
		htm += '<tr style="background:#dddcdc;text-align:left;">';
		//table head
		for(i=0; i<_columns.length; i++){
			htm += '<th style="' + tcss + 'width:' + _columns[i]['width'] + ';' + _columns[i]['style'] + '" >' + _columns[i]['caption'] + '</th>';
		}	
		htm += '</tr>';
		htm += '</thead>';
		htm += '<tbody></tbody>';
		htm += '</table>';
		$(tarId).closest('div').find('.dropdown-menu').html(htm);
		$(tarId).closest('div').find('.dropdown-menu').css('border', 'solid 1px #a3a1a1');
		$(tarId).closest('div').addClass('cu-multi-select');
		
		//table tbody
		htm = '';
		htm += '<tr style="cursor:pointer" class="clickable-row">';
		htm += '<td colspan="'+ _columns.length +'" style="text-align:center;" cu-code="">선택</td>';
		htm += '</tr>';
		for(i=0; i<data.cv_1.length; i++){
			var obj = data.cv_1[i];
			htm += '<tr style="cursor:pointer" class="clickable-row">';
			for(j=0; j<_columns.length; j++){
				htm += '<td style="' + _columns[j]['style'] + '" cu-code="' + _columns[j]['ref'] + '">' + gfnma_nvl2(obj[_columns[j]['ref']]) + '</td>';
			}
			htm += '</tr>';
		}
		$(tarId).closest('div').find('tbody').html(htm);
		

		//button clear
		$(tarId).closest('div').find('button').find('font').text('선택');
		$(tarId).closest('div').find('button').attr('cu-value', '');
		$(tarId).closest('div').find('button').attr('cu-label', '');
		
		//tr click event
		$(tarId).closest('div').find('.clickable-row').click(function(){
			if($(this).hasClass('active')){
				$(this).removeClass('active')
				$(tarId).attr('cu-value', '');
				$(tarId).attr('cu-label', '');
				$(tarId).find('font').text('선택');
			} else {
				$(this).addClass('active').siblings().removeClass('active');
				var empty = $(this).find('[cu-code=""]').text();
				if(empty) {
					$(tarId).attr('cu-value', '');
					$(tarId).attr('cu-label', '');
					$(tarId).find('font').text('선택');
				} else {
					var cu_value = $(this).find('[cu-code=' + _colValue + ']').text();
					var cu_label = $(this).find('[cu-code=' + _colLabel + ']').text();
					$(tarId).attr('cu-value', cu_value);
					$(tarId).attr('cu-label', cu_label);
					$(tarId).find('font').text(cu_label);
				}
				if(typeof _callback == "function") {
					_callback(cu_value)
				}
			}
		});	
	}	
	
	try {

		if (Array.isArray(_target)) {
			_target.forEach((tarId) => {
				innerCreat(tarId, data);
			});
		} else {
			innerCreat(_target, data);
		}
		
		if(typeof _returnData == "function") {
			_returnData(data);
		}
		
	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
		console.error("failed", e);
		console.error("failed", e.message);
	}
}

/**
 * @name 		gfnma_multiSelectInit2
 * @description 화면에서 데이터를 받아 멀티 컬럼 select
 * @function
 * @param 		{string} target
 * @param 		{string} compCode
 * @param 		{string} clientCode
 * @param 		{string} bizcompId
 * @param 		{string} whereClause
 * @param 		{string} formId
 * @param 		{string} menuId
 * @param 		{string} selectValue
 * @param 		{string} colValue
 * @param 		{string} colLabel
 * @param 		{string} columns
 * @param 		{any[]} _bizCompDatas
 * @returns 	{void}
 */
async function gfnma_multiSelectInit2(obj, bizCompDatas) {

	var _target			= obj.target;
	var _compCode		= obj.compCode;
	var _clientCode		= obj.clientCode;
	var _bizcompId		= obj.bizcompId;
	var _whereClause	= obj.whereClause;
	var _formId			= obj.formId;
	var _menuId			= obj.menuId;
	var _selectValue	= obj.selectValue;
	var _dropType		= obj.dropType;
	var _dropAlign		= obj.dropAlign;
	var _colValue		= obj.colValue;
	var _colLabel		= obj.colLabel;
	var _columns		= obj.columns;
	var _callback		= obj.callback;

	let data = '';

	for(var i = 0; bizCompDatas.length > i; i++){
		if(!gfn_isEmpty(bizCompDatas[i][_bizcompId])){
			data = bizCompDatas[i][_bizcompId];
			break;
		}
	}
	
	if(gfn_isEmpty(data)){
		return;
	}

	const innerCreat = function (tarId, data) {
		
		//중간에 버튼 삽입 -----------------------
		var bchk = $(tarId).closest('div').find('button').length;
		if(bchk==1){
			$(tarId).closest('div').find('button').removeClass('btn-light').addClass('btn-outline-secondary');
			$(tarId).closest('div').find('button').find('i').remove();
			$(tarId).closest('div').find('button').css('border-right', 'none').css('border-radius', '0px');
			
			var tmpBtn = '';
			tmpBtn += '<button type="button" style="width:25px;min-width:25px;padding-left:0px;padding-right:0px" class="btn btn-sm btn-outline-secondary dropdown-toggle">';
			tmpBtn += '	<span class="visually-hidden">';
			tmpBtn += '		<i class="sbux-sidemeu-ico fas fa-angle-down" style="font-size: 14px;color:#9b9ea1"></i>';        
			tmpBtn += '	</span>';
			tmpBtn += '</button>';
			$(tarId).closest('div').find('button').after(tmpBtn);
			$(tarId).closest('div').find('button').eq(1).click(function(event){
				event.stopPropagation();
				if($(this).closest('div').hasClass('open')===true){
					$(this).closest('div').removeClass('open');
					$(this).closest('div').find('button').eq(0).attr('aria-expanded', 'false');
				} else {
					//console.log($(this).closest('div'));
					$(this).closest('div').addClass('open');
					$(this).closest('div').find('button').eq(0).attr('aria-expanded', 'true');
				}
			});
			
			//console.log('id:', $(tarId).attr('id'));
			var tmpWidth1 = $(tarId).closest('div').find('button').eq(0).width();
			var tmpWidth2 = $(tarId).closest('div').find('button').eq(1).width();
			var tmpWidth3 = tmpWidth1 + tmpWidth2;
			//console.log('tmpWidth3:', tmpWidth3);
			$(tarId).closest('div').css('min-width', tmpWidth3);
			tmpWidth3 = tmpWidth1 - tmpWidth2;
			//console.log('tmpWidth3:', tmpWidth3);
			$(tarId).closest('div').find('button').eq(0).width(tmpWidth3);
		}
		//------------------------------------------
		
		//style set
		if(_dropType=='down'){
			$(tarId).closest('div').addClass('dropdown');
		} else {
			$(tarId).closest('div').addClass('dropup');
		}
		if(_dropAlign=='right'){
			$(tarId).closest('div').find('.dropdown-menu').addClass('dropdown-menu-right');
		}
		
		var htm 	= '';		
		var tcss 	= 'padding-top:4px;padding-bottom:4px;font-weight:bold;';
		htm += '<table class="table table-sm table-bordered table-hover" style="width:100%;display:inline-block">';
		htm += '<thead style="position:sticky;top:0">';
		htm += '<tr style="background:#dddcdc;text-align:left;">';
		//table head
		for(i=0; i<_columns.length; i++){
			htm += '<th style="' + tcss + 'width:' + _columns[i]['width'] + ';' + _columns[i]['style'] + '" >' + _columns[i]['caption'] + '</th>';
		}	
		htm += '</tr>';
		htm += '</thead>';
		htm += '<tbody></tbody>';
		htm += '</table>';
		$(tarId).closest('div').find('.dropdown-menu').html(htm);
		$(tarId).closest('div').find('.dropdown-menu').css('border', 'solid 1px #a3a1a1');
		$(tarId).closest('div').addClass('cu-multi-select');
		
		//table tbody
		htm = '';
		htm += '<tr style="cursor:pointer" class="clickable-row">';
		htm += '<td colspan="'+ _columns.length +'" style="text-align:center;" cu-code="">선택</td>';
		htm += '</tr>';
		for(i=0; i<data.length; i++){
			var obj = data[i];
			htm += '<tr style="cursor:pointer" class="clickable-row">';
			for(j=0; j<_columns.length; j++){
				htm += '<td style="' + _columns[j]['style'] + '" cu-code="' + _columns[j]['ref'] + '">' + gfnma_nvl2(obj[_columns[j]['ref']]) + '</td>';
			}	
			htm += '</tr>';
		}
		$(tarId).closest('div').find('tbody').html(htm);
		
		//button clear
		$(tarId).closest('div').find('button').find('font').text('선택');
		$(tarId).closest('div').find('button').attr('cu-value', '');
		$(tarId).closest('div').find('button').attr('cu-label', '');
		
		//tr click event
		$(tarId).closest('div').find('.clickable-row').click(function(){
			if($(this).hasClass('active')){
				$(this).removeClass('active')
				$(tarId).attr('cu-value', '');
				$(tarId).attr('cu-label', '');
				$(tarId).find('font').text('선택');
			} else {
				$(this).addClass('active').siblings().removeClass('active');
				var empty = $(this).find('[cu-code=""]').text();
				if(empty) {
					$(tarId).attr('cu-value', '');
					$(tarId).attr('cu-label', '');
					$(tarId).find('font').text('선택');
				} else {
					var cu_value = $(this).find('[cu-code=' + _colValue + ']').text();
					var cu_label = $(this).find('[cu-code=' + _colLabel + ']').text();
					$(tarId).attr('cu-value', cu_value);
					$(tarId).attr('cu-label', cu_label);
					$(tarId).find('font').text(cu_label);
				}
				if(typeof _callback == "function") {
					_callback(cu_value)
				}
			}
		});		
	}	

	try {
		if (Array.isArray(_target)) {
			_target.forEach((tarId) => {
				innerCreat(tarId, data);
			});
		} else {
			innerCreat(_target, data);
		}

	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
		console.error("failed", e);
		console.error("failed", e.message);
	}
}


/**
 * @name 		gfnma_multiSelectSet
 * @description 멀티 컬럼 select 에 값 select 하기
 * @function
 * @param 		{string} id
 * @param 		{string} colValue
 * @param 		{string} colLabel
 * @param 		{string} findValue
 * @returns 	{void}
 */
const gfnma_multiSelectSet = async function (id, colValue, colLabel, findValue) {
	var f_value = "";
	var find	= false;
	if(findValue){
		$(id).closest('div').find('tbody tr').each(function(){
			f_value = $(this).find('[cu-code=' + colValue + ']').text();
			if(f_value==findValue){
				find = true;
				$(this).addClass('active').siblings().removeClass('active');
				var cu_value = $(this).find('[cu-code=' + colValue + ']').text();
				var cu_label = $(this).find('[cu-code=' + colLabel + ']').text();
				$(id).attr('cu-value', cu_value);
				$(id).attr('cu-label', cu_label);
				//$(id).find('font').text(cu_label);
				$(id).html('<font>' + cu_label + '</font>');
				return false;
			}
		});
	}
	if(!find){
		$(id).attr('cu-value', '');
		$(id).attr('cu-label', '');
		$(id).find('font').text('선택');
		$(id).closest('div').find('tbody tr').removeClass('active');
	}
}

/**
 * @name 		gfnma_multiSelectGet
 * @description 멀티 컬럼 select 에 선택된 값 가져오기 
 * @function
 * @param 		{string} id		: target
 * @param 		{string} type	: null: value 값 / true: object 값
 * @returns 	{object}
 */
const gfnma_multiSelectGet = function (id, type) {
	
//	var obj = {
//		value	: gfnma_nvl($(id).attr('cu-value')),
//		label	: gfnma_nvl($(id).attr('cu-label'))
//	};
	var obj = {};
	var chk = false;
	$(id).closest('div').find('tbody').find('.active').find('td').each(function(){
		var colName  = $(this).attr('cu-code');
		var colValue = $(this).text();
		obj[colName] = colValue;
		chk = true;
	});
	if(type){
		if(chk){
			return obj;
		} else {
			return null;
		}
	} else {
		return gfnma_nvl($(id).attr('cu-value'));
	}
}

/**
 * @name 		gfnma_uxDataSet
 * @description 데이터를 ux컴포넌트에 바인딩
 * @function
 * @param 		{string} target
 * @param 		{object} obj
 * @returns 	{void}
 */
const gfnma_uxDataSet = function (target, obj) {
	
	for(var key in obj){
		if($(target).find('#'+key)){
			var cls = $(target).find('#'+key).attr('class') + '';
			var val = gfnma_nvl(obj[key]);
			if(cls.indexOf('sbux-')>-1){
				SBUxMethod.set(key,	val);
			} else {
				$(target).find('#'+key).val(val);
				$(target).find('#'+key).text(val);
			}
		}
	}
}

/**
 * @name 		gfnma_uxDataSet2
 * @description 데이터를 ux컴포넌트에 바인딩
 * @function
 * @param 		{string} target
 * @param 		{object} obj
 * @param 		{string} except: 	ID 중 제외할 단어 
 * @param 		{string} incluld_p: ID 중 포함(앞)할 단어 
 * @param 		{string} incluld_b: ID 중 포함(뒤)할 단어 
 * @returns 	{void}
 */
const gfnma_uxDataSet2 = function (target, obj, except, incluld_p, incluld_b) {
	
	for(var key in obj){
		var skey = "";
		if(except){
			skey = key.replaceAll(except, '');
		};
		if(incluld_p){
			skey = incluld_p + key;
		};
		if(incluld_b){
			skey = key + incluld_b;
		};
		if($(target).find('#'+skey)){
			var cls = $(target).find('#'+skey).attr('class') + '';
			var val = gfnma_nvl(obj[key]);
			if(cls.indexOf('sbux-')>-1){
				SBUxMethod.set(skey,	val);
			} else {
				$(target).find('#'+skey).val(val);
				$(target).find('#'+skey).text(val);
			}
		}
	}
}

/**
 * @name 		gfnma_uxDataClear
 * @description 지정된 타겟에 자식 태그들의 ux컴포넌트 값을 초기화
 * @function
 * @param 		{string} target
 * @returns 	{void}
 */
const gfnma_uxDataClear = function (target) {
    var tar = typeof target == 'string' ? $(target) : target;
	tar.find('input').val('');
	tar.find('input').each(function(){
		var id 	= $(this).attr('id');		
		SBUxMethod.set(id, '');
	});
	tar.find('input[type=checkbox]').prop('checked', false);
	tar.find('select').val('');
	tar.find('select').each(function(){
		var id = $(this).attr('id');
		SBUxMethod.set(id, '');
	});
	tar.find('.cu-multi-select').each(function(){
		var id = $(this).find('button').eq(0).attr('id');
		id = '#' + id;
        gfnma_multiSelectSet(id, '', '', '');
	});
	//to do .. 필요하면 말하세요
}

/**
 * @name 		gfnma_uxDisabled
 * @description 지정된 타겟에 자식 태그들의 ux컴포넌트 값을 초기화
 * @function
 * @param 		{string} target
 * @param 		{string} bol	: readonly true false
 * @returns 	{void}
 */
const gfnma_uxDisabled = function (target, bol) {
	
	//input
	$(target).find('input').each(function(){
		$(this).prop('readonly', bol);
	});

	//checkbox
	$(target).find('input[type=checkbox]').each(function(){
		$(this).prop('disabled', bol);
	});
	
	//gfnma_multiSelectInit
	$(target).find('.dropdown').each(function(){
		$(this).find('button').prop('disabled', bol);
	});
	
	//모달버튼
	$(target).find('button[data-sbux-toggle=modal]').prop('disabled', bol);
}

/**
 * @name 		gfnma_getObjectRowTable
 * @description 테이블 tr에서 DATA 추출하기
 * @function
 * @param 		{string} target
 * @returns 	{object}
 */
const gfnma_getObjectRowTable = function (target) {
	
    var obj = {};
    target.find('td').each(function (index, item) {
        if ($(this).attr('cu-name')) {
            obj[$(this).attr('cu-name')] = $(this).text();
        }
    });
    return obj;
}

/**
 * @name 		gfnma_getNumber
 * @description 숫자(0-9)만 추출한다.
 * @function
 * @param 		{string} str
 * @returns 	{Number}
 */
const gfnma_getNumber = function (str) {
	
	var regex 	= /[^0-9]/g;
	str = (str) ? str + '' : '';
	var result 	= str.replace(regex, "");
    return Number(result);
}

/**
 * @name 		gfnma_getRound
 * @description 반올림 한다.
 * @function
 * @param 		{Number} val : 값
 * @param 		{Number} unit : 반올림자릿수
 * @returns 	{Number}
 */
const gfnma_getRound = function (val, unit) {
	
	var rnum = 0;
	if(val==0){
		rnum = Math.floor(val);
	} else {
		var str = '';
		for (var i = 0; i < unit; i++) {
			str += '0';
		}
		if(unit==0){
			rnum = Math.round(val);
		} else {
			str = '1' + str;
			str = Number(str);
			rnum = Math.floor(Math.round(val * str))/str;
		}
	}
    return rnum;
}

/**
 * @name 		gfnma_isDate
 * @description 날짜 유무를 검증한다.
 * @function
 * @param 		{string} str
 * @returns 	{boolean}
 */
const gfnma_isDate = function (str) {
	
	var chk = false;
	if(!str) return chk;
	
	var regex = /[^0-9]/g;
	str = str.replace(regex, "") + '';
	if(str.length==8){
		if( !isNaN(str) &&
				str.substr(0,2)=='20' &&
					(Number(str.substr(4,2)) > 0 && Number(str.substr(4,2)) < 13) && 
						(Number(str.slice(-2)) > 0 && Number(str.slice(-2)) < 32)
		){
			chk = true;
		}
	}
	return chk;
}

/**
 * @name 		gfnma_getFileSize
 * @description 파일 크기 계산
 * @param 		{object} target : 타겟명칭 혹은 객체
 * @param 		{string} unit : mb, kb : 파일단위
 * @returns 	{Number}
 */
const gfnma_getFileSize = function (target, unit) {
    var iSize = 0;
    var brow = gfnma_getBrowser();

    var tar;
    if (typeof target == 'string') {
        tar = $(target);
    } else {
        tar = target;
    }

    if (brow.indexOf('IE') != -1 && brow.indexOf('IE:11') == -1) {
        var objFSO = new ActiveXObject('Scripting.FileSystemObject');
        var sPath = tar[0].value;
        var objFile = objFSO.getFile(sPath);
        iSize = objFile.size;
    } else {
        iSize = tar[0].files[0].size;
    }
    if (unit.toLowerCase() == 'kb') {
        iSize = iSize / 1024;
    } else if (unit.toLowerCase() == 'mb') {
        iSize = iSize / 1024 / 1024;
    } else {
        // BYTE
        iSize = iSize;
    }
    return Number(iSize);
};

const gfnma_getBrowser = function () {
    var agt = navigator.userAgent.toLowerCase();
    if ((navigator.appName == 'Netscape' && agt.indexOf('trident') != -1) || agt.indexOf('msie') != -1) {
        if (agt.indexOf('msie') != -1) {
            // 익스플로러 10 이하일 경우
            var rv = -1;
            if (navigator.appName == 'Microsoft Internet Explorer') {
                var ua = navigator.userAgent;
                var re = new RegExp('MSIE ([0-9]{1,}[.0-9]{0,})');
                if (re.exec(ua) != null) rv = parseFloat(RegExp.$1);
            }
            return 'IE:' + rv;
        } else {
            return 'IE:11';
        }
    }

    if (agt.indexOf('chrome') != -1) return 'Chrome';
    if (agt.indexOf('opera') != -1) return 'Opera';
    if (agt.indexOf('staroffice') != -1) return 'Star Office';
    if (agt.indexOf('webtv') != -1) return 'WebTV';
    if (agt.indexOf('beonex') != -1) return 'Beonex';
    if (agt.indexOf('chimera') != -1) return 'Chimera';
    if (agt.indexOf('netpositive') != -1) return 'NetPositive';
    if (agt.indexOf('phoenix') != -1) return 'Phoenix';
    if (agt.indexOf('firefox') != -1) return 'Firefox';
    if (agt.indexOf('safari') != -1) return 'Safari';
    if (agt.indexOf('skipstone') != -1) return 'SkipStone';
    if (agt.indexOf('netscape') != -1) return 'Netscape';
    if (agt.indexOf('mozilla/5.0') != -1) return 'Mozilla';
};

/**
 * @name 		gfnma_showPopover
 * @description 필수값 체크에서 필수값이 없는 부분에 팝오버 메시지 출력
 * @param 		{object} element : HTML node
 * @function
 */
function gfnma_showPopover(element) {
	const popoverHtml = `
        <div id="popover_wrap_` + element.id + `" style="position: absolute; display: inline;">
            <div id="popover_req_` + element.id + `" class="sbux-pop sbux-fade sbux-pop-bottom sbux-in sbux-required-popover" style="display: block;">
                <div class="sbux-pop-arrow"></div>
                <div class="sbux-pop-content" style="width: max-content;">이 입력란을 선택하세요.</div>
            </div>
        </div>`;

	const $element = $(element).parent();
	const offset = $element.offset();
	const popover = $(popoverHtml).appendTo('body');

	const popoverWidth = $("#popover_req_"+element.id).outerWidth();
	const popoverHeight = $("#popover_req_"+element.id).outerHeight();
	const elementWidth = $element.outerWidth();
	const elementHeight = $element.outerHeight();

	popover.css({
		top: offset.top + (elementHeight / 2),
		left: offset.left + (elementWidth / 2) - (popoverWidth),
	});

	setTimeout(function() {
		popover.fadeOut(300, function() {
			popover.remove();
		});
	}, 1000);
}

/**
 * @name 		validateRequired
 * @description 필수값 체크
 * @function
 */
const validateRequired = function (target) {
	var dropdownList = [];
	var returnValue = true;

	if(target) {
		dropdownList = $('button[group-id='+target+'][required]');
	} else {
		dropdownList = $('button[required]');
	}

	if(dropdownList.length < 1) {
		return true;
	}

	for(var i = 0; i < dropdownList.length; i++) {
		const selectedValue = $(dropdownList[i]).attr('cu-value');

		if (!selectedValue) {
			gfnma_showPopover(dropdownList[i]);
			returnValue = false;
			break;
		}
	}

	return returnValue;
}

/**
 * @name 		gfnma_getComCode
 * @description 멀티 컬럼 select
 * @function
 * @param 		{string} target
 * @param 		{string} groupCategory
 * @param 		{string} groupCode
 * @param 		{string} groupName
 * @param 		{string} subCode
 * @param 		{string} extraField1
 * @param 		{string} extraField2
 * @param 		{string} extraField3
 * @param 		{string} formId
 * @param 		{string} menuId
 * @returns 	{void}
 */
async function gfnma_getComCode(obj, callbackFn) {

	var _workType			= obj.workType;
	var _groupCategory		= obj.groupCategory;
	var _groupCode			= obj.groupCode;
	var _groupName			= obj.groupName;
	var _subCode			= obj.subCode;
	var _extraField1		= obj.extraField1;
	var _extraField2		= obj.extraField2;
	var _extraField3		= obj.extraField3;
	var _formId				= obj.formId;
	var _menuId				= obj.menuId;

    var paramObj = { 
		V_P_DEBUG_MODE_YN	: ''
		,V_P_LANG_ID		: ''
		,V_P_COMP_CODE		: gv_ma_selectedCorpCd
		,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
		
		,V_P_GROUP_CATEGORY	: _groupCategory
		,V_P_GROUP_CODE		: _groupCode
		,V_P_GROUP_NAME		: _groupName
		,V_P_SUB_CODE		: _subCode
		,V_P_EXTRA_FIELD1	: _extraField1
		,V_P_EXTRA_FIELD2	: _extraField2
		,V_P_EXTRA_FIELD3	: _extraField3
		
		,V_P_FORM_ID		: _formId
		,V_P_MENU_ID		: _menuId
		,V_P_PROC_ID		: ''
		,V_P_USERID			: ''
		,V_P_PC				: ''
    };		

    const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3000Q1List.do", {
    	getType				: 'json',
    	workType			: _workType,
    	cv_count			: '4',
    	params				: gfnma_objectToString(paramObj)
	});

	const data = await postJsonPromise;
	console.log('gfnma_getComCode data (SP_COM3000_Q1):', data);

	var rlist = [];
	try {
		
		if (_.isEqual("S", data.resultStatus)) {

        	data.cv_1.forEach((item, index) => {
				const msg = {
					SUB_CODE				: gfnma_nvl(item.SBSD_CD),			
					CODE_NAME				: gfnma_nvl(item.CD_NM),			
					SYSTEM_YN				: gfnma_nvl(item.SYS_YN),			
					DESCR					: gfnma_nvl(item.DSCTN),			
					EXTRA_FIELD1			: gfnma_nvl(item.EXTRA_COL1),			
					EXTRA_FIELD2			: gfnma_nvl(item.EXTRA_COL2),			
					EXTRA_FIELD3			: gfnma_nvl(item.EXTRA_COL3),			
					EXTRA_FIELD4			: gfnma_nvl(item.EXTRA_COL4),			
					EXTRA_FIELD5			: gfnma_nvl(item.EXTRA_COL5),			
					EXTRA_FIELD6			: gfnma_nvl(item.EXTRA_COL6),			
					EXTRA_FIELD7			: gfnma_nvl(item.EXTRA_COL7),			
					EXTRA_FIELD8			: gfnma_nvl(item.EXTRA_COL8),			
					EXTRA_FIELD9			: gfnma_nvl(item.EXTRA_COL9),			
					EXTRA_FIELD10			: gfnma_nvl(item.EXTRA_COL10),			
					SORT_SEQ				: gfnma_nvl(item.SORT_SEQ),			
					USE_YN					: gfnma_nvl(item.USE_YN),			
					GROUP_CODE				: gfnma_nvl(item.GRP_CD),			
					CLIENT_CODE				: gfnma_nvl(item.CLNT_CD),			
					COMP_CODE				: gfnma_nvl(item.CO_CD),			
				}
				rlist.push(msg);
			});
			callbackFn(rlist);
    	} else {
      		alert(data.resultMessage);
    	}
		
	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
		console.error("failed", e);
		console.error("failed", e.message);
	}
}

/**
 * @name 		gfnma_firmBankingSend
 * @description 펌뱅킹 호출
 * @function
 * @param 		{string} fbs_service
 * @param 		{string} send_data
 * @param 		{string} bSync
 * @returns 	{void}
 */
async function gfnma_firmBankingSend(fbs_service, send_data, bSync) {
	var paramObj = {
		FBS_SERVICE : fbs_service,
		SEND_DATA : send_data,
		bSync : bSync
	};

	const postJsonPromise = gfn_postJSON("/com/sendFirmBanking.do", paramObj);
	const data = await postJsonPromise;

	try {
		if (_.isEqual("S", data.resultStatus)) {
			return data;
		} else {
			alert(data.message);
		}
	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
		console.error("failed", e.message);
		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	}
}

/**
 * @name 		gfnma_firmBankingSend
 * @description 펌뱅킹 리턴메시지 추출
 * @function
 * @param 		{string} inputString
 * @param 		{string} startIndex
 * @param 		{string} length
 * @returns 	{void}
 */
function gfnma_firmSubString(inputString, startIndex, length) {
	const encoding = 'ks_c_5601-1987';

	// 문자열을 바이트 배열로 변환
	const bytes = iconv.encode(inputString, encoding);

	// 범위를 벗어나지 않도록 조정
	if (bytes.length <= startIndex + length) {
		return iconv.decode(bytes, encoding);
	}

	// 부분 배열을 추출
	const subBytes = bytes.slice(startIndex, startIndex + length);

	return iconv.decode(subBytes, encoding);
}

/**
 * @name 		gfnma_fbsOpen
 * @description 펌뱅킹 업무개시 조회
 * @function
 * @param 		{string} strBank_Code
 * @param 		{string} strFbs_Service
 * @param 		{string} strcs_code
 * @param 		{string} strFbs_Work_Type
 * @returns 	{boolean}
 */
const gfnma_fbsOpen = async function (strBank_Code, strFbs_Service, strcs_code, strFbs_Work_Type) {
	let bSync = gfn_nvl(strBank_Code) != "";

	var paramObj = {
		V_P_DEBUG_MODE_YN	: '',
		V_P_LANG_ID		: '',
		V_P_COMP_CODE		: gv_ma_selectedCorpCd,
		V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
		V_P_BANK_CODE : strBank_Code,
		V_P_FBS_SERVICE : strFbs_Service,
		V_P_CS_CODE : strcs_code,
		V_P_FBS_WORK_TYPE : strFbs_Work_Type,
		V_P_INTERFACEID : "",
		V_P_FORM_ID		: p_formId,
		V_P_MENU_ID		: p_menuId,
		V_P_PROC_ID		: '',
		V_P_USERID			: '',
		V_P_PC				: '',
	};

	const postJsonPromise = gfn_postJSON("/com/selectFbsOpenList.do", {
		getType				: 'json',
		workType			: 'Q',
		cv_count			: '1',
		params				: gfnma_objectToString(paramObj)
	});

	const data = await postJsonPromise;
	console.log('data:', data);
	try {
		if (_.isEqual("S", data.resultStatus)) {
			if(data.cv_1.length > 0) {
				let str = "";
				let num1 = 0;
				let num2 = 0;

				for(var i = 0; i < data.cv_1.length; i++) {
					var strArray = await gfnma_firmBankingSend(strFbs_Service, gfn_nvl(data.cv_1[i]["SEND_DATA"]), bSync);
					if (gfn_nvl(strArray[0]).trim() == "000" || gfn_nvl(strArray[0]).trim() == "0000" || gfn_nvl(strArray[0]).trim() == "COMP") {
						++num2;
					} else {
						++num1;
						str = gfn_nvl(strArray[0]);
					}
				}
				if (num2 > 0 && num1 == 0)
					return true;
			}
		} else {
			alert(data.resultMessage);
			return false;
		}

		return true;
	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
		console.error("failed", e.message);
		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		return false;
	}
}

/**
 * @name 		gfnma_fbsName
 * @description 펌뱅킹 업무개시 조회
 * @function
 * @param 		{string} strBank_Code
 * @param 		{string} strFbs_Service
 * @param 		{string} strcs_code
 * @param 		{string} strFbs_Work_Type
 * @returns 	{boolean}
 */
const gfnma_fbsName = async function (
	strBank_Code, strFbs_Service, strFbs_Work_Type,
	strAccount_Bank, strAcccount_No, strSocialNum, strAccount_Owner, strCurrency_Code, strFbs_No) {
	let bSync = false;
	let strArray1 = new Array("", "OPEN_ERROR");

	var paramObj = {
		V_P_DEBUG_MODE_YN	: '',
		V_P_LANG_ID		: '',
		V_P_COMP_CODE		: gv_ma_selectedCorpCd,
		V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
		V_P_BANK_CODE : strBank_Code,
		V_P_FBS_SERVICE : strFbs_Service,
		V_P_FBS_WORK_TYPE : strFbs_Work_Type,
		V_P_ACCOUNT_BANK : strAccount_Bank,
		V_P_ACCOUNT_NO : strAcccount_No.replaceAll("-", ""),
		V_P_SOCIALNUM : strSocialNum,
		V_P_ACCOUNT_OWNER : strAccount_Owner,
		V_P_CURRENCY_CODE : strCurrency_Code,
		V_P_FBS_NO : strFbs_No,
		V_P_INTERFACEID : "",
		V_P_FORM_ID		: p_formId,
		V_P_MENU_ID		: p_menuId,
		V_P_PROC_ID		: '',
		V_P_USERID			: '',
		V_P_PC				: '',
	};

	const postJsonPromise = gfn_postJSON("/com/selectFbsName.do", {
		getType				: 'json',
		workType			: 'Q',
		cv_count			: '1',
		params				: gfnma_objectToString(paramObj)
	});
	const data = await postJsonPromise;

	try {
		if (_.isEqual("S", data.resultStatus)) {
			if (data.cv_1.length >= 1) {
				let str = "";
				let num1 = 0;
				let num2 = 0;

				for (const row in data.cv_1) {
					var strArray2 =  gfnma_firmBankingSend(FBS_SERVICE, gfn_nvl(row["SEND_DATA"]), bSync);

					if (strArray2.code.trim() == "000" || strArray2.code.trim() == "0000" || strArray2.code.trim() == "COMP") {
						++num2;
					} else {
						++num1;
						str = strArray2.code;
					}
				}

				if (num1 > 0) {
					gfn_comAlert("E0000", "수취인확인 에러 [" + str + "]");
					strArray1[1] = str;
				}

				if (num2 > 0 && num1 == 0) {
					strArray1[1] = "OK";
				}
			}

			return strArray1;
		} else {
			strArray1[1] = data.resultMessage;
			alert(data.resultMessage);
			return strArray1;
		}
	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
		console.error("failed", e.message);
		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	}
}

/**
 * @name 		gfnma_getExchangeRateQ
 * @description 환율
 * @function
 * @param 		{string} fbs_service
 * @param 		{string} send_data
 * @param 		{string} bSync
 * @returns 	{void}
 */
async function gfnma_getExchangeRateQ(paramObj, workType, callbackFn) {
	
    const postJsonPromise = gfn_postJSON("/fi/far/rec/getExchangeRate.do", {
    	getType				: 'json',
    	workType			: workType,
    	cv_count			: '1',
    	params				: gfnma_objectToString(paramObj)
	});    	 
	const data = await postJsonPromise;
	console.log('gfnma_getExchangeRateQ data:', data);

	try {
		if (_.isEqual("S", data.resultStatus)) {
			if(callbackFn){
				callbackFn(data.cv_1);
			}
		} else {
			alert(data.message);
		}
	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
		console.error("failed", e.message);
		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	}
}

/**
 * @name 		gfnma_htmlExcelDown
 * @description html table 을 엑셀로 다운로드
 * @function
 * @param 		{object} Object
 * @returns 	
 */
const gfnma_htmlExcelDown = function(obj) {
    var _fileName 				= obj.fileName;
    var _sheetName 				= obj.sheetName;
    var _heads 					= obj.heads;
    var _headFixed 				= obj.headFixed;
    var _dataStartColumn 		= obj.dataStartColumn;
    var _data 					= obj.data;
    var _removeCommaIndexList 	= obj.removeCommaIndexList;

    if (!_data || _data.length == 0) {
        alert('다운로드할 데이터가 없습니다.');
        return;
    }

    const download = async (workbook, fileName) => {
        const buffer = await workbook.xlsx.writeBuffer();
        const blob = new Blob([buffer], {
            type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        });
        const url = window.URL.createObjectURL(blob);
        const anchor = document.createElement('a');
        anchor.href = url;
        anchor.download = fileName + '.xlsx';
        anchor.click();
        window.URL.revokeObjectURL(url);
    };

    var workbook = new ExcelJS.Workbook();
    var sheet = null;
    if (_headFixed) {
        sheet = workbook.addWorksheet(_sheetName, { views: [_headFixed] });
    } else {
        sheet = workbook.addWorksheet(_sheetName);
    }

    //set head
    for (var i = 0; i < _heads.length; i++) {
        var colName = _heads[i]['column'];
        if (colName.indexOf(':') > -1) {
            var tmps = colName.split(':');
            colName = tmps[0];
        }
        sheet.getCell(colName).value = _heads[i]['text'];
        sheet.mergeCells(_heads[i]['column']);

        if (_heads[i]['style']) {
            sheet.getCell(colName).style = _heads[i]['style'];
        }

        if (_heads[i]['bgColor']) {
            sheet.getCell(colName).fill = {
                type: 'pattern',
                pattern: 'solid',
                fgColor: { argb: _heads[i]['bgColor'] },
            };
        }

        if (_heads[i]['width']) {
            sheet.getColumn(i + 1).width = Number(_heads[i]['width']);
        }
    }

    //eng column create
    var endCol = [
        'A','B','C','D','E','F','G','H','I','J',
        'K','L','M','N','O','P','Q','R','S','T',
        'U','V','W','X','Y','Z',
        'AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ',
        'AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT',
        'AU','AV','AW','AX','AY','AZ'
    ];
    var f_eng = _dataStartColumn.replace(/[0-9]/g, '');
    var f_num = Number(_dataStartColumn.replace(/[A-Z]/g, ''));

    var f_sidx = 0;
    for (var i = 0; i < endCol.length; i++) {
        if (endCol[i] == f_eng) {
            f_sidx = i;
            break;
        }
    }
    //console.log('_data', _data);

    //remove comma
    if (_removeCommaIndexList != undefined && _removeCommaIndexList.length > 0) {
        var nlist = [];
        for (var i = 0; i < _data.length; i++) {
            var tmp = [];
            for (var j = 0; j < _data[i].length; j++) {
                var str = _data[i][j];
                for (var k = 0; k < _removeCommaIndexList.length; k++) {
                    if (j == Number(_removeCommaIndexList[k])) {
                        str = Number(comapp.util.removeComma(_data[i][j]));
                        break;
                    }
                }
                tmp.push(str);
            }
            nlist.push(tmp);
        }
        _data = [];
        _data = nlist.slice();
    }

    //set data
    for (var i = 0; i < _data.length; i++) {
        var tmplist = _data[i];
        var tt_sidx = f_sidx;
        for (var j = 0; j < tmplist.length; j++) {
            var tcolname = endCol[tt_sidx] + (f_num + i);
            sheet.getCell(tcolname).value = tmplist[j];
            tt_sidx++;
        }
    }

    //file down
    download(workbook, _fileName).then((r) => {});
};

const gfnma_getRowTable = function(tableId) {
    var rlist = [];
    $(tableId).find('tbody').find('tr').each(function (){
	    var tmp = [];
	    $(this).find('td').each(function () {
	            tmp.push($(this).text());
	        });
	    rlist.push(tmp);
    });
    return rlist;
};

const gfnma_camelToSnakeUpper = function(str) {
	return str.replace(/([a-z])([A-Z])/g, '$1_$2').toLowerCase().toUpperCase();
};
const gfnma_snakeToCamel = function(str){
	return str.toLowerCase().replace(/(_\w)/g,function(match){
		return match[1].toUpperCase();
	});
};

/**
 * @name gfn_getTableElement
 * @description Table 내부 sb요소 일괄 GET
 * 필수 : table Id 필수, table 내부 td 요소들 id값 개발표준 준수
 * ex) reg[등록] srch[검색조건] dtl[상세]
 * @function
 * @param {String} _tableId
 * @param {String} _pattern
 * @param {Object} _paramObj
 * @param {String} _preFix
 * @returns
 */
const gfnma_getTableElement = function(_tableId, _pattern, _paramObj, _preFix, _ignore) {
	let table = document.getElementById(_tableId);
	let elements = table.querySelectorAll(`[id^=${_pattern}]`);
	elements = Array.from(elements);

	function searchMsg(_el) {
		let $closestTd = $(_el).closest('td');
		let $closestTh = $closestTd.closest('tr').find('th').filter(function () {
			return $(this).index() < $closestTd.index();
		}).last();
		return $closestTh.html();

	}

	for (let element of elements) {
		let key = element.id.split('-').pop();
		let formatKey = _preFix + gfnma_camelToSnakeUpper(key);

		if (element.type === 'text' || element.tagName === 'SELECT' || element.tagName === 'TEXTAREA') {
			let sbValue = SBUxMethod.get(element.id);
			if (gfn_isEmpty(sbValue)) {
				if(_ignore.includes(key)){
					continue;
				}
				let msg = searchMsg(element);
				gfn_comAlert("W0005", msg);
				return false;
			} else {
				if (_paramObj.hasOwnProperty(formatKey)) {
					_paramObj[formatKey] = sbValue;
				} else {
					for (let objKey in _paramObj) {
						if (objKey.split('_').slice(2).join('_') === key.toUpperCase()) {
							_paramObj[objKey] = sbValue;
						}
					}
				}
			}
		} else if (element.type === 'checkbox') {
			let sbValue = SBUxMethod.getCheckbox(element.id)[element.id];
			if (_paramObj.hasOwnProperty(formatKey)) {
				_paramObj[formatKey] = sbValue;
			} else {
				for (let objKey in _paramObj) {
					if (objKey.split('_').slice(2).join('_') === key.toUpperCase()) {
						_paramObj[objKey] = sbValue;
					}
				}
			}
		}
	}
	return true;
}


/**
 * @name 		gfnma_findReportFilePath
 * @description 레포트 파일 경로 조회
 * @function
 * @param 		{string} reportType
 * @returns 	{string}
 */
const gfnma_findReportFilePath = async function(reportType) {
	var paramObj = {
		V_P_DEBUG_MODE_YN : '',
		V_P_LANG_ID : '',
		V_P_COMP_CODE : gv_ma_selectedCorpCd,
		V_P_CLIENT_CODE : gv_ma_selectedClntCd,
		V_P_REPORT_TYPE : reportType,
		V_P_FORM_ID : p_formId,
		V_P_MENU_ID : p_menuId,
		V_P_PROC_ID : '',
		V_P_USERID : '',
		V_P_PC : ''
	};
	let reportFilePath = '';

	const postJsonPromise = gfn_postJSON("/com/selectReportFilePath.do", {
		getType				: 'json',
		cv_count			: '1',
		params				: gfnma_objectToString(paramObj)
	});
	const data = await postJsonPromise;

	try {
		if (_.isEqual("S", data.resultStatus)) {
			if(data.resultMessage){
				reportFilePath = data.cv_1[0].REPORT_DLL;
			}
		} else {
			alert(data.resultMessage);
		}
	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
		console.error("failed", e.message);
		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	}

	return reportFilePath;
}

/**
 * @name 		gfnma_convertDataForReport
 * @description 서버에서 조회한 data를 report용 data로 변환
 * @function
 * @param 		{object} data
 * @returns 	{object}
 */
const gfnma_convertDataForReport = async function(data) {
	const param = [];
	let regx = /^cv_\d+$/;
	let keys = Object.keys(data);

	for (var i = 0; i < keys.length; i++) {
		if(regx.test(keys[i])) {
			let index = keys[i].replace("cv_", "") - 1;
			while (param.length <= index) {
				param.push({data: { root: []}});
			}
			param[index].data.root = data[keys[i]];
		}
	}

	return param;
}

/**
 * @name gfnma_convertMultiRowDataForReport
 * @description 데이터를 동적으로 중첩하는 함수
 * @param {Object} rowData - 모든 데이터 객체 (cv_* 포함)
 * @param {string} masterKey - 마스터 데이터의 키 이름 (예: "cv_6")
 * @param {Array<string>} slaveKeys - 슬레이브 데이터의 키 이름 배열 (예: ["cv_7", "cv_14"])
 * @param {string} matchingKey - 마스터와 슬레이브를 매핑하는 키 이름 (예: "EMP_CODE")
 * @returns {Array} 중첩된 데이터
 */
const gfnma_convertMultiRowDataForReport = async function(rowData, masterKey, slaveKeys, matchingKey) {
	const param = {};
	let regx = /^cv_\d+$/;
	let keys = Object.keys(rowData);

	for (var i = 0; i < keys.length; i++) {
		if(regx.test(keys[i])) {
			param[keys[i]] = rowData[keys[i]];
		}
	}

	const masterData = param[masterKey]; // 마스터 데이터 추출

	var convertData = masterData.map((masterItem) => {
		const masterKeyValue = masterItem[matchingKey];

		const nestedData = {};
		// 지정된 슬레이브 키들만 처리
		slaveKeys.forEach((key) => {
			const slaveData = param[key] || []; // 슬레이브 데이터 추출
			nestedData[key] = slaveData.filter(
				(slaveItem) => slaveItem[matchingKey] === masterKeyValue
			);
		});

		return { ...masterItem, ...nestedData };
	});

	return [{data: { root: convertData}}];
}

/**
 * @name 		gfnma_generateUUID
 * @description uuid생성
 * @function
 * @returns 	{string}
 */
function gfnma_generateUUID() {
	return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
		(c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
	);
}

/**
 * @name 		gfnma_getAccountRange
 * @description 세금계산서 매핑 대상
 * @function
 * @param 		{string} workType
 * @param 		{string} strAccountCode
 * @returns 	{void}
 */
async function gfnma_getAccountRange(workType, strAccountCode, callbackFn) {
	
	var paramObj = {
		V_P_DEBUG_MODE_YN 	: '',
		V_P_LANG_ID 		: '',
		V_P_COMP_CODE 		: gv_ma_selectedCorpCd,
		V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
		V_P_ACCOUNT_CODE 	: strAccountCode,
		V_P_FORM_ID 		: p_formId,
		V_P_MENU_ID 		: p_menuId,
		V_P_PROC_ID 		: '',
		V_P_USERID 			: '',
		V_P_PC 				: ''
	};
		
    const postJsonPromise = gfn_postJSON("/com/getAccountRange.do", {
    	getType				: 'json',
    	workType			: workType,
    	cv_count			: '1',
    	params				: gfnma_objectToString(paramObj)
	});    	 
	const data = await postJsonPromise;
	console.log('gfnma_getExchangeRateQ data:', data);

	try {
		if (_.isEqual("S", data.resultStatus)) {
			if(callbackFn){
				callbackFn(data.cv_1);
			}
		} else {
			alert(data.message);
		}
	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
		console.error("failed", e.message);
		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	}
}

/**
 * @name 		gfnma_getAccountRange
 * @description 세금계산서 매핑 대상
 * @function
 * @param 		{string} workType
 * @param 		{string} strAccountCode
 * @returns 	{void}
 */
const gfnma_gridValidate = async function(objGrid, nRow, nCol, strValue) {
	if (strValue != "") {
		return strValue;
	} else {
		return { isValid : false, message : '값을 입력하세요.' };
	}
}

/**
 * @name 		gfnma_gridValidateCheck
 * @description grid validation check
 * @function
 * @param 		{object} objGrid
 * @returns 	{boolean}
 */
const gfnma_gridValidateCheck = function() {
	const grids = _SBGrid.getGrids();

	for (const gridId of grids) {
		const grid = _SBGrid.getGrid(gridId);
		const updatedData = grid.getUpdateData(true, 'all');
		const captions = grid.getCaption('array')[0];
		const rowHeaderLength = (typeof grid.getRowHeader() === 'string' && grid.getRowHeader() != 'none') ? 1 : (grid.getRowHeader() == 'none' ? 0 : grid.getRowHeader().length);

		for (let colIndex = 0; colIndex < grid.getCols(); colIndex++) {
			const colAttr = grid.getColUserAttr(colIndex);

			if (colAttr?.required) {
				for (const rowData of updatedData) {
					const isInsertedOrUpdated = rowData.status === 'i' || rowData.status === 'u';
					const cellValue = gfn_nvl(rowData.data[grid.getRefOfCol(colIndex)]);

					if (isInsertedOrUpdated && cellValue === "") {
						gfn_comAlert("W0002", captions[colIndex - rowHeaderLength]);
						grid.clickCell(rowData.rownum, colIndex, true, false);
						grid.editCell();
						return false; // Validation failed
					}
				}
			}
		}
	}

	return true; // Validation passed
}

/**
 * @name 		gfnma_validateResidentNumber
 * @description grid validation check
 * @function
 * @param 		{string} residentNumber
 * @returns 	{boolean}
 */
const gfnma_validateResidentNumber = function(residentNumber) {
	// 입력 형식이 올바른지 확인 (6자리-7자리)
	if (!/^\d{6}-\d{7}$/.test(residentNumber)) {
		return false;
	}

	// 주민등록번호를 숫자 배열로 변환
	const [birthPart, restPart] = residentNumber.split("-");
	const digits = (birthPart + restPart).split('').map(Number);

	// 생년월일 검증
	const genderCode = digits[6];
	const yearPrefix = {
		'1': 1900, '2': 1900, // 1900년대 남성/여성
		'3': 2000, '4': 2000, // 2000년대 남성/여성
		'5': 1900, '6': 1900, // 외국인 1900년대
		'7': 2000, '8': 2000  // 외국인 2000년대
	}[genderCode];

	if (!yearPrefix) {
		return false;
	}

	const year = yearPrefix + parseInt(birthPart.substring(0, 2), 10);
	const month = parseInt(birthPart.substring(2, 4), 10) - 1; // 월은 0부터 시작
	const day = parseInt(birthPart.substring(4, 6), 10);

	const birthDate = new Date(year, month, day);
	if (
		!(birthDate instanceof Date) ||
		isNaN(birthDate) ||
		birthDate.getFullYear() !== year ||
		birthDate.getMonth() !== month ||
		birthDate.getDate() !== day ||
		year < 1900 || year > new Date().getFullYear()
	) {
		return false;
	}

	// 체크섬 검증
	const weights = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5];
	let sum = 0;
	for (let i = 0; i < 12; i++) {
		sum += digits[i] * weights[i];
	}

	const remainder = (11 - (sum % 11)) % 10;
	return remainder === digits[12];
}

const gfn_bizComponentData = async function(BIZCOMP_ID_LIST, WHERE_CLAUSE_LIST, PARAM_LIST, COMP_CODE, CLIENT_CODE  ){

	var paramObj = {
		     V_P_DEBUG_MODE_YN      : ''
		    ,V_P_LANG_ID            : ''
		    ,V_P_COMP_CODE          : COMP_CODE
		    ,V_P_CLIENT_CODE        : CLIENT_CODE
		    ,V_P_BIZCOMP_ID_LIST    : BIZCOMP_ID_LIST
		    ,V_P_WHERE_CLAUSE_LIST  : WHERE_CLAUSE_LIST
		    ,V_P_PARAM_LIST         : PARAM_LIST
		    ,V_P_FORM_ID            : ''
		    ,V_P_MENU_ID            : ''
		    ,V_P_PROC_ID            : ''
		    ,V_P_USERID             : ''
		    ,V_P_PC                 : ''
    };

    const postJsonPromise = gfn_postJSON("/com/comSelectListMulti.do", {
    	getType				: 'json',
    	workType			: 'Q',
    	cv_count			: '1',
    	params				: gfnma_objectToString(paramObj, true)
	});

    const data = await postJsonPromise;
    try {
		if (_.isEqual("S", data.resultStatus)) {
			console.log(' gfn_bizComponentData data ==>', data);
			if(!gfn_isEmpty(data.v_errorStr)){
				console.log(' ERROR COMPONENT==>', data.v_errorStr);
			}
			return data;
    	} else {
			console.log(' ERROR data ==>', data);
      		alert(data.resultMessage);
    	}

    } catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
		console.error("failed", e.message);
    	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }
}