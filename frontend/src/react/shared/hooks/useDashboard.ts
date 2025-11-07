// @shared/hooks/useDashboard.ts
import { useQuery } from '@tanstack/react-query';
import { getApcAgtStatus } from '../lib/apis/dashboard';
import { ApcItem } from '../types/dashboard';

export function useApcStatus() {
  return useQuery<ApcItem[]>({
    queryKey: ['apcStatus'],
    queryFn: getApcAgtStatus,
    staleTime: 60_000,
    refetchInterval: 60_000,
  });
}
