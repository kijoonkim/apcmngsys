import React, { useState } from 'react';

// Vite + React 환경에서는 Tailwind CSS가 설정되어 있다고 가정합니다.

export default function AiPrompt() {
    // 상태 변수들을 정의합니다.
    const [apiKey, setApiKey] = useState(''); // API 키를 저장할 상태
    const [contextData, setContextData] = useState(''); // 기초 데이터를 저장할 상태
    const [userQuestion, setUserQuestion] = useState(''); // 사용자 질문을 저장할 상태
    const [result, setResult] = useState('아직 호출되지 않았습니다.'); // API 결과를 저장할 상태
    const [isLoading, setIsLoading] = useState(false); // 로딩 상태를 관리할 상태

    // API를 호출하는 비동기 함수
    const callGeminiApi = async () => {
        if (!apiKey.trim()) {
            setResult('오류: API 키를 먼저 입력해주세요.');
            return;
        }
        if (!contextData.trim() || !userQuestion.trim()) {
            setResult('오류: 기초 데이터와 질문을 모두 입력해야 합니다.');
            return;
        }

        setIsLoading(true);
        setResult('모델을 호출하는 중...');

        const MODEL_NAME = "models/gemini-2.5-flash-preview-09-2025";
        const API_URL = `https://generativelanguage.googleapis.com/v1beta/${MODEL_NAME}:generateContent?key=${apiKey}`;

        const prompt = `
당신은 주어진 데이터를 정확하게 분석하고 답변하는 데이터 분석 전문가입니다.
아래에 제공되는 "기초 데이터"를 기반으로만 "질문"에 대해 답변하세요.

---
[기초 데이터]
${contextData}
---

[질문]
${userQuestion}
    `;

        try {
            const response = await fetch(API_URL, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ contents: [{ parts: [{ text: prompt }] }] })
            });

            if (!response.ok) {
                const errorResult = await response.json();
                console.error('API Error Response:', errorResult);
                throw new Error(`API 호출 실패: ${errorResult.error?.message || response.statusText}`);
            }

            const resultData = await response.json();
            const answerText = resultData.candidates[0].content.parts[0].text;
            setResult(answerText.trim());

        } catch (error) {
            console.error(error);
            setResult(`오류가 발생했습니다: ${error.message}`);
        } finally {
            setIsLoading(false);
        }
    };

    // UI를 렌더링하는 부분
    return (
        <div className="bg-gray-100 min-h-screen p-8 font-sans">
            <div className="max-w-3xl mx-auto bg-white p-8 rounded-lg shadow-lg">
                <h1 className="text-3xl font-bold border-b-2 border-gray-200 pb-4 mb-6">Gemini 데이터 분석 콘솔</h1>

                <div className="mb-6">
                    <label htmlFor="api-key" className="block text-lg font-semibold mb-2">API 키 입력</label>
                    <input
                        type="password"
                        id="api-key"
                        value={apiKey}
                        onChange={(e) => setApiKey(e.target.value)}
                        placeholder="여기에 발급받은 API 키를 붙여넣으세요"
                        className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                    />
                </div>

                <div className="mb-6">
                    <label htmlFor="context-data" className="block text-lg font-semibold mb-2">1. 기초 데이터 (Context) 입력</label>
                    <p className="text-sm text-gray-600 mb-2">분석할 데이터를 여기에 텍스트 형태로 붙여넣으세요. (예: 엑셀 데이터 복사)</p>
                    <textarea
                        id="context-data"
                        rows="10"
                        value={contextData}
                        onChange={(e) => setContextData(e.target.value)}
                        placeholder="여기에 분석할 기초 데이터를 붙여넣으세요."
                        className="w-full p-3 border border-gray-300 rounded-md text-sm"
                    />
                </div>

                <div className="mb-6">
                    <label htmlFor="user-question" className="block text-lg font-semibold mb-2">2. 질문 입력</label>
                    <textarea
                        id="user-question"
                        rows="3"
                        value={userQuestion}
                        onChange={(e) => setUserQuestion(e.target.value)}
                        placeholder="위 데이터를 기반으로 질문을 입력하세요."
                        className="w-full p-3 border border-gray-300 rounded-md text-sm"
                    />
                </div>

                <button
                    onClick={callGeminiApi}
                    disabled={isLoading}
                    className="w-full text-lg py-3 px-6 cursor-pointer border-none rounded-md bg-blue-600 text-white hover:bg-blue-700 disabled:bg-gray-400 disabled:cursor-not-allowed"
                >
                    {isLoading ? '답변 생성 중...' : '답변 생성하기'}
                </button>

                <h2 className="text-2xl font-bold border-b-2 border-gray-200 pb-2 mt-8 mb-4">실행 결과:</h2>
                <pre className="mt-4 p-4 bg-gray-100 border border-gray-200 rounded-md whitespace-pre-wrap max-h-72 overflow-y-auto">
          {result}
        </pre>
            </div>
        </div>
    );
}