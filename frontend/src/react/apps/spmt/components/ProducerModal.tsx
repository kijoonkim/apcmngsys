import React, { useState, useEffect } from 'react';
import { Modal, Button, Table } from '@mantine/core';
import { postJSON } from '@lib/http';

// (임시) 모달이 App에 반환할 재고 타입
type InventoryItem = {
  pltno: string;
  prdcrNm: string;
  prdcrIdentno: string;
  invntrQntt: string;
};

// (임시) 모달이 보여줄 재고 목록
const DUMMY_INVENTORY: InventoryItem[] = [
  { name: '임시 재고 A', code: 'P-100', qty: 50 },
  { name: '임시 재고 B', code: 'P-200', qty: 20 },
];

interface ProducerModalProps {
  isOpen: boolean;
  onClose: () => void;
  onSelect: (selectedItem: InventoryItem) => void; // 👈 "Promise의 then" 콜백
}

const ProducerModal: React.FC<ProducerModalProps> = ({
  isOpen,
  onClose,
  onSelect,
  searchParams,
}) => {
  // (나중에 여기서 서버 API로 재고 목록을 조회)
  // (지금은 임시 데이터 사용)
  const [rawMtrInvntr, setRawMtrInvntr] = useState([]);
  useEffect(() => {
    postJSON('/am/wrhs/selectRawMtrWrhsPrfmncList.do', {
      ...searchParams,
      wrhsYmdFrom: searchParams.date,
      wrhsYmdTo: searchParams.date,
    }).then((r) => {
      if (r && r.resultList.length > -1) {
        setRawMtrInvntr(r.resultList);
      }
    });
  }, []);

  const handleSelectClick = (item: InventoryItem) => {
    // 1. 👈 App에서 받은 onSelect 콜백 실행
    console.log(item, '이거줄껭');
    onSelect(item);
    // (onSelect가 App의 상태를 바꾸고, App이 모달을 닫아줌)
  };

  return (
    <Modal
      opened={isOpen}
      onClose={onClose}
      title="재고 조회 (생산자 선택)"
      size="lg" // 모달 크기
    >
      {/* (여기에 나중에 서버에서 가져올 재고 테이블)
       */}
      <Table>
        <Table.Thead>
          <Table.Tr>
            <Table.Th>원물번호</Table.Th>
            <Table.Th>생산자</Table.Th>
            <Table.Th>번호</Table.Th>
            <Table.Th>입고수량</Table.Th>
          </Table.Tr>
        </Table.Thead>
        <Table.Tbody>
          {rawMtrInvntr.map((item) => (
            <Table.Tr key={item.pltno}>
              <Table.Td>{item.pltno}</Table.Td>
              <Table.Td>{item.prdcrNm}</Table.Td>
              <Table.Td>{item.prdcrIdentno}</Table.Td>
              <Table.Td>{item.invntrQntt}</Table.Td>
              <Table.Td>
                <Button size="xs" onClick={() => handleSelectClick(item)}>
                  선택
                </Button>
              </Table.Td>
            </Table.Tr>
          ))}
        </Table.Tbody>
      </Table>
    </Modal>
  );
};

export default ProducerModal;
