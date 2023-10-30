package com.at.apcss.am.bbs.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.bbs.mapper.apcBbsMapper;
import com.at.apcss.am.bbs.service.apcBbsService;
import com.at.apcss.am.bbs.vo.apcBbsCmntVO;
import com.at.apcss.am.bbs.vo.apcBbsVO;


/**
 * @Class Name : BbsServiceImpl.java
 * @Description : 게시판 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Service("apcBbsService")
public class apcBbsServiceImpl implements apcBbsService{

	@Autowired
	private apcBbsMapper bbsMapper;

	@Override
	public apcBbsVO selectBbs(apcBbsVO bbsVO) throws Exception {

		apcBbsVO resultVO = bbsMapper.selectBbs(bbsVO);

		return resultVO;
	}

	@Override
	public apcBbsVO selectBbs(String bbsNo) throws Exception {

		apcBbsVO bbsVO = new apcBbsVO();
		bbsVO.setMsgKey(bbsNo);

		apcBbsVO resultVO = bbsMapper.selectBbs(bbsVO);

		return resultVO;
	}

	@Override
	public List<apcBbsVO> selectBbsList(apcBbsVO bbsVO) throws Exception {

		List<apcBbsVO> resultList = bbsMapper.selectBbsList(bbsVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (apcBbsVO bbs : resultList ) {
			System.out.printf("bbsNo : %s", bbs.getBbsTitle());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertBbs(apcBbsVO bbsVO) throws Exception {

		int insertedCnt = bbsMapper.insertBbs(bbsVO);

		return insertedCnt;
	}

	@Override
	public int updateBbs(apcBbsVO bbsVO) throws Exception {

		int updatedCnt = bbsMapper.updateBbs(bbsVO);

		return updatedCnt;
	}

	@Override
	public int deleteBbs(apcBbsVO bbsVO) throws Exception {

		int deletedCnt = bbsMapper.deleteBbs(bbsVO);

		return deletedCnt;
	}

	@Override
	public int deleteBbsList(List<apcBbsVO> bbsList) throws Exception {

		int deletedCnt = 0;

		for ( apcBbsVO bbsVO : bbsList ) {
			deletedCnt += bbsMapper.deleteBbs(bbsVO);
		}

		return deletedCnt;
	}
	/**
	 * 게시판댓글정보를 삭제한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBbsCmnt(apcBbsCmntVO bbsCmntVO) throws Exception{
		int insertedCnt = bbsMapper.deleteBbsCmnt(bbsCmntVO);
		return 0;
	}
	/**
	 * 게시판댓글정보를 전체삭제한다.
	 * @param bbsVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBbsAllCmnt(apcBbsVO bbsVO) throws Exception{
		int insertedCnt = bbsMapper.deleteBbsAllCmnt(bbsVO);
		return 0;
	}

	@Override
	public int insertBbsCmnt(apcBbsCmntVO bbsCmntVO) throws Exception {
		// TODO Auto-generated method stub
		int insertedCnt = bbsMapper.insertBbsCmnt(bbsCmntVO);
		return 0;
	}

	@Override
	public int insertBbsChildCmnt(apcBbsCmntVO bbsCmntVO) throws Exception {
		// TODO Auto-generated method stub
		int insertedCnt = bbsMapper.insertBbsChildCmnt(bbsCmntVO);
		return 0;
	}
	@Override
	public List<apcBbsCmntVO> selectBbsCmntList(apcBbsVO bbsVO) throws Exception {
		// TODO Auto-generated method stub
		List<apcBbsCmntVO> resultList = bbsMapper.selectBbsCmntList(bbsVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (apcBbsCmntVO bbs : resultList ) {
			System.out.printf("bbsNo : %s", bbs.getBbsNo());
			System.out.println();
		}
		return resultList;
	}

}
