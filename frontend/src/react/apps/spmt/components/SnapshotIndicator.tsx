/**
 * 스냅샷 상태 표시 컴포넌트
 * - 자동 저장 상태
 * - 마지막 저장 시간
 * - 저장되지 않은 변경사항 표시
 */

import React, { useEffect, useState } from 'react';
import { useSnapshot } from '../contexts/InventoryContext';

const SnapshotIndicator: React.FC = () => {
  const { lastSavedAt, isDirty } = useSnapshot();
  const [timeAgo, setTimeAgo] = useState('');

  // 시간 경과 표시 업데이트
  useEffect(() => {
    if (!lastSavedAt) {
      setTimeAgo('');
      return;
    }

    const updateTimeAgo = () => {
      const now = Date.now();
      const diff = now - lastSavedAt;
      const seconds = Math.floor(diff / 1000);

      if (seconds < 60) {
        setTimeAgo(`${seconds}초 전`);
      } else if (seconds < 3600) {
        setTimeAgo(`${Math.floor(seconds / 60)}분 전`);
      } else {
        setTimeAgo(`${Math.floor(seconds / 3600)}시간 전`);
      }
    };

    updateTimeAgo();
    const interval = setInterval(updateTimeAgo, 1000);

    return () => clearInterval(interval);
  }, [lastSavedAt]);

  if (!lastSavedAt && !isDirty) return null;

  return (
    <div className="fixed bottom-4 right-4 z-40">
      <div
        className={`px-4 py-2 rounded-lg shadow-lg flex items-center space-x-2 ${
          isDirty
            ? 'bg-yellow-100 border-2 border-yellow-400'
            : 'bg-green-100 border-2 border-green-400'
        }`}
      >
        {/* 아이콘 */}
        <div className="flex-shrink-0">
          {isDirty ? (
            <svg
              className="w-5 h-5 text-yellow-600 animate-pulse"
              fill="currentColor"
              viewBox="0 0 20 20"
            >
              <path d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z" />
            </svg>
          ) : (
            <svg
              className="w-5 h-5 text-green-600"
              fill="currentColor"
              viewBox="0 0 20 20"
            >
              <path
                fillRule="evenodd"
                d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                clipRule="evenodd"
              />
            </svg>
          )}
        </div>

        {/* 텍스트 */}
        <div className="text-sm">
          {isDirty ? (
            <span className="font-medium text-yellow-800">
              저장되지 않은 변경사항
            </span>
          ) : (
            <span className="font-medium text-green-800">
              임시저장 완료 {timeAgo && `• ${timeAgo}`}
            </span>
          )}
        </div>

        {/* 로딩 애니메이션 (자동 저장 중) */}
        {isDirty && (
          <div className="flex-shrink-0">
            <div className="w-4 h-4 border-2 border-yellow-600 border-t-transparent rounded-full animate-spin"></div>
          </div>
        )}
      </div>
    </div>
  );
};

export default SnapshotIndicator;
