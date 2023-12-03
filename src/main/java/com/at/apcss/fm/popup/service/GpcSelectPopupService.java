package com.at.apcss.fm.popup.service;

import java.util.List;

import com.at.apcss.fm.popup.vo.GpcSelectPopupVO;


/**
 * apc선택 팝업 Service 인터페이스
 * @author ljw
 * @since 2023.10.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.03  ljw       최초 생성
 * </pre>
 */
public interface GpcSelectPopupService {

	/**
	 * APC 리스트
	 * @param InvstmntSpmtPopupVO
	 * @return
	 * @throws Exception
	 */
	public List<GpcSelectPopupVO> selectGpcList(GpcSelectPopupVO gpcSelectPopupVO) throws Exception;

}
