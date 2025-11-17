import React, { useState, useRef, useEffect } from 'react';
import { APC_TOOLS } from './AiTools';
import ReactMarkdown from 'react-markdown';
// Vite + React 환경에서는 Tailwind CSS가 설정되어 있다고 가정합니다.

/**
 * AI와의 통신을 위한 '전문 공구함' (Tools) 정의
 * 이 객체는 사용자의 프롬프트와 함께 백엔드 서버로 전송됩니다.
 * AI는 이 '사용 설명서'를 보고 어떤 도구를 사용할지 결정합니다.
 */

const markdownContent = `
저희 APC 정보지원시스템에 **'AI 챗봇 비서'**가 새롭게 탑재되었습니다.
이제 시스템에 대해 궁금한 점이 있다면, 복잡한 메뉴를 클릭할 필요 없이 채팅창에 **자연스러운 말로 질문**하기만 하면 됩니다.

* "거산APC 이번 달 실적 알려줘." * "APC가 무슨 뜻인가요?" (일반적인 질문도 OK!)

AI 챗봇 비서는 여러분의 질문 의도를 파악하고, 시스템 내의 **정확한 정보**를 찾아 **핵심만 요약**해서 빠르게 알려주거나, 일반적인 질문에도 똑똑하게 답변합니다.
저희는 Google의 최첨단 AI 두뇌를 사용하지만, **가장 중요하게 생각한 것은 바로 '보안'과 '데이터 프라이버시'**입니다. 그래서 AI가 우리 시스템의 민감한 정보(데이터베이스)에 **절대로 직접 접근할 수 없도록** 설계했습니다.
마치 **'외부의 천재 컨설턴트(AI)'**와 **'내부의 꼼꼼한 비서(우리 시스템 서버)'**가 협업하는 방식과 같습니다.

1.  **여러분의 질문:** 여러분이 비서에게 질문합니다. (예: "거산 실적 보여줘")
2.  **비서의 1차 판단:** 비서는 질문을 듣고, 외부 컨설턴트에게 어떤 종류의 분석을 맡겨야 할지 판단합니다. (이때, 비서는 컨설턴트가 이해할 수 있는 **'업무 요청서 양식(Tools)'**을 알고 있습니다.)
3.  **비서 → 컨설턴트 (업무 요청):** 비서는 컨설턴트에게 "손님이 '거산'의 '실적'을 원하는데, 어떤 데이터를 가져와야 할지 **정확한 지시**를 내려주세요." 라고 요청합니다. (이때 '업무 요청서 양식'을 함께 보여줍니다.)
4.  **컨설턴트의 분석 및 지시:** 컨설턴트는 양식을 보고 "아, '거산'이라는 이름으로 먼저 정확한 APC 코드를 찾고, 그다음 실적 데이터를 가져오라고 지시해야겠군!" 이라고 판단하여, **구체적인 '데이터 요청 지시서(Function Call)'**를 비서에게 전달합니다. (컨설턴트는 실제 데이터는 보지 못합니다!)
5.  **비서의 안전한 데이터 조회:** 비서는 컨설턴트가 준 지시서에 따라, **회사 내부의 안전한 데이터 창고(DB)에서 딱 필요한 정보만!** 정확하게 가져옵니다. (AI가 시키지 않은 정보나 위험한 작업은 절대 하지 않습니다.)
6.  **비서 → 컨설턴트 (핵심 정보 전달):** 비서는 가져온 **핵심 데이터만** 컨설턴트에게 보여주며 "이 데이터를 가지고 손님에게 알기 쉽게 설명해주세요." 라고 최종 요청합니다.
7.  **컨설턴트의 답변 작성:** 컨설턴트는 방금 받은 **제한된 정보만을 이용**하여, 여러분이 이해하기 쉬운 최종 답변을 작성합니다.
8.  **비서 → 여러분 (최종 답변 전달):** 비서는 컨설턴트가 작성한 답변을 여러분께 전달합니다.

**핵심은, AI는 우리 회사 건물 밖에 있고, 모든 정보 전달과 실제 데이터 접근은 우리 내부 직원인 '비서'가 안전하게 통제한다는 것입니다.**

> *  🛡️ 강력한 보안:** AI는 우리 데이터베이스에 절대 직접 접속하지 않습니다. 모든 요청은 우리 시스템(비서)을 통해 **안전하게 필터링**됩니다.
> *  🔒 데이터 프라이버시 보장:** AI에게 분석을 위해 데이터를 전달하더라도, 그 데이터는 **오직 답변 생성을 위해서만 임시로 사용**되고, AI 서버에는 **절대 저장되거나 학습에 이용되지 않습니다.** (독립적인 요청 처리 후 즉시 폐기)
> *  🎯 믿을 수 있는 정보:** AI는 인터넷 정보가 아닌, 우리 시스템 내부의 **실시간 데이터**를 기반으로 답변하므로 항상 정확합니다.
> *  ⏱️ 업무 효율성 향상:** 복잡한 메뉴 대신, **간단한 질문**만으로 원하는 정보를 즉시 얻을 수 있습니다.
> *  🔑 권한 관리:** AI는 답변 시 **여러분의 계정 권한을 존중**합니다. 여러분이 볼 수 있는 정보만 AI를 통해 확인할 수 있습니다. (민감 정보 자동 필터링)
> *  📈 뛰어난 확장성:** 앞으로 AI 비서에게 더 많은 '업무 요청서 양식(Tools)'을 가르쳐주면, 실적 조회뿐만 아니라 더 다양한 업무를 AI를 통해 처리할 수 있게 됩니다.

**APC 정보지원시스템의 새로운 AI 챗봇 비서와 함께 더욱 스마트하고 효율적인 업무를 경험해보세요!**
`;

export default function AIAssistant() {
  const [messages, setMessages] = useState([
    { role: 'ai', content: '안녕하세요! APC 정보지원시스템에 대해 무엇이든 물어보세요.' },
  ]);
  const [inputPrompt, setInputPrompt] = useState('');
  const [isLoading, setIsLoading] = useState(false);

  // 1. 스크롤 '닻' 만들기 (useRef)
  const messagesEndRef = useRef(null);

  // 3. 스크롤 '실행' (useEffect)
  useEffect(() => {
    // 닻(ref)이 연결된 요소가 화면에 보이도록 부드럽게 스크롤합니다.
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, [messages]);

  /**
   * 사용자가 프롬프트를 전송했을 때 호출되는 함수
   */
  const handleSendPrompt = async () => {
    if (!inputPrompt.trim() || isLoading) return;

    const newMessages = [...messages, { role: 'user', content: inputPrompt }];
    setMessages(newMessages);
    setInputPrompt('');
    setIsLoading(true);

    try {
      console.log(inputPrompt, 'inputPrompt');
      console.log(APC_TOOLS, 'APC_TOOLS');
      // --- 백엔드 서버와 통신하는 부분 ---
      const response = await fetch('/api/ask-ai', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          prompt: inputPrompt,
          tools: APC_TOOLS, // 정의한 '전문 공구함'을 함께 전송
        }),
      });
      console.log(response);

      // 실제 백엔드 구현 후 아래 코드 활성화
      const data = await response.json();
      console.log(data);
      setMessages([...newMessages, { role: 'ai', content: data.answer }]);

      // --- 지금은 백엔드가 없으므로, 가짜 응답을 시뮬레이션합니다 ---
      // await mockBackendResponse(newMessages, inputPrompt);
    } catch (error) {
      console.error('Error fetching from backend:', error);
      setMessages([
        ...newMessages,
        { role: 'ai', content: '오류가 발생했습니다. 서버와 통신할 수 없습니다.' },
      ]);
    } finally {
      setIsLoading(false);
    }
  };

  function renderSimpleMarkdown(text) {
    // 정규표현식을 사용하여 **단어** 를 <strong>단어</strong> 로 바꿉니다.
    const boldHtml = text.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>');
    // (나중에 다른 마크다운도 추가할 수 있습니다. 예: *italic*)
    return boldHtml;
  }

  // --- 백엔드 응답 시뮬레이션 함수 (나중에 삭제될 부분) ---
  const mockBackendResponse = (currentMessages, prompt) => {
    return new Promise((resolve) => {
      setTimeout(() => {
        let aiResponse = '죄송합니다. 이해하지 못했습니다.';
        if (prompt.includes('거산')) {
          aiResponse =
            "어떤 '거산'을 말씀하시는 건가요? 아래에서 선택해주세요.\n\n1. 거산유통 (A123)\n2. 거산인삼 (B456)";
        } else if (prompt.includes('A123') || prompt.includes('1번')) {
          aiResponse =
            "네, '거산유통(A123)'의 10월 입고 실적을 조회하겠습니다. 잠시만 기다려주세요...";
        } else if (prompt.includes('안녕')) {
          aiResponse = '네, 안녕하세요! 무엇을 도와드릴까요?';
        }
        setMessages([...currentMessages, { role: 'ai', content: aiResponse }]);
        resolve();
      }, 1500);
    });
  };

  return (
    <div className="bg-gray-100 font-sans flex h-screen" style={{ height: '89vh' }}>
      <div className="w-1/2 flex flex-col bg-gray-50">
        <div className="flex-1 p-6 overflow-y-auto">
          <div className="space-y-4">
            {messages.map((msg, index) => (
              <div
                key={index}
                className={`flex ${msg.role === 'user' ? 'justify-end' : 'justify-start'}`}
              >
                <div
                  className={`max-w-lg px-4 py-3 rounded-2xl ${msg.role === 'user' ? 'bg-blue-500 text-white' : 'bg-gray-200 text-gray-800'}`}
                >
                  {/*<p className="whitespace-pre-wrap">{msg.content}</p>*/}
                  <p
                    className="whitespace-pre-wrap"
                    dangerouslySetInnerHTML={{ __html: renderSimpleMarkdown(msg.content) }}
                  />
                </div>
              </div>
            ))}
            {isLoading && (
              <div className="flex justify-start">
                <div className="px-4 py-3 rounded-2xl bg-gray-200 text-gray-800">
                  <div className="flex items-center space-x-2">
                    <div
                      className="w-2 h-2 bg-gray-500 rounded-full animate-bounce"
                      style={{ animationDelay: '0s' }}
                    ></div>
                    <div
                      className="w-2 h-2 bg-gray-500 rounded-full animate-bounce"
                      style={{ animationDelay: '0.2s' }}
                    ></div>
                    <div
                      className="w-2 h-2 bg-gray-500 rounded-full animate-bounce"
                      style={{ animationDelay: '0.4s' }}
                    ></div>
                  </div>
                </div>
              </div>
            )}
            {/* 2. 스크롤 '닻' 연결하기 (ref 속성) */}
            <div ref={messagesEndRef} />
          </div>
        </div>

        <div className="p-4 bg-white border-t border-gray-200">
          <div className="flex items-center space-x-2">
            <textarea
              value={inputPrompt}
              onChange={(e) => setInputPrompt(e.target.value)}
              onKeyDown={(e) => {
                if (e.key === 'Enter' && !e.shiftKey) {
                  e.preventDefault();
                  handleSendPrompt();
                }
              }}
              placeholder="여기에 질문을 입력하세요..."
              className="flex-1 p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              rows="2"
              disabled={isLoading}
            />
            <button
              onClick={handleSendPrompt}
              disabled={isLoading || !inputPrompt.trim()}
              className="px-6 py-3 bg-blue-600 text-white rounded-lg font-semibold hover:bg-blue-700 disabled:bg-gray-400 disabled:cursor-not-allowed"
            >
              전송
            </button>
          </div>
        </div>
      </div>
      <div className="w-1/2 p-6 bg-white border-r border-gray-200 overflow-y-auto">
        <h2 className="text-2xl font-bold mb-4">AI 도구 설명서 (Tools)</h2>
        <p className="text-lg text-gray-600 mb-4">
          APC 정보지원시스템 AI 챗봇은 기존에 제공되는 기능들과 AI 모델에 자체적으로 학습된 정보들을
          제공합니다. 기존에 사용하던 메뉴들의 정보를 간략하고 빠르게 확인해야하는경우엔 간단한
          질의를 통하여 빠르게 확인이 가능합니다. 또, 각 계정에 분리된 권한을 통해 민감한 정보들은
          제외하여 제공할 수 있습니다. AI가 직접 데이터베이스에 접근하는 형식이 아니기 때문에
          보안성이 좋습니다. 데이터를 전달하여 분석을 요청하는 경우에도 독립적인 요청으로 임시처리만
          하며, 응답생성이 완료되면, 그 데이터는 즉시폐기 됩니다.
        </p>
        <pre className="bg-gray-800 text-white p-4 rounded-lg text-xl whitespace-pre-wrap">
          APC 정보지원시스템 AI 챗봇은 기존에 제공되는 기능들과 AI 모델에 자체적으로 학습된 정보들을
          제공합니다. 기존에 사용하던 메뉴들의 정보를 간략하고 빠르게 확인해야하는경우엔 간단한
          질의를 통하여 빠르게 확인이 가능합니다. 또, 각 계정에 분리된 권한을 통해 민감한 정보들은
          제외하여 제공할 수 있습니다. AI가 직접 데이터베이스에 접근하는 형식이 아니기 때문에
          보안성이 좋습니다. 데이터를 전달하여 분석을 요청하는 경우에도 독립적인 요청으로 임시처리만
          하며, 응답생성이 완료되면, 그 데이터는 즉시폐기 됩니다.
        </pre>
        <ReactMarkdown>{markdownContent}</ReactMarkdown>

        {/*<p className="text-sm text-gray-600 mb-4">*/}
        {/*    이 JSON 객체는 AI에게 어떤 기능을 사용할 수 있는지 알려주는 '사용 설명서'입니다.*/}
        {/*    React 앱은 사용자의 질문과 이 설명서를 함께 백엔드 서버로 전송합니다.*/}
        {/*</p>*/}
        {/*<pre className="bg-gray-800 text-white p-4 rounded-lg text-xs whitespace-pre-wrap">*/}
        {/*    {JSON.stringify(APC_TOOLS, null, 2)}*/}
        {/*</pre>*/}
      </div>
    </div>
  );
}
