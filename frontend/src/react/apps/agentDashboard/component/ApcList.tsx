import React, { useState, useEffect, useCallback } from 'react';
import useEmblaCarousel from 'embla-carousel-react';
import Autoplay from 'embla-carousel-autoplay';
import {
    BoxIcon,
    BugIcon,
    CalendarIcon,
    CloudDrizzleIcon,
    CloudIcon,
    GridIcon,
    LeafIcon,
    ListIcon,
    SunIcon,
    ChevronLeft,
    ChevronRight
} from "lucide-react";
import { apcCenters, type ApcCenter } from '@apps/agentDashboard/data/apcCenters'; // ✅ 데이터 import

// 6개씩 묶는 헬퍼 함수
const chunkArray = (array: ApcCenter[], size: number) => {
    const chunks = [];
    for (let i = 0; i < array.length; i += size) {
        chunks.push(array.slice(i, i + size));
    }
    return chunks;
};

const APCCard = ({ apc }: { apc: ApcCenter }) => {
    const getWeatherIcon = (weather: string) => {
        if (!weather) return <CloudIcon className="w-5 h-5" />;
        if (weather.includes('맑음')) return <SunIcon className="w-5 h-5 text-yellow-500" />;
        if (weather.includes('비')) return <CloudDrizzleIcon className="w-5 h-5 text-blue-500" />;
        return <CloudIcon className="w-5 h-5 text-gray-500" />;
    };

    const pestAlertColor =
        apc.pestAlert === '경보' ? 'bg-red-100 text-red-800' :
            apc.pestAlert === '주의' ? 'bg-yellow-100 text-yellow-800' :
                'bg-green-100 text-green-800';

    const peakSeasonColor = apc.isPeakSeason ? 'bg-emerald-100 text-emerald-800' : 'bg-slate-100 text-slate-800';

    return (
        <div className="bg-white rounded-xl shadow-md p-5 border border-gray-100 hover:shadow-lg hover:border-blue-300 transition-all duration-300 h-full">
            {/* 카드 헤더 */}
            <div className="flex justify-between items-start mb-4">
                <div>
                    <h3 className="font-bold text-xl text-slate-800">{apc.name}</h3>
                    <p className="text-sm text-slate-500">{apc.location}</p>
                </div>
                <div className="flex items-center space-x-2">
                    {apc.weather === 'loading' ? (
                        <span className="text-xs text-gray-400">로딩중...</span>
                    ) : (
                        getWeatherIcon(apc.weather)
                    )}
                    <div className={`text-xs font-bold px-2 py-1 rounded-full ${pestAlertColor} flex items-center`}>
                        <BugIcon className="w-3 h-3" />
                        <span className="ml-1">{apc.pestAlert}</span>
                    </div>
                </div>
            </div>

            {/* 주요 정보 */}
            <div className="grid grid-cols-2 gap-4 mb-4 text-sm">
                <div className="flex items-center space-x-2 text-slate-600">
                    <CalendarIcon className="w-4 h-4" />
                    <div>
                        <p className="font-semibold">최근 사용일</p>
                        <p>{apc.lastUsed}</p>
                    </div>
                </div>
                <div className="flex items-center space-x-2 text-slate-600">
                    <LeafIcon className="w-4 h-4" />
                    <div>
                        <p className="font-semibold">주력 품목</p>
                        <div className="flex items-center">
                            <p className="mr-2">{apc.mainItem}</p>
                            <span className={`text-xs font-bold px-2 py-0.5 rounded-full ${peakSeasonColor}`}>
                                {apc.isPeakSeason ? '성수기' : '비성수기'}
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            {/* 실적 */}
            <div>
                <h4 className="font-semibold text-slate-700 mb-2 flex items-center">
                    <BoxIcon className="w-4 h-4" />
                    <span className="ml-2">실적 현황</span>
                </h4>
                <div className="space-y-2 text-sm">
                    {apc.performance ? (
                        Object.entries(apc.performance).map(([key, value]) => (
                            <div key={key} className="flex items-center">
                                <span className="w-16 text-slate-600 capitalize">
                                    {key === 'receiving' ? '입고' : key === 'sorting' ? '선별' : '포장'}
                                </span>
                                <div className="flex-1 bg-gray-200 rounded-full h-2.5 mx-2">
                                    <div
                                        className="bg-blue-500 h-2.5 rounded-full transition-all duration-500"
                                        style={{ width: `${value}%` }}
                                    />
                                </div>
                                <span className="ml-1 font-medium text-slate-700 w-12 text-right">{value}%</span>
                            </div>
                        ))
                    ) : (
                        <p className="text-xs text-gray-500">실적 데이터 없음</p>
                    )}
                </div>
            </div>
        </div>
    );
};

const APCCarouselView = ({ apcList }: { apcList: ApcCenter[] }) => {
    const [emblaRef, emblaApi] = useEmblaCarousel(
        {
            loop: true,
            align: 'start',
        },
        [Autoplay({ delay: 3000, stopOnInteraction: false })]
    );

    const [selectedIndex, setSelectedIndex] = useState(0);
    const [scrollSnaps, setScrollSnaps] = useState<number[]>([]);

    // 6개씩 묶기
    const apcChunks = chunkArray(apcList, 6);

    const scrollPrev = useCallback(() => {
        if (emblaApi) emblaApi.scrollPrev();
    }, [emblaApi]);

    const scrollNext = useCallback(() => {
        if (emblaApi) emblaApi.scrollNext();
    }, [emblaApi]);

    const scrollTo = useCallback(
        (index: number) => {
            if (emblaApi) emblaApi.scrollTo(index);
        },
        [emblaApi]
    );

    const onSelect = useCallback(() => {
        if (!emblaApi) return;
        setSelectedIndex(emblaApi.selectedScrollSnap());
    }, [emblaApi]);

    useEffect(() => {
        if (!emblaApi) return;
        onSelect();
        setScrollSnaps(emblaApi.scrollSnapList());
        emblaApi.on('select', onSelect);
        emblaApi.on('reInit', onSelect);
    }, [emblaApi, onSelect]);

    if (!apcList || apcList.length === 0) {
        return <div className="text-center p-10">표시할 APC 데이터가 없습니다.</div>;
    }

    return (
        <div className="relative">
            {/* 캐러셀 컨테이너 */}
            <div className="overflow-hidden" ref={emblaRef}>
                <div className="flex">
                    {apcChunks.map((chunk, pageIndex) => (
                        <div key={pageIndex} className="flex-[0_0_100%] min-w-0">
                            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 px-1">
                                {chunk.map((apc) => (
                                    <APCCard key={apc.id} apc={apc} />
                                ))}
                            </div>
                        </div>
                    ))}
                </div>
            </div>

            {/* 이전/다음 버튼 */}
            {apcChunks.length > 1 && (
                <>
                    <button
                        onClick={scrollPrev}
                        className="absolute left-0 top-1/2 -translate-y-1/2 -translate-x-4 bg-white rounded-full p-2 shadow-lg hover:bg-gray-100 transition-all z-10"
                        aria-label="이전"
                    >
                        <ChevronLeft className="w-6 h-6 text-gray-700" />
                    </button>
                    <button
                        onClick={scrollNext}
                        className="absolute right-0 top-1/2 -translate-y-1/2 translate-x-4 bg-white rounded-full p-2 shadow-lg hover:bg-gray-100 transition-all z-10"
                        aria-label="다음"
                    >
                        <ChevronRight className="w-6 h-6 text-gray-700" />
                    </button>
                </>
            )}

            {/* 인디케이터 (페이지 점) */}
            {apcChunks.length > 1 && (
                <div className="flex justify-center gap-2 mt-6">
                    {scrollSnaps.map((_, index) => (
                        <button
                            key={index}
                            onClick={() => scrollTo(index)}
                            className={`w-2 h-2 rounded-full transition-all ${
                                index === selectedIndex
                                    ? 'bg-blue-600 w-8'
                                    : 'bg-gray-300 hover:bg-gray-400'
                            }`}
                            aria-label={`${index + 1}페이지로 이동`}
                        />
                    ))}
                </div>
            )}

            {/* 페이지 정보 */}
            <div className="text-center mt-4 text-sm text-gray-600">
                {selectedIndex + 1} / {apcChunks.length} 페이지
                <span className="ml-2 text-gray-400">
                    (총 {apcList.length}개 APC)
                </span>
            </div>
        </div>
    );
};

const APCListItem = ({ apc }: { apc: ApcCenter }) => (
    <tr className="border-b hover:bg-blue-50 transition-colors">
        <td className="p-4 font-semibold text-slate-800">{apc.name}</td>
        <td className="p-4 text-slate-600">{apc.location}</td>
        <td className="p-4 text-slate-600">{apc.lastUsed}</td>
        <td className="p-4 text-slate-600">{apc.mainItem}</td>
        <td className="p-4">
            <span className={`px-2 py-1 text-xs font-semibold rounded-full ${
                apc.pestAlert === '경보' ? 'bg-red-100 text-red-800' :
                    apc.pestAlert === '주의' ? 'bg-yellow-100 text-yellow-800' :
                        'bg-green-100 text-green-800'
            }`}>
                {apc.pestAlert}
            </span>
        </td>
        <td className="p-4 text-slate-600">{apc.performance?.receiving ?? 'N/A'}%</td>
        <td className="p-4 text-slate-600">{apc.performance?.sorting ?? 'N/A'}%</td>
        <td className="p-4 text-slate-600">{apc.performance?.packing ?? 'N/A'}%</td>
    </tr>
);

// 메인 컴포넌트 - props 없이 독립적으로 작동
export default function ApcList() {
    const [viewType, setViewType] = useState<'card' | 'list'>('card');

    // ✅ 컴포넌트 내부에서 데이터 관리
    const [apcList, setApcList] = useState<ApcCenter[]>(apcCenters);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    // 필요시 API 호출 로직 추가 가능
    // useEffect(() => {
    //     fetchApcData();
    // }, []);

    if (loading) {
        return <div className="text-center p-10">데이터를 불러오는 중입니다... ⏳</div>;
    }

    if (error) {
        return <div className="text-center p-10 text-red-600">오류가 발생했습니다: {error} 😥</div>;
    }

    if (!apcList || apcList.length === 0) {
        return <div className="text-center p-10">표시할 APC 데이터가 없습니다.</div>;
    }

    return (
        <div>
            <div className="flex mb-6 justify-between items-center">
                <h2 className="text-2xl font-bold text-gray-800">APC 운영 현황</h2>
                <div className="flex items-center bg-slate-200 rounded-lg p-1">
                    <button
                        onClick={() => setViewType('card')}
                        className={`px-3 py-2 rounded-md text-sm font-semibold transition-all ${
                            viewType === 'card' ? 'bg-white shadow' : 'text-slate-600 hover:text-slate-800'
                        }`}
                    >
                        <GridIcon className="w-5 h-5" />
                    </button>
                    <button
                        onClick={() => setViewType('list')}
                        className={`px-3 py-2 rounded-md text-sm font-semibold transition-all ${
                            viewType === 'list' ? 'bg-white shadow' : 'text-slate-600 hover:text-slate-800'
                        }`}
                    >
                        <ListIcon className="w-5 h-5" />
                    </button>
                </div>
            </div>

            {viewType === 'card' ? (
                <APCCarouselView apcList={apcList} />
            ) : (
                <div className="bg-white rounded-xl shadow-md overflow-hidden">
                    <div className="overflow-x-auto">
                        <table className="w-full text-left text-sm">
                            <thead className="bg-slate-50 border-b">
                            <tr>
                                <th className="p-4 font-semibold">APC명</th>
                                <th className="p-4 font-semibold">위치</th>
                                <th className="p-4 font-semibold">최근 사용일</th>
                                <th className="p-4 font-semibold">주력 품목</th>
                                <th className="p-4 font-semibold">병해충</th>
                                <th className="p-4 font-semibold">입고</th>
                                <th className="p-4 font-semibold">선별</th>
                                <th className="p-4 font-semibold">포장</th>
                            </tr>
                            </thead>
                            <tbody>
                            {apcList.map(apc => (
                                <APCListItem key={apc.id} apc={apc} />
                            ))}
                            </tbody>
                        </table>
                    </div>
                </div>
            )}
        </div>
    );
}