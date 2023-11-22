package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
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
public class ProductCodeInfoLogServiceImpl extends BaseServiceImpl implements ProductCodeInfoLogService{

	@Autowired
	private ProductCodeInfoLogMapper productCodeInfoLogMapper;

	@Override
	public ProductCodeInfoLogVO selectProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {

		ProductCodeInfoLogVO resultVO = productCodeInfoLogMapper.selectProductCodeInfoLog(productCodeInfoLogVO);

		return resultVO;
	}

	@Override
	public List<ProductCodeInfoLogVO> selectProductCodeInfoLogList(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {

		List<ProductCodeInfoLogVO> resultList = productCodeInfoLogMapper.selectProductCodeInfoLogList(productCodeInfoLogVO);
		return resultList;
	}

	@Override
	public int insertProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {

		int insertedCnt = productCodeInfoLogMapper.insertProductCodeInfoLog(productCodeInfoLogVO);

		return insertedCnt;
	}

	@Override
	public int updateProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {

		int updatedCnt = productCodeInfoLogMapper.updateProductCodeInfoLog(productCodeInfoLogVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveProductCodeInfoLogList(List<ProductCodeInfoLogVO> productCodeInfoLogVOList) throws Exception {
		int savedCnt = 0;
		for (ProductCodeInfoLogVO productCodeInfoLogVO : productCodeInfoLogVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(productCodeInfoLogVO.getRowSts())) {
				savedCnt += insertProductCodeInfoLog(productCodeInfoLogVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(productCodeInfoLogVO.getRowSts())) {
				savedCnt += updateProductCodeInfoLog(productCodeInfoLogVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {
		return productCodeInfoLogMapper.insertMegerProductCodeInfoLog(productCodeInfoLogVO);
	}
	@Override
	public int insertMegerLogProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {
		return productCodeInfoLogMapper.insertMegerLogProductCodeInfoLog(productCodeInfoLogVO);
	}
	@Override
	public int updateMegerProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {
		return productCodeInfoLogMapper.updateMegerProductCodeInfoLog(productCodeInfoLogVO);
	}

	@Override
	public int deleteProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception {
		return productCodeInfoLogMapper.deleteProductCodeInfoLog(productCodeInfoLogVO);
	}

}
