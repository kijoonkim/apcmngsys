package com.at.apcss.am.oprtr.service.impl;

import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.oprtr.mapper.OprtrMapper;
import com.at.apcss.am.oprtr.service.OprtrService;
import com.at.apcss.am.oprtr.vo.OprtrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
/**
 * @Class Name : OprtrServiceImpl.java
 * @Description : 작업생산자 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김호
 * @since 2023.07.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.13  김 호        최초 생성
 * </pre>
 */
@Service("oprtrService")
public class OprtrServiceImpl extends BaseServiceImpl implements OprtrService {

	@Autowired
	private OprtrMapper oprtrMapper;

	@Override
	public OprtrVO selectOprtr(OprtrVO oprtrVO) throws Exception {
		return oprtrMapper.selectOprtr(oprtrVO);
	}

	@Override
	public List<OprtrVO> selectOprtrList(OprtrVO oprtrVO) throws Exception {
		return oprtrMapper.selectOprtrList(oprtrVO);
	}

	@Override
	public HashMap<String, Object> multiSaveOprtrList(List<OprtrVO> optrtList) throws Exception {

		for (OprtrVO oprtrVO : optrtList) {
			if (ComConstants.ROW_STS_INSERT.equals(oprtrVO.getRowSts())) {
				if(0 == insertOprtr(oprtrVO)){
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
			if (ComConstants.ROW_STS_UPDATE.equals(oprtrVO.getRowSts())) {
				if(0 == updateOprtr(oprtrVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
		}

		return null;
	}

	@Override
	public int insertOprtr(OprtrVO oprtrVO) throws Exception {

		int insertedCnt = oprtrMapper.insertOprtr(oprtrVO);

		return insertedCnt;
	}

	@Override
	public int updateOprtr(OprtrVO oprtrVO) throws Exception {

		int updatedCnt = oprtrMapper.updateOprtr(oprtrVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deleteOprtr(OprtrVO oprtrVO) throws Exception {
		if(0 == oprtrMapper.deleteOprtr(oprtrVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
		}
		return null;
	}
}
