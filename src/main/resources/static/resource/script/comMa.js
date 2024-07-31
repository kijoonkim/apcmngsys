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
		res += temp.replaceAll("\,", "&#44;") + ',';
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
 * @name 		gfnma_date
 * @description 날짜를 yyyyMMddHHmmss 문자열로
 * @function
 * @returns 	{string}
 */
const gfnma_date = function () {
	var rstr = '';
	var pad = function(number, length) {
	  var str = '' + number;
	  while (str.length < length) {
	    str = '0' + str;
	  }
	  return str;
	}
	var nowDate = new Date();	
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
 * @returns 	{string}
 */
const gfnma_date3 = function(year, month) {
	var rstr 	= '';
	var p_month	= '';
	if(month){
		p_month = (month.length==1) ? '0' + month : month;
	}  
	var date = new Date(year, p_month, 0);
	rstr = date.getDate();
	if(rstr.length==1){
		rstr = year + '-' + month + '-0' + rstr;
	} else {
		rstr = year + '-' + month + '-' + rstr;
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
	rstr += str1.substr(0,4) + gubun + str1.substr(4,2) + gubun + str1.substr(6,2); 
	return rstr;
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
	if(val==null || val==undefined || val=='undefined'){
		str = '';
	} else {
		str = val + '';
	}
	str = str.trim();
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
		,V_P_PROC_PARAMS	: ''
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

/**
 * @name 		gfnma_setComSelect
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
		,V_P_PROC_PARAMS	: ''
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

    var paramObj = { 
		V_P_DEBUG_MODE_YN	: ''
		,V_P_LANG_ID		: 'KOR'
		,V_P_COMP_CODE		: _compCode
		,V_P_CLIENT_CODE	: _clientCode
		,V_P_BIZCOMP_ID		: _bizcompId
		,V_P_WHERE_CLAUSE	: _whereClause
		,V_P_PROC_PARAMS	: ''
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
		for(i=0; i<data.cv_1.length; i++){
			var obj = data.cv_1[i];
			htm += '<tr style="cursor:pointer" class="clickable-row">';
			for(j=0; j<_columns.length; j++){
				htm += '<td style="' + _columns[j]['style'] + '" cu-code="' + _columns[j]['ref'] + '">' + obj[_columns[j]['ref']] + '</td>';
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
				var cu_value = $(this).find('[cu-code=' + _colValue + ']').text();
				var cu_label = $(this).find('[cu-code=' + _colLabel + ']').text();
				$(tarId).attr('cu-value', cu_value);
				$(tarId).attr('cu-label', cu_label);
				$(tarId).find('font').text(cu_label);
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
const gfnma_multiSelectSet = function (id, colValue, colLabel, findValue) {
	
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
				$(id).find('font').text(cu_label);
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
			SBUxMethod.set(key,	obj[key]);
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
		var id = $(this).attr('id');
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
	var result 	= str.replace(regex, "");
    return Number(result);
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
 * @name 		validateRequired
 * @description 필수값 체크
 * @function
 */
const validateRequired = function () {
	let requiredFields = document.querySelectorAll('[aria-required="true"]');
	let allValid = true;

	requiredFields.forEach(field => {
		if (field.tagName === 'INPUT') {
			if (field.value.trim() === '') {
				allValid = false;
			}
		} else if (field.tagName === 'BUTTON') {
			if (!field.getAttribute('data-selected-value')) {
				allValid = false;
			}
		}
	});

	return allValid;
}

