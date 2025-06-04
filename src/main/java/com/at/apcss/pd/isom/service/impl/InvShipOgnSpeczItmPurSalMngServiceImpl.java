package com.at.apcss.pd.isom.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.isom.mapper.InvShipOgnSpeczItmPurSalMngMapper;
import com.at.apcss.pd.isom.service.InvShipOgnSpeczItmPurSalMngService;
import com.at.apcss.pd.isom.vo.InvShipOgnSpeczItmPurSalMngVO;
import com.at.apcss.pd.isom.vo.ItemStbltYnVO;


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
 * 2023.06.21          최초 생성
 * </pre>
 */
@Service("InvShipOgnSpeczItmPurSalMngService")
public class InvShipOgnSpeczItmPurSalMngServiceImpl extends BaseServiceImpl implements InvShipOgnSpeczItmPurSalMngService{

	@Autowired
	private InvShipOgnSpeczItmPurSalMngMapper invShipOgnSpeczItmPurSalMngMapper;

	@Override
	public InvShipOgnSpeczItmPurSalMngVO selectInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception {

		return invShipOgnSpeczItmPurSalMngMapper.selectInvShipOgnSpeczItmPurSalMng(invShipOgnSpeczItmPurSalMngVO);
	}

	@Override
	public List<InvShipOgnSpeczItmPurSalMngVO> selectInvShipOgnSpeczItmPurSalMngList(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception {
		return invShipOgnSpeczItmPurSalMngMapper.selectInvShipOgnSpeczItmPurSalMngList(invShipOgnSpeczItmPurSalMngVO);
	}

	@Override
	public int insertInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception {
		return invShipOgnSpeczItmPurSalMngMapper.insertInvShipOgnSpeczItmPurSalMng(invShipOgnSpeczItmPurSalMngVO);
	}

	@Override
	public int updateInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception {
		return 0;
	}
	@Override
	public int deleteInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception {
		return 0;
	}

	@Override
	public int multiSaveInvShipOgnSpeczItmPurSalMngList(List<InvShipOgnSpeczItmPurSalMngVO> invShipOgnSpeczItmPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;// 등록년도
		String brnoVal = null;//출자출하조직 사업자번호
		String uoBrnoVal = null;//통합조직 사업자번호
		for (InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO : invShipOgnSpeczItmPurSalMngVOList) {
			yrVal = invShipOgnSpeczItmPurSalMngVO.getYr();
			brnoVal = invShipOgnSpeczItmPurSalMngVO.getBrno();
			uoBrnoVal = invShipOgnSpeczItmPurSalMngVO.getUoBrno();
			if (ComConstants.ROW_STS_INSERT.equals(invShipOgnSpeczItmPurSalMngVO.getRowSts())) {
				savedCnt += insertInvShipOgnSpeczItmPurSalMng(invShipOgnSpeczItmPurSalMngVO);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(invShipOgnSpeczItmPurSalMngVO.getRowSts())) {
				savedCnt += updateInvShipOgnSpeczItmPurSalMng(invShipOgnSpeczItmPurSalMngVO);
			}
		}

		//전문품목 매입 매출 저장 완료 후 적합여부 체크
		if (yrVal != null && !yrVal.equals("")
			&& brnoVal != null && !brnoVal.equals("")
			&& uoBrnoVal != null && !uoBrnoVal.equals("")){

			List<ItemStbltYnVO> resultVoList = new ArrayList<>();
			ItemStbltYnVO itemStbltYnVo = new ItemStbltYnVO();

			itemStbltYnVo.setYr(yrVal);
			itemStbltYnVo.setBrno(brnoVal);
			itemStbltYnVo.setUoBrno(uoBrnoVal);
			resultVoList = selectItemStbltYnList(itemStbltYnVo);

			//조회 결과가 있을 경우에만 업데이트
			if (resultVoList != null) {
				//적합여부 초기화
				invShipOgnSpeczItmPurSalMngMapper.updateItemStbltYnInit(itemStbltYnVo);
				for (ItemStbltYnVO resultVo : resultVoList) {
					updateItemStbltYn(resultVo);
				}
			}
		}

		return savedCnt;
	}

	//품목별 적합여부 리스트
	@Override
	public List<ItemStbltYnVO> selectItemStbltYnList(ItemStbltYnVO itemStbltYnVo) throws Exception {
		return invShipOgnSpeczItmPurSalMngMapper.selectItemStbltYnList(itemStbltYnVo);
	}

	//적합여부 업데이트
	@Override
	public int updateItemStbltYn(ItemStbltYnVO itemStbltYnVo) throws Exception {
		return invShipOgnSpeczItmPurSalMngMapper.updateItemStbltYn(itemStbltYnVo);
	}

	//전문품목 매입매출 로우데이터
	@Override
	public List<InvShipOgnSpeczItmPurSalMngVO> selectRawDataList(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception {
		return invShipOgnSpeczItmPurSalMngMapper.selectRawDataList(InvShipOgnSpeczItmPurSalMngVO);
	}

	//전문품목 매입매출 로우데이터
	@Override
	public List<InvShipOgnSpeczItmPurSalMngVO> selectRawDataList2025(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception {
		return invShipOgnSpeczItmPurSalMngMapper.selectRawDataList2025(InvShipOgnSpeczItmPurSalMngVO);
	}

	/**
	 * 출자출하조직 전품품목 매입매출
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<InvShipOgnSpeczItmPurSalMngVO> selectIsoMajorItemPurchaseRawDataList(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception {
		int yr = Integer.parseInt(invShipOgnSpeczItmPurSalMngVO.getYr());
		if (yr < 2025) {
			invShipOgnSpeczItmPurSalMngVO.setOldDataYn(ComConstants.CON_YES);
		}
		return invShipOgnSpeczItmPurSalMngMapper.selectIsoMajorItemPurchaseRawDataList(invShipOgnSpeczItmPurSalMngVO);
	}

	@Override
	public List<InvShipOgnSpeczItmPurSalMngVO> selectIsoMajorItemPurchaseList(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception {
		int yr = Integer.parseInt(invShipOgnSpeczItmPurSalMngVO.getYr());
		if (yr < 2025) {
			invShipOgnSpeczItmPurSalMngVO.setOldDataYn(ComConstants.CON_YES);
		}
		return invShipOgnSpeczItmPurSalMngMapper.selectIsoMajorItemPurchaseList(invShipOgnSpeczItmPurSalMngVO);
	}

	@Override
	public List<InvShipOgnSpeczItmPurSalMngVO> selectInvShipOgnSpeczItmPurSalMngListNew(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception {
		return invShipOgnSpeczItmPurSalMngMapper.selectInvShipOgnSpeczItmPurSalMngListNew(invShipOgnSpeczItmPurSalMngVO);
	}

	@Override
	public int insertInvShipOgnSpeczItmPurSalMngNew(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception {
		return invShipOgnSpeczItmPurSalMngMapper.insertInvShipOgnSpeczItmPurSalMngNew(invShipOgnSpeczItmPurSalMngVO);
	}

	@Override
	public int multiSaveInvShipOgnSpeczItmPurSalMngListNew(List<InvShipOgnSpeczItmPurSalMngVO> invShipOgnSpeczItmPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;// 등록년도
		String brnoVal = null;//출자출하조직 사업자번호
		String uoBrnoVal = null;//통합조직 사업자번호
		String tmprStrgYnVal = null;//임시저장 여부
		int delYn = 0;
		for (InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO : invShipOgnSpeczItmPurSalMngVOList) {
			yrVal = invShipOgnSpeczItmPurSalMngVO.getYr();
			brnoVal = invShipOgnSpeczItmPurSalMngVO.getBrno();
			uoBrnoVal = invShipOgnSpeczItmPurSalMngVO.getUoBrno();
			tmprStrgYnVal = invShipOgnSpeczItmPurSalMngVO.getTmprStrgYn();
			//저장 전 기존 자료 전체 삭제 처리
			if(delYn == 0) {
				delYn = invShipOgnSpeczItmPurSalMngMapper.updateDelYn(invShipOgnSpeczItmPurSalMngVO);
			}
			savedCnt += insertInvShipOgnSpeczItmPurSalMngNew(invShipOgnSpeczItmPurSalMngVO);
		}

		InvShipOgnSpeczItmPurSalMngVO tmprStrgVo = new InvShipOgnSpeczItmPurSalMngVO();
		tmprStrgVo.setYr(yrVal);
		tmprStrgVo.setBrno(brnoVal);
		tmprStrgVo.setUoBrno(uoBrnoVal);
		tmprStrgVo.setTmprStrgYn(tmprStrgYnVal);
		invShipOgnSpeczItmPurSalMngMapper.updateTempSaveAps(tmprStrgVo);
		invShipOgnSpeczItmPurSalMngMapper.updateTempSavePst(tmprStrgVo);

		//임시저장인 경우 적합여부 체크 하지 않음
		if ("Y".equals(tmprStrgYnVal)) {
			return savedCnt;
		}

		//전문품목 매입 매출 저장 완료 후 적합여부 체크
		if (yrVal != null && !yrVal.equals("")
			&& brnoVal != null && !brnoVal.equals("")
			&& uoBrnoVal != null && !uoBrnoVal.equals("")){

			List<ItemStbltYnVO> resultVoList = new ArrayList<>();
			ItemStbltYnVO itemStbltYnVo = new ItemStbltYnVO();

			itemStbltYnVo.setYr(yrVal);
			itemStbltYnVo.setBrno(brnoVal);
			itemStbltYnVo.setUoBrno(uoBrnoVal);
			resultVoList = selectItemStbltYnList(itemStbltYnVo);

			//조회 결과가 있을 경우에만 업데이트
			if (resultVoList != null) {
				//적합여부 초기화
				invShipOgnSpeczItmPurSalMngMapper.updateItemStbltYnInit(itemStbltYnVo);
				for (ItemStbltYnVO resultVo : resultVoList) {
					updateItemStbltYn(resultVo);
				}
			}
		}
		return savedCnt;
	}

	@Override
	public InvShipOgnSpeczItmPurSalMngVO selectTempSaveIsoPst(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception {
		return invShipOgnSpeczItmPurSalMngMapper.selectTempSaveIsoPst(invShipOgnSpeczItmPurSalMngVO);
	}

}
