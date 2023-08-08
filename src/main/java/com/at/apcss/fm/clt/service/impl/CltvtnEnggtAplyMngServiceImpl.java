package com.at.apcss.fm.clt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.clt.mapper.CltvtnEnggtAplyMngMapper;
import com.at.apcss.fm.clt.service.CltvtnEnggtAplyMngService;
import com.at.apcss.fm.clt.vo.CltvtnEnggtAplyMngVO;


/**
 * @Class Name : CltvtnEnggtAplyMngServiceImpl.java
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
@Service("cltvtnEnggtAplyMngService")
public class CltvtnEnggtAplyMngServiceImpl implements CltvtnEnggtAplyMngService{

	@Autowired
	private CltvtnEnggtAplyMngMapper cltvtnEnggtAplyMngMapper;

	@Override
	public CltvtnEnggtAplyMngVO selectCltvtnEnggtAplyMng(CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO) throws Exception {

		CltvtnEnggtAplyMngVO resultVO = cltvtnEnggtAplyMngMapper.selectCltvtnEnggtAplyMng(cltvtnEnggtAplyMngVO);

		return resultVO;
	}

	@Override
	public CltvtnEnggtAplyMngVO selectCltvtnEnggtAplyMng(String msgKey) throws Exception {

		CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO = new CltvtnEnggtAplyMngVO();
		cltvtnEnggtAplyMngVO.setMsgKey(msgKey);

		CltvtnEnggtAplyMngVO resultVO = cltvtnEnggtAplyMngMapper.selectCltvtnEnggtAplyMng(cltvtnEnggtAplyMngVO);

		return resultVO;
	}

	@Override
	public List<CltvtnEnggtAplyMngVO> selectCltvtnEnggtAplyMngList(CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO) throws Exception {

		List<CltvtnEnggtAplyMngVO> resultList = cltvtnEnggtAplyMngMapper.selectCltvtnEnggtAplyMngList(cltvtnEnggtAplyMngVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (CltvtnEnggtAplyMngVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertCltvtnEnggtAplyMng(CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO) throws Exception {

		int insertedCnt = cltvtnEnggtAplyMngMapper.insertCltvtnEnggtAplyMng(cltvtnEnggtAplyMngVO);

		return insertedCnt;
	}

	@Override
	public int updateCltvtnEnggtAplyMng(CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO) throws Exception {

		int updatedCnt = cltvtnEnggtAplyMngMapper.updateCltvtnEnggtAplyMng(cltvtnEnggtAplyMngVO);

		return updatedCnt;
	}

	@Override
	public int deleteCltvtnEnggtAplyMng(CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO) throws Exception {

		int deletedCnt = cltvtnEnggtAplyMngMapper.deleteCltvtnEnggtAplyMng(cltvtnEnggtAplyMngVO);

		return deletedCnt;
	}

	@Override
	public int deleteCltvtnEnggtAplyMngList(List<CltvtnEnggtAplyMngVO> cltvtnEnggtAplyMngList) throws Exception {

		int deletedCnt = 0;

		for ( CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO : cltvtnEnggtAplyMngList ) {
			deletedCnt += cltvtnEnggtAplyMngMapper.deleteCltvtnEnggtAplyMng(cltvtnEnggtAplyMngVO);
		}

		return deletedCnt;
	}

}
