package com.at.apcss.am.invntr.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.cmns.vo.PltBxVO;
import com.at.apcss.am.invntr.vo.PltWrhsSpmtVO;

/**
 * 팔레트 입출고 Mapper 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Mapper
public interface PltWrhsSpmtMapper {
	/**
	 * 팔레트/박스 입출고 단건 조회
	 * 
	 * @param pltBxVO
	 * @return
	 * @throws Exception
	 */
	public PltWrhsSpmtVO selectPltBxMngWrhsSpmt(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception;
	/**
	 * 팔레트/박스 재고정보 목록 조회
	 * 
	 * @param pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
	public List<PltBxVO> selectPltBxMngList(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception;
	
	/**
	 * 팔레트 입출고 단건 조회
	 * @param pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
	public PltWrhsSpmtVO selectPltWrhsSpmt(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception;

	/**
	 * 팔레트 입출고 목록 조회
	 * @param pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
	public List<PltWrhsSpmtVO> selectPltWrhsSpmtList(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception;

	/**
	 * 팔레트 입출고 등록
	 * @param pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
	public int insertPltWrhsSpmt(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception;

	/**
	 * 팔레트 입출고 변경
	 * @param pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
	public int updatePltWrhsSpmt(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception;

	/**
	 * 팔레트 입출고 delYn 변경
	 * @param pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
	public int updateDelYnPltWrhsSpmt(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception;
	/**
	 * 팔레트 입출고 기초재고수량 변경
	 * @param pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
	public int updateBssInvntrQnttPltWrhsSpmt(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception;
	/**
	 * 팔레트 입출고 SN 조회
	 * @param pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
	PltWrhsSpmtVO selectWrhsSpmtSN(PltWrhsSpmtVO pltWrhsSpmtVO)throws Exception;
	int selectPltWrhsSpmtSN(PltWrhsSpmtVO pltWrhsSpmtVO)throws Exception;
	/**
	 * 팔레트 입출고실적 생성후 파레트정보내 현수량 업데이트
	 * @param pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
	void updatePltBxInfoBssInvntrQntt(PltWrhsSpmtVO pltWrhsSpmtVO)throws Exception;

	int mergePltWrhsSpmt(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception;
	/**
	 * 팔레트 입출고실적 삭제
	 * @param pltDelList
	 * @return
	 * @throws Exception
	 */
	int deletePltWrhsSpmt(List<PltWrhsSpmtVO> pltDelList) throws Exception;
}
