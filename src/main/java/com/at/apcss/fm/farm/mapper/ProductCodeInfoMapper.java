package com.at.apcss.fm.farm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.ProductCodeInfoVO;

/**
 * 게시판 Mapper 인터페이스
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
@Mapper
public interface ProductCodeInfoMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public ProductCodeInfoVO selectProductCodeInfo(ProductCodeInfoVO productCodeInfoVO);

	public List<ProductCodeInfoVO> selectProductCodeInfoList(ProductCodeInfoVO productCodeInfoVO);

	public int insertProductCodeInfo(ProductCodeInfoVO productCodeInfoVO);

	public int updateProductCodeInfo(ProductCodeInfoVO productCodeInfoVO);

	public int insertMegerProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception;
	public int insertMegerLogProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception;

	public int insertMegerProductCodeInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogProductCodeInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception;

	public int deleteProductCodeInfo(ProductCodeInfoVO productCodeInfoVO) throws Exception;
}
