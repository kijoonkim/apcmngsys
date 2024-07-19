# mainPostMessage 사용설명서

## 1. REQUEST PAGE
> parameter로 사용될 VO를 생성하고 해당 객체 필드의 target으로 받고자 하는 Tab의 ID입력

	/** main 레이아웃을 통해서 전달하고자 하는 탭에 선택한 row 정보를 전달함. **/
	let cfn_reqTab = function(){
		let idx = grdRawMtrWrhs.getRow();
		let data = grdRawMtrWrhs.getRowData(idx);
		/** 전달하고자하는 TAB의 아이디를 객체 필드에 담아서 전달 **/
		data.target = 'AM_001_002'
		let json = JSON.stringify(data);
		/** main에 선언되어있는 fn **/
		window.parent.cfn_openTabSearch(json);
	}

## 2. MAIN PAGE
> 현재 테스트는 A탭에서 조회목록에 대한 정보를 받아 B탭에 인자로 전달해 조회하는 기능입니다.<br>
다른탭에 어떤 동작을 요구하는 기능이 필요한 경우 main에 선언하시고 사용하시면 됩니다.

	
	 function cfn_openTabSearch (obj){
        try{
            let object = JSON.parse(obj);
            if(!gfn_isEmpty(object)){
                let target = object.target;
                /** left Menu에서 넘어온 해당 Tab의 대한 정보로 필터링 **/
                let data = sideJsonData.filter((item) => item.id == target);
                /** 현재 열려있는 탭인지 확인 **/
                let openFlag = tabJsonData.some((item) => item.targetid.replace("TAB_","") == target);

                if(openFlag){
                    /** receive Tab이 열려 있는 상태에선 msg를 전달하여 VO 전달 **/
                    let iframe = "idxfrmJson_TAB_" + target;
                    let el = document.getElementById(iframe);
                    /** 해당 Tab open **/
                    SBUxMethod.set("tab_menu","TAB_"+target);
                    /** main > receive 로 parameter 전달 **/
                    el.contentWindow.postMessage(object);
                }else{
                    localStorage.setItem("callMain",JSON.stringify(object));
                    /** 현재 receive Tab이 없는경우 새로 오픈하며 중간에 로직을 위해서
                     * 직접 전달하지않고 localStorage를 사용하여 param 전달 **/
                    fn_actionGoPage(
                        data[0].url
                        , 'LEFT'
                        , data[0].id
                        , data[0].text
                        , data[0].pid
                    );
                }
            }
      }catch (e){
            /** 전달인자가 비어있을경우 json parse exception **/
            console.error(e.toString());
        }
    }
## 3. RECEIVE PAGE
> MAIN PAGE로 부터 새탭을 생성하여 호출된것과 postMessage를 전달받은것이 분기됩니다.<br>
고로 document 전체에 이벤트 리스너가 감지되어 해당 기능을 처리합니다.
<details>
  <summary>MAIN을 통해 새탭을 열때</summary>
      
      window.addEventListener('DOMContentLoaded', async function(e) {	await fn_init();
		await stdGrdSelect.init();

		/** main으로부터 호출되어 생성될때 localStorage통해 VO 즉시 검색 확인 **/
		let initObject = localStorage.getItem("callMain");
		if(!gfn_isEmpty(initObject)){
			initObject = JSON.parse(initObject);
			localStorage.removeItem("callMain");
			await SBUxMethod.set("srch-inp-pltno",initObject.pltno);
			await SBUxMethod.set("srch-dtp-wrhsYmd",initObject.wrhsYmd);
			await fn_search()
		}
	});
</details>

<details>
  <summary><b>열려있는 탭에 전달받을때</b></summary>


	window.addEventListener('message',function(event){
		let obj = event.data;
		if(!gfn_isEmpty(obj)){
			SBUxMethod.set("srch-inp-pltno",obj.pltno);
			SBUxMethod.set("srch-dtp-wrhsYmd",obj.wrhsYmd);
			fn_search();
		}
	});
  </details>

