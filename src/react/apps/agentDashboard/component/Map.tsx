// KoreaMap.tsx
import 'maplibre-gl/dist/maplibre-gl.css';
import Map, { Source, Layer, Marker } from 'react-map-gl/maplibre';
import type { LayerProps } from 'react-map-gl/maplibre';

const MAP_STYLE = 'https://demotiles.maplibre.org/style.json'; // 키 없이 사용 가능
const SIDO_URL  = `${import.meta.env.BASE_URL}data/korea_sido.geojson`; // public/data에 파일

const fillLayer: LayerProps = {
    id: 'sido-fill',
    type: 'fill',
    paint: { 'fill-color': '#c7d2fe', 'fill-opacity': 0.5 },
};
const lineLayer: LayerProps = {
    id: 'sido-line',
    type: 'line',
    paint: { 'line-color': '#64748b', 'line-width': 0.8 },
};

const markers = [
    { name: '서울', lon: 126.9784, lat: 37.5665 },
    { name: '대전', lon: 127.3845, lat: 36.3504 },
];

export default function KoreaMap() {
    return (
        <Map
            initialViewState={{ longitude: 127.7669, latitude: 35.9078, zoom: 5.2 }}
            mapStyle={MAP_STYLE}
            style={{ width: '100%', height: 420 }}
        >
            <Source id="sido" type="geojson" data={SIDO_URL}>
                <Layer {...fillLayer} />
                <Layer {...lineLayer} />
            </Source>

            {/* 배열은 Fragment로 감싸주기 */}
            <>
                {markers.map((m) => (
                    <Marker key={m.name} longitude={m.lon} latitude={m.lat} anchor="bottom">
                        <div
                            style={{
                                width: 8, height: 8, borderRadius: 999,
                                background: '#1d4ed8', border: '2px solid white',
                                boxShadow: '0 0 0 1px #1d4ed8',
                            }}
                            title={m.name}
                        />
                    </Marker>
                ))}
            </>
        </Map>
    );
}
