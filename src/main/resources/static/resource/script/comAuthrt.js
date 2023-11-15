'use strict';

/**
 * @description 권한관리
 */

/**
 * @name
 * @description
 * @param {any} _authrtUI
 * @function
 * @returns
 */
const gfn_setComAuthrtUI = function(_authrtUI) {
	
	if (gfn_isEmpty(_authrtUI)) {
		return;	
	}
	
	try {
		_authrtUI.forEach((_ui) => {
			
			let entyId = _ui.entyId;
			//let entyType = _ui.entyType;
			let aplcnType = _ui.aplcnType;
			let useYn = _ui.useYn;
			let indctYn = _ui.indctYn;
			
			switch (aplcnType) {
				case "01":
				case "11":
					if (_.isEqual("Y", useYn)) {
						try {
							// SB
							SBUxMethod.attr(entyId, 'disabled', 'false');
						} catch(e) {
							document.getElementById(entyId).removeAttribute('disabled');
						}
					} else {
						try {
							// SB
							SBUxMethod.attr(entyId, 'disabled', 'true');
						} catch(e) {
							document.getElementById(entyId).setAttribute('disabled', true);
						}
					}
					
					// 표시
					if (!_.isEqual("Y", indctYn)) {
						try {
							// SB
							SBUxMethod.hide(entyId, 'disabled', 'true');
						} catch(e) {
							document.getElementById(entyId).style.display = "none";
						}
					}
					break;
				default:
					return;
			}
			
			
			
		});
		
	} catch (e) {
		
	}
}

