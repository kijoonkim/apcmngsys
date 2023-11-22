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
import com.at.apcss.fm.farm.mapper.ProductCodeInfoRegMapper;
import com.at.apcss.fm.farm.service.ProductCodeInfoRegService;
import com.at.apcss.fm.farm.vo.ProductCodeInfoRegVO;


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
@Service("productCodeInfoRegService")
public class ProductCodeInfoRegServiceImpl extends BaseServiceImpl implements ProductCodeInfoRegService{

	@Autowired
	private ProductCodeInfoRegMapper productCodeInfoRegMapper;

	@Override
	public ProductCodeInfoRegVO selectProductCodeInfoReg(ProductCodeInfoRegVO productCodeInfoRegVO) throws Exception {

		ProductCodeInfoRegVO resultVO = productCodeInfoRegMapper.selectProductCodeInfoReg(productCodeInfoRegVO);

		return resultVO;
	}

	@Override
	public List<ProductCodeInfoRegVO> selectProductCodeInfoRegList(ProductCodeInfoRegVO productCodeInfoRegVO) throws Exception {

		List<ProductCodeInfoRegVO> resultList = productCodeInfoRegMapper.selectProductCodeInfoRegList(productCodeInfoRegVO);
		return resultList;
	}

	@Override
	public int insertProductCodeInfoReg(ProductCodeInfoRegVO productCodeInfoRegVO) throws Exception {

		int insertedCnt = productCodeInfoRegMapper.insertProductCodeInfoReg(productCodeInfoRegVO);

		return insertedCnt;
	}

	@Override
	public int updateProductCodeInfoReg(ProductCodeInfoRegVO productCodeInfoRegVO) throws Exception {

		int updatedCnt = productCodeInfoRegMapper.updateProductCodeInfoReg(productCodeInfoRegVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveProductCodeInfoRegList(List<ProductCodeInfoRegVO> productCodeInfoRegVOList) throws Exception {
		int savedCnt = 0;
		for (ProductCodeInfoRegVO productCodeInfoRegVO : productCodeInfoRegVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(productCodeInfoRegVO.getRowSts())) {
				savedCnt += insertProductCodeInfoReg(productCodeInfoRegVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(productCodeInfoRegVO.getRowSts())) {
				savedCnt += updateProductCodeInfoReg(productCodeInfoRegVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deleteProductCodeInfoReg(ProductCodeInfoRegVO productCodeInfoRegVO) throws Exception {
		return productCodeInfoRegMapper.deleteProductCodeInfoReg(productCodeInfoRegVO);
	}

}
