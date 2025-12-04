import React, { useState, useRef, useEffect } from 'react';
import { getApcTools } from './AiTools';
import ReactMarkdown from 'react-markdown';
// Vite + React 환경에서는 Tailwind CSS가 설정되어 있다고 가정합니다.

/**
 * AI와의 통신을 위한 '전문 공구함' (Tools) 정의
 * 이 객체는 사용자의 프롬프트와 함께 백엔드 서버로 전송됩니다.
 * AI는 이 '사용 설명서'를 보고 어떤 도구를 사용할지 결정합니다.
 */

export default function AIAssistant({ apcCd, apcNm }) {
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
      // --- 백엔드 서버와 통신하는 부분 ---
      const response = await fetch('/api/ask-ai', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          prompt: inputPrompt,
          tools: getApcTools(),
          context: {
            apcCd: apcCd,
            apcNm: apcNm,
          },
        }),
      });

      // 실제 백엔드 구현 후 아래 코드 활성화
      const data = await response.json();
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
    <div className="bg-gray-100 font-sans flex h-screen" style={{ height: '100%' }}>
      <div className="w-full flex flex-col bg-gray-50">
        <div className="flex-1 p-6 overflow-y-auto">
          <div className="space-y-4">
            {messages.map((msg, index) => (
              <div
                key={index}
                className={`flex ${msg.role === 'user' ? 'justify-end' : 'justify-start'}`}
              >
                <div
                  className={`max-w-3xl px-4 py-3 rounded-2xl ${msg.role === 'user' ? 'bg-blue-500 text-white' : 'bg-gray-200 text-gray-800'}`}
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

        <div className="py-3 bg-white border-t border-gray-200">
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
    </div>
  );
}
