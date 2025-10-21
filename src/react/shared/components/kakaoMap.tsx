import React, { useEffect, useRef } from "react";
import { loadKakaoSdk } from "@shared/lib/loadKakaoSdk";

type Props = {
    appKey: string;              // 카카오 앱키
    centerAddress?: string;      // 초기 센터 주소(선택)
    addresses: string[];         // 마커 찍을 주소 배열
    height?: string;             // 컨테이너 높이 (기본 400px)
    zoom?: number;               // 기본 레벨 (낮을수록 확대, 기본 7)
};

export default function KakaoMap({
                                     appKey,
                                     centerAddress,
                                     addresses,
                                     height = "400px",
                                     zoom = 7,
                                 }: Props) {
    const boxRef = useRef<HTMLDivElement>(null);

    useEffect(() => {
        let map: any;
        let geocoder: any;
        let markers: any[] = [];

        (async () => {
            const kakao = await loadKakaoSdk(appKey);
            if (!boxRef.current) return;

            // 임시 중심: 대한민국 중앙쯤
            const defaultCenter = new kakao.maps.LatLng(36.5, 127.8);

            map = new kakao.maps.Map(boxRef.current, {
                center: defaultCenter,
                level: zoom,
            });

            geocoder = new kakao.maps.services.Geocoder();

            // 1) 센터 주소가 있으면 먼저 변환해서 이동
            if (centerAddress) {
                await new Promise<void>((res) => {
                    geocoder.addressSearch(centerAddress!, (result: any[], status: any) => {
                        if (status === kakao.maps.services.Status.OK && result[0]) {
                            const p = new kakao.maps.LatLng(result[0].y, result[0].x);
                            map.setCenter(p);
                        }
                        res();
                    });
                });
            }

            // 2) 주소 배열을 순차 변환 → 마커
            for (const addr of addresses) {
                await new Promise<void>((res) => {
                    geocoder.addressSearch(addr, (result: any[], status: any) => {
                        if (status === kakao.maps.services.Status.OK && result[0]) {
                            const pos = new kakao.maps.LatLng(result[0].y, result[0].x);
                            const marker = new kakao.maps.Marker({ position: pos });
                            marker.setMap(map);
                            markers.push(marker);
                        }
                        res();
                    });
                });
            }

            // 3) 보이는 범위 맞추기 (마커가 있으면 bounds로)
            if (markers.length > 0) {
                const bounds = new kakao.maps.LatLngBounds();
                markers.forEach(m => bounds.extend(m.getPosition()));
                map.setBounds(bounds);
            }
        })();

        // cleanup
        return () => {
            // 카카오맵은 destroy 없어서 DOM만 비워두면 충분
        };
    }, [appKey, centerAddress, addresses, zoom]);

    return <div ref={boxRef} style={{ width: "100%", height }} />;
}