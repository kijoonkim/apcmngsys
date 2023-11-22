package com.at.apcss.fm.clt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.clt.mapper.CltvtnEngttRsltMngMapper;
import com.at.apcss.fm.clt.service.CltvtnEngttRsltMngService;
import com.at.apcss.fm.clt.vo.CltvtnEngttRsltMngVO;


/**
 * @Class Name : CltvtnEngttRsltMngServiceImpl.java
 * @Description : 재배약정결과관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("cltvtnEngttRsltMngService")
public class CltvtnEngttRsltMngServiceImpl extends BaseServiceImpl implements CltvtnEngttRsltMngService{

	@Autowired
	private CltvtnEngttRsltMngMapper cltvtnEngttRsltMngMapper;

	@Override
	public CltvtnEngttRsltMngVO selectCltvtnEngttRsltMng(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO) throws Exception {

		CltvtnEngttRsltMngVO resultVO = cltvtnEngttRsltMngMapper.selectCltvtnEngttRsltMng(cltvtnEngttRsltMngVO);

		return resultVO;
	}

	@Override
	public CltvtnEngttRsltMngVO selectCltvtnEngttRsltMng(String msgKey) throws Exception {

		CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO = new CltvtnEngttRsltMngVO();
		cltvtnEngttRsltMngVO.setMsgKey(msgKey);

		CltvtnEngttRsltMngVO resultVO = cltvtnEngttRsltMngMapper.selectCltvtnEngttRsltMng(cltvtnEngttRsltMngVO);

		return resultVO;
	}

	@Override
	public List<CltvtnEngttRsltMngVO> selectCltvtnEngttRsltMngList(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO) throws Exception {

		List<CltvtnEngttRsltMngVO> resultList = cltvtnEngttRsltMngMapper.selectCltvtnEngttRsltMngList(cltvtnEngttRsltMngVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (CltvtnEngttRsltMngVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertCltvtnEngttRsltMng(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO) throws Exception {

		int insertedCnt = cltvtnEngttRsltMngMapper.insertCltvtnEngttRsltMng(cltvtnEngttRsltMngVO);

		return insertedCnt;
	}

	@Override
	public int updateCltvtnEngttRsltMng(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO) throws Exception {

		int updatedCnt = cltvtnEngttRsltMngMapper.updateCltvtnEngttRsltMng(cltvtnEngttRsltMngVO);
		int updatedCnt2 = cltvtnEngttRsltMngMapper.updateCltvtnEngttRsltMng2(cltvtnEngttRsltMngVO);

		return updatedCnt;
	}

	@Override
	public int deleteCltvtnEngttRsltMng(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO) throws Exception {

		int deletedCnt = cltvtnEngttRsltMngMapper.deleteCltvtnEngttRsltMng(cltvtnEngttRsltMngVO);

		return deletedCnt;
	}

	@Override
	public int deleteCltvtnEngttRsltMngList(List<CltvtnEngttRsltMngVO> cltvtnEngttRsltMngList) throws Exception {

		int deletedCnt = 0;

		for ( CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO : cltvtnEngttRsltMngList ) {
			deletedCnt += cltvtnEngttRsltMngMapper.deleteCltvtnEngttRsltMng(cltvtnEngttRsltMngVO);
		}

		return deletedCnt;
	}

}
