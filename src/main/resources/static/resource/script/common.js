/**
 * 
 */


/**
 *  빈값 체크 함수
 */
gfn_isEmpty = function (str) {
	
    if (typeof str == "boolean") {
        return str;
    }
    else if (typeof str == "string") {
        str = str.trim();
    }

    if (str == undefined) {
        return true;
    }
    else if (str == "undefined") {
        return true;
    }
    else if (str == null) {
        return true;
    }
    else if (str == "null") {
    	return true;
    }
    else if (str == "") {
        if (typeof str == "string" || typeof str == "object") {
            return true;
        }
        else {
            return false;
        }
    }
    else if ("x" + str == "xNaN") {
        return true;
    }
    else if (str.length == 0) {
        return true;
    }
    else {
        return false;
    }
}

gfn_nvl = function (str, defaultStr) {

	if (gfn_isEmpty(defaultStr)) {
		defaultStr = '';
	}

    if(typeof str == "undefined" || str == undefined || str == "undefined" || str == null || str == 'null' || str == "" ) {
        str = defaultStr;
    }

    return gfn_isEmpty(str) ? defaultStr : str;
}