package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.ProductCodeInfoLogMapper;
import com.at.apcss.fm.farm.service.ProductCodeInfoLogService;
import com.at.apcss.fm.farm.vo.ProductCodeInfoLogVO;


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
@Service("productCodeInfoLogService")
public class ProductCodeInfoLogServiceImpl implements ProductCodeInfoLogService{

	@Autowired
	private ProductCodeInfoLogMapper productCodeInfoLogMapper;

	@Override
	public ProductCodeInfoLogVO selectproductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {

		ProductCodeInfoLogVO resultVO = productCodeInfoLogMapper.selectproductCodeInfoLog(productCodeInfoLogVO);

		return resultVO;
	}

	@Override
	public List<ProductCodeInfoLogVO> selectproductCodeInfoLogList(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {

		List<ProductCodeInfoLogVO> resultList = productCodeInfoLogMapper.selectproductCodeInfoLogList(productCodeInfoLogVO);
		return resultList;
	}

	@Override
	public int insertproductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {

		int insertedCnt = productCodeInfoLogMapper.insertproductCodeInfoLog(productCodeInfoLogVO);

		return insertedCnt;
	}

	@Override
	public int updateproductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {

		int updatedCnt = productCodeInfoLogMapper.updateproductCodeInfoLog(productCodeInfoLogVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveproductCodeInfoLogList(List<ProductCodeInfoLogVO> productCodeInfoLogVOList) throws Exception {
		int savedCnt = 0;
		for (ProductCodeInfoLogVO productCodeInfoLogVO : productCodeInfoLogVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(productCodeInfoLogVO.getRowSts())) {
				savedCnt += insertproductCodeInfoLog(productCodeInfoLogVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(productCodeInfoLogVO.getRowSts())) {
				savedCnt += updateproductCodeInfoLog(productCodeInfoLogVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerproductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {
		return productCodeInfoLogMapper.insertMegerproductCodeInfoLog(productCodeInfoLogVO);
	}
	@Override
	public int insertMegerLogproductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {
		return productCodeInfoLogMapper.insertMegerLogproductCodeInfoLog(productCodeInfoLogVO);
	}
	@Override
	public int updateMegerproductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {
		return productCodeInfoLogMapper.updateMegerproductCodeInfoLog(productCodeInfoLogVO);
	}

	@Override
	public int deleteproductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {
		return productCodeInfoLogMapper.deleteproductCodeInfoLog(productCodeInfoLogVO);
	}

}
