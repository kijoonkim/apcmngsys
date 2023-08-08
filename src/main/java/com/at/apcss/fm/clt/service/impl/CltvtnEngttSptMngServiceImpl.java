package com.at.apcss.fm.clt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.clt.mapper.CltvtnEngttSptMngMapper;
import com.at.apcss.fm.clt.service.CltvtnEngttSptMngService;
import com.at.apcss.fm.clt.vo.CltvtnEngttSptMngVO;


/**
 * @Class Name : CltvtnEngttSptMngServiceImpl.java
 * @Description : 재배약정신청관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("cltvtnEngttSptMngService")
public class CltvtnEngttSptMngServiceImpl implements CltvtnEngttSptMngService{

	@Autowired
	private CltvtnEngttSptMngMapper cltvtnEngttSptMngMapper;

	@Override
	public CltvtnEngttSptMngVO selectCltvtnEngttSptMng(CltvtnEngttSptMngVO cltvtnEngttSptMngVO) throws Exception {

		CltvtnEngttSptMngVO resultVO = cltvtnEngttSptMngMapper.selectCltvtnEngttSptMng(cltvtnEngttSptMngVO);

		return resultVO;
	}

	@Override
	public CltvtnEngttSptMngVO selectCltvtnEngttSptMng(String msgKey) throws Exception {

		CltvtnEngttSptMngVO cltvtnEngttSptMngVO = new CltvtnEngttSptMngVO();
		cltvtnEngttSptMngVO.setMsgKey(msgKey);

		CltvtnEngttSptMngVO resultVO = cltvtnEngttSptMngMapper.selectCltvtnEngttSptMng(cltvtnEngttSptMngVO);

		return resultVO;
	}

	@Override
	public List<CltvtnEngttSptMngVO> selectCltvtnEngttSptMngList(CltvtnEngttSptMngVO cltvtnEngttSptMngVO) throws Exception {

		List<CltvtnEngttSptMngVO> resultList = cltvtnEngttSptMngMapper.selectCltvtnEngttSptMngList(cltvtnEngttSptMngVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (CltvtnEngttSptMngVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertCltvtnEngttSptMng(CltvtnEngttSptMngVO cltvtnEngttSptMngVO) throws Exception {

		int insertedCnt = cltvtnEngttSptMngMapper.insertCltvtnEngttSptMng(cltvtnEngttSptMngVO);

		return insertedCnt;
	}

	@Override
	public int updateCltvtnEngttSptMng(CltvtnEngttSptMngVO cltvtnEngttSptMngVO) throws Exception {

		int updatedCnt = cltvtnEngttSptMngMapper.updateCltvtnEngttSptMng(cltvtnEngttSptMngVO);

		return updatedCnt;
	}

	@Override
	public int deleteCltvtnEngttSptMng(CltvtnEngttSptMngVO cltvtnEngttSptMngVO) throws Exception {

		int deletedCnt = cltvtnEngttSptMngMapper.deleteCltvtnEngttSptMng(cltvtnEngttSptMngVO);

		return deletedCnt;
	}

	@Override
	public int deleteCltvtnEngttSptMngList(List<CltvtnEngttSptMngVO> cltvtnEngttSptMngList) throws Exception {

		int deletedCnt = 0;

		for ( CltvtnEngttSptMngVO cltvtnEngttSptMngVO : cltvtnEngttSptMngList ) {
			deletedCnt += cltvtnEngttSptMngMapper.deleteCltvtnEngttSptMng(cltvtnEngttSptMngVO);
		}

		return deletedCnt;
	}

}
