package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.ProductCodeInfoLogVO;


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
public interface ProductCodeInfoLogService {

	/**
	 * 정보를 조회한다.
	 * @param productCodeInfoLogVO
	 * @return
	 * @throws Exception
	 */
	public ProductCodeInfoLogVO selectProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception;

	public List<ProductCodeInfoLogVO> selectProductCodeInfoLogList(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception;

	public int insertProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception;

	public int updateProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception;

	public int multiSaveProductCodeInfoLogList(List<ProductCodeInfoLogVO> productCodeInfoLogVOList) throws Exception;
	public int insertMegerProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVOList) throws Exception;
	public int insertMegerLogProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVOList) throws Exception;
	public int updateMegerProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVOList) throws Exception;

	public int deleteProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception;

}
