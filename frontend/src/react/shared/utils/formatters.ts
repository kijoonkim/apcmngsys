// src/shared/utils/formatters.ts
export const formatPhoneNumber = (phone: string): string => {
  if (!phone) return '';
  if (phone.length === 10) {
    return phone.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
  }
  if (phone.length === 11) {
    return phone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
  }
  return phone;
};

export const formatBusinessNumber = (brno: string): string => {
  if (!brno) return '';
  return brno.replace(/(\d{3})(\d{2})(\d{5})/, '$1-$2-$3');
};

export const formatNumber = (num: number | null | undefined): string => {
  if (!num) return '0';
  return num.toLocaleString();
};

export const formatWeight = (weight: number): string => {
  return `${formatNumber(weight)} ton`;
};
