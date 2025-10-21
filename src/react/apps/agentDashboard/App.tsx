// src/react/agentDashboard/App.tsx
import * as React from "react"
import Autoplay from "embla-carousel-autoplay";
import {Card, CardContent, CardHeader, CardTitle} from "@ui/card";
import KakaoMap from "@shared/components/kakaoMap";
import {Carousel, CarouselContent, CarouselItem} from "@ui/carousel";
import {Area, CartesianGrid, XAxis, YAxis, Tooltip, AreaChart} from "recharts";
import {AutoScrollTags} from "@shared/components/AutoScrollTags";


export default function App() {
    /** carousel auto **/
    const autoplayChart = React.useRef(
        Autoplay({ delay: 6000, stopOnInteraction: false, stopOnMouseEnter: false })
    )
    const autoplayData = React.useRef(
        Autoplay({ delay: 2000, stopOnInteraction: false, stopOnMouseEnter: false })
    )
    /** api 호출 **/
    const data = [
        {
            "name": "Page A",
            "uv": 4000,
            "pv": 2400,
            "amt": 2400
        },
        {
            "name": "Page B",
            "uv": 3000,
            "pv": 1398,
            "amt": 2210
        },
        {
            "name": "Page C",
            "uv": 2000,
            "pv": 9800,
            "amt": 2290
        },
        {
            "name": "Page D",
            "uv": 2780,
            "pv": 3908,
            "amt": 2000
        },
        {
            "name": "Page E",
            "uv": 1890,
            "pv": 4800,
            "amt": 2181
        },
        {
            "name": "Page F",
            "uv": 2390,
            "pv": 3800,
            "amt": 2500
        },
        {
            "name": "Page G",
            "uv": 3490,
            "pv": 4300,
            "amt": 2100
        }
    ]

    return (
        <Card
            className="bg-gray-50 p-5"
            style={{
                display: "grid",
                gridTemplateAreas: `
          "widget temp dataSet dataSet dataSet topInfo"
          "widget temp dataSet dataSet dataSet topInfo"
          "map    apcInfo apcInfo sysPrst sysPrst topInfo"
          "map    apcInfo apcInfo sysPrst sysPrst topInfo"
        `,
                gridTemplateColumns: "2fr 1fr 1fr 1fr 1fr 0.8fr",
                gridTemplateRows: " 1fr 1fr 1fr 1fr",
                gap: "16px",
                height: "100vh",        // ⬅️ ★ 그리드 컨테이너의 '명확한 높이'
                // height: "calc(100vh - 64px)"  // 헤더가 있으면 이런 식으로
            }}
        >
            {/* widget: fixed 제거하고 sticky로 - 그리드 흐름 유지 + 고정 느낌 */}
            <section style={{ gridArea: "widget" }}>
                <div className="flex h-full">
                    <Card className="flex-grow-1">
                        <CardHeader className="pb-2">
                            <CardTitle>공공데이터 API</CardTitle>
                        </CardHeader>
                        <CardContent className="flex gap-1">
                            <AutoScrollTags></AutoScrollTags>
                            {/*<div>뭔가가</div>*/}
                        </CardContent>
                    </Card>
                    {/* 위젯 더 쌓이면 여기 */}
                </div>
            </section>

            <section style={{ gridArea: "topInfo" }} >
                <div className="h-full flex flex-col gap-5">
                    <Card className="flex-grow-1">
                        <CardHeader className="pb-2">
                            <CardTitle>전체 설치 현황</CardTitle>
                        </CardHeader>
                        <CardContent>
                            {/*{isLoading ? '로딩…' : data.me?.name ?? '-'}*/}
                        </CardContent>
                    </Card>
                    <Card className="flex-grow-1">
                        <CardHeader className="pb-2">
                            <CardTitle>가동률</CardTitle>
                        </CardHeader>
                        <CardContent>
                            {/*{isLoading ? '로딩…' : data.me?.name ?? '-'}*/}
                        </CardContent>
                    </Card>
                    <Card className="flex-grow-1">
                        <CardHeader className="pb-2">
                            <CardTitle>생산자수</CardTitle>
                        </CardHeader>
                        <CardContent>
                            {/*{isLoading ? '로딩…' : data.me?.name ?? '-'}*/}
                        </CardContent>
                    </Card>
                    <Card className="flex-grow-1">
                        <CardHeader className="pb-2">
                            <CardTitle>설비연계</CardTitle>
                        </CardHeader>
                        <CardContent>
                            {/*{isLoading ? '로딩…' : data.me?.name ?? '-'}*/}
                        </CardContent>
                    </Card>
                    {/* 위젯 더 쌓이면 여기 */}
                </div>
            </section>

            <section style={{ gridArea: "map" }} className="min-h-0">

                <Card className="h-full">
                    <CardHeader className="pb-2">
                        <CardTitle>전국 지도</CardTitle>
                    </CardHeader>
                    <CardContent className="h-full flex flex-col">
                    <KakaoMap
                        appKey={import.meta.env.VITE_KAKAO_JS_KEY}            // .env에 저장 추천
                        centerAddress="서울특별시 중구 세종대로 110"
                        addresses={[
                            "서울특별시 종로구 사직로 161",
                            "부산광역시 부산진구 중앙대로 993",
                            "대구광역시 북구 연암로 40",
                        ]}
                        height="100%"  // 카드 안에서 꽉 차게
                        zoom={7}
                    />
                    </CardContent>
                </Card>
            </section>

            <section style={{ gridArea: "dataSet" }} className="min-h-0">
                <Card className="h-full">
                    <CardHeader className="pb-2">
                        <CardTitle>월별 데이터 수집현황</CardTitle>
                    </CardHeader>
                    <CardContent className="h-full flex flex-col">
                        <div className="flex-1 overflow-auto">{/* 표/리스트 */}</div>
                    </CardContent>
                </Card>
            </section>

            <section style={{ gridArea: "apcInfo" }} className="min-h-0">
                <Card className="h-full">
                    <CardContent className="h-full">
                        <Carousel
                            orientation="vertical"
                            opts={{ loop: true, align: "start" }}
                            plugins={[autoplayData.current]}
                            className="h-full w-full"
                        >
                            <CarouselContent className="h-full">
                                {Array.from({ length: 5 }).map((_, i) => (
                                    <CarouselItem key={i} className="h-full ">
                                        <Card className="h-full border-0 shadow-none">
                                            <div>여기에다가 써야하는구나?</div>
                                            <CardContent className="h-full flex items-center justify-center p-6">
                                                <span className="text-4xl font-semibold">{i + 1}</span>
                                            </CardContent>
                                        </Card>
                                    </CarouselItem>
                                ))}
                            </CarouselContent>
                        </Carousel>
                    </CardContent>
                </Card>
            </section>

            <section style={{ gridArea: "sysPrst" }} className="min-h-0">
                <Card className="h-full">
                    <CardHeader className="pb-2">
                        <CardTitle>APC 입고 데이터</CardTitle>
                    </CardHeader>
                    <CardContent className="h-full flex flex-col">
                        <div className="flex-1 overflow-auto"></div>
                    </CardContent>
                </Card>
            </section>
            <section style={{ gridArea: "temp"}} className="min-h-0">
                <Card className="h-full">
                <Carousel
                    orientation="vertical"
                    opts={{ loop: true, align: "start" }}
                    plugins={[autoplayChart.current]}
                    className="h-full w-full"
                >
                    <CarouselContent className="h-full">
                        {Array.from({ length: 5 }).map((_, i) => (
                            <CarouselItem key={i} className="h-full ">
                                <Card className="h-full border-0 shadow-none">
                                    <CardContent className="h-full flex items-center justify-center p-6">
                                        <AreaChart width={430} height={250} data={data}
                                                   margin={{ top: 10, right: 30, left: 0, bottom: 0 }}>
                                            <defs>
                                                <linearGradient id="colorUv" x1="0" y1="0" x2="0" y2="1">
                                                    <stop offset="5%" stopColor="#8884d8" stopOpacity={0.8}/>
                                                    <stop offset="95%" stopColor="#8884d8" stopOpacity={0}/>
                                                </linearGradient>
                                                <linearGradient id="colorPv" x1="0" y1="0" x2="0" y2="1">
                                                    <stop offset="5%" stopColor="#82ca9d" stopOpacity={0.8}/>
                                                    <stop offset="95%" stopColor="#82ca9d" stopOpacity={0}/>
                                                </linearGradient>
                                            </defs>
                                            <XAxis dataKey="name" />
                                            <YAxis />
                                            <CartesianGrid strokeDasharray="3 3" />
                                            <Tooltip />
                                            <Area type="monotone" dataKey="uv" stroke="#8884d8" fillOpacity={1} fill="url(#colorUv)" />
                                            <Area type="monotone" dataKey="pv" stroke="#82ca9d" fillOpacity={1} fill="url(#colorPv)" />
                                        </AreaChart>
                                    </CardContent>
                                </Card>
                            </CarouselItem>
                        ))}
                    </CarouselContent>
                </Carousel>
                </Card>
            </section>
        </Card>
    )
}