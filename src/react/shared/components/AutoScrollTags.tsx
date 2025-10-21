import * as React from "react"
import { Separator } from "@ui/separator"
import { ScrollArea } from "@ui/scroll-area"

export type RegionWeather = {
    code: string        // 내부 코드 (원하는 형식)
    name: string        // 표시 이름 (시/군/구)
    temp: number        // 현재기온(°C)
    rainProb: number    // 강수확률(%)
    humidity: number    // 습도(%)
    condition: "맑음" | "구름많음" | "흐림" | "비" | "눈" | "소나기"
}

export const regionsWeather: RegionWeather[] = [
    { code: "11B10101", name: "서울 강남구", temp: 27, rainProb: 10, humidity: 55, condition: "맑음" },
    { code: "11B10102", name: "서울 강서구", temp: 26, rainProb: 20, humidity: 60, condition: "구름많음" },
    { code: "11H20201", name: "부산 해운대구", temp: 28, rainProb: 30, humidity: 70, condition: "구름많음" },
    { code: "11H10701", name: "대구 수성구", temp: 29, rainProb: 20, humidity: 58, condition: "맑음" },
    { code: "11F20501", name: "광주 북구", temp: 27, rainProb: 40, humidity: 65, condition: "흐림" },
    { code: "11C20401", name: "대전 서구", temp: 26, rainProb: 30, humidity: 62, condition: "구름많음" },
    { code: "11H20101", name: "울산 남구", temp: 28, rainProb: 35, humidity: 68, condition: "구름많음" },
    { code: "11B00101", name: "세종", temp: 25, rainProb: 20, humidity: 57, condition: "맑음" },
    { code: "11B20601", name: "경기 수원시 권선구", temp: 25, rainProb: 10, humidity: 50, condition: "맑음" },
    { code: "11B20302", name: "경기 고양시 일산동구", temp: 24, rainProb: 15, humidity: 52, condition: "맑음" },
    { code: "11B20201", name: "인천 연수구", temp: 25, rainProb: 20, humidity: 58, condition: "구름많음" },
    { code: "11D10301", name: "강원 춘천시", temp: 23, rainProb: 15, humidity: 55, condition: "맑음" },
    { code: "11D10401", name: "강원 원주시", temp: 24, rainProb: 20, humidity: 56, condition: "구름많음" },
    { code: "11C10301", name: "충북 청주시 흥덕구", temp: 25, rainProb: 25, humidity: 60, condition: "구름많음" },
    { code: "11C20502", name: "충남 천안시 서북구", temp: 25, rainProb: 30, humidity: 62, condition: "흐림" },
    { code: "11F10201", name: "전북 전주시 완산구", temp: 26, rainProb: 35, humidity: 65, condition: "흐림" },
    { code: "11F20502", name: "전남 목포시", temp: 27, rainProb: 50, humidity: 72, condition: "비" },
    { code: "11H10201", name: "경북 포항시 남구", temp: 28, rainProb: 25, humidity: 66, condition: "구름많음" },
    { code: "11H20301", name: "경남 창원시 성산구", temp: 27, rainProb: 30, humidity: 67, condition: "구름많음" },
    { code: "11G00201", name: "제주 제주시", temp: 29, rainProb: 40, humidity: 75, condition: "소나기" },
]

type AutoScrollTagsProps = {
    interval?: number   // 몇 ms마다
    stepRows?: number   // 몇 줄씩 이동
    rowPx?: number      // 한 줄 높이(px) - 모르면 24로 대충
}

export function AutoScrollTags({
                                   interval = 2000,
                                   stepRows = 3,
                                   rowPx = 24,
                               }: AutoScrollTagsProps) {
    const rootRef = React.useRef<HTMLDivElement>(null)

    React.useEffect(() => {
        const viewport = rootRef.current?.querySelector(
            "[data-radix-scroll-area-viewport]"
        ) as HTMLDivElement | null
        if (!viewport) return

        const timer = window.setInterval(() => {
            viewport.scrollBy({ top: stepRows * rowPx, behavior: "smooth" })

            // 끝까지 갔으면 다시 위로
            const atEnd =
                viewport.scrollTop + viewport.clientHeight >= viewport.scrollHeight - 1
            if (atEnd) {
                viewport.scrollTo({ top: 0, behavior: "smooth" })
            }
        }, interval)

        return () => window.clearInterval(timer)
    }, [interval, stepRows, rowPx])

    return (
        <ScrollArea ref={rootRef} className="h-72 w-64 rounded-md border">
            <div className="p-4">
                {regionsWeather.map((w) => (
                    <React.Fragment key={w.code}>
                        <div className="text-sm">
                            {w.name} · {w.temp}°C · 강수 {w.rainProb}% · {w.condition}
                        </div>
                        <Separator className="my-2" />
                    </React.Fragment>
                ))}
            </div>
        </ScrollArea>
    )
}