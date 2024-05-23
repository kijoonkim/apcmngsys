<%
/**
 * @Class Name : regPrdcr.jsp
 * @Description : 생산자관리 화면
 * @author SI개발부
 * @since 2023.12.04
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.12.04   	김호			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	    <link rel="shortcut icon" href="#">

	    <style>
	        header .hd_top {
	            width: 100%;
	            min-width: 1380px;
	            background: #244b6d;
	            position: relative;
	            height: 50px;
	            margin-bottom: 5px;
	        }

	        p {
	            text-align: center;
	            position: relative;
	            top: 50%;
	            -ms-transform: translateY(-50%);
	            -webkit-transform: translateY(-50%);
	            transform: translateY(-50%);
	            color: #ffffff;
	            font-size: 20px;
	        }

	        div.left {
	            text-align: center;
	            width: 10%;
	            float: left;
	            box-sizing: border-box;
	            background: #ffffff;
	        }

	        div.right {
	            width: 90%;
	            float: right;
	            box-sizing: border-box;
	            background: #ffffff;
	            padding-left: 10px;
	        }

	        div.olControlScaleLine>div {
	            color: white;
	            border-color: white;
	            border-width: medium;
	        }

	        .attribution {
	            color: black;
	            margin: 0px 10px -25px 0px;
	            font-size: 12px;
	            font-weight: bold;
	            text-shadow: -1px 0 white, 0 1px white, 1px 0 white, 0 -1px white;
	            text-align: right;
	        }

	        .menu {
	            padding-top: 5px;
	   			padding-bottom: 5px;
	        }

	        .menu:hover {
	            background-color: #7E7EB3;
	            color: white;
	        }

	        .lbutton{
	            border-top-left-radius: 5px;
	            border-bottom-left-radius: 5px;
	        }
			.button {
	            margin-left:-4px;
	        }
			.rbutton{
	            border-top-right-radius: 5px;
	            border-bottom-right-radius: 5px;
				margin-left:-4px;
	        }

	        #buttonGroup button{
	            border: 1px solid #7E7EB3;
	            background-color: #ffffff;
	            color: #000000;
	            padding: 5px;
	        }
	        #buttonGroup button:hover{
	            color:white;
	            background-color: #7E7EB3;
	        }

	        textarea.pop {
				width: 100%;
				height: 200px;
				padding: 10px;
				box-sizing: border-box;
				border: solid 2px #1E90FF;
				border-radius: 5px;
				font-size: 16px;
				resize: both;
			}

	    </style>

	    <title>팜맵</title>

	    <script src="https://agis.epis.or.kr/ASD/pub2/js/jquery-3.4.1.js"></script>
		<script src="https://agis.epis.or.kr/ASD/js/lib/openlayers/OpenLayers.js"></script>
		<script src="https://agis.epis.or.kr/ASD/js/lib/proj4js/proj4.js"></script>
		<script src="https://agis.epis.or.kr/ASD/farmmapApi/farmapApi.do?apiKey=8AuulPFHOftqyHEmTdQK&domain=http://localhost:8085/"></script>

	    <script>
			var map1;
	        var mapBounds = new OpenLayers.Bounds(-20037508.34, -20037508.34, 20037508.34, 20037508.34);
	        var mapMinZoom = 7;
	        var mapMaxZoom = 20;
	        var xyString;
			var reqUrl;
			var domain = "http://localhost:8085/";
			var apiKey = "8AuulPFHOftqyHEmTdQK";

	        function init() {
	            map1 = farmmapObj.init("mapDiv1");
				console.log('farmmapObj', farmmapObj);
	            reqUrl = farmmapObj.rootUri; //  "https://agis.epis.or.kr/ASD/"

	            addSearchFarmmapDataEvent();
	            addMoveendEvent();
				// addFarmmapLayer();
	            getButton('menuMapMgr,btnMapMgr');
				// addVectorLayer();

	            var emapApiKey = '8AuulPFHOftqyHEmTdQK';
	            var korean_map_tile = 'https://map.ngii.go.kr/openapi/Gettile.do?';
	            var emapLayer = new OpenLayers.Layer.XYZ("2D", "", {
	                url: korean_map_tile,
	                layer: "2D",
	                matrixSet: "korean",
	                format: "image/png",
	                style: "korean",
	                transitionEffect: 'resize',
	                serverResolutions: farmmapObj.oResolutions,
	                opacity: 1,
	                tileSize: new OpenLayers.Size(256, 256),
	                tileOrigin: new OpenLayers.LonLat(-200000.000000000, 4000000.000000000),
	                maxExtent: new OpenLayers.Bounds(-200000.000000000, 997738.410700000, 2802261.589000000, 4000000.000000000),
	                transparent: true,
	                getURL: function(bounds) {
	                    var res = this.getServerResolution();
	                    var x = Math.round((bounds.left - this.maxExtent.left) /
	                        (res * this.tileSize.w));
	                    var y = Math.round((this.maxExtent.top - bounds.top) /
	                        (res * this.tileSize.h));
	                    var z = this.getServerZoom() + 5;
	                    if (x >= 0 && y >= 0) {
	                        return this.options.url + "?service=" + "WMTS" +
	                            "&request=" + "GetTile" + "&version=" + "1.0.0" +
	                            "&layer=" + "korean_map" + "&style=" + this.style +
	                            "&format=" + this.format + "&tilematrixset=" +
	                            this.matrixSet + "&tilematrix=L" + z +
	                            "&tilerow=" + y + "&tilecol=" + x + "&apiKey=" +
	                            emapApiKey + "&baseUrl=" + korean_map_tile;
	                    } else {
	                        return "../images/nodata.png";
	                    }
	                },
	                isBaseLayer: false,
	                visibility: false
	            });
	            emapLayer.setZIndex(400);
	            map1.addLayer(emapLayer);
	        }

	        function addMoveendEvent() {
	            farmmapObj.addEvent("moveend", map1, moveendEventCallback);
	            moveendEventCallback();
	        }

	        function moveendEventCallback(e) {
	            var params = {
	                "lon": map1.getCenter().lon,
	                "lat": map1.getCenter().lat
	            };
	            farmmapObj.searchBjdFromPoint(params);
	            $("#zoom").text(map1.getZoom());
	        }

	        function searchJusoWhenMovedMapCallback(result) {
	            $("#whereis").text(result.data.juso);
	        }

	        function addMapEvent() {
	            farmmapObj.addEvent("mouseover", map1, mapEventCallback);
	            farmmapObj.addEvent("mouseout", map1, mapEventCallback);
	        }

	        function mapEventCallback(e) {
	            if (e.type == "mouseover") {
	                alert("===== mouse over =====");
	            } else if (e.type == "mouseout") {
	                alert("***** mouse out *****");
	            } else if (e.type == "updatesize") {
	                alert("##### updatesize #####");
	            }
	        }

	        function removeMoveendEvent() {
	            farmmapObj.removeEvent("moveend", map1);
	            $("#whereis").text("");
	            $("#zoom").text("");
	        }

	        function removeMapEvent() {
	            farmmapObj.removeEvent("mouseover", map1);
	            farmmapObj.removeEvent("mouseout", map1);
	        }

	        function addControl() {
	            farmmapObj.addControl("scaleLine", map1);
	            farmmapObj.addControl("panZoomBar", map1);
	            farmmapObj.addControl("layerSwitcher", map1);
	        }

	        function removeControl() {
	            farmmapObj.removeControl("scaleLine", map1);
	            farmmapObj.removeControl("panZoomBar", map1);
	            farmmapObj.removeControl("layerSwitcher", map1);
	        }

	        function getObject() {
	            var layer = farmmapObj.getObject("layer", "팜맵", map1);
	            if (layer != null) {
	                alert("**** 팜맵 레이어가 있습니다. ****");
	            } else {
	                alert("팜맵 레이어가 없습니다.\n팜맵레이어 API -> 팜맵레이어를 먼저 추가하십시요.");
	            }
	        }

	        function clearMap() {
	            farmmapObj.clearMap(map1);

	            $("#info").val("");
	        }

	        function addcctv() {
				var layer = farmmapObj.getObject("layer", "vworld_cctv", map1);
				if(layer != null) {
					farmmapObj.removeLayer("vworld_cctv", map1);
				} else {
					var layerName = "vworld_cctv";
					var url = "http://api.vworld.kr/req/wms?";
					var layerObj = {
										layers: "lt_p_utiscctv",
										styles: "lt_p_utiscctv",
										apikey: "M4Z0Y2P5BcNV52OxjHYl",
										domain: "http://localhost:8080/"
					}
					farmmapObj.addWMSLayer(layerName, url, layerObj, map1);
				}
			}

	        function addMarkerLayer() {
	            var layer = farmmapObj.getObject("layer", "markerLayer", map1);
	            if (layer != null) {
	                farmmapObj.removeLayer("markerLayer", map1);
	            } else {
	                var layerName = "markerLayer";
	                farmmapObj.addMarkerLayer(layerName, map1);
	            }
	        }

	        function addVectorLayer() {
				console.log('addVectorLayer in');
	            var layer = farmmapObj.getObject("layer", "vectorLayer", map1);

	            if (layer != null) {
	                farmmapObj.removeLayer("vectorLayer", map1);
	            } else {
	                var layerName = "vectorLayer";
	                var layerOption = {
	                    defaultStyle: {
	                        fillColor: "#ff0000",
	                        pointRadius: 10,
	                        strokeWidth: 4,
	                        strokeColor: "#ffffff",
	                        fontColor: "yellow",
	                        fontSize: "12px",
	                        fontWeight: "bold",
	                        labelYOffset: -25,
	                        labelOutlineColor: "black",
	                        labelOutlineWidth: 10,
	                        labelOutlineOpacity: 1
	                    },
	                    selectStyle: {
	                        fillColor: "#ffffff",
	                        pointRadius: 10,
	                        strokeWidth: 4,
	                        strokeColor: "#ff0000",
	                        fontColor: "#ffffff",
	                        fontSize: "12px",
	                        fontWeight: "bold",
	                        labelYOffset: -25,
	                        labelOutlineColor: "black",
	                        labelOutlineWidth: 10,
	                        labelOutlineOpacity: 1
	                    },
	                    hover: false,
	                    multiple: false,
	                    toggle: true,
	                    onSelect: vectorSelect,
	                    onUnselect: vectorUnselect
	                }
	                farmmapObj.addVectorLayer(layerName, layerOption, map1);
	            }
	        }

	        function activateVectorLayerEvent() {
	            var stat = farmmapObj.activateVectorLayerEvent("vectorLayer", map1);
	            alert(stat);
	        }

	        function deactivateVectorLayerEvent() {
	            var stat = farmmapObj.deactivateVectorLayerEvent("vectorLayer", map1);
	            alert(stat);
	        }

	        function layerShowHide() {
	            var layer = farmmapObj.getObject("layer", "팜맵", map1);
	            if (layer != null && layer.getVisibility()) {
	                farmmapObj.hideLayer("팜맵", map1);
	                setTimeout(function() {
	                    alert("팜맵레이어 숨김");
	                }, 300);
	            } else if (layer != null && !layer.getVisibility()) {
	                farmmapObj.showLayer("팜맵", map1);
	                setTimeout(function() {
	                    alert("팜맵레이어 보기");
	                }, 300);
	            } else {
	                alert("팜맵레이어를 먼저 추가하십시요.");
	            }
	        }

	        function getLayerNameList() {
	            var layerNames = farmmapObj.getLayerNameList(map1);
	            alert(layerNames);
	        }

	        function addFarmmapLayer() {
	        	var layer = farmmapObj.getObject("layer", "팜맵W", map1);
	        	if (layer != null) {
	                farmmapObj.removeLayer("팜맵W", map1);
	            }

	            layer = farmmapObj.getObject("layer", "팜맵", map1);
	            if (layer != null) {
	                farmmapObj.removeLayer("팜맵", map1);
	            } else {
	                farmmapObj.addFarmmapLayer("팜맵", map1);
	            }
	        }

	        function addWhiteFarmmapLayer() {
	        	var layer = farmmapObj.getObject("layer", "팜맵", map1);
	        	if (layer != null) {
	                farmmapObj.removeLayer("팜맵", map1);
	            }

	            layer = farmmapObj.getObject("layer", "팜맵W", map1);
	            if (layer != null) {
	                farmmapObj.removeLayer("팜맵W", map1);
	            } else {
	                farmmapObj.addWhiteFarmmapLayer("팜맵W", map1);
	            }
	        }

	        function addBasicInfomapLayer() {
	            var layer = farmmapObj.getObject("layer", "국토정보기본도", map1);
	            if (layer != null) {
	                farmmapObj.removeLayer("국토정보기본도", map1);
	            } else {
	                farmmapObj.addBasicInfomapLayer("국토정보기본도", map1);
	            }
	        }
			function searchCallback(data) {
				console.log('searchCallback(data) is data = ', data);
				$('#vectorClickDiv').hide();
				returnjson = data;
				$("#info").val(JSON.stringify(data, null, 4));

				if (layer != null) {
					farmmapObj.removeLayer("vectorLayer", map1);
				}
				var layer = farmmapObj.getObject("layer", "vectorLayer", map1);
			}
	        // function searchCallback(data) {
			// 	console.log('searchCallback on ', data);
	        //     var keys = Object.keys(data);
	        //     var text = "";
	        //     for (var i = 0; i < keys.length; i++) {
	        //         var searchData = data[keys[i]];
	        //         text += keys[i] + " : " + JSON.stringify(searchData) + "\r\n\r\n";
	        //     }
			//
			// 	console.log('text',text);
	        //     $("#info").val(text);
	        // }

	        function addSearchFarmmapDataEvent() {
	            farmmapObj.addSearchFarmmapDataEvent(map1, "searchCallback");
	        }

	        function removeSearchFarmmapDataEvent() {
	            farmmapObj.removeSearchFarmmapDataEvent(map1);
	        }

	        function getLegendImage() {
	            var mapType = "farmmap";
	            var option = "h";

	            var name = "팜맵";

	            $("#legendDiv").hide();
	            $("#legendImageLabel").text(name);
	            var url = farmmapObj.getLegendImage(mapType, option);
	            if (url != "") {
	                $("#legendImage").attr("src",
	                    farmmapObj.getLegendImage(mapType, option));
	                $("#legendDiv").show();
	            }
	        }

	        function addMarker() {
	            var markerLayerName = 'markerLayer';

	            var layer = farmmapObj.getObject("layer", markerLayerName, map1);
	            if (layer == null) {
	            	alert("마커레이어를 추가하십시요.");
	            	return false;
	            }

	            var markerOptions = {
	                id: 'marker1',
	                iconSizeWidth: 50,
	                iconSizeHeight: 70,
	                iconUrl: reqUrl + 'images/marker/marker1.png',
	                x: 982600.46915681,
	                y: 1832833.4243186,
	                clickFunc: markerClick,
	                data: {
	                    id: 'marker1',
	                    iconSize: '50/70',
	                    xy: '982600.46915681/1832833.4243186'
	                }
	            }

	            farmmapObj.addMarker(markerLayerName, markerOptions, map1);

	            markerOptions = {
	                id: 'marker2',
	                iconSizeWidth: 70,
	                iconSizeHeight: 70,
	                iconUrl: reqUrl + 'images/marker/marker2.png',
	                x: 982709.00765681,
	                y: 1832877.1211186,
	                opacity: 1,
	                clickFunc: markerClick,
	                data: {
	                    id: 'marker2',
	                    iconSize: '70/70',
	                    xy: '982709.00765681/1832877.1211186'
	                }
	            }

	            farmmapObj.addMarker(markerLayerName, markerOptions, map1);

	            markerOptions = {
	                id: 'marker3',
	                iconSizeWidth: 70,
	                iconSizeHeight: 70,
	                iconUrl: reqUrl + 'images/marker/marker3.png',
	                x: 14171781.26262,
	                y: 4368702.6029289,
	                epsg: "EPSG:3857",
	                opacity: 1,
	                clickFunc: markerClick,
	                data: {
	                    id: 'marker3',
	                    iconSize: '70/70',
	                    xy: '14171781.26262/4368702.6029289',
	                    epsg: "EPSG:3857"
	                }
	            }

	            farmmapObj.addMarker(markerLayerName, markerOptions, map1);

	            markerOptions = {
	                id: 'marker4',
	                iconSizeWidth: 70,
	                iconSizeHeight: 70,
	                iconUrl: reqUrl + 'images/marker/marker3.png',
	                x: 127.30509917810372,
	                y: 36.492736592906944,
	                epsg: "EPSG:4326",
	                opacity: 0.8,
	                clickFunc: markerClick,
	                data: {
	                    id: 'marker4',
	                    iconSize: '70/70',
	                    xy: '39.244113294906406/77.62617078940632',
	                    epsg: "EPSG:4326"
	                }
	            }

	            farmmapObj.addMarker(markerLayerName, markerOptions, map1);
	        }

	        var mId;

	        function markerClick(e) {
	            if (mId == e.object.id && $("#markerClickDiv").is(':visible')) {
	                $("#markerClickDiv").hide();
	            } else {
	                var data = e.object.data;
	                var keys = Object.keys(data);
	                var text = "";
	                for (var i = 0; i < keys.length; i++) {
	                    var searchData = data[keys[i]];
	                    text = '"' + keys[i] + '": "' + data[keys[i]] + '"';
	                }
	                $("#markerClickInfo").val(text);
	                $("#markerClickDiv").show();

	                mId = e.object.id;
	            }
	        }

	        function markerShowHide() {
	            var marker = farmmapObj.getObject("marker", "marker1", map1);
	            if (marker != null) {
	                if (farmmapObj.isMarkerVisible(marker)) {
	                    farmmapObj.hideMarker(marker);
	                } else {
	                    farmmapObj.showMarker(marker);
	                }
	            }
	        }

	        function markerShowAllHideAll(type) {
	            var layer = farmmapObj.getObject("layer", "markerLayer", map1);
	            if (layer != null) {
	                if (type == "showAll") {
	                    farmmapObj.showAllMarker("markerLayer", map1);
	                } else {
	                    farmmapObj.hideAllMarker("markerLayer", map1);
	                }
	            }
	        }

	        var sizeW = 100;
	        var sizeH = 120;

	        function setMarkerSize() {
	            var marker = farmmapObj.getObject("marker", "marker1", map1);
	            if (marker != null) {
	                var size = {
	                    iconSizeWidth: sizeW,
	                    iconSizeHeight: sizeH
	                };
	                farmmapObj.setMarkerSize(marker, size);

	                sizeW += 10;
	                sizeH += 10;
	            }
	        }

	        var mx = 982600.46915681;
	        var my = 1832833.4243186;

	        function setMarkerLocation() {
	            var marker = farmmapObj.getObject("marker", "marker1", map1);
	            if (marker != null) {
	                mx += 10;
	                var xy = {
	                    x: mx,
	                    y: my
	                };
	                farmmapObj.setMarkerLocation(marker, xy);
	            }
	        }

	        function setMarkerIcon() {
	            var marker = farmmapObj.getObject("marker", "marker1", map1);
	            if (marker != null) {
	                var icon = {
	                    iconUrl: reqUrl + "images/marker/marker3.png",
	                    opacity: 0.3
	                }
	                farmmapObj.setMarkerIcon(marker, icon);
	            }
	        }

	        function setMarkerData() {
	            var marker = farmmapObj.getObject("marker", "marker1", map1);
	            if (marker != null) {
	                var data = {
	                    id: 'marker1-1',
	                    iconUrl: reqUrl + "images/marker/marker3.png",
	                    opacity: 0.3
	                }
	                farmmapObj.setMarkerData(marker, data);
	            }
	        }

	        function removeMarker() {
	            var marker = farmmapObj.getObject("marker", "marker1", map1);
	            if (marker != null) {
	                farmmapObj.removeMarker(marker);
	            }
	        }

			function addVector() {
				var data = returnjson;
				if (returnjson == null) return;

				var layerName = "vectorLayer";
				var layerOption = {
					hover: false,
					multiple: false,
					toggle: true,
					onSelect: vectorSelect2,
					onUnselect: vectorUnselect2
				}
				farmmapObj.addVectorLayer(layerName, layerOption, map1);


				var farmmapData;
				if (data.output.farmmapData != null) {
					farmmapData = data.output.farmmapData;
					for (var k = 0; k < farmmapData.data.length; k++) {

						if (k > 300) break;

						var feature = farmmapData.data[k];
						var xy = feature.geometry[0].xy;

						var id = "";
						var label = "";

						if (data.input.mapType == "base") {
							if (data.input.columnType.toUpperCase() == "KOR") {
								id = feature.필지고유번호;
								label = feature.필지고유번호;
							} else {
								id = feature.pnu;
								label = feature.pnu;
							}
						} else {
							if (data.input.columnType.toUpperCase() == "KOR") {
								id = feature.팜맵ID;
								label = feature.팜맵ID;
							} else {
								id = feature.id;
								label = feature.id;
							}
						}

						vectorOptions = {
							id: id.toString()
							, type: "polygon"
							, xy: xy
							, data: feature
							, style: {
								fillColor: "black",
								fillOpacity: 0.5,
								strokeWidth: 2,
								strokeColor: "#ff0000",
							// 	strokeLinecap: "round",
							// 	fontSize: "12px",
							// 	fontColor: "black",
							// 	fontWeight: "bold",
							// 	label: label.toString(),
							// 	labelOutlineColor: "#ffffff",
							// 	labelOutlineWidth: 3
							}
						}
						farmmapObj.addVector("vectorLayer", vectorOptions, map1);
					}
				}

				var sourceData;
				if (data.output.source != null) {
					sourceData = data.output.source;
					for (var k = 0; k < sourceData.data.length; k++) {

						var feature = sourceData.data[k];
						var xy = feature.geometry[0].xy;

						var label = "";

						if (data.input.mapType == "base") {
							if (data.input.columnType.toUpperCase() == "KOR") {
								label = feature.필지고유번호;
							} else {
								label = feature.pnu;
							}
						} else {
							if (data.input.columnType.toUpperCase() == "KOR") {
								label = feature.대표PNU;
							} else {
								label = feature.pnu;
							}
						}

						vectorOptions = {
							id: ("source_" + k).toString()
							, type: "polygon"
							, xy: xy
							, data: feature
							, style: {
								fillColor: "#FFFFFF",
								fillOpacity: 0.5,
								strokeWidth: 5,
								strokeColor: "#FFFFFF"
								, fontSize: "12px",
								fontColor: "black",
								fontWeight: "bold",
								label: label.toString(),
								labelOutlineColor: "#ffffff",
								labelOutlineWidth: 3
							}
						}
						farmmapObj.addVector("vectorLayer", vectorOptions, map1);
					}
					sourceData = null;
				}

				var targetData;
				if (data.output.target != null) {
					targetData = data.output.target;
					for (var k = 0; k < targetData.data.length; k++) {

						var feature = targetData.data[k];
						var xy = feature.geometry[0].xy;

						vectorOptions = {
							id: "target_" + feature.rank_label.toString()
							, type: "polygon"
							, xy: xy
							, data: feature
							, style: {
								fillColor: "black",
								fillOpacity: 0.001,
								strokeWidth: 2,
								strokeColor: "#ff0000",
								strokeLinecap: "round",
								fontSize: "12px",
								fontColor: "yellow",
								fontWeight: "bold",
								label: feature.rank_label.toString(),
								labelOutlineColor: "blue",
								labelOutlineWidth: 3
							}
						}
						farmmapObj.addVector("vectorLayer", vectorOptions, map1);
					}
					targetData = null;
				}

				if (farmmapObj.getObject("layer", "vectorLayer", map1).features.length > 0) {
					map1.zoomToExtent(farmmapObj.getObject("layer", "vectorLayer", map1).features[0].geometry.getBounds());
					map1.zoomTo(11);
				}
			}

	        function vectorSelect(feature) {
	            if (feature.id == "point6") {
	                feature.style.externalGraphic = reqUrl + 'images/marker/marker1.png';
	            }

	            if (feature.id == "point3") {
	                feature.style.fillColor = "#00ff00";
	                feature.style.strokeColor = "#ffffff";
	            }

	            if (feature.id == "lineString2") {
	                feature.style.strokeColor = "#0505f5";
	                feature.style.strokeDashstyle = "dot";
	                feature.style.strokeLinecap = "square";
	            }

	            if (feature.id == "polygon2") {
	                feature.style.fillColor = "#0505f5";
	                feature.style.strokeColor = "yellow";
	                feature.style.strokeDashstyle = "dot";
	            }

	            if (feature.id == "circle2") {
	                feature.style.strokeColor = "white";
	                feature.style.strokeDashstyle = "solid";
	            }

	            feature.layer.redraw();

	            if (Object.keys(feature.data).length > 0) {
	                var data = feature.data;
	                var keys = Object.keys(data);
	                var text = "";
	                for (var i = 0; i < keys.length; i++) {
	                    var searchData = data[keys[i]];
	                    text += keys[i] + " : " + data[keys[i]] + "\r\n";;
	                }
	                $("#markerClickInfo").val(text);
	                $("#markerClickDiv").show();
	            }
	        }

	        function vectorUnselect(feature) {
	            if (feature.id == "point6") {
	                feature.style.externalGraphic = reqUrl + 'images/marker/marker3.png';
	            }

	            if (feature.id == "point3") {
	                feature.style.fillColor = "#ff99ee";
	                feature.style.strokeColor = "#e62222";
	            }

	            if (feature.id == "lineString2") {
	                feature.style.strokeColor = "#ff0000";
	                feature.style.strokeDashstyle = "dashdot";
	                feature.style.strokeLinecap = "round";
	            }

	            if (feature.id == "polygon2") {
	                feature.style.fillColor = "black";
	                feature.style.strokeColor = "#ff0000";
	                feature.style.strokeDashstyle = "dashdot";
	            }

	            if (feature.id == "circle2") {
	                feature.style.strokeColor = "black";
	                feature.style.strokeDashstyle = "dash";
	            }

	            feature.layer.redraw();

	            $("#markerClickDiv").hide();
	        }

	        function setVectorStyle(type, vecId) {
	            var vec = farmmapObj.getObject("vector", vecId, map1);
	            var styleOptions = {};
	            if (vec != null) {
	                if (type == "point") {
	                    styleOptions = {
	                        fillColor: "#ff99ee",
	                        graphicName: "x",
	                        pointRadius: 20,
	                        strokeWidth: 4,
	                        strokeColor: "#e62222",
	                        fontColor: "#ffffff",
	                        fontSize: "12px",
	                        fontWeight: "bold",
	                        label: vec.id + "스타일변경",
	                        labelYOffset: -30,
	                        labelOutlineColor: "black",
	                        labelOutlineWidth: 10,
	                        labelOutlineOpacity: 0.7
	                    }
	                    farmmapObj.setVectorStyle(vec, styleOptions);
	                } else if (type == "lineString") {
	                    styleOptions = {
	                        strokeWidth: 10,
	                        strokeColor: "blue",
	                        fontColor: "#000000",
	                        fontSize: "20px",
	                        fontWeight: "bold",
	                        label: vec.id + "스타일변경",
	                        labelYOffset: -30,
	                        labelOutlineColor: "white",
	                        labelOutlineWidth: 10,
	                        labelOutlineOpacity: 0.7
	                    }
	                    farmmapObj.setVectorStyle(vec, styleOptions);
	                }
	            } else {
	                alert(vecId + " 아이디의 벡터가 없습니다.");
	            }
	        }

	        function hideShowVector(vecId) {
	            var vec = farmmapObj.getObject("vector", vecId, map1);
	            if (vec != null) {
	                if (farmmapObj.isVectorVisible(vec)) {
	                    farmmapObj.hideVector(vec);
	                } else {
	                    farmmapObj.showVector(vec);
	                }
	            } else {
	                alert(vecId + " 아이디의 벡터가 없습니다.");
	            }
	        }

	        function hideShowAllVector(type) {
	            var layer = farmmapObj.getObject("layer", "vectorLayer", map1);
	            if (layer != null) {
	                if (type == "showAll") {
	                    farmmapObj.showAllVector("vectorLayer", map1);
	                } else {
	                    farmmapObj.hideAllVector("vectorLayer", map1);
	                }
	            } else {
	                alert("vectorLayer 이름의 레이어가 없습니다.");
	            }
	        }

	        function setVectorData(type, vecId) {
	            var vec = farmmapObj.getObject("vector", vecId, map1);
	            if (vec != null) {
	                var dataOptions = {};
	                if (type == "attr") {
	                    dataOptions = {
	                        id: vec.id + "속성 변경"
	                    }
	                    farmmapObj.setVectorData(vec, type, dataOptions);
	                } else if (type == "data") {
	                    dataOptions = {
	                        id: vec.id,
	                        desc: "데이터가 변경되었습니다."
	                    }
	                    farmmapObj.setVectorData(vec, type, dataOptions);
	                }
	            } else {
	                alert(vecId + " 아이디의 벡터가 없습니다.");
	            }
	        }

	        function removeVector(vecId) {
	            var vec = farmmapObj.getObject("vector", vecId, map1);
	            if (vec != null) {
	                farmmapObj.removeVector(vec);
	            } else {
	                alert(vecId + " 아이디의 벡터가 없습니다.");
	            }
	        }

	        var returnjson;
	        function searchCallbackRelationLayer(data) {
	            returnjson = data;
	            var layer = farmmapObj.getObject("layer", "relationVectorLayer", map1);
	            if (layer != null) {
	                farmmapObj.removeLayer("relationVectorLayer", map1);
	            }
	        }

	        function addRelationVector() {
	            var data = returnjson;
	            if (returnjson == null)
	                return;

	            var keys = Object.keys(data);
	            var text = "";
	            for (var i = 0; i < keys.length; i++) {
	                var searchData = data[keys[i]];
	                text += keys[i] + " : " + JSON.stringify(searchData) + "\r\n\r\n";
	            }

	            $("#info").val(xyString + "\n\n" + text);

	            var layerName = "relationVectorLayer";
	            var layerOption = {
	                hover: false,
	                multiple: false,
	                toggle: true,
	                onSelect: vectorSelect2,
	                onUnselect: vectorUnselect2
	            }
	            farmmapObj.addVectorLayer(layerName, layerOption, map1);

	            var farmmapData;
	            if (data.output.farmmapData != null) {
	                farmmapData = data.output.farmmapData;
	                for (var k = 0; k < farmmapData.data.length; k++) {

	                    if (k > 300)
	                        break;

	                    var feature = farmmapData.data[k];
	                    var xy = feature.geometry[0].xy;

	                    var id = "";
	                    var label = "";

	                    if (data.input.columnType.toUpperCase() == "KOR") {
	                        id = feature.지오메트리ID;
	                        label = feature.지오메트리ID;
	                    } else {
	                        id = feature.gid;
	                        label = feature.gid;
	                    }

	                    vectorOptions = {
	                        id: id.toString(),
	                        type: "polygon",
	                        xy: xy,
	                        data: feature,
	                        style: {
	                            fillColor: "black",
	                            fillOpacity: 0.5,
	                            strokeWidth: 2,
	                            strokeColor: "#ff0000",
	                            strokeLinecap: "round",
	                            fontSize: "12px",
	                            fontColor: "black",
	                            fontWeight: "bold",
	                            label: label.toString(),
	                            labelOutlineColor: "#ffffff",
	                            labelOutlineWidth: 3
	                        }
	                    }
	                    farmmapObj.addVector(layerName, vectorOptions, map1);
	                }
	            }

	            var sourceData;
	            if (data.output.source != null) {
	                sourceData = data.output.source;
	                for (var k = 0; k < sourceData.data.length; k++) {

	                    var feature = sourceData.data[k];
	                    var xy = feature.geometry[0].xy;

	                    var label = "";

	                    if (data.input.mapType == "farmmap") {
	                        if (data.input.columnType.toUpperCase() == "KOR") {
	                            label = feature.PNU지번코드;
	                        } else {
	                            label = feature.pnu_lnm_cd;
	                        }
	                    } else {
	                        if (data.input.columnType.toUpperCase() == "KOR") {
	                            label = feature.필지고유번호;
	                        } else {
	                            label = feature.pnu;
	                        }
	                    }

	                    vectorOptions = {
	                        id: ("source_" + k).toString(),
	                        type: "polygon",
	                        xy: xy,
	                        data: feature,
	                        style: {
	                            fillColor: "#FFFFFF",
	                            fillOpacity: 0.5,
	                            strokeWidth: 5,
	                            strokeColor: "#FFFFFF"
	                        }
	                    }
	                    farmmapObj.addVector(layerName, vectorOptions, map1);
	                }
	            }

	            var targetData;
	            if (data.output.target != null) {
	                targetData = data.output.target;
	                for (var k = 0; k < targetData.data.length; k++) {

	                    var feature = targetData.data[k];
	                    var xy = feature.geometry[0].xy;

	                    vectorOptions = {
	                        id: "target_" + feature.rank_label.toString(),
	                        type: "polygon",
	                        xy: xy,
	                        data: feature,
	                        style: {
	                            fillColor: "black",
	                            fillOpacity: 0.001,
	                            strokeWidth: 2,
	                            strokeColor: "#ff0000",
	                            strokeLinecap: "round",
	                            fontSize: "12px",
	                            fontColor: "yellow",
	                            fontWeight: "bold",
	                            label: feature.rank_label.toString(),
	                            labelOutlineColor: "blue",
	                            labelOutlineWidth: 3
	                        }
	                    }
	                    farmmapObj.addVector(layerName, vectorOptions, map1);
	                }
	            }
	        }

			function vectorSelect2(feature, flag) {
				console.log(' vectorSelect2 test');
				console.log(' vectorSelect2 feature', feature);
				console.log(' vectorSelect2 flag', flag);
				if (!flag) {
					console.log('!flag');
					vectorUnselect2(farmmapObj.getObject("layer", "vectorLayer", map1).features[0]);
					console.log('vectorUnselect2 갔다옴 !');
				}

				console.log('첫번째 if 끝');

				if (feature.id != farmmapObj.getObject("layer", "vectorLayer", map1).features[0].id) {
					console.log('2번째 if 시작');
					console.log('farmmapObj.getObject("layer", "vectorLayer", map1).features[0].id', farmmapObj.getObject("layer", "vectorLayer", map1).features[0].id);
					console.log('feature.id', feature.id);
					feature.style.display = 'none';
					feature.layer.redraw();
				}

				console.log('if 모두 끝 ');

				feature.style.fillColor = "#0505f5";
				feature.style.strokeColor = "yellow";
				feature.style.strokeWidth = 5;
				feature.style.display = '';
				feature.layer.redraw();

				if (Object.keys(feature.data).length > 0) {
					var data = feature.data;
					var keys = Object.keys(data);
					var text = {};
					var jsonFrmaldData = [];
					console.log('vectorSelect2 keys', keys);
					for (var i = 0; i < keys.length; i++) {
						var searchData = data[keys[i]];
						text[keys[i]] = data[keys[i]]
						jsonFrmaldData.push(text);
					}
					// console.log('vectorSelect2 text', text);
					console.log('vectorSelect2 text', jsonFrmaldData);
					frmidMapPopup(jsonFrmaldData);
					$("#vectorClickInfo").val(jsonFrmaldData);
					$("#vectorClickDiv").show();
				}
			}

			function vectorUnselect2(feature) {
				console.log('vectorUnselect2 feature', feature);
				if (feature.id.indexOf("source_") != -1) {
					feature.style.fillColor = "#FFFFFF";
					feature.style.strokeColor = "#FFFFFF";
				} else {
					feature.style.fillColor = "black";
					feature.style.strokeColor = "#ff0000";
					feature.style.strokeWidth = 2;
				}
				feature.layer.redraw();

				$("#vectorClickDiv").hide();
			}

	        function getButton(ids) {
	        	var menuId = ids.split(",")[0];
	        	var buttonId = ids.split(",")[1];

	        	var menuDivs = $("div[id^='menu']");
	            for (var i = 0; i < menuDivs.length; i++) {
	                if (menuDivs[i].id == menuId) {
	                	$(menuDivs[i]).css("background","#60caae");
	                	$(menuDivs[i]).css("color","#ffffff");
	                } else {
	                	$(menuDivs[i]).css("background","");
	                	$(menuDivs[i]).css("color","");
	                }
	            }

	            var buttonDivs = $("div[id^='btn']");
	            for (var i = 0; i < buttonDivs.length; i++) {
	                if (buttonDivs[i].id == buttonId) {
	                    $(buttonDivs[i]).show();
	                } else {
	                    $(buttonDivs[i]).hide();
	                }
	            }
	        }

			function getFarmmapDataSeachBjdAndLandCode() {
				var params = {};
				console.log('test');
				// params.bjdCd = $("#bjdCd4").val();
				params.bjdCd = '5013031023';
				params.landCd = '02'; // 01:논 02:밭 03:과수 04:시설 05:비경지
				params.mapType = 'farmmap';
				params.columnType = 'ENG';
				params.apiKey = apiKey;
				params.domain = domain;

				console.log('params', params);
				console.log('reqUrl', reqUrl);

				$.ajax({
					url: reqUrl + "farmmapApi/getFarmmapDataSeachBjdAndLandCode.do",
					dataType: "jsonp",
					jsonpCallback: "searchCallback",
					async: false,
					type: "GET",
					cache: false,
					data: params,
					error: function (XMLHttpRequest, textStatus, errorThrown) {
						console.log('==============error================');
						console.log('XMLHttpRequest', XMLHttpRequest);
						console.log('textStatus', textStatus);
						console.log('errorThrown', errorThrown);
						console.log('==============error================');
					}
				});
				console.log('getFarmmapDataSeachBjdAndLandCode params',params);
			}
	    </script>
</head>
<body oncontextmenu="return false" onload="init()">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 생산자관리 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회"class="btn btn-sm btn-outline-danger" onclick="getFarmmapDataSeachBjdAndLandCode();"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<td>
<%--								<sbux-input--%>
<%--									uitype="text"--%>
<%--									id="info"--%>
<%--									name="info"--%>
<%--									class="form-control input-sm"--%>
<%--									maxlength="33"--%>
<%--									show-clear-button="true"></sbux-input>--%>
							</td>
							<td colspan="3">
								<textarea id="info" name="info" style="width:100%"></textarea>
							</td>
							<td>
								<button type="button" class="button" onclick="javascript:getFarmmapDataSeachBjdAndLandCode();">조회</button>
							</td>
							<td>
								<button type="button" class="button" onclick="addVector()">벡터그리기</button>
							</td>
						</tr>
					</tbody>
				</table>


				<!-- 1번째 그리드-->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>팜맵 정보</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div>
	        <div class="left">
	            <br>
	            <hr>
	            <div id="menuMapMgr" onClick="getButton('menuMapMgr,btnMapMgr')" class="menu">지도관리 API</div><hr>
	            <div id="menuLayer" onClick="getButton('menuLayer,btnLayer')" class="menu">레이어 API</div><hr>
	            <div id="menuFarmmap" onClick="getButton('menuFarmmap,btnFarmmap')" class="menu">팜맵레이어 API</div><hr>
	            <div id="menuMarker" onClick="getButton('menuMarker,btnMarker')" class="menu">마커 API</div><hr>
	            <div id="menuVector" onClick="getButton('menuVector,btnVector')" class="menu">벡터 API</div><hr>
	        </div>

	        <div class="right">
	            <div>
	                &nbsp;&nbsp; <b>위치</b> : <label id="whereis"></label> &nbsp;&nbsp;&nbsp;&nbsp; <b>줌</b> : <label id="zoom"></label>
	            </div>

				<hr>
				<div id="buttonGroup">
		            <div id="btnMapMgr">
		            	&nbsp;&nbsp;
		                <button type="button" class="lbutton" onclick="javascript:addMoveendEvent();">moveend 이벤트추가</button>
		                <button type="button" class="button" onclick="javascript:removeMoveendEvent();">moveend 이벤트제거</button>
		                <button type="button" class="button" onclick="javascript:addMapEvent();">맵이벤트추가</button>
		                <button type="button" class="button" onclick="javascript:removeMapEvent();">맵이벤트제거</button>
		                <button type="button" class="button" onclick="javascript:addControl();">컨트롤추가</button>
		                <button type="button" class="button" onclick="javascript:removeControl();">컨트롤제거</button>
		                <button type="button" class="button" onclick="javascript:getObject();">객체찾기</button>
		                <button type="button" class="rbutton" onclick="javascript:clearMap();">맵초기화</button>
		            </div>
		            <div id="btnLayer" style="display: none;">
		            	&nbsp;&nbsp;
		                <button type="button" class="lbutton" onclick="javascript:addcctv();">CCTV WMS추가/제거</button>
		                <button type="button" class="button" onclick="javascript:addMarkerLayer();">마커레이어 추가/제거</button>
		                <button type="button" class="button" onclick="javascript:addVectorLayer();">벡터레이어 추가/제거</button>
		                <button type="button" class="button" onclick="javascript:activateVectorLayerEvent();">벡터 이벤트 활성</button>
		                <button type="button" class="button" onclick="javascript:deactivateVectorLayerEvent();">벡터 이벤트 비활성</button>
		                <button type="button" class="button" onclick="javascript:layerShowHide();">레이어 보기/숨김</button>
		                <button type="button" class="rbutton" onclick="javascript:getLayerNameList();">레이어목록조회</button>
		            </div>
		            <div id="btnFarmmap" style="display: none;">
		            	&nbsp;&nbsp;
		                <button type="button" class="lbutton" onclick="javascript:addFarmmapLayer();">팜맵 추가/제거</button>
		                <button type="button" class="button" onclick="javascript:addWhiteFarmmapLayer();">팜맵 백지도 추가/제거</button>
		                <button type="button" class="button" onclick="javascript:addBasicInfomapLayer();">국토정보기본도 추가/제거</button>
		                <button type="button" class="button" onclick="javascript:addSearchFarmmapDataEvent();">조회이벤트 추가</button>
		                <button type="button" class="button" onclick="javascript:removeSearchFarmmapDataEvent();">조회이벤트 제거</button>
		                <button type="button" class="rbutton" onclick="javascript:getLegendImage();">팜맵범례조회</button>

		                <div id="legendDiv" style="width: 100px; position: absolute; left: 1000px; top: 95px; z-index: 1006; display: none;">
		                    <label id="legendImageLabel" style="color: teal; font-weight: 300; font-size: 15px;"></label> <img id="legendImage" src="" />
		                </div>
		            </div>
		            <div id="btnMarker" style="display: none;">
		            	&nbsp;&nbsp;
		                <button type="button" class="lbutton" onclick="javascript:addMarkerLayer();">마커레이어 추가/제거</button>
		                <button type="button" class="button" onclick="javascript:addMarker();">마커생성</button>
		                <button type="button" class="button" onclick="javascript:markerShowHide();">마커 보기/숨김</button>
		                <button type="button" class="button" onclick="javascript:markerShowAllHideAll('showAll');">마커 전체보기</button>
		                <button type="button" class="button" onclick="javascript:markerShowAllHideAll('hideAll');">마커 전체숨김</button>
		                <button type="button" class="button" onclick="javascript:setMarkerSize();">마커 크기변경</button>
		                <button type="button" class="button" onclick="javascript:setMarkerLocation();">마커 위치변경</button>
		                <button type="button" class="button" onclick="javascript:setMarkerIcon();">마커 아이콘변경</button>
		                <button type="button" class="button" onclick="javascript:setMarkerData();">마커 데이터변경</button>
		                <button type="button" class="rbutton" onclick="javascript:removeMarker();">마커 제거</button>
		            </div>
		            <div id="btnVector" style="display: none;">
		            	&nbsp;&nbsp;
		                <button type="button" class="lbutton" onclick="javascript:addVectorLayer();">벡터레이어 추가/제거</button>
		                <button type="button" class="button" onclick="javascript:addVector('point');">포인트 추가</button>
		                <button type="button" class="button" onclick="javascript:addVector('lineString');">라인 추가</button>
		                <button type="button" class="button" onclick="javascript:addVector('polygon');">폴리곤 추가</button>
		                <button type="button" class="button" onclick="javascript:addVector('circle');">원 추가</button>
		                <button type="button" class="button" onclick="javascript:hideShowVector('point2');">point2 숨김/보기</button>
		                <button type="button" class="button" onclick="javascript:hideShowVector('point3');">point3 보기/보기</button>
		                <button type="button" class="button" onclick="javascript:hideShowAllVector('hideAll');">벡터 전체숨김</button>
		                <button type="button" class="button" onclick="javascript:hideShowAllVector('showAll');">벡터 전체보기</button>
		                <button type="button" class="button" onclick="javascript:setVectorStyle('lineString','lineString1');">lineString1 스타일변경</button>
		                <button type="button" class="button" onclick="javascript:setVectorData('data','point4');">point4 데이터변경</button>
		                <button type="button" class="rbutton" onclick="javascript:removeVector('circle1');">circle1 제거</button>
		            </div>
	            </div>
				<font size="2px">
					<br>
				</font>

	            <div id="mapDiv1" style="height: 480px;"></div>
	        </div>
	    </div>

	    </div>

	    <div id="markerClickDiv" style="width: 400px; height: 70px; position: absolute; left: 400px; top: 200px; z-index: 1006; display: none;">
	        <button type="button" class="button" onclick="javascript:$('#markerClickDiv').hide();" style="width: 45px; height: 25px; position: absolute; left: 330px; top: 10px; z-index: 1006;">닫기</button>
	        <textarea id="markerClickInfo" name="markerClickInfo" class="pop">
			</textarea>
	    </div>
				</div>
			</div>

		<div id="vectorClickDiv"
			 style="width:400px; position: absolute; left: 300px; top: 200px; z-index: 1006; display: none;">
			<button type="button" class="button" onclick="javascript:$('#vectorClickDiv').hide();"
					style="position: absolute; left: 330px; top: 10px; z-index: 1006;">닫기
			</button>
			<textarea id="vectorClickInfo" name="vectorClickInfo" rows="20" style="width:100%" class="pop">
			</textarea>
		</div>
		</div>
	</section>


</body>
<div>
	<sbux-modal id="modal-framldMap" name="modal-framldMap" uitype="middle" header-title="팜맵 데이터" body-html-id="body-modal-framldMap" footer-is-close-button="false" header-is-close-button="false" style="width:1100px" ></sbux-modal>
</div>
<div id="body-modal-framldMap">
	<jsp:include page="../popup/framldMapPopup.jsp"/>
</div>
<script type="text/javascript">

	const frmidMapPopup = async function(data){
		console.log('팝업 실행');
		console.log('popup data', data);
		SBUxMethod.openModal('modal-framldMap');
		popFramldMap.init(gv_selectedApcCd, data);
	}

	function test(){
		console.log('testtestsetset');
	}

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>