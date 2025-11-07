export default GroupOverlay = ({ gradeId, lotData, containerRef }) => {
  const [overlays, setOverlays] = useState([]);
  const [hoveredGroup, setHoveredGroup] = useState(null);

  useLayoutEffect(() => {
    if (!containerRef.current) return;

    const groups = {};

    PRODUCERS.forEach((producerId, rowIdx) => {
      const cellKey = `${producerId}_${gradeId}`;
      const lots = lotData[cellKey] || [];

      lots.forEach((lot, lotIdx) => {
        if (lot.groupId) {
          if (!groups[lot.groupId]) {
            groups[lot.groupId] = {
              firstRow: rowIdx,
              lastRow: rowIdx,
              firstLotIdx: lotIdx,
              lastLotIdx: lotIdx,
              total: 0,
            };
          }
          groups[lot.groupId].lastRow = rowIdx;
          groups[lot.groupId].lastLotIdx = lotIdx;
          groups[lot.groupId].total += lot.qty;
        }
      });
    });

    const gradeIdx = GRADES.findIndex((g) => g.id === gradeId);
    const allCells = containerRef.current.querySelectorAll('.cell-container');

    const newOverlays = Object.entries(groups)
      .map(([groupId, info]) => {
        const firstCellIdx = info.firstRow * GRADES.length + gradeIdx;
        const lastCellIdx = info.lastRow * GRADES.length + gradeIdx;

        const firstCell = allCells[firstCellIdx];
        const lastCell = allCells[lastCellIdx];

        if (!firstCell || !lastCell) return null;

        const firstLotDiv = firstCell.querySelectorAll('.lot-item')[info.firstLotIdx];
        const lastLotDiv = lastCell.querySelectorAll('.lot-item')[info.lastLotIdx];

        if (!firstLotDiv || !lastLotDiv) return null;

        const firstRect = firstLotDiv.getBoundingClientRect();
        const lastRect = lastLotDiv.getBoundingClientRect();
        const containerRect = containerRef.current.getBoundingClientRect();

        return {
          groupId,
          left: firstRect.left - containerRect.left,
          top: firstRect.top - containerRect.top,
          width: firstRect.width,
          height: lastRect.bottom - firstRect.top,
          total: info.total,
        };
      })
      .filter(Boolean);

    setOverlays(newOverlays);
  }, [gradeId, lotData, containerRef]);

  return (
    <>
      {overlays.map((overlay) => (
        <div
          key={overlay.groupId}
          style={{
            position: 'absolute',
            left: `${overlay.left}px`,
            top: `${overlay.top}px`,
            width: `${overlay.width}px`,
            height: `${overlay.height}px`,
            border: '4px solid rgb(147, 51, 234)',
            borderRadius: '8px',
            zIndex: 20,
            pointerEvents: 'auto',
            cursor: 'pointer',
            transition: 'all 0.2s',
          }}
          onMouseEnter={() => setHoveredGroup(overlay.groupId)}
          onMouseLeave={() => setHoveredGroup(null)}
          onTouchStart={() => setHoveredGroup(overlay.groupId)}
          onTouchEnd={() => setTimeout(() => setHoveredGroup(null), 2000)}
        >
          {hoveredGroup === overlay.groupId && (
            <div
              style={{
                position: 'absolute',
                bottom: '-35px',
                right: '5px',
                background: 'rgb(147, 51, 234)',
                color: 'white',
                padding: '6px 12px',
                borderRadius: '6px',
                fontSize: '13px',
                fontWeight: 'bold',
                whiteSpace: 'nowrap',
                boxShadow: '0 2px 8px rgba(0,0,0,0.2)',
                animation: 'fadeIn 0.2s',
              }}
            >
              합계: {overlay.total}개
            </div>
          )}
        </div>
      ))}
    </>
  );
};
