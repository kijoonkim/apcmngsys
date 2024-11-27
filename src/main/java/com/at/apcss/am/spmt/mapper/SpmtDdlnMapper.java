package com.at.apcss.am.spmt.mapper;

import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.am.spmt.vo.SpmtCmndVO;

/**
 * 생산속보 Mapper 인터페이스
 * @author 박승진
 * @since 2024.11.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.11.20  박승진        최초 생성
 * </pre>
 */
@Mapper
public interface SpmtDdlnMapper {

	/**
	 * 당일작업단가 리스트 조회
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectDhtyJobList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 당일작업단가 리스트 조회
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectJobCnList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 시황분석 리스트 조회
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectMrktAnlsList(HashMap<String,Object> spmtVO) throws Exception;



	/**
	 * 당일작업단가 수정
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int updateDhtyJobList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 당일작업단가 등록
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int insertDhtyJobList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 작업내용 수정
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int updateJobCnList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 작업내용 등록
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int insertJobCnList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 시황분석 수정
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int updateMrktAnlsList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 시황분석 등록
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int insertMrktAnlsList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황1 선별 등록
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int insertInvntrSort(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황1 팔레트박스 등록
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int insertPltBx(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황1 선별 수정
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int updateInvntrSort(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황1 팔레트박스 수정
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int updatePltBx(HashMap<String,Object> spmtVO) throws Exception;


	/**
	 * 재고현황1 선별재고 조회
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectInvntrSortList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황1 선별재고 조회
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectInvntrBxList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황2  선별 수정
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int updateInvntr2SortList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황2 선별 등록
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int insertInvntr2SortList(HashMap<String,Object> spmtVO) throws Exception;
	/**
	 * 재고현황2  상품 수정
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int updateInvntr2GdsList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황2 상품 등록
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int insertInvntr2GdsList(HashMap<String,Object> spmtVO) throws Exception;
	/**
	 * 재고현황2 다이스 수정
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int updateInvntr2DiceList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황2 등록
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int insertInvntr2DiceList(HashMap<String,Object> spmtVO) throws Exception;


	/**
	 * 재고현황2 선별재고 조회
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectInvntrTwoList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 입고현황 수정
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int updateWrhsSttnList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 입고현황 등록
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int insertWrhsSttnList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 입고현황 선별재고 조회
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectWrhsSttnList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 당일작업단가 삭제
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int deleteDhtyJobList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 작업내용 삭제
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int deleteJobCnList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 시황분석 삭제
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int deleteMrktAnlsList(HashMap<String,Object> spmtVO) throws Exception;


	/**
	 * 재고현황1 선별 삭제
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int deleteInvntrSort1(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황1 팔레트박스 삭제
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int deleteInvntrPltbx(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황2 선별 삭제
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int deleteInvntrSort2(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황2 다이스 삭제
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int deleteInvntrDice(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황2 상품 삭제
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int deleteInvntrGds(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황2 상품 삭제
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int deleteWrhsSttnList(HashMap<String,Object> spmtVO) throws Exception;


}
