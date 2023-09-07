package com.at.apcss.am.vrty.service;

import java.util.List;

import com.at.apcss.am.vrty.vo.VrtyVO;

public interface VrtyService {
	/**
	 * 품종 팝업에서 조회
	 * @param ComCdVO
	 * @return
	 * @throws Exception
	 */

	List<VrtyVO> selectVrtyList(VrtyVO vrtyVO) throws Exception;
}
