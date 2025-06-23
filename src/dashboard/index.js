// Tabler Core 스타일 및 JS
import '@tabler/core/dist/css/tabler.min.css';
import '@tabler/core/dist/js/tabler.min.js';

// Leaflet 지도
import 'leaflet/dist/leaflet.css';
import L from 'leaflet';

// Chart.js
import Chart from 'chart.js/auto';

// jquery
import $ from 'jquery';
window.$ = $;
window.jQuery = $;

// src/index.js
import ApexCharts from 'apexcharts';
// 전역으로 ApexCharts 노출
window.ApexCharts = ApexCharts;

// 지도 초기화 (webpack 번들에 포함될 js)
const map = L.map('map').setView([36.5, 127.8], 7);  // 줌 8 → 남한 중심
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 18
}).addTo(map);

// 전역에 map 노출해서 나중에 다른 JS에서 마커 추가 가능하게
window.leafletMap = map;

// 차트 그리기
window.Chart = Chart;
