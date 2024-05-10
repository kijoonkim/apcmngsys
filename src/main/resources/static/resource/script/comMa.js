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
	var res = '';
	for(key in obj){
		res += obj[key] + ',';
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
 * @param 		{string} _defaultvalue
 * @param 		{string} _allyn
 * @returns 	{void}
 */
async function gfnma_setComSelect(_targetIds, _jsondataRef, _bizcompid, _whereclause, _compcode, _subcode, _codename, _defaultvalue, _allyn) {

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
	console.log('select data:', data);

	try {
		_jsondataRef.length = 0;
		data.cv_1.forEach((item) => {
			const cdVl = {
				text	: item[_codename],
				label	: item[_codename],
				value	: item[_subcode]
			}
			_jsondataRef.push(cdVl);
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

