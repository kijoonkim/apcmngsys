import React, { useState } from 'react';
import { AppShell, Burger, Group, Title, Stack, Text, TextInput,
    SegmentedControl, Button, Divider, Card, ScrollArea, Box, Tabs, Image, Grid } from '@mantine/core';
import {useDisclosure} from "@mantine/hooks";
import { IconPhoto, IconMessageCircle, IconSettings } from '@tabler/icons-react';
import KoreaMap from "@apps/agentDashboard/component/Map";

import { KPIGrid } from "@apps/agentDashboard/sections/KPIGrid";

// Header에 Tabs를 두고, 선택된 탭에 따라 Main 콘텐츠가 바뀌는 최소 예시
// - Navbar/Aside/Footer 없음
// - keepMounted=false: 보이지 않는 탭의 DOM을 제거해 성능/스타일 꼬임 방지

type ViewKey = 'policy' | 'vendor' | 'main';

export default function App() {
    const [tab, setTab] = useState<ViewKey>('main');
    const [opened, { toggle }] = useDisclosure();

    return (
        <AppShell
            padding="md"
            header={{ height: 64 }}>
            <AppShell.Header withBorder={false}>
                <Group h="100%" px="md" justify="flex-start" wrap="nowrap" gap='100'>
                    <Image
                        radius="md"
                        w="auto"
                        src="src/main/resources/static/resource/images/header_logo_backup_20231006.png"
                    />
                    <Tabs
                        value={tab}
                        onChange={(v) => setTab((v as ViewKey) ?? 'main')}
                        keepMounted={false}
                        w='100%'
                    >
                        <Tabs.List>
                            <Tabs.Tab value="main">mainTest</Tabs.Tab>
                            <Tabs.Tab value="policy">정책성과</Tabs.Tab>
                            <Tabs.Tab value="vendor">운영성과</Tabs.Tab>
                        </Tabs.List>
                    </Tabs>

                </Group>
            </AppShell.Header>

            <AppShell.Main>
                <Box>
                    {tab === 'main' && (
                        <Grid grow gutter="md" style={{ gridAutoRows: 'minmax(220px, 1fr)' }}>
                            <Grid.Col span={3} h={50}>1</Grid.Col>
                            <Grid.Col span={3}></Grid.Col>
                            <Grid.Col span={3}>3</Grid.Col>
                            <Grid.Col span={3}>4</Grid.Col>
                            <Grid.Col span={4} h={300}>5</Grid.Col>
                            <Grid.Col span={4}>6</Grid.Col>
                            <Grid.Col span={4}>7</Grid.Col>
                            <Grid.Col span={4}>8</Grid.Col>
                            <Grid.Col span={4}>9</Grid.Col>
                            <Grid.Col span={4}>10</Grid.Col>
                        </Grid>
                    )}

                    {tab === 'policy' && (
                        <Box>
                            <Title order={3} mb="sm">정책성과 뷰</Title>

                            <Text c="dimmed">여기에 KPI/지도 등을 추가</Text>
                        </Box>
                    )}

                    {tab === 'vendor' && (
                        <Box>
                            <Title order={3} mb="sm">운영성과 뷰</Title>
                            <Text c="dimmed">여기에 카드/랭킹 등을 추가</Text>
                        </Box>
                    )}
                </Box>
            </AppShell.Main>
        </AppShell>
    );
}
