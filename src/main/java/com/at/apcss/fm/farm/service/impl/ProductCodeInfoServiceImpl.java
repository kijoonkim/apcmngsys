package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.ProductCodeInfoMapper;
import com.at.apcss.fm.farm.service.ProductCodeInfoService;
import com.at.apcss.fm.farm.vo.ProductCodeInfoVO;


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
@Service("productCodeInfoService")
public class ProductCodeInfoServiceImpl implements ProductCodeInfoService{

	@Autowired
	private ProductCodeInfoMapper productCodeInfoMapper;

	@Override
	public ProductCodeInfoVO selectProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception {

		ProductCodeInfoVO resultVO = productCodeInfoMapper.selectProductCodeInfo(productCodeInfoVO);

		return resultVO;
	}

	@Override
	public List<ProductCodeInfoVO> selectProductCodeInfoList(ProductCodeInfoVO productCodeInfoVO) throws Exception {

		List<ProductCodeInfoVO> resultList = productCodeInfoMapper.selectProductCodeInfoList(productCodeInfoVO);
		return resultList;
	}

	@Override
	public int insertProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception {

		int insertedCnt = productCodeInfoMapper.insertProductCodeInfo(productCodeInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception {

		int updatedCnt = productCodeInfoMapper.updateProductCodeInfo(productCodeInfoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveProductCodeInfoList(List<ProductCodeInfoVO> productCodeInfoVOList) throws Exception {
		int savedCnt = 0;
		for (ProductCodeInfoVO productCodeInfoVO : productCodeInfoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(productCodeInfoVO.getRowSts())) {
				savedCnt += insertProductCodeInfo(productCodeInfoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(productCodeInfoVO.getRowSts())) {
				savedCnt += updateProductCodeInfo(productCodeInfoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception {
		return productCodeInfoMapper.insertMegerProductCodeInfo(productCodeInfoVO);
	}
	@Override
	public int insertMegerLogProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception {
		return productCodeInfoMapper.insertMegerLogProductCodeInfo(productCodeInfoVO);
	}


	@Override
	public int insertMegerProductCodeInfoMap(Map<String, String> MapList) throws Exception {
		return productCodeInfoMapper.insertMegerProductCodeInfoMap(MapList);
	}
	@Override
	public int insertMegerLogProductCodeInfoMap(Map<String, String> MapList) throws Exception {
		return productCodeInfoMapper.insertMegerLogProductCodeInfoMap(MapList);
	}

	@Override
	public int updateMegerProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception {
		return productCodeInfoMapper.updateMegerProductCodeInfo(productCodeInfoVO);
	}

	@Override
	public int deleteProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception {
		return productCodeInfoMapper.deleteProductCodeInfo(productCodeInfoVO);
	}

}
