package com.at.apcss.fm.popup.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.popup.mapper.ApcSelectPopupMapper;
import com.at.apcss.fm.popup.service.ApcSelectPopupService;
import com.at.apcss.fm.popup.vo.ApcSelectPopupVO;


/**
 * @Class Name : ApcSelectPopupServiceImpl.java
 * @Description : APC선택 팝업 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("ApcSelectPopupService")
public class ApcSelectPopupServiceImpl extends BaseServiceImpl implements ApcSelectPopupService{

	@Autowired
	private ApcSelectPopupMapper apcSelectPopupMapper;

	@Override
	public List<ApcSelectPopupVO> selectApcList(ApcSelectPopupVO vo) throws Exception {
		List<ApcSelectPopupVO> resultList = apcSelectPopupMapper.selectApcList(vo);

		return resultList;
	}

}
