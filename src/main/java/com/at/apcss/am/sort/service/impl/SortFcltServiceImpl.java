package com.at.apcss.am.sort.service.impl;

import java.util.Arrays;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.at.apcss.am.sort.mapper.SortFcltMapper;
import com.at.apcss.am.sort.service.SortFcltService;
import com.at.apcss.am.sort.vo.SortFcltVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : SortFcltServiceImpl.java
 * @Description : 선별설비정보 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 박승진
 * @since 2024.09.03
 * @version 1.0
 * @param <SortFcltVO>
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.03  박승진        최초 생성
 * </pre>
 */
@Service("sortFcltService")
public class SortFcltServiceImpl extends BaseServiceImpl implements SortFcltService {

	@Autowired
	private SortFcltMapper sortFcltMapper;


	@Override
	public SortFcltVO selectSortFcltInfo(SortFcltVO sortFcltVO) throws Exception {

		SortFcltVO resultVO = sortFcltMapper.selectSortFcltInfo(sortFcltVO);

		return resultVO;
	}

	@Override
	public List<SortFcltVO> selectSortFcltInfoList(SortFcltVO sortFcltVO) throws Exception {

		List<SortFcltVO> resultVO = sortFcltMapper.selectSortFcltInfoList(sortFcltVO);

		return resultVO;
	}

	@Override
	public List<SortFcltVO> selectSortOprtngCrtrList(SortFcltVO sortFcltVO) throws Exception {
		List<SortFcltVO> resultVO = sortFcltMapper.selectSortOprtngCrtrList(sortFcltVO);
		return resultVO;
	}


	@Override
	public List<SortFcltVO> selectSortFcltDtlInfoList(SortFcltVO sortFcltVO) throws Exception {
		List<SortFcltVO> resultVO = sortFcltMapper.selectSortFcltDtlInfoList(sortFcltVO);
		return resultVO;
	}


	@Override
	public int insertSortFclt(SortFcltVO sortFcltVO) throws Exception {
		int result = 0;
		SortFcltVO resultVO = sortFcltMapper.selectSortFcltInfo(sortFcltVO);

		if(resultVO == null) {
			sortFcltMapper.insertSortFclt(sortFcltVO);
		}else {
			sortFcltMapper.updateSortFclt(sortFcltVO);
		}


		List<String> atrbList = Arrays.asList(new String[] {"RPRS_ITEM_CD","RPRS_VRTY_CD","STD_PCKG_CD"});
		atrbList.forEach(data ->{
				sortFcltVO.setFcltAtrbType(data);
				if(data == "RPRS_ITEM_CD") {
					sortFcltVO.setAtrbCd(sortFcltVO.getRprsItem());
				}else if(data == "RPRS_VRTY_CD") {
					sortFcltVO.setAtrbCd(sortFcltVO.getRprsVrty());
				}else if(data == "STD_PCKG_CD") {
					sortFcltVO.setAtrbCd(sortFcltVO.getUnit());
				}

			try {
				SortFcltVO resultVO2 = sortFcltMapper.selectSortFcltAtrb(sortFcltVO);


				if(resultVO2 == null) {
					sortFcltMapper.insertSortFcltAtrb(sortFcltVO);
				}else {
					sortFcltMapper.updateSortFcltAtrb(sortFcltVO);
				}
			}catch(Exception e){
				e.printStackTrace();
			}

		});




		return result;
	}

	@Override
	public int deleteSortFclt(SortFcltVO sortFcltVO) throws Exception {
		int result = 0;
		result = sortFcltMapper.deleteSortFclt(sortFcltVO);
		result = sortFcltMapper.deleteSortFcltAtrb(sortFcltVO);
		result = sortFcltMapper.deleteSortFcltDtl(sortFcltVO);
		return result;
	}
	@Override
	public int deleteSortFcltDtl(SortFcltVO sortFcltVO) throws Exception {
		int result = 0;
		result = sortFcltMapper.deleteSortFcltDtl(sortFcltVO);
		return result;
	}

	@Override
	public int insertSortFcltAtrb(SortFcltVO sortFcltVO) throws Exception {
		//result = sortFcltMapper.insertSortFcltAtrb(sortFcltVO);
		//result = sortFcltMapper.updateSortFcltAtrb(sortFcltVO);
		return 0;
	}

	@Override
	public SortFcltVO selectSortFcltAtrbList(SortFcltVO sortFcltVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertSortFcltDtl(List<SortFcltVO> sortFcltVOList) throws Exception {

			sortFcltVOList.forEach(item -> {
				String gubun = item.getGubun();
				try {
					if(gubun.equals("insert") ) {
						sortFcltMapper.insertSortFcltDtl(item);
					}else if(gubun.equals("update")) {
						sortFcltMapper.updateSortFcltDtl(item);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

			});


		return 0;
	}

	@Override
	public List<SortFcltVO> selectSortFcltDtl(SortFcltVO sortFcltVO) throws Exception {
		List<SortFcltVO> resultVO = sortFcltMapper.selectSortFcltDtl(sortFcltVO);
		return resultVO;
	}

	@Override
	public List<SortFcltVO> selectSortFcltOprtngPlanList(SortFcltVO sortFcltVO) throws Exception {
		List<SortFcltVO> resultVO = sortFcltMapper.selectSortFcltOprtngPlanList(sortFcltVO);
		return resultVO;
	}

	@Override
	public List<SortFcltVO> selectSortFcltOprtngPrfmncList(SortFcltVO sortFcltVO) throws Exception {
		List<SortFcltVO> resultVO = sortFcltMapper.selectSortFcltOprtngPrfmncList(sortFcltVO);
		return resultVO;
	}

	@Override
	public int insertSortFcltOprtngPlan(SortFcltVO sortFcltVO) throws Exception {
		int result = 0;
		String gubun = sortFcltVO.getGubun();
		if(gubun.equals("insert") ) {
			sortFcltMapper.insertSortFcltOprtngPlan(sortFcltVO);
		}else if(gubun.equals("update")) {
			sortFcltMapper.updateSortFcltOprtngPlan(sortFcltVO);
		}
		return result;
	}

	@Override
	public int deleteSortFcltOprtngPlan(SortFcltVO sortFcltVO) throws Exception {
		int result = 0;
		result = sortFcltMapper.deleteSortFcltOprtngPlan(sortFcltVO);
		return result;
	}

	@Override
	public int deleteSortFcltOprtngPrfmnc(SortFcltVO sortFcltVO) throws Exception {
		int result = 0;
		result = sortFcltMapper.deleteSortFcltOprtngPrfmnc(sortFcltVO);
		return result;
	}

	@Override
	public int insertSortOprtngCrtr(List<SortFcltVO> sortFcltVO) throws Exception {
		sortFcltVO.forEach(item -> {
			String gubun = item.getGubun();
			try {
				if(gubun.equals("insert") ) {
					sortFcltMapper.insertSortOprtngCrtr(item);
				}else if(gubun.equals("update")) {
					sortFcltMapper.updateSortOprtngCrtr(item);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		});
	return 0;
	}

	@Override
	public int deleteSortOprtngCrtr(SortFcltVO sortFcltVO) throws Exception {
		int result = 0;
		result = sortFcltMapper.deleteSortOprtngCrtr(sortFcltVO);
		return result;
	}

	@Override
	public int insertSortFcltOprtngPrfmnc(SortFcltVO sortFcltVO) throws Exception {
		int result = 0;
		String gubun = sortFcltVO.getGubun();
		if(gubun.equals("insert") ) {
			sortFcltMapper.insertSortFcltOprtngPrfmnc(sortFcltVO);
		}else if(gubun.equals("update")) {
			sortFcltMapper.updateSortFcltOprtngPrfmnc(sortFcltVO);
		}
		return result;
	}



}
