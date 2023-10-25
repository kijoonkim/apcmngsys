package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.ProductCodeInfoVO;


/**
 * 평가등록결과 Service 인터페이스
 * @author 김동제
 * @since 2023.10.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.01  김동제        최초 생성
 * </pre>
 */
public interface ProductCodeInfoService {

	/**
	 * 정보를 조회한다.
	 * @param productCodeInfoVO
	 * @return
	 * @throws Exception
	 */
	public ProductCodeInfoVO selectProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception;

	public List<ProductCodeInfoVO> selectProductCodeInfoList(ProductCodeInfoVO productCodeInfoVO) throws Exception;

	public int insertProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception;

	public int updateProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception;

	public int multiSaveProductCodeInfoList(List<ProductCodeInfoVO> productCodeInfoVOList) throws Exception;

	public int insertMegerProductCodeInfo(ProductCodeInfoVO productCodeInfoVOList) throws Exception;
	public int insertMegerLogProductCodeInfo(ProductCodeInfoVO productCodeInfoVOList) throws Exception;

	public int insertMegerProductCodeInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogProductCodeInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerProductCodeInfo(ProductCodeInfoVO productCodeInfoVOList) throws Exception;

	public int deleteProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception;

}
