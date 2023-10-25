package com.at.apcss.fm.farm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.ProductCodeInfoLogVO;

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
public interface ProductCodeInfoLogMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public ProductCodeInfoLogVO selectProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO);

	public List<ProductCodeInfoLogVO> selectProductCodeInfoLogList(ProductCodeInfoLogVO productCodeInfoLogVO);

	public int insertProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO);

	public int updateProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO);

	public int insertMegerProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception;
	public int insertMegerLogProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception;
	public int updateMegerProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception;

	public int deleteProductCodeInfoLog(ProductCodeInfoLogVO productCodeInfoLogVO) throws Exception;
}
