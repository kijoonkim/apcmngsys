import LotComponent from '@apps/spmt/components/LotComponent';

export default CellContainer = ({
  lots = [],
  clients,
  onLotClick,
  onEmptyCellClick,
  mode,
  cellKey,
  activeShipmentGrade,
  pendingLotIds,
}) => {
  const gridClass =
    lots.length <= 1
      ? 'grid-cols-1'
      : lots.length === 2
        ? 'grid-cols-2'
        : lots.length === 3
          ? 'grid-cols-3'
          : lots.length === 4
            ? 'grid-cols-4'
            : lots.length === 5
              ? 'grid-cols-5'
              : 'grid-cols-6';
  const gradeId = cellKey.split('_')[1];
  const isShipmentActiveInThisColumn = mode === 'shipment' && activeShipmentGrade === gradeId;

  if (lots.length === 0)
    return (
      <div
        className="cell-container flex items-center justify-center min-h-12 text-gray-300 cursor-pointer hover:bg-gray-100"
        onClick={() => onEmptyCellClick(cellKey)}
      >
        -
      </div>
    );

  return (
    <div className={`cell-container grid ${gridClass} w-full`}>
      {lots.map((lot) => (
        <LotComponent
          key={lot.id}
          lot={lot}
          client={clients[lot.shipmentId]}
          onClick={onLotClick}
          mode={mode}
          isShipmentActiveInThisColumn={isShipmentActiveInThisColumn}
          isPending={pendingLotIds.has(lot.id)}
        />
      ))}
    </div>
  );
};
