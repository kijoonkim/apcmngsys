import React, { useState } from 'react';
import { AppShell, Burger, Group, Title, Stack, Text, TextInput,
    SegmentedControl, Button, Divider, Card, ScrollArea, Box, Tabs, Image, Grid } from '@mantine/core';
import {useDisclosure} from "@mantine/hooks";
import Gemini from "@apps/agentDashboard/component/Gemini";
import AiPrompt from "@apps/agentDashboard/component/AiPrompt";
import AiChat from "@apps/agentDashboard/component/AiChat";
import ApcList from "@apps/agentDashboard/component/ApcList";

type ViewKey = 'policy' | 'vendor' | 'main';

export default function App({ initialProps }: { initialProps: { apcCode?: string } }) {
    const [tab, setTab] = useState<ViewKey>('vendor');
    const [opened, { toggle }] = useDisclosure();
    const [apcCode, setApcCode] = React.useState(initialProps.apcCode ?? "");

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
                        src="src/main/resources/static/resource/images/header_logo_backup_20231006.png"
                    />
                    <Tabs
                        value={tab}
                        onChange={(v) => setTab((v as ViewKey) ?? 'main')}
                        keepMounted={false}
                        w='100%'
                    >
                        <Tabs.List>
                            <Tabs.Tab value="vendor">운영성과</Tabs.Tab>
                            <Tabs.Tab value="main">mainTest</Tabs.Tab>
                            <Tabs.Tab value="policy">정책성과</Tabs.Tab>
                            <Tabs.Tab value="apcList">APC목록</Tabs.Tab>
                        </Tabs.List>
                    </Tabs>

                </Group>
            </AppShell.Header>

            <AppShell.Main>
                <Box>
                    {tab === 'main' && (
                        <Box>
                            <AiPrompt></AiPrompt>
                        </Box>
                    )}

                    {tab === 'policy' && (
                        <Box>
                            <Gemini></Gemini>
                        </Box>
                    )}

                    {tab === 'vendor' && (
                        <Box>
                            <AiChat></AiChat>
                        </Box>
                    )}

                    {tab === 'apcList' && (
                        <Box>
                            <ApcList></ApcList>
                        </Box>
                    )}
                </Box>
            </AppShell.Main>
        </AppShell>
    );
}
