import React, { useEffect, useState } from 'react';
import { useKeenSlider } from 'keen-slider/react';

const slides = [
    { id:'weather', title:'기상 요약', body:'평균 26℃ · 강수 5mm', tone:'ok' },
    { id:'pest',    title:'병해충 경보', body:'벼멸구 주의보(중부)', tone:'warn' },
    { id:'news',    title:'농업 뉴스', body:'AI 작황 예측 시범', tone:'info' },
];

export function AutoCarousel() {
    const [cur, setCur] = useState(0);
    const [ref, inst] = useKeenSlider({ loop:true, slideChanged(s){ setCur(s.track.details.rel); }});
    useEffect(()=>{ const t=setInterval(()=>inst.current?.next(), 4000); return ()=>clearInterval(t); },[inst]);
    return (
        <div className="carousel">
            <div ref={ref} className="keen-slider">
                {slides.map(s=>(
                    <div key={s.id} className="keen-slider__slide">
                        <div className={`card ${s.tone}`}>
                            <div className="card-title">{s.title}</div>
                            <div className="card-body">{s.body}</div>
                        </div>
                    </div>
                ))}
            </div>
            <div className="dots">
                {slides.map((_,i)=>(
                    <button key={i} className={`dot ${i===cur?'active':''}`} onClick={()=>inst.current?.moveToIdx(i)} />
                ))}
            </div>
        </div>
    );
}