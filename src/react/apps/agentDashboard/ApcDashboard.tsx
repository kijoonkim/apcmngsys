import React, { useState } from 'react';
import { AppShell, Burger, Group, Title, Stack, Text, TextInput,
    SegmentedControl, Button, Divider, Card, ScrollArea, Box, Tabs, Image, Grid } from '@mantine/core';
import {useDisclosure} from "@mantine/hooks";
import Gemini from "@apps/agentDashboard/component/Gemini";
import AiPrompt from "@apps/agentDashboard/component/AiPrompt";
import AiChat from "@apps/agentDashboard/component/AiChat";
import ApcList from "@apps/agentDashboard/component/ApcList";
import ApcTotal from "@apps/agentDashboard/component/ApcTotal";
import ApcMap from "@apps/agentDashboard/component/ApcMap";
import headerLogo from '@assets/header_logo.png';

type ViewKey = 'policy' | 'vendor' | 'main';

export default function App({ initialProps }: { initialProps: { apcCode?: string } }) {
    const [tab, setTab] = useState<ViewKey>('vendor');
    const [opened, { toggle }] = useDisclosure();
    const [apcCode, setApcCode] = React.useState(initialProps.apcCode ?? "");
    const [showSplitView, setShowSplitView] = useState(false);

    const handleLogoDoubleClick = () => {
        setShowSplitView(prev => !prev);
    };

    console.log(apcCode);

    return (
        <AppShell
            padding="md"
            header={{ height: 64 }}>
            <AppShell.Header withBorder={false}>
                <Group h="100%" px="md" justify="flex-start" wrap="nowrap" gap='100'>
                    <Image
                        radius="md"
                        w="auto"
                        src={headerLogo} // 수정된 이미지 경로 사용
                        onDoubleClick={handleLogoDoubleClick}
                        style={{ cursor: 'pointer', height: '40px' }} // 이미지 높이 조절 (선택 사항)
                        alt="APC Logo" // alt 속성 추가
                    />
                    <Tabs
                        value={tab}
                        onChange={(v) => setTab((v as ViewKey) ?? 'main')}
                        keepMounted={false}
                        w='100%'
                    >
                        <Tabs.List>
                            <Tabs.Tab value="vendor">ChatBot Search</Tabs.Tab>
                            <Tabs.Tab value="main">운영성과</Tabs.Tab>
                            <Tabs.Tab value="policy">정책성과</Tabs.Tab>
                            <Tabs.Tab value="apcList">APC목록</Tabs.Tab>
                        </Tabs.List>
                    </Tabs>

                </Group>
            </AppShell.Header>

            <AppShell.Main style={{padding : '64px 0 0 0', height: 'calc(100vh - 64px)'}}>
                {showSplitView ? (
                    // --- 4분할 그리드 뷰 재구현 ---
                    <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gridTemplateRows: '1fr 1fr', gap: '16px', height: '100%', padding: '16px' }}>
                        {/* 각 그리드 셀 */}
                        <div style={{ overflow: 'hidden' }}> {/* 셀 자체는 스크롤 숨김 */}
                            <ApcList />
                        </div>
                        <div style={{ overflow: 'hidden' }}>
                            <ApcTotal />
                        </div>
                        <div style={{ overflow: 'hidden' }}>
                            <ApcMap />
                        </div>
                        <div style={{ overflow: 'hidden' }}>
                            <AiChat /> {/* 내부에서 스크롤 처리 */}
                        </div>
                    </div>
                    // --- 재구현 끝 ---
                ) : (
                    <Box style={{ height: '100%', overflow: 'auto' }}>
                        {tab === 'vendor' && <AiChat />}
                        {tab === 'main' && <ApcTotal />}
                        {tab === 'policy' && <ApcMap />}
                        {tab === 'apcList' && <ApcList />}
                    </Box>
                )}
            </AppShell.Main>
        </AppShell>
    );
}
