package com.at.apcss.fm.spmt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.clt.vo.CltvtnEnggtAplyMngVO;
import com.at.apcss.fm.spmt.mapper.SpmtEnggtInfoMngMapper;
import com.at.apcss.fm.spmt.service.SpmtEnggtInfoMngService;
import com.at.apcss.fm.spmt.vo.SpmtEnggtInfoMngVO;


/**
 * @Class Name : SpmtEnggtInfoMngServiceImpl.java
 * @Description : 스마트자동화 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("spmtEnggtInfoMngService")
public class SpmtEnggtInfoMngServiceImpl extends BaseServiceImpl implements SpmtEnggtInfoMngService{

	@Autowired
	private SpmtEnggtInfoMngMapper spmtEnggtInfoMngMapper;

	@Override
	public SpmtEnggtInfoMngVO selectSpmtEnggtInfoMng(SpmtEnggtInfoMngVO spmtEnggtInfoMngVO) throws Exception {

		SpmtEnggtInfoMngVO resultVO = spmtEnggtInfoMngMapper.selectSpmtEnggtInfoMng(spmtEnggtInfoMngVO);

		return resultVO;
	}

	@Override
	public SpmtEnggtInfoMngVO selectSpmtEnggtInfoMng(String msgKey) throws Exception {

		SpmtEnggtInfoMngVO spmtEnggtInfoMngVO = new SpmtEnggtInfoMngVO();
		spmtEnggtInfoMngVO.setMsgKey(msgKey);

		SpmtEnggtInfoMngVO resultVO = spmtEnggtInfoMngMapper.selectSpmtEnggtInfoMng(spmtEnggtInfoMngVO);

		return resultVO;
	}

	@Override
	public List<SpmtEnggtInfoMngVO> selectSpmtEnggtInfoMngList(SpmtEnggtInfoMngVO spmtEnggtInfoMngVO) throws Exception {

		List<SpmtEnggtInfoMngVO> resultList = spmtEnggtInfoMngMapper.selectSpmtEnggtInfoMngList(spmtEnggtInfoMngVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (SpmtEnggtInfoMngVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertSpmtEnggtInfoMng(SpmtEnggtInfoMngVO spmtEnggtInfoMngVO) throws Exception {

		int insertedCnt = spmtEnggtInfoMngMapper.insertSpmtEnggtInfoMng(spmtEnggtInfoMngVO);

		return insertedCnt;
	}

	@Override
	public int updateSpmtEnggtInfoMng(SpmtEnggtInfoMngVO spmtEnggtInfoMngVO) throws Exception {

		int updatedCnt = spmtEnggtInfoMngMapper.updateSpmtEnggtInfoMng(spmtEnggtInfoMngVO);

		return updatedCnt;
	}

	
	@Override
	public int deleteSpmtEnggtInfoMng(List<SpmtEnggtInfoMngVO> spmtEnggtInfoMngList) throws Exception {

		int deletedCnt = 0;

		for ( SpmtEnggtInfoMngVO spmtEnggtInfoMngVO : spmtEnggtInfoMngList ) {
			//deletedCnt += cltvtnEnggtAplyMngMapper.deleteCltvtnEnggtAplyMng(cltvtnEnggtAplyMngVO);
			deletedCnt += spmtEnggtInfoMngMapper.deleteSpmtEnggtInfoMng(spmtEnggtInfoMngVO); //delYn 값만 Y로 업데이트
		}
		

		return deletedCnt;
	}

	@Override
	public int deleteSpmtEnggtInfoMngList(List<SpmtEnggtInfoMngVO> spmtEnggtInfoMngList) throws Exception {

		int deletedCnt = 0;

		for ( SpmtEnggtInfoMngVO spmtEnggtInfoMngVO : spmtEnggtInfoMngList ) {
			deletedCnt += spmtEnggtInfoMngMapper.deleteSpmtEnggtInfoMng(spmtEnggtInfoMngVO);
		}

		return deletedCnt;
	}

}
