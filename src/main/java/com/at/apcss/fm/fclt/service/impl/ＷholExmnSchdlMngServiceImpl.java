package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.fclt.mapper.ＷholExmnSchdlMngMapper;
import com.at.apcss.fm.fclt.service.ＷholExmnSchdlMngService;
import com.at.apcss.fm.fclt.vo.ＷholExmnSchdlMngVO;


/**
 * @Class Name : ＷholExmnSchdlMngServiceImpl.java
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
@Service("wholExmnSchdlMngService")
public class ＷholExmnSchdlMngServiceImpl implements ＷholExmnSchdlMngService{

	@Autowired
	private ＷholExmnSchdlMngMapper wholExmnSchdlMngMapper;

	@Override
	public ＷholExmnSchdlMngVO selectＷholExmnSchdlMng(ＷholExmnSchdlMngVO wholExmnSchdlMngVO) throws Exception {

		ＷholExmnSchdlMngVO resultVO = wholExmnSchdlMngMapper.selectＷholExmnSchdlMng(wholExmnSchdlMngVO);

		return resultVO;
	}

	@Override
	public ＷholExmnSchdlMngVO selectＷholExmnSchdlMng(String msgKey) throws Exception {

		ＷholExmnSchdlMngVO wholExmnSchdlMngVO = new ＷholExmnSchdlMngVO();
		wholExmnSchdlMngVO.setMsgKey(msgKey);

		ＷholExmnSchdlMngVO resultVO = wholExmnSchdlMngMapper.selectＷholExmnSchdlMng(wholExmnSchdlMngVO);

		return resultVO;
	}

	@Override
	public List<ＷholExmnSchdlMngVO> selectＷholExmnSchdlMngList(ＷholExmnSchdlMngVO wholExmnSchdlMngVO) throws Exception {

		List<ＷholExmnSchdlMngVO> resultList = wholExmnSchdlMngMapper.selectＷholExmnSchdlMngList(wholExmnSchdlMngVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (ＷholExmnSchdlMngVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertＷholExmnSchdlMng(ＷholExmnSchdlMngVO wholExmnSchdlMngVO) throws Exception {

		int insertedCnt = wholExmnSchdlMngMapper.insertＷholExmnSchdlMng(wholExmnSchdlMngVO);

		return insertedCnt;
	}

	@Override
	public int updateＷholExmnSchdlMng(ＷholExmnSchdlMngVO wholExmnSchdlMngVO) throws Exception {

		int updatedCnt = wholExmnSchdlMngMapper.updateＷholExmnSchdlMng(wholExmnSchdlMngVO);

		return updatedCnt;
	}

	@Override
	public int deleteＷholExmnSchdlMng(ＷholExmnSchdlMngVO wholExmnSchdlMngVO) throws Exception {

		int deletedCnt = wholExmnSchdlMngMapper.deleteＷholExmnSchdlMng(wholExmnSchdlMngVO);

		return deletedCnt;
	}

	@Override
	public int deleteＷholExmnSchdlMngList(List<ＷholExmnSchdlMngVO> wholExmnSchdlMngList) throws Exception {

		int deletedCnt = 0;

		for ( ＷholExmnSchdlMngVO wholExmnSchdlMngVO : wholExmnSchdlMngList ) {
			deletedCnt += wholExmnSchdlMngMapper.deleteＷholExmnSchdlMng(wholExmnSchdlMngVO);
		}

		return deletedCnt;
	}

}
