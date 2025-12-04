// src/react/apps/ordr/index.tsx
import { useState } from 'react';
import { createRoot } from 'react-dom/client';
import { MantineProvider, Tabs, Stack, Paper, Text, ActionIcon, Group } from '@mantine/core';
import { Dropzone } from '@mantine/dropzone';
import { IconX, IconUpload, IconFile } from '@tabler/icons-react';
import { AgGridReact } from 'ag-grid-react';
import * as XLSX from 'xlsx';
import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-alpine.css';
import '@mantine/core/styles.css';
import '@mantine/dropzone/styles.css';

interface ExcelTab {
  id: string;
  fileName: string;
  data: any[];
  columns: any[];
}

const OrderUpload = () => {
  const [tabs, setTabs] = useState<ExcelTab[]>([]);
  const [activeTab, setActiveTab] = useState<string | null>(null);

  const handleFileDrop = async (files: File[]) => {
    for (const file of files) {
      const data = await file.arrayBuffer();
      const workbook = XLSX.read(data);
      const sheetName = workbook.SheetNames[0];
      const worksheet = workbook.Sheets[sheetName];
      const jsonData = XLSX.utils.sheet_to_json(worksheet);

      // 컬럼 추출
      const columns = Object.keys(jsonData[0] || {}).map((key) => ({
        field: key,
        headerName: key,
        editable: true,
        resizable: true,
      }));

      // 새 탭 추가
      const newTab: ExcelTab = {
        id: `tab-${Date.now()}-${Math.random()}`,
        fileName: file.name,
        data: jsonData,
        columns: columns,
      };

      setTabs((prev) => [...prev, newTab]);
      setActiveTab(newTab.id);
    }
  };

  const handleCloseTab = (tabId: string) => {
    setTabs((prev) => prev.filter((t) => t.id !== tabId));
    if (activeTab === tabId) {
      const remainingTabs = tabs.filter((t) => t.id !== tabId);
      setActiveTab(remainingTabs.length > 0 ? remainingTabs[0].id : null);
    }
  };

  return (
    <MantineProvider>
      <Stack h="100vh" p="md" gap="md">
        {/* Drag & Drop 영역 */}
        <Paper withBorder p="md" radius="xs">
          <Dropzone
            onDrop={handleFileDrop}
            accept={[
              'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
              'application/vnd.ms-excel',
            ]}
            maxSize={10 * 1024 ** 2} // 10MB
          >
            <Group justify="center" gap="md" style={{ minHeight: 120, pointerEvents: 'none' }}>
              <IconUpload size={50} stroke={1.5} />
              <div>
                <Text size="xl" inline>
                  엑셀 파일을 드래그하거나 클릭하여 업로드
                </Text>
                <Text size="sm" c="dimmed" inline mt={7}>
                  여러 파일을 동시에 업로드할 수 있습니다
                </Text>
              </div>
            </Group>
          </Dropzone>
        </Paper>

        {/* 탭 영역 */}
        {tabs.length > 0 && (
          <Paper withBorder style={{ flex: 1 }} radius="xs">
            <Tabs value={activeTab} onChange={setActiveTab}>
              <Tabs.List>
                {tabs.map((tab) => (
                  <Tabs.Tab
                    key={tab.id}
                    value={tab.id}
                    leftSection={<IconFile size={14} />}
                    rightSection={
                      <ActionIcon
                        size="xs"
                        variant="subtle"
                        color="gray"
                        onClick={(e) => {
                          e.stopPropagation();
                          handleCloseTab(tab.id);
                        }}
                      >
                        <IconX size={12} />
                      </ActionIcon>
                    }
                  >
                    {tab.fileName}
                  </Tabs.Tab>
                ))}
              </Tabs.List>

              {tabs.map((tab) => (
                <Tabs.Panel key={tab.id} value={tab.id} pt="md">
                  <div
                    className="ag-theme-alpine"
                    style={{ height: 'calc(100vh - 300px)', width: '100%' }}
                  >
                    <AgGridReact
                      rowData={tab.data}
                      columnDefs={tab.columns}
                      defaultColDef={{
                        sortable: true,
                        filter: true,
                        resizable: true,
                      }}
                      pagination
                      paginationPageSize={50}
                    />
                  </div>
                </Tabs.Panel>
              ))}
            </Tabs>
          </Paper>
        )}
      </Stack>
    </MantineProvider>
  );
};

// 렌더링
const container = document.getElementById('root');
if (container) {
  const root = createRoot(container);
  root.render(<OrderUpload />);
}

export default OrderUpload;
