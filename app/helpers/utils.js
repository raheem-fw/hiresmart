export const transformDate = (date) => {
  if (!date) return '';

  const d = new Date(date);

  const dd = String(d.getDate()).padStart(2, '0');
  const mm = String(d.getMonth() + 1).padStart(2, '0'); // months are 0-based
  const yyyy = d.getFullYear();

  return `${yyyy}-${mm}-${dd}`;
};
