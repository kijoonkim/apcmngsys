export default SplitModal = ({ isOpen, lot, onClose, onSplit }) => {
  const [qtys, setQtys] = useState([]);
  const [currentInput, setCurrentInput] = useState('');
  React.useEffect(() => {
    if (lot) {
      setQtys([]);
      setCurrentInput('');
    }
  }, [lot]);
  if (!isOpen || !lot) return null;

  const originalQty = lot.qty,
    currentSum = qtys.reduce((sum, q) => sum + q, 0),
    remainingQty = originalQty - currentSum;
  const nInput = parseInt(currentInput, 10),
    canAdd = nInput > 0 && nInput <= remainingQty,
    canConfirm = remainingQty === 0 && qtys.length >= 1;

  const handleAdd = () => {
    if (canAdd) {
      setQtys([...qtys, nInput]);
      setCurrentInput('');
    }
  };
  const handleSubmit = (e) => {
    e.preventDefault();
    if (canConfirm) {
      onSplit(qtys);
      onClose();
    } else if (remainingQty > 0) {
      const finalQtys = [...qtys];
      if (currentInput && nInput > 0 && nInput <= remainingQty) {
        finalQtys.push(nInput);
        const newRemaining = remainingQty - nInput;
        if (newRemaining > 0) finalQtys.push(newRemaining);
      } else finalQtys.push(remainingQty);
      onSplit(finalQtys);
      onClose();
    }
  };

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
      <div className="bg-white p-6 rounded-lg shadow-xl max-w-md w-full">
        <h3 className="text-xl font-bold mb-4">재고 분리</h3>
        <p className="text-sm text-gray-600 mb-2">
          원본 수량: <strong className="text-blue-600">{originalQty}</strong>개
        </p>
        <p className="text-sm text-gray-600 mb-4">
          남은 수량:{' '}
          <strong className={remainingQty === 0 ? 'text-green-600' : 'text-red-600'}>
            {remainingQty}
          </strong>
          개
        </p>
        <form onSubmit={handleSubmit} className="space-y-3">
          <div className="flex space-x-2">
            <input
              type="number"
              value={currentInput}
              onChange={(e) => setCurrentInput(e.target.value)}
              className="flex-1 px-3 py-2 border border-gray-300 rounded-md"
              placeholder="분리할 수량 입력"
              min="1"
              max={remainingQty}
            />
            <button
              type="button"
              onClick={handleAdd}
              disabled={!canAdd}
              className="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 disabled:bg-gray-400"
            >
              추가
            </button>
          </div>
          {qtys.length > 0 && (
            <div className="border border-gray-300 rounded-md p-3 space-y-2">
              <p className="text-sm font-semibold text-gray-700">분리된 수량:</p>
              {qtys.map((q, idx) => (
                <div key={idx} className="flex items-center justify-between bg-gray-50 p-2 rounded">
                  <span className="text-sm">
                    조각 {idx + 1}: <strong>{q}</strong>개
                  </span>
                  <button
                    type="button"
                    onClick={() => setQtys(qtys.filter((_, i) => i !== idx))}
                    className="text-red-600 hover:text-red-800 text-sm font-medium"
                  >
                    삭제
                  </button>
                </div>
              ))}
            </div>
          )}
          <div className="flex space-x-2 pt-4">
            <button
              type="button"
              onClick={onClose}
              className="flex-1 px-4 py-2 bg-gray-300 text-gray-700 rounded-md hover:bg-gray-400"
            >
              취소
            </button>
            <button
              type="submit"
              className="flex-1 px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700"
            >
              {canConfirm ? '확인' : '나머지 자동 추가'}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};
