package com.at.apcss.fm.popup.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.popup.mapper.InvstmntSpmtPopupMapper;
import com.at.apcss.fm.popup.service.InvstmntSpmtPopupService;
import com.at.apcss.fm.popup.vo.InvstmntSpmtPopupVO;


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
@Service("InvstmntSpmtPopupService")
public class InvstmntSpmtPopupServiceImpl extends BaseServiceImpl implements InvstmntSpmtPopupService{

	@Autowired
	private InvstmntSpmtPopupMapper invstmntSpmtPopupMapper;

	@Override
	public List<InvstmntSpmtPopupVO> selectInvstmntSpmtList(InvstmntSpmtPopupVO vo) throws Exception {
		List<InvstmntSpmtPopupVO> resultList = invstmntSpmtPopupMapper.selectInvstmntSpmtList(vo);

		return resultList;
	}

}
