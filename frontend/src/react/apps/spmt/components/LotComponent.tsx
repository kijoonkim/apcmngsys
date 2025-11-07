export default LotComponent = ({
  lot,
  client,
  onClick,
  mode,
  isShipmentActiveInThisColumn,
  isPending,
}) => {
  const clientClasses = client
    ? `${client.color} ${client.bgColor} ${client.borderStyle}`
    : 'border-gray-200 bg-white';
  let modeClass = mode === 'view' ? 'cursor-default' : 'cursor-pointer';
  if (isShipmentActiveInThisColumn && !isPending && !lot.shipmentId)
    modeClass += ' opacity-30 scale-95';
  const pendingClass = isPending ? 'ring-2 ring-blue-600 ring-inset' : '';

  return (
    <div
      className={`lot-item relative flex items-center justify-center h-12 border ${clientClasses} ${modeClass} hover:brightness-90 transition-all duration-150`}
      onClick={() => onClick(lot)}
    >
      <span className="text-sm font-medium text-gray-800">{lot.qty}</span>
      {pendingClass && (
        <div className={`absolute inset-0 ${pendingClass} pointer-events-none`}></div>
      )}
    </div>
  );
};
