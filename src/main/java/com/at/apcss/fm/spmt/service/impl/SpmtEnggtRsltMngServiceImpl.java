package com.at.apcss.fm.spmt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.spmt.mapper.SpmtEnggtRsltMngMapper;
import com.at.apcss.fm.spmt.service.SpmtEnggtRsltMngService;
import com.at.apcss.fm.spmt.vo.SpmtEnggtRsltMngVO;;


/**
 * @Class Name : SpmtEnggtRsltMngServiceImpl.java
 * @Description : 출하약정신청관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Service("spmtEnggtRsltMngService")
public class SpmtEnggtRsltMngServiceImpl extends BaseServiceImpl implements SpmtEnggtRsltMngService{

	@Autowired
	private SpmtEnggtRsltMngMapper spmtEnggtRsltMngMapper;

	@Override
	public SpmtEnggtRsltMngVO selectSpmtEnggtRsltMng(SpmtEnggtRsltMngVO spmtEnggtRsltMngVO) throws Exception {

		SpmtEnggtRsltMngVO resultVO = spmtEnggtRsltMngMapper.selectSpmtEnggtRsltMng(spmtEnggtRsltMngVO);

		return resultVO;
	}

	@Override
	public SpmtEnggtRsltMngVO selectSpmtEnggtRsltMng(String msgKey) throws Exception {

		SpmtEnggtRsltMngVO spmtEnggtRsltMngVO = new SpmtEnggtRsltMngVO();
		spmtEnggtRsltMngVO.setMsgKey(msgKey);

		SpmtEnggtRsltMngVO resultVO = spmtEnggtRsltMngMapper.selectSpmtEnggtRsltMng(spmtEnggtRsltMngVO);

		return resultVO;
	}

	@Override
	public List<SpmtEnggtRsltMngVO> selectSpmtEnggtRsltMngList(SpmtEnggtRsltMngVO spmtEnggtRsltMngVO) throws Exception {

		List<SpmtEnggtRsltMngVO> resultList = spmtEnggtRsltMngMapper.selectSpmtEnggtRsltMngList(spmtEnggtRsltMngVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (SpmtEnggtRsltMngVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertSpmtEnggtRsltMng(SpmtEnggtRsltMngVO spmtEnggtRsltMngVO) throws Exception {

		int insertedCnt = spmtEnggtRsltMngMapper.insertSpmtEnggtRsltMng(spmtEnggtRsltMngVO);

		return insertedCnt;
	}

	@Override
	public int updateSpmtEnggtRsltMng(SpmtEnggtRsltMngVO spmtEnggtRsltMngVO) throws Exception {

		int updatedCnt = spmtEnggtRsltMngMapper.updateSpmtEnggtRsltMng(spmtEnggtRsltMngVO);

		return updatedCnt;
	}

	@Override
	public int deleteSpmtEnggtRsltMng(SpmtEnggtRsltMngVO spmtEnggtRsltMngVO) throws Exception {

		int deletedCnt = spmtEnggtRsltMngMapper.deleteSpmtEnggtRsltMng(spmtEnggtRsltMngVO);

		return deletedCnt;
	}

	@Override
	public int deleteSpmtEnggtRsltMngList(List<SpmtEnggtRsltMngVO> spmtEnggtRsltMngList) throws Exception {

		int deletedCnt = 0;

		for ( SpmtEnggtRsltMngVO spmtEnggtRsltMngVO : spmtEnggtRsltMngList ) {
			deletedCnt += spmtEnggtRsltMngMapper.deleteSpmtEnggtRsltMng(spmtEnggtRsltMngVO);
		}

		return deletedCnt;
	}

}
