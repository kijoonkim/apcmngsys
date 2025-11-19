// ItemVrtyModal.tsx
import React, { useState, useEffect } from 'react';

interface ItemVrty {
  vrtyCd: string;
  itemCd: string;
  itemNm: string;
  vrtyNm: string;
}

interface ItemVrtyModalProps {
  isOpen: boolean;
  apcCd: string;
  onSelect: (selected: { vrtyCd: string; itemCd: string; text: string }) => void;
}

const ItemVrtyModal: React.FC<ItemVrtyModalProps> = ({ isOpen, apcCd, onSelect }) => {
  const [items, setItems] = useState<ItemVrty[]>([]);
  const [loading, setLoading] = useState(false);
  console.log(apcCd);

  useEffect(() => {
    if (isOpen && apcCd) {
      loadItems();
    }
  }, [isOpen, apcCd]);

  const loadItems = async () => {
    setLoading(true);
    try {
      // gfn_getApcVrty 호출 (jQuery 함수를 Promise로 래핑)
      const vrtyCd = await window.gfn_getApcVrty(apcCd);
      setItems(vrtyCd || []);
    } catch (error) {
      console.error('품목 품종 조회 실패:', error);
      setItems([]);
    } finally {
      setLoading(false);
    }
  };

  const handleCellClick = (item: ItemVrty) => {
    const text = `${item.itemNm}/${item.vrtyNm}`;
    onSelect({
      vrtyCd: item.vrtyCd,
      itemCd: item.itemCd,
      text,
    });
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
      <div className="bg-white rounded-lg shadow-xl w-full max-w-4xl max-h-[80vh] overflow-hidden">
        <div className="p-6 border-b border-gray-200">
          <h2 className="text-2xl font-bold text-gray-800">품목/품종 선택</h2>
        </div>

        <div className="p-6 overflow-y-auto max-h-[calc(80vh-120px)]">
          {loading ? (
            <div className="flex items-center justify-center py-12">
              <div className="text-gray-500">로딩 중...</div>
            </div>
          ) : items.length === 0 ? (
            <div className="flex items-center justify-center py-12">
              <div className="text-gray-500">선택 가능한 품목이 없습니다.</div>
            </div>
          ) : (
            <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-3">
              {items.map((item) => (
                <div
                  key={`${item.itemCd}_${item.vrtyCd}`}
                  className="cell cursor-pointer border-2 border-gray-300 rounded-lg p-4 hover:border-blue-500 hover:bg-blue-50 transition-all duration-200 text-center"
                  onClick={() => handleCellClick(item)}
                  data-vrty-cd={item.vrtyCd}
                  data-item-cd={item.itemCd}
                >
                  <div className="font-semibold text-gray-800">{item.itemNm}</div>
                  <div className="text-sm text-gray-600 mt-1">{item.vrtyNm}</div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default ItemVrtyModal;
