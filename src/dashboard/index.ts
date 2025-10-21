// Tabler
import '@tabler/core/dist/css/tabler.min.css';
import '@tabler/core/dist/js/tabler.min.js';

// jQuery: 이 페이지 번들에 포함 (헤더 없음)
import $ from 'jquery';
(window as any).$ = $;
(window as any).jQuery = $;

// Leaflet
import 'leaflet/dist/leaflet.css';
import L from 'leaflet';
import iconRetinaUrl from 'leaflet/dist/images/marker-icon-2x.png';
import iconUrl       from 'leaflet/dist/images/marker-icon.png';
import shadowUrl     from 'leaflet/dist/images/marker-shadow.png';
L.Icon.Default.mergeOptions({ iconRetinaUrl, iconUrl, shadowUrl });

// Chart.js / ApexCharts
import Chart from 'chart.js/auto';
import ApexCharts from 'apexcharts';
(window as any).Chart = Chart;
(window as any).ApexCharts = ApexCharts;

// 지도 초기화
document.addEventListener('DOMContentLoaded', () => {
    const mapEl = document.getElementById('map');
    if (!mapEl) return;
    const map = L.map(mapEl).setView([36.5, 127.8], 7);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', { maxZoom: 18 }).addTo(map);
    (window as any).leafletMap = map;
});