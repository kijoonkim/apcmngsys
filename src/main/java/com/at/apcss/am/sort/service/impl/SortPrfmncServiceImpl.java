package com.at.apcss.am.sort.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.at.apcss.am.sort.vo.*;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.invntr.service.SortInvntrService;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.sort.mapper.SortPrfmncMapper;
import com.at.apcss.am.sort.service.SortInptPrfmncService;
import com.at.apcss.am.sort.service.SortPrfmncService;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : SortPrfmncServiceImpl.java
 * @Description : 선별실적 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("sortPrfmncService")
public class SortPrfmncServiceImpl extends BaseServiceImpl implements SortPrfmncService {

	@Autowired
	private SortPrfmncMapper sortPrfmncMapper;

	@Resource(name="cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Resource(name="sortInptPrfmncService")
	private SortInptPrfmncService sortInptPrfmncService;

	@Resource(name="sortInvntrService")
	private SortInvntrService sortInvntrService;

	@Override
	public SortPrfmncVO selectSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception {

		SortPrfmncVO resultVO = sortPrfmncMapper.selectSortPrfmnc(sortPrfmncVO);

		return resultVO;
	}

	@Override
	public List<SortDsctnTotVO> selectSortDsctnTot(SortDsctnTotVO sortDsctnTotVO) throws Exception {

		List<SortDsctnTotVO> resultVO = sortPrfmncMapper.selectSortDsctnTot(sortDsctnTotVO);

		return resultVO;
	}
	@Override
	public List<SortDsctnTotVO> selectSortDsctn(SortDsctnTotVO sortDsctnTotVO) throws Exception {

		List<SortDsctnTotVO> resultVO = sortPrfmncMapper.selectSortDsctn(sortDsctnTotVO);

		return resultVO;
	}

	@Override
	public List<ComSortDsctnTotVO> selectComSortDsctnTot(ComSortDsctnTotVO sortDsctnTotVO) throws Exception {

		List<ComSortDsctnTotVO> resultVO = sortPrfmncMapper.selectComSortDsctnTot(sortDsctnTotVO);

		return resultVO;
	}

	@Override
	public List<SortPrfmncVO> selectSortPrfmncList(SortPrfmncVO sortPrfmncVO) throws Exception {

		List<SortPrfmncVO> resultList = sortPrfmncMapper.selectSortPrfmncList(sortPrfmncVO);

		return resultList;
	}

	@Override
	public List<SortPrfmncVO> selectSortPrfmncGrdList(SortPrfmncVO sortPrfmncVO) throws Exception {

		List<SortPrfmncVO> resultList = sortPrfmncMapper.selectSortPrfmncGrdList(sortPrfmncVO);

		return resultList;
	}

	@Override
	public List<SortPrfmncVO> selectSortCnclList(SortPrfmncVO sortPrfmncVO) throws Exception {

		List<SortPrfmncVO> resultList = sortPrfmncMapper.selectSortCnclList(sortPrfmncVO);

		return resultList;
	}




	@Override
	public List<SortPrfmncVO> selectSortInptPrfmncList(SortPrfmncVO sortPrfmncVO) throws Exception {

		List<SortPrfmncVO> resultList = sortPrfmncMapper.selectSortInptPrfmncList(sortPrfmncVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception {

		if(0 == sortPrfmncMapper.insertSortPrfmnc(sortPrfmncVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertSortPrfmncList(List<SortPrfmncVO> sortPrfmncList) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		List<SortInvntrVO> sortInvntrList = new ArrayList<>();

		// 투입실적 유무에 따라 선별번호 부여 or 선별투입실적 등록 처리
		int insertedCnt = 0;
		for ( SortPrfmncVO sortPrfmncVO : sortPrfmncList ) {
			String sortno = sortPrfmncVO.getSortno();
			if (!StringUtils.hasText(sortno)) {
				sortno = cmnsTaskNoService.selectSortno(sortPrfmncVO.getApcCd(), sortPrfmncVO.getInptYmd());
				sortPrfmncVO.setSortno(sortno);
			}

			if (!StringUtils.hasText(sortPrfmncVO.getRprsPrdcrCd())) {
				sortPrfmncVO.setRprsPrdcrCd(sortPrfmncVO.getPrdcrCd());
			}

			insertedCnt = sortPrfmncMapper.insertSortPrfmnc(sortPrfmncVO);

			if (insertedCnt != 0) {

			}

			SortInvntrVO sortInvntrVO = new SortInvntrVO();
			BeanUtils.copyProperties(sortPrfmncVO, sortInvntrVO);
			sortInvntrVO.setSortQntt(sortPrfmncVO.getSortQntt());
			sortInvntrVO.setSortWght(sortPrfmncVO.getSortWght());
			sortInvntrVO.setInvntrQntt(sortPrfmncVO.getSortQntt());
			sortInvntrVO.setInvntrWght(sortPrfmncVO.getSortWght());

			sortInvntrList.add(sortInvntrVO);
		}

		// 선별재고 생성
		rtnObj = sortInvntrService.insertSortInvntrList(sortInvntrList);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 입고구분에 따라 재고 변경 추가

		return null;
	}


	@Override
	public HashMap<String, Object> updateSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception {

		if(0 == sortPrfmncMapper.updateSortPrfmnc(sortPrfmncVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception {

		if(0 == sortPrfmncMapper.deleteSortPrfmnc(sortPrfmncVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteSortPrfmncList(List<SortPrfmncVO> sortPrfmncList) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		for ( SortPrfmncVO sort : sortPrfmncList ) {

			// 선별재고 삭제
			SortInvntrVO invntrVO = new SortInvntrVO();
			BeanUtils.copyProperties(sort, invntrVO);

			rtnObj = sortInvntrService.deleteSortInvntr(invntrVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			// 선별실적.delYn set 'Y'
			//sortPrfmncMapper.deleteSortPrfmnc(sort);
			if (ComConstants.CON_YES.equals(sort.getSortRealDelY())) {
                sortPrfmncMapper.deleteSortPrfmnc(sort);
            } else {
                sortPrfmncMapper.updateSortPrfmncForDelY(sort);
            }

		}

		return null;
	}

	@Override
	public List<SortBffaVO> selectSortBffaListBySortno(SortBffaVO sortBffaVO) throws Exception {
		return sortPrfmncMapper.selectSortBffaListBySortno(sortBffaVO);
	}

	@Override
    public List<SortPrfmncVO> selectSortListBySortno(SortPrfmncVO sortPrfmncVO) throws Exception {

        List<SortPrfmncVO> resultList = sortPrfmncMapper.selectSortListBySortno(sortPrfmncVO);

        return resultList;
    }
    
    @Override
    public List<HashMap<String, Object>> selectExhstDsctn(HashMap<String, Object> exhstDsctn) throws Exception {

    	List<HashMap<String, Object>> resultVO = sortPrfmncMapper.selectExhstDsctn(exhstDsctn);
    	
		return resultVO;
	}
    
    @Override
    public List<HashMap<String, Object>> selectGrdDsctn(HashMap<String, Object> exhstDsctn) throws Exception {

    	List<HashMap<String, Object>> resultVO = sortPrfmncMapper.selectGrdDsctn(exhstDsctn);
    	
		return resultVO;
	}

	@Override
	public int insertSortBffa(SortBffaVO sortBffaVO) throws Exception {
		String wrhsno = sortBffaVO.getBffaWrhsno();
		String apcCd = sortBffaVO.getApcCd();
		String wrhsYmd	= sortBffaVO.getWrhsYmd();

		String sysFrstInptUserId =  sortBffaVO.getSysFrstInptUserId();
		String sysFrstInptPrgrmId =  sortBffaVO.getSysFrstInptPrgrmId();
		String sysFrstInptDt =  sortBffaVO.getSysFrstInptDt();
		String sysLastChgUserId =  sortBffaVO.getSysLastChgUserId();
		String sysLastChgPrgrmId =  sortBffaVO.getSysLastChgPrgrmId();
		String sysLastChgDt =  sortBffaVO.getSysLastChgDt();

		if(StringUtils.isEmpty(wrhsno)) {
			String wrhsNo = cmnsTaskNoService.selectBffaWrhsno(apcCd,wrhsYmd);
			sortBffaVO.setBffaWrhsno(wrhsNo);
			sortBffaVO.setPltno(wrhsNo);
			/** 없을때 **/
			if(!sortBffaVO.getSortBffaWrhsStdGrdVO().isEmpty()){
				for(SortBffaWrhsStdGrdVO vo : sortBffaVO.getSortBffaWrhsStdGrdVO()){
					vo.setSysFrstInptDt(sysFrstInptDt);
					vo.setSysFrstInptUserId(sysFrstInptUserId);
					vo.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);
					vo.setSysLastChgDt(sysLastChgDt);
					vo.setSysLastChgPrgrmId(sysLastChgPrgrmId);
					vo.setSysLastChgUserId(sysLastChgUserId);
					vo.setBffaWrhsno(wrhsNo);
					sortPrfmncMapper.insertSortBffaStdGrd(vo);
				}
			}
			return sortPrfmncMapper.insertSortBffa(sortBffaVO);
		}else{
			deleteSortBffaAll(sortBffaVO);
			for(SortBffaWrhsStdGrdVO vo : sortBffaVO.getSortBffaWrhsStdGrdVO()) {
				vo.setSysFrstInptDt(sysFrstInptDt);
				vo.setSysFrstInptUserId(sysFrstInptUserId);
				vo.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);
				vo.setSysLastChgDt(sysLastChgDt);
				vo.setSysLastChgPrgrmId(sysLastChgPrgrmId);
				vo.setSysLastChgUserId(sysLastChgUserId);
				vo.setBffaWrhsno(sortBffaVO.getBffaWrhsno());
				sortPrfmncMapper.insertSortBffaStdGrd(vo);
			}
			return sortPrfmncMapper.updateSortBffa(sortBffaVO);
		}
	}

	@Override
	public List<SortPrfmncVO> selectSortPrfmncListByWrhs(SortPrfmncVO sortPrfmncVO) throws Exception {
		
		List<SortPrfmncVO> resultList = sortPrfmncMapper.selectSortPrfmncListByWrhs(sortPrfmncVO);

		return resultList;
	}

	@Override
	public List<SortPrfmncVO> selectSortPrfmncListByWrhsForGdsGrd(SortPrfmncVO sortPrfmncVO) throws Exception {
		List<SortPrfmncVO> resultList = sortPrfmncMapper.selectSortPrfmncListByWrhsForGdsGrd(sortPrfmncVO);

		return resultList;
	}

	@Override
	public int deleteSortBffa(List<SortBffaVO> sortBffaVoList) throws Exception {
		int count = 0;
		try {
			for(SortBffaVO vo : sortBffaVoList ){
				count += sortPrfmncMapper.deleteSortBffa(vo);
				sortPrfmncMapper.deleteSortBffaStdGrd(vo);
			}

		}catch (Exception e){
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
		}
		return count;
	}

	@Override
	public int deleteSortBffaAll(SortBffaVO sortBffaVO) throws Exception {
		return sortPrfmncMapper.deleteSortBffaAll(sortBffaVO);
	}

}
