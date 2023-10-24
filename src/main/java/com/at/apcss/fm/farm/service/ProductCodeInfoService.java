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
	public ProductCodeInfoVO selectproductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception;

	public List<ProductCodeInfoVO> selectproductCodeInfoList(ProductCodeInfoVO productCodeInfoVO) throws Exception;

	public int insertProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception;

	public int updateProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception;

	public int multiSaveproductCodeInfoList(List<ProductCodeInfoVO> productCodeInfoVOList) throws Exception;

	public int insertMegerproductCodeInfo(ProductCodeInfoVO productCodeInfoVOList) throws Exception;
	public int insertMegerLogproductCodeInfo(ProductCodeInfoVO productCodeInfoVOList) throws Exception;

	public int insertMegerproductCodeInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogproductCodeInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerproductCodeInfo(ProductCodeInfoVO productCodeInfoVOList) throws Exception;

	public int deleteproductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception;

}
