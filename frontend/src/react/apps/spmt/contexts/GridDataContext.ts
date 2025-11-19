import { createContext } from 'react';

// (임시) 타입 정의, 실제 프로젝트의 타입으로 대체하세요.
interface Grade {
  id: string;
  name: string;
}
interface Lot {
  id: string;
  qty: number;
  shipmentId: string;
}
interface Client {
  color: string;
  bgColor: string;
  borderStyle: string;
}
interface LotData {
  [cellKey: string]: Lot[];
}

// 1. Context에 담을 데이터의 타입을 정의합니다.
// (상태, 데이터, 이벤트 핸들러 등 필요한 모든 것을 여기에 넣습니다)
export interface GridContextType {
  grades: Grade[];
  producers: string[];
  lotData: LotData;
  clients: { [id: string]: Client };
  mode: string;
  activeShipmentGrade: string;
  pendingLotIds: Set<string>;

  // 이벤트 핸들러도 Context를 통해 전달할 수 있습니다.
  onLotClick: (lot: Lot, cellKey: string) => void;
  onEmptyCellClick: (cellKey: string) => void;
}

// 2. Context 객체를 생성하고 export 합니다.
// 기본값은 null로 설정하고, Provider에서 반드시 값을 제공하도록 합니다.
export const GridDataContext = createContext<GridContextType | null>(null);
