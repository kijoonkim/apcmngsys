package com.at.apcss.fm.popup.service;

import java.util.List;

import com.at.apcss.fm.popup.vo.ItemSelectPopupVO;


/**
 * 품목선택 팝업 Service 인터페이스
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
public interface ItemSelectPopupService {

	/**
	 * 품목 리스트
	 * @param ItemSelectPopupVO
	 * @return
	 * @throws Exception
	 */
	public List<ItemSelectPopupVO> selectItemList(ItemSelectPopupVO itemSelectPopupVO) throws Exception;

}
