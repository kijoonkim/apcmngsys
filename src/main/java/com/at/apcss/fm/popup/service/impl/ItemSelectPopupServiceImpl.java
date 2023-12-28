package com.at.apcss.fm.popup.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.popup.mapper.ItemSelectPopupMapper;
import com.at.apcss.fm.popup.service.ItemSelectPopupService;
import com.at.apcss.fm.popup.vo.ItemSelectPopupVO;


/**
 * @Class Name : InvstmntSpmtPopupServiceImpl.java
 * @Description : 통합조직,출자출하조직 팝업 서비스를 정의하기 위한 서비스 구현 클래스
 * @author ljw
 * @since 2023.09.22
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.22  ljw        최초 생성
 * </pre>
 */
@Service("ItemSelectPopupService")
public class ItemSelectPopupServiceImpl extends BaseServiceImpl implements ItemSelectPopupService{

	@Autowired
	private ItemSelectPopupMapper itemSelectPopupMapper;

	@Override
	public List<ItemSelectPopupVO> selectItemList(ItemSelectPopupVO vo) throws Exception {
		List<ItemSelectPopupVO> resultList = itemSelectPopupMapper.selectItemList(vo);

		return resultList;
	}

	@Override
	public List<ItemSelectPopupVO> selectYrGpcList(ItemSelectPopupVO vo) throws Exception {
		List<ItemSelectPopupVO> resultList = itemSelectPopupMapper.selectYrGpcList(vo);

		return resultList;
	}

}
