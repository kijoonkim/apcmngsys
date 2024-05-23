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
const gfnma_objectToString = function (obj) {
	var res 	= '';
	var temp 	= '';
	for(key in obj){
		temp = obj[key] + '';
		res += temp + ',';
	}
	res = res.slice(0, -1);
	return res;
}

/**
 * @name 		gfnma_nvl
 * @description undefined 를 '' 로 변환
 * @function
 * @param 		{string} 
 * @returns 	{string}
 */
const gfnma_nvl = function (val) {
	return (val==undefined || val=='undefined') ? '' : val;
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
 * @name 		gfnma_setComSelect
 * @description sbux-select 데이터 설정
 * @function
 * @param 		{(string|string[])} _targetIds
 * @param 		{any[]} _jsondataRef
 * @param 		{string} _bizcompid
 * @param 		{string} _whereclause
 * @param 		{string} _compcode
 * @param 		{string} _subcode
 * @param 		{string} _codename
 * @param 		{string} _allyn
 * @param 		{string} _defaultvalue
 * @returns 	{void}
 */
async function gfnma_setComSelect(_targetIds, _jsondataRef, _bizcompid, _whereclause, _compcode, _subcode, _codename, _allyn, _defaultvalue) {

	if (gfn_isEmpty(_bizcompid)) {
		return;
	}

    var paramObj = { 
		v_p_debug_mode_yn	: ''
		,v_p_lang_id		: 'KOR'
		,v_p_comp_code		: _compcode
		,v_p_client_code	: ''
		,v_p_bizcomp_id		: _bizcompid
		,v_p_where_clause	: _whereclause
		,v_p_form_id		: ''
		,v_p_menu_id		: ''
		,v_p_proc_id		: ''
		,v_p_userid			: ''
		,v_p_pc				: ''
    };		

    const postJsonPromise = gfn_postJSON("/com/comSelectList.do", {
    	getType				: 'json',
    	workType			: 'Q',
    	cv_count			: '1',
    	params				: gfnma_objectToString(paramObj)
	});

	const data = await postJsonPromise;
	//console.log('select data:', data);

	try {
		_jsondataRef.length = 0;
		data.cv_1.forEach((item) => {
			if(_defaultvalue){
				if(_defaultvalue==item[_subcode]){
					const cdVl = {
						text		: item[_codename],
						label		: item[_codename],
						value		: item[_subcode],
						selected	: "selected"
					}
					_jsondataRef.push(cdVl);
				} else {
					const cdVl = {
						text	: item[_codename],
						label	: item[_codename],
						value	: item[_subcode]
					}
					_jsondataRef.push(cdVl);
				}
			} else {
				const cdVl = {
					text	: item[_codename],
					label	: item[_codename],
					value	: item[_subcode]
				}
				_jsondataRef.push(cdVl);
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

    var paramObj = { 
		v_p_debug_mode_yn	: ''
		,v_p_lang_id		: 'KOR'
		,v_p_comp_code		: _compCode
		,v_p_client_code	: _clientCode
		,v_p_bizcomp_id		: _bizcompId
		,v_p_where_clause	: _whereClause
		,v_p_form_id		: _formId
		,v_p_menu_id		: _menuId
		,v_p_proc_id		: ''
		,v_p_userid			: ''
		,v_p_pc				: ''
    };		

    const postJsonPromise = gfn_postJSON("/com/comSelectList.do", {
    	getType				: 'json',
    	workType			: 'Q',
    	cv_count			: '1',
    	params				: gfnma_objectToString(paramObj)
	});

	const data = await postJsonPromise;
	console.log('select data:', data);

	try {
		
		//style set
		if(_dropType=='down'){
			$(_target).closest('div').addClass('dropdown');
		} else {
			$(_target).closest('div').addClass('dropup');
		}
		if(_dropAlign=='right'){
			$(_target).closest('div').find('.dropdown-menu').addClass('dropdown-menu-right');
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
		$(_target).closest('div').find('.dropdown-menu').html(htm);
		
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
		$(_target).closest('div').find('tbody').html(htm);
		
		//tr click event
		$(_target).closest('div').find('.clickable-row').click(function(){
			if($(this).hasClass('active')){
				$(this).removeClass('active')
				$(_target).attr('cu-value', '');
				$(_target).attr('cu-label', '');
				$(_target).find('font').text('선택');
			} else {
				$(this).addClass('active').siblings().removeClass('active');
				var cu_value = $(this).find('[cu-code=' + _colValue + ']').text();
				var cu_label = $(this).find('[cu-code=' + _colLabel + ']').text();
				$(_target).attr('cu-value', cu_value);
				$(_target).attr('cu-label', cu_label);
				$(_target).find('font').text(cu_label);
			}
		});
		
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
 * @param 		{string} id
 * @param 		{string} colValue
 * @param 		{string} colLabel
 * @param 		{string} findValue
 */
const gfnma_multiSelectGet = function (id) {
	
	var obj = {
		value	: gfnma_nvl($(id).attr('cu-value')),
		label	: gfnma_nvl($(id).attr('cu-label'))
	};
	return gfnma_nvl($(id).attr('cu-value'));
}

