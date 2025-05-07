<%
    /**
     * @Class Name : menuInfoPopup.jsp
     * @Description : 메뉴정보 화면
     * @author SI개발부
     * @since 2025.04.21
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	 수정내용
     * @ ----------    ----------    ---------------------------
     * @ 2025.04.21    신정철		 최초 생성
     * @see
     *
     */
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>title : 메뉴 정보</title>
    <style>
        .menu-info {
            width: 90%;
            margin: 30px auto;
            font-family: Arial, sans-serif;
            padding: 0;
            list-style: none;
        }
        .menu-info li {
            padding: 12px 16px;
            border-bottom: 1px solid #ccc;
        }
        .menu-info li span.__label {
            display: inline-block;
            width: 120px;
            font-weight: bold;
            color: #333;
            font-size: 1.2em;
        }
        .menu-info li span.__value {
            color: #555;
            font-size: 1.2em;
        }
        .menu-title {
            text-align: center;
            font-size: 1.6em;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<ul class="menu-info">
    <li><span class="__label">메뉴ID</span><span class="__value popMenuInfo-menuId"></span></li>
    <li><span class="__label">메뉴명</span><span class="__value popMenuInfo-menuNm"></span></li>
    <!-- <li><span class="__label">구분</span><span class="value popMenuInfo-sysNm"></span></li> -->
    <li><span class="__label">상위메뉴ID</span><span class="__value popMenuInfo-upMenuId"></span></li>
    <li><span class="__label">상위메뉴명</span><span class="__value popMenuInfo-upMenuNm"></span></li>
    <li><span class="__label">URL</span><span class="__value popMenuInfo-url"></span></li>
</ul>

</body>
<script type="application/javascript">
    const popMenuInfo = {
        modalId: "modal-menuInfo",
        objMenu: {
            menuId: "",
            menuNm: "",
            sysNm: "",
            upMenuId: "",
            upMenuNm: "",
            url: "",
        },
        callbackFnc: function() {},
        init: function(_objMenuInfo, _callbackFnc) {

            this.objMenu = gfn_cloneJson(_objMenuInfo);

            if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
                this.callbackFnc = _callbackFnc;
            }

            document.querySelector(".popMenuInfo-menuId").textContent = gfn_nvl(this.objMenu.menuId);
            document.querySelector(".popMenuInfo-menuNm").textContent = gfn_nvl(this.objMenu.menuNm);
            //document.querySelector(".popMenuInfo-sysNm").textContent = gfn_nvl(this.objMenu.sysNm);
            document.querySelector(".popMenuInfo-upMenuId").textContent = gfn_nvl(this.objMenu.upMenuId);
            document.querySelector(".popMenuInfo-upMenuNm").textContent = gfn_nvl(this.objMenu.upMenuNm);
            document.querySelector(".popMenuInfo-url").textContent = gfn_nvl(this.objMenu.url);
        },
        close: function() {
            gfn_closeModal(this.modalId, this.callbackFnc, this.objMenu);
        },
    }
</script>
</html>
