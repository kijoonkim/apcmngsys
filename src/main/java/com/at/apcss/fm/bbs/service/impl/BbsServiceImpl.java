package com.at.apcss.fm.bbs.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsFileVO;
import com.at.apcss.fm.bbs.vo.BbsVO;


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
@Service("bbsService")
public class BbsServiceImpl extends BaseServiceImpl implements BbsService{

	@Autowired
	private BbsMapper bbsMapper;

	@Override
	public BbsVO selectBbs(BbsVO bbsVO) throws Exception {

		BbsVO resultVO = bbsMapper.selectBbs(bbsVO);

		return resultVO;
	}

	@Override
	public BbsVO selectBbs(String bbsNo) throws Exception {

		BbsVO bbsVO = new BbsVO();
		bbsVO.setMsgKey(bbsNo);

		BbsVO resultVO = bbsMapper.selectBbs(bbsVO);

		return resultVO;
	}

	@Override
	public List<BbsVO> selectBbsList(BbsVO bbsVO) throws Exception {

		List<BbsVO> resultList = bbsMapper.selectBbsList(bbsVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (BbsVO bbs : resultList ) {
			System.out.printf("bbsNo : %s", bbs.getBbsTitle());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertBbs(BbsVO bbsVO) throws Exception {

		int insertedCnt = bbsMapper.insertBbs(bbsVO);

		return insertedCnt;
	}

	@Override
	public int updateBbs(BbsVO bbsVO) throws Exception {

		int updatedCnt = bbsMapper.updateBbs(bbsVO);

		return updatedCnt;
	}

	@Override
	public int deleteBbs(BbsVO bbsVO) throws Exception {

		int deletedCnt = bbsMapper.deleteBbs(bbsVO);

		return deletedCnt;
	}

	@Override
	public int deleteBbsList(List<BbsVO> bbsList) throws Exception {

		int deletedCnt = 0;

		for ( BbsVO bbsVO : bbsList ) {
			deletedCnt += bbsMapper.deleteBbs(bbsVO);
		}

		return deletedCnt;
	}

	@Override
	public int insertAttach(BbsFileVO bbsFileVO) throws Exception {
		int insertedCnt = bbsMapper.insertAttach(bbsFileVO);
		return insertedCnt;
	}

	@Override
	public List<BbsFileVO> selectBbsAttachesList(BbsVO bbsVO) throws Exception {
		List<BbsFileVO> resultList = bbsMapper.selectBbsAttachesList(bbsVO);
		return resultList;
	}

	@Override
	public int deleteBbsAttache(BbsFileVO bbsFileVO) throws Exception {
		int deletedCnt = bbsMapper.deleteBbsAttache(bbsFileVO);
		return deletedCnt;
	}

	@Override
	public BbsFileVO selectBbsAttaches(BbsFileVO bbsFileVO) throws Exception {
		BbsFileVO resultVO = bbsMapper.selectBbsAttaches(bbsFileVO);
		return resultVO;
	}

}
